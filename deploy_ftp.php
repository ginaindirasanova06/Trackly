<?php
/**
 * Trackly - Staged FTP Deployment Tool
 * 
 * Safe deployment script with strict single-error bail-out to avoid IP bans.
 * Usage:
 *   php deploy_ftp.php --check
 *   php deploy_ftp.php --phase=1   (system)
 *   php deploy_ftp.php --phase=2   (app)
 *   php deploy_ftp.php --phase=3   (public)
 *   php deploy_ftp.php --phase=4   (writable structure)
 *   php deploy_ftp.php --phase=5   (.env production)
 *   php deploy_ftp.php --phase=all (all phases in order)
 */

$ftp_server = 'ftp.capuang.com';
$ftp_port   = 21;
$ftp_user   = 'Trackly@lab-studio.cloud';
$ftp_pass   = 'Trackly2026!!';

$baseDir = __DIR__;

// Parse CLI options
$options = getopt('', ['check', 'phase:']);

echo "========================================================\n";
echo "   TRACKLY - SECURE STAGED FTP DEPLOYMENT TOOL\n";
echo "========================================================\n";
echo "Target Host: $ftp_server:$ftp_port\n";
echo "User       : $ftp_user\n";
echo "Time       : " . date('Y-m-d H:i:s') . "\n";
echo "--------------------------------------------------------\n";

// Function to safely connect
function connectFtp($host, $port, $user, $pass) {
    echo "[1/2] Connecting to FTP server (Explicit FTPS)...\n";
    $conn = @ftp_ssl_connect($host, $port, 20);
    if (!$conn) {
        echo "(!) Explicit FTPS not available, trying plain FTP...\n";
        $conn = @ftp_connect($host, $port, 20);
    }
    
    if (!$conn) {
        fwrite(STDERR, "[CRITICAL] Connection refused or timed out. Halting immediately.\n");
        exit(1);
    }

    echo "[2/2] Authenticating single attempt...\n";
    $login = @ftp_login($conn, $user, $pass);
    if (!$login) {
        fwrite(STDERR, "[CRITICAL] Authentication failed. Halting immediately to prevent IP block.\n");
        ftp_close($conn);
        exit(1);
    }

    ftp_pasv($conn, true);
    echo "[OK] Connected & Authenticated successfully.\n";
    return $conn;
}

// Function to safely create remote directory recursively
function ftp_mksubdirs($conn, $targetDir) {
    $parts = explode('/', trim($targetDir, '/'));
    $current = '';
    foreach ($parts as $part) {
        if ($part === '' || $part === '.') continue;
        $current .= '/' . $part;
        if (!@ftp_chdir($conn, $current)) {
            if (!@ftp_mkdir($conn, $current)) {
                return false;
            }
        }
    }
    return true;
}

// Function to upload directory recursively
function uploadDirectory($conn, $localDir, $remoteDir, $exclude = []) {
    $files = new RecursiveIteratorIterator(
        new RecursiveDirectoryIterator($localDir, RecursiveDirectoryIterator::SKIP_DOTS),
        RecursiveIteratorIterator::SELF_FIRST
    );

    $totalFiles = 0;
    $uploadedFiles = 0;

    foreach ($files as $file) {
        $filePath = $file->getRealPath();
        $subPath = substr($filePath, strlen($localDir) + 1);
        $subPathNormalized = str_replace('\\', '/', $subPath);

        // Check exclusions
        $skip = false;
        foreach ($exclude as $pattern) {
            if (strpos($subPathNormalized, $pattern) !== false) {
                $skip = true;
                break;
            }
        }
        if ($skip) continue;

        $targetRemotePath = rtrim($remoteDir, '/') . '/' . $subPathNormalized;

        if ($file->isDir()) {
            if (!ftp_mksubdirs($conn, $targetRemotePath)) {
                echo "(!) Warning: Could not create dir: $targetRemotePath\n";
            }
        } else {
            $totalFiles++;
            $parentDir = dirname($targetRemotePath);
            ftp_mksubdirs($conn, $parentDir);

            $mode = FTP_BINARY;
            $ext = strtolower(pathinfo($filePath, PATHINFO_EXTENSION));
            if (in_array($ext, ['php', 'txt', 'html', 'css', 'js', 'json', 'env', 'xml', 'md', 'htaccess'])) {
                $mode = FTP_ASCII;
            }

            echo "  -> Uploading: $subPathNormalized ... ";
            $start = microtime(true);
            $upload = @ftp_put($conn, $targetRemotePath, $filePath, $mode);
            $duration = round(microtime(true) - $start, 2);

            if (!$upload) {
                fwrite(STDERR, "\n[ERROR] Failed to upload $subPathNormalized. Halting deployment.\n");
                ftp_close($conn);
                exit(1);
            }
            echo "OK ({$duration}s)\n";
            $uploadedFiles++;
        }
    }
    return $uploadedFiles;
}

