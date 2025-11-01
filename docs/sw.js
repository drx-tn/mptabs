self.addEventListener('fetch', function(event) {
  event.respondWith(
    caches.match(event.request)
    .then((response)=>{
      if(response){
        return response;
      }
      else{
        return fetch(event.request)
        .then((res)=>{
          return caches.open('mptabs-cache-v1-011125')
          .then((cache)=>{
            cache.put(event.request.url,res.clone());
            return res;
          })
        })
      }
    })
    .catch(()=>{})
  )
});
self.addEventListener("install", (event) => {
  event.waitUntil(
    caches
      .open("mptabs-cache-v1-011125")
      .then((cache) =>
        cache.addAll([
          "/",
          "/mptabs/index.html",
          "/mptabs/mptabs.png",
          "/mptabs/profile.png",
          "/mptabs/inc/style.css",
          "/mptabs/inc/data.json",
          "/mptabs/inc/tab.html"
        ]),
      ),
  );
});