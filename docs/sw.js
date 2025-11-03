const CACHE_NAME = 'mptabs-cache-v031125';
const ASSETS_TO_CACHE = [
  '/',
  '/mptabs/index.html',
  '/mptabs/mptabs.png',
  '/mptabs/profile.png',
  '/mptabs/inc/style.css',
  '/mptabs/inc/data.json',
  '/mptabs/inc/tab.html', // Cache only once without query params
];
// INSTALL: Pre-cache static assets
self.addEventListener('install', event => {
  event.waitUntil(
    caches.open(CACHE_NAME)
      .then(cache => cache.addAll(ASSETS_TO_CACHE))
      .catch(err => {
        console.error('Service Worker install failed:', err);
      })
  );
  self.skipWaiting();
});
// ACTIVATE: Clean up old caches
self.addEventListener('activate', event => {
  event.waitUntil(
    caches.keys().then(keys =>
      Promise.all(
        keys.filter(k => k !== CACHE_NAME)
          .map(k => caches.delete(k))
      )
    )
  );
  self.clients.claim();
});
// FETCH: Handle requests with smart caching
self.addEventListener('fetch', event => {
  const url = new URL(event.request.url);
  // Serve cached /mptabs/inc/tab.html for any ?i= query param variants
  if (url.pathname === '/mptabs/inc/tab.html') {
    event.respondWith(
      caches.match('/mptabs/inc/tab.html')
        .then(cachedResponse => {
          if (cachedResponse) return cachedResponse;
          // Fallback to network if not cached
          return fetch(event.request).then(networkResponse => {
            if (!networkResponse || networkResponse.status !== 200 || networkResponse.type !== 'basic') {
              return networkResponse;
            }
            const responseClone = networkResponse.clone();
            caches.open(CACHE_NAME).then(cache => {
              cache.put('/mptabs/inc/tab.html', responseClone);
            });
            return networkResponse;
          });
        }).catch(() => {
          // Optional: offline fallback page or response here
          return caches.match('/mptabs/index.html');
        })
    );
    return;
  }
  if (event.request.method !== 'GET') return;
  event.respondWith(
    caches.match(event.request)
      .then(resp => {
        if (resp) return resp;

        return fetch(event.request)
          .then(networkResp => {
            if (!networkResp || networkResp.status !== 200 || networkResp.type !== 'basic') {
              return networkResp;
            }
            const respClone = networkResp.clone();
            caches.open(CACHE_NAME).then(cache => {
              cache.put(event.request, respClone);
            });
            return networkResp;
          })
          .catch(() => {
            if (event.request.destination === 'document') {
              return caches.match('/mptabs/index.html');
            }
          });
      })
  );
});