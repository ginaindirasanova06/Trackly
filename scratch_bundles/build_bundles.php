<?php
$baseDir = 'c:/xampppp/htdocs/Trackly';
$outDir  = $baseDir . '/scratch_bundles';
if (!is_dir($outDir)) {
    mkdir($outDir, 0777, true);
}

function createZipFromDir($sourceDir, $outZipFile, $excludePatterns = []) {
    $zip = new ZipArchive();
    if ($zip->open($outZipFile, ZipArchive::CREATE | ZipArchive::OVERWRITE) !== true) {
        throw new Exception("Cannot create $outZipFile");
    }

    $sourceDir = realpath($sourceDir);
    $files = new RecursiveIteratorIterator(
        new RecursiveDirectoryIterator($sourceDir, RecursiveDirectoryIterator::SKIP_DOTS),
        RecursiveIteratorIterator::SELF_FIRST
    );

    foreach ($files as $file) {
        $filePath = $file->getRealPath();
        $relPath = substr($filePath, strlen($sourceDir) + 1);
        $normPath = str_replace('\\', '/', $relPath);

        $skip = false;
        foreach ($excludePatterns as $pattern) {
            if (strpos($normPath, $pattern) !== false) {
                $skip = true;
                break;
            }
        }
        if ($skip) continue;

        if ($file->isDir()) {
            $zip->addEmptyDir($normPath);
        } else {
            $zip->addFile($filePath, $normPath);
        }
    }

    $zip->close();
    echo "Created: $outZipFile (" . round(filesize($outZipFile) / 1024, 1) . " KB)\n";
}

echo "Building ZIP bundles...\n";

// 1. system
createZipFromDir($baseDir . '/system', $outDir . '/bundle_system.zip');

// 2. app
createZipFromDir($baseDir . '/app', $outDir . '/bundle_app.zip', ['Database/Seeds/demo']);

// 3. public
createZipFromDir($baseDir . '/public', $outDir . '/bundle_public.zip', ['test_capabilities', 'ping_test', 'check_server_env']);

// 4. writable
$zipW = new ZipArchive();
$zipW->open($outDir . '/bundle_writable.zip', ZipArchive::CREATE | ZipArchive::OVERWRITE);
$zipW->addEmptyDir('cache');
$zipW->addEmptyDir('debugbar');
$zipW->addEmptyDir('logs');
$zipW->addEmptyDir('session');
$zipW->addEmptyDir('uploads');
if (file_exists($baseDir . '/writable/.htaccess')) {
    $zipW->addFile($baseDir . '/writable/.htaccess', '.htaccess');
}
$zipW->close();
echo "Created: {$outDir}/bundle_writable.zip (" . round(filesize($outDir . '/bundle_writable.zip') / 1024, 1) . " KB)\n";

echo "All bundles built successfully.\n";
