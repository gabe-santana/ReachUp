$document.ready(function(){

     export class clsReachUpWebAPI {
        constructor() {
            this.url = 'https://192.168.0.109:8000/api';
         }

         async httpGet(str, options = {})
         {
            const response = await fetch(this.url + str, {
                method: 'GET',
                headers: {
                    'Accept':'application/json',
                    'Content-Type':'application/json',
                    ...options.headers,
                },
              })

              const json = await response.json();
              return json;
         }

         async httpPost(str, options = {})
         {
            const response = await fetch(this.url + str, {
                method: 'POST',
                body: options.body,
                headers: {
                    'Accept':'application/json',
                    'Content-Type':'application/json',
                    ...options.headers,
                },
              })
              
              const json = await response.json();
              return json;

         }

         async httpPatch(str, options = {})
         {
            const response = await fetch(this.url + str, {
                method: 'PATCH',
                headers: {
                    'Accept':'application/json',
                    'Content-Type':'application/json',
                    ...options.headers,
                },
              })

              const json = await response.json();
              return json;

         }

         async httpDelete(str, options = {})
         {
            const response = await fetch(this.url + str, {
                method: 'DELETE',
                headers: {
                    'Accept':'application/json',
                    'Content-Type':'application/json',
                    ...options.headers,
                },
              })
                
              const json = await response.json();
              return json;

         }
     }

     /*function clsReachUpWebApi(url)
     {
         this.url = url;

         this.httpGet = async function (str)
         {
            await fetch(url, {
                method: 'GET',
                headers: {
                    'Accept':'application/json',
                    'Content-Type':'application/json'
                },
              })
                .then (this.response = JSON.parse(response => response.json()))
                .then(() => {
                  return this.response;
                })
                return false;
         }

         this.httpPost = async function(str)
         {
            await fetch(url, {
                method: 'POST',
                headers: {
                    'Accept':'application/json',
                    'Content-Type':'application/json'
                },
              })
                .then (this.response = JSON.parse(response => response.json()))
                .then(() => {
                  return this.response;
                })
                return false;
         }

         this.httpPatch = async function(str)
         {
            await fetch(url, {
                method: 'PATCH',
                headers: {
                    'Accept':'application/json',
                    'Content-Type':'application/json'
                },
              })
                .then (this.response = JSON.parse(response => response.json()))
                .then(() => {
                  return this.response;
                })
                return false;
         }

         this.httpDelete = async function(str)
         {
            await fetch(url, {
                method: 'DELETE',
                headers: {
                    'Accept':'application/json',
                    'Content-Type':'application/json'
                },
              })
                .then (this.response = JSON.parse(response => response.json()))
                .then(() => {
                  return this.response;
                })
                return false;
         }
     }*/
})
