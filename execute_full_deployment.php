<?php
/**
 * Trackly - Orchestrated End-to-End Phased Deployment
 */

$ftp_server = 'ftp.capuang.com';
$ftp_port   = 21;
$ftp_user   = 'Trackly@lab-studio.cloud';
$ftp_pass   = 'Trackly2026!!';
$token      = 'TracklyDeploy2026Safe!!';
$baseUrl    = 'https://lab-studio.cloud/Trackly/public';

$baseDir    = 'c:/xampppp/htdocs/Trackly';
$bundlesDir = $baseDir . '/scratch_bundles';
$scratchDir = 'C:/Users/hp/.gemini/antigravity-ide/brain/f98c1874-d9bc-420e-bb1e-ba459b73245d/scratch';

echo "========================================================\n";
echo "   TRACKLY - END-TO-END AUTOMATED DEPLOYMENT\n";
echo "========================================================\n\n";

function logStep($step, $title) {
    echo "\n[" . date('H:i:s') . "] === $step: $title ===\n";
}

function callRunner($url, $token, $action, $postData = []) {
    $fullUrl = $url . '/server_deploy_runner.php';
    $postData['token'] = $token;
    $postData['action'] = $action;

    $ch = curl_init($fullUrl);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($ch, CURLOPT_POST, true);
    curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query($postData));
    curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
    curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, false);
    curl_setopt($ch, CURLOPT_TIMEOUT, 120);

    $res = curl_exec($ch);
    $code = curl_getinfo($ch, CURLINFO_HTTP_CODE);
    $err = curl_error($ch);
    curl_close($ch);

    if ($err) {
        fwrite(STDERR, "[ERROR] cURL failed: $err\n");
        exit(1);
    }
    $json = json_decode($res, true);
    if (!$json) {
        echo "Raw Response (Code $code):\n$res\n";
    }
    return $json;
}

// 1. Connect FTPS
logStep("CONNECT", "Connecting to FTP Server");
$conn = @ftp_ssl_connect($ftp_server, $ftp_port, 20);
if (!$conn) {
    $conn = @ftp_connect($ftp_server, $ftp_port, 20);
}
if (!@ftp_login($conn, $ftp_user, $ftp_pass)) {
    fwrite(STDERR, "[CRITICAL] FTP Login failed.\n");
    exit(1);
}
ftp_pasv($conn, true);
echo "FTP Connected successfully.\n";

// Upload runner script
logStep("PREPARE", "Uploading server_deploy_runner.php");
$runnerLocal = $scratchDir . '/server_deploy_runner.php';
if (!@ftp_put($conn, 'public/server_deploy_runner.php', $runnerLocal, FTP_ASCII)) {
    fwrite(STDERR, "[ERROR] Could not upload server_deploy_runner.php\n");
    exit(1);
}
echo "Server deploy runner uploaded successfully.\n";

// Test runner status
$status = callRunner($baseUrl, $token, 'status');
print_r($status);

// ==========================================
// FASE 3: DATABASE MIGRATION & SEEDING
// ==========================================
logStep("FASE 3", "Deploying & Initializing Database Schema (capd4965_Trackly)");
$sqlLocal = $baseDir . '/database_trackly_production.sql';
echo "Uploading database_trackly_production.sql ... ";
if (!@ftp_put($conn, 'public/database_trackly_production.sql', $sqlLocal, FTP_ASCII)) {
    fwrite(STDERR, "[ERROR] Failed to upload SQL dump.\n");
    exit(1);
}
echo "OK\nExecuting SQL queries on localhost MySQL...\n";
$dbResult = callRunner($baseUrl, $token, 'install_db');
print_r($dbResult);

if (empty($dbResult['tables']) || !in_array('users', $dbResult['tables'])) {
    fwrite(STDERR, "[ERROR] Database initialization did not complete properly.\n");
    exit(1);
}
echo "[SUCCESS] Database initialized with tables: " . implode(', ', $dbResult['tables']) . "\n";

