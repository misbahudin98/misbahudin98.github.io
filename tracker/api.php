<?php
declare(strict_types=1);

header('Content-Type: application/json; charset=utf-8');
header('Cache-Control: no-store, no-cache, must-revalidate');

$jsonFile = __DIR__ . DIRECTORY_SEPARATOR . 'applications.json';

if (!file_exists($jsonFile)) {
    $initial = [
        'schema_version' => '1.0',
        'updated_at' => date('c'),
        'applications' => [],
    ];
    file_put_contents(
        $jsonFile,
        json_encode($initial, JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES) . PHP_EOL,
        LOCK_EX
    );
}

$method = $_SERVER['REQUEST_METHOD'] ?? 'GET';

if ($method === 'GET') {
    $raw = file_get_contents($jsonFile);
    if ($raw === false) {
        http_response_code(500);
        echo json_encode(['ok' => false, 'error' => 'Gagal membaca applications.json']);
        exit;
    }
    echo $raw;
    exit;
}

if ($method === 'POST') {
    $body = file_get_contents('php://input');
    if ($body === false || trim($body) === '') {
        http_response_code(400);
        echo json_encode(['ok' => false, 'error' => 'Payload JSON kosong.']);
        exit;
    }

    $decoded = json_decode($body, true);
    if (!is_array($decoded) || !isset($decoded['applications']) || !is_array($decoded['applications'])) {
        http_response_code(422);
        echo json_encode(['ok' => false, 'error' => 'Format wajib memuat array applications.']);
        exit;
    }

    $payload = [
        'schema_version' => (string) ($decoded['schema_version'] ?? '1.0'),
        'updated_at' => date('c'),
        'applications' => array_values($decoded['applications']),
    ];

    $encoded = json_encode($payload, JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES);
    if ($encoded === false) {
        http_response_code(500);
        echo json_encode(['ok' => false, 'error' => 'Gagal melakukan encode JSON.']);
        exit;
    }

    $written = file_put_contents($jsonFile, $encoded . PHP_EOL, LOCK_EX);
    if ($written === false) {
        http_response_code(500);
        echo json_encode(['ok' => false, 'error' => 'Gagal menulis ke applications.json.']);
        exit;
    }

    echo json_encode(['ok' => true, 'updated_at' => $payload['updated_at'], 'count' => count($payload['applications'])]);
    exit;
}

http_response_code(405);
echo json_encode(['ok' => false, 'error' => 'Metode HTTP tidak diizinkan.']);
