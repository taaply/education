<?php

return [
    'name' => 'My PWA App',
    'manifest' => [
        'name' => 'My PWA App',
        'short_name' => 'PWA',
        'start_url' => '/',
        'display' => 'standalone',
        'theme_color' => '#000000',
        'background_color' => '#ffffff',
        'orientation'=> 'any',
        'icons' => [
            '192x192' => '/images/icons/icon-192x192.png',
            '512x512' => '/images/icons/icon-512x512.png'
        ],
    ],
    'offline' => [
        'enabled' => true,
        'route' => 'offline',
        'message' => 'You are currently offline.',
        'image' => '/images/offline.png'
    ]
];
