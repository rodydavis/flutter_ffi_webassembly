'use strict';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "/index.html": "d7098a741862fead33d74631e2385574",
"/main.dart.js": "5f851024e8a8eae9dd4b58caee9b7b74",
"/favicon.png": "5dcef449791fa27946b3d35ad8803796",
"/icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"/icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"/manifest.json": "a706713a3f2e10971a93cfea0ade7817",
"/assets/LICENSE": "bca3ff5ea70f204a4ffb885c3ac55018",
"/assets/target/debug/libadder.d": "e72d13081f73774fda07cc2bbefef389",
"/assets/target/debug/libadder.dylib": "24c70cdaed239f4eb059f71ab9f40363",
"/assets/target/debug/deps/libadder.dylib.dSYM/Contents/Resources/DWARF/libadder.dylib": "5df26a752a5bf6db999ff33e96989dd8",
"/assets/target/debug/deps/libadder.dylib": "24c70cdaed239f4eb059f71ab9f40363",
"/assets/target/debug/dart_wasmer": "3c93fa5dc6992789d2033b3f7a13044a",
"/assets/target/debug/dart_wasmer.d": "72894681a557a916b4073ba302c18d84",
"/assets/AssetManifest.json": "7a5e66799ec00e4440f7c714605a08b9",
"/assets/FontManifest.json": "01700ba55b08a6141f33e168c4a6c22f",
"/assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "115e937bb829a890521f72d2e664b632",
"/assets/fonts/MaterialIcons-Regular.ttf": "56d3ffdef7a25659eab6a68a3fbfaf16",
"/assets/src/add.wasm": "61c7d282dce9caf7577852b77f97f11f"
};

self.addEventListener('activate', function (event) {
  event.waitUntil(
    caches.keys().then(function (cacheName) {
      return caches.delete(cacheName);
    }).then(function (_) {
      return caches.open(CACHE_NAME);
    }).then(function (cache) {
      return cache.addAll(Object.keys(RESOURCES));
    })
  );
});

self.addEventListener('fetch', function (event) {
  event.respondWith(
    caches.match(event.request)
      .then(function (response) {
        if (response) {
          return response;
        }
        return fetch(event.request);
      })
  );
});