// Execution
$conn = connectFtp($ftp_server, $ftp_port, $ftp_user, $ftp_pass);

if (isset($options['check']) || (!isset($options['phase']))) {
    echo "\n=== STATUS CHECK ===\n";
    echo "Current remote directory: " . ftp_pwd($conn) . "\n";
    $list = ftp_nlist($conn, '.');
    echo "Contents at root:\n";
    print_r($list);
    echo "\nDone. Use --phase=<1|2|3|4|5|all> to proceed.\n";
    ftp_close($conn);
    exit(0);
}

$phase = $options['phase'];
echo "\nTarget Phase: $phase\n";

if ($phase === '1' || $phase === 'all') {
    echo "\n--- FASE 1: Deploying 'system' (CodeIgniter 4 Core) ---\n";
    $count = uploadDirectory($conn, $baseDir . '/system', '/system');
    echo "[OK] Fase 1 complete ($count files uploaded).\n";
}

if ($phase === '2' || $phase === 'all') {
    echo "\n--- FASE 2: Deploying 'app' (Application Logic) ---\n";
    $exclude = ['Database/Seeds/demo', '.git'];
    $count = uploadDirectory($conn, $baseDir . '/app', '/app', $exclude);
    echo "[OK] Fase 2 complete ($count files uploaded).\n";
}

if ($phase === '3' || $phase === 'all') {
    echo "\n--- FASE 3: Deploying 'public' (Frontend & Assets) ---\n";
    $count = uploadDirectory($conn, $baseDir . '/public', '/public');
    echo "[OK] Fase 3 complete ($count files uploaded).\n";
}

if ($phase === '4' || $phase === 'all') {
    echo "\n--- FASE 4: Creating 'writable' Directory Structure ---\n";
    $writableFolders = [
        '/writable',
        '/writable/cache',
        '/writable/debugbar',
        '/writable/logs',
        '/writable/session',
        '/writable/uploads',
    ];
    foreach ($writableFolders as $wf) {
        if (ftp_mksubdirs($conn, $wf)) {
            echo "  -> Directory ready: $wf\n";
        }
    }
    // Upload .htaccess in writable to protect sensitive data
    if (file_exists($baseDir . '/writable/.htaccess')) {
        @ftp_put($conn, '/writable/.htaccess', $baseDir . '/writable/.htaccess', FTP_ASCII);
    }
    echo "[OK] Fase 4 complete.\n";
}

if ($phase === '5' || $phase === 'all') {
    echo "\n--- FASE 5: Deploying Production Environment Configuration (.env) ---\n";
    $envSource = file_exists($baseDir . '/.env.production') ? $baseDir . '/.env.production' : $baseDir . '/.env';
    echo "Uploading configuration to /.env ... ";
    $res = @ftp_put($conn, '/.env', $envSource, FTP_ASCII);
    if (!$res) {
        fwrite(STDERR, "[ERROR] Failed to upload /.env\n");
        ftp_close($conn);
        exit(1);
    }
    echo "OK\n";
    echo "[OK] Fase 5 complete.\n";
}

ftp_close($conn);
echo "\n========================================================\n";
echo "   DEPLOYMENT PHASE $phase COMPLETED SUCCESSFULLY\n";
echo "========================================================\n";
