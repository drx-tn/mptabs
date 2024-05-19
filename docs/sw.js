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
          return caches.open('qrcheck-cache-v1')
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