// ==========================================
// FASE 4: DEPLOYMENT BERTARAP VIA FTPS
// ==========================================

// 4.1 system
logStep("FASE 4.1", "Deploying 'system' (CodeIgniter 4 Core Framework)");
echo "Uploading bundle_system.zip ... ";
if (!@ftp_put($conn, 'public/bundle_system.zip', $bundlesDir . '/bundle_system.zip', FTP_BINARY)) {
    fwrite(STDERR, "[ERROR] Failed to upload bundle_system.zip\n");
    exit(1);
}
echo "OK\nExtracting on server...\n";
$extSys = callRunner($baseUrl, $token, 'extract', ['bundle' => 'bundle_system.zip']);
print_r($extSys);

// 4.2 app
logStep("FASE 4.2", "Deploying 'app' (Application Logic)");
echo "Uploading bundle_app.zip ... ";
if (!@ftp_put($conn, 'public/bundle_app.zip', $bundlesDir . '/bundle_app.zip', FTP_BINARY)) {
    fwrite(STDERR, "[ERROR] Failed to upload bundle_app.zip\n");
    exit(1);
}
echo "OK\nExtracting on server...\n";
$extApp = callRunner($baseUrl, $token, 'extract', ['bundle' => 'bundle_app.zip']);
print_r($extApp);

// 4.3 public
logStep("FASE 4.3", "Deploying 'public' (Assets & Front Controller)");
echo "Uploading bundle_public.zip ... ";
if (!@ftp_put($conn, 'public/bundle_public.zip', $bundlesDir . '/bundle_public.zip', FTP_BINARY)) {
    fwrite(STDERR, "[ERROR] Failed to upload bundle_public.zip\n");
    exit(1);
}
echo "OK\nExtracting on server...\n";
$extPub = callRunner($baseUrl, $token, 'extract', ['bundle' => 'bundle_public.zip']);
print_r($extPub);

// 4.4 writable
logStep("FASE 4.4", "Deploying 'writable' (Storage Structure)");
echo "Uploading bundle_writable.zip ... ";
if (!@ftp_put($conn, 'public/bundle_writable.zip', $bundlesDir . '/bundle_writable.zip', FTP_BINARY)) {
    fwrite(STDERR, "[ERROR] Failed to upload bundle_writable.zip\n");
    exit(1);
}
echo "OK\nExtracting on server...\n";
$extWrit = callRunner($baseUrl, $token, 'extract', ['bundle' => 'bundle_writable.zip']);
print_r($extWrit);

// 4.5 .env
logStep("FASE 4.5", "Deploying Production Environment (.env)");
$envContent = file_get_contents($baseDir . '/.env.production');
$envRes = callRunner($baseUrl, $token, 'deploy_env', ['env_content' => $envContent]);
print_r($envRes);

ftp_close($conn);

// ==========================================
// FASE 5: POST-DEPLOYMENT VERIFICATION & CLEANUP
// ==========================================
logStep("FASE 5", "Testing Live Web Application");

$ch = curl_init($baseUrl . '/');
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
curl_setopt($ch, CURLOPT_FOLLOWLOCATION, true);
curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, false);
$res = curl_exec($ch);
$code = curl_getinfo($ch, CURLINFO_HTTP_CODE);
$effectiveUrl = curl_getinfo($ch, CURLINFO_EFFECTIVE_URL);
curl_close($ch);

echo "Base Request to $baseUrl/ => HTTP $code (Final URL: $effectiveUrl)\n";
echo "Title / Content snippet:\n" . substr(strip_tags($res), 0, 300) . "\n\n";

if ($code === 200) {
    echo "[SUCCESS] Trackly is UP and running!\n";
    echo "Cleaning up installer scripts...\n";
    $cleanupRes = callRunner($baseUrl, $token, 'cleanup');
    print_r($cleanupRes);
} else {
    echo "(!) HTTP Code is $code. Please check output before cleanup.\n";
}

echo "\n========================================================\n";
echo "   DEPLOYMENT PROCESS FINISHED\n";
echo "========================================================\n";
