export module ReachUpWebAPI {
  
      export class clsReachUpWebAPI {
        public readonly _url: string;
        constructor() {
             this._url = 'https://192.168.0.109:8000/api';
         }

<<<<<<< HEAD
=======
<<<<<<< HEAD:WebAdmin/classes/models/models/ReachUpWebAPI.js
     export class clsReachUpWebAPI {
        constructor() {
            this.url = 'https://192.168.0.109:8000/api';
         }

         async httpGet(str, options = {})
         {
            const response = await fetch(this.url + str, {
=======
>>>>>>> ded10ec553451ce4a1052eea58a4b5c5526a7913
         public get url() : string {
           return this._url;
         }

         public async httpGet(str : string, options : Array<string> = [])
         {
            const response = await fetch(this._url + str, {
<<<<<<< HEAD
=======
>>>>>>> ded10ec553451ce4a1052eea58a4b5c5526a7913:WebAdmin/classes/models/ReachUpWebAPI.ts
>>>>>>> ded10ec553451ce4a1052eea58a4b5c5526a7913
                method: 'GET',
                headers: {
                    'Accept':'application/json',
                    'Content-Type':'application/json',
<<<<<<< HEAD
                    //...options.headers,
=======
<<<<<<< HEAD:WebAdmin/classes/models/models/ReachUpWebAPI.js
                    ...options.headers,
=======
                    //...options.headers,
>>>>>>> ded10ec553451ce4a1052eea58a4b5c5526a7913:WebAdmin/classes/models/ReachUpWebAPI.ts
>>>>>>> ded10ec553451ce4a1052eea58a4b5c5526a7913
                },
              })

              const json = await response.json();
              return json;
         }

<<<<<<< HEAD
=======
<<<<<<< HEAD:WebAdmin/classes/models/models/ReachUpWebAPI.js
         async httpPost(str, options = {})
         {
            const response = await fetch(this.url + str, {
                method: 'POST',
                body: options.body,
                headers: {
                    'Accept':'application/json',
                    'Content-Type':'application/json',
                    ...options.headers,
=======
>>>>>>> ded10ec553451ce4a1052eea58a4b5c5526a7913
         public async httpPost(str : string, options : Array<string> = [])
         {
            const response = await fetch(this._url + str, {
                method: 'POST',
                //body: options.body,
                headers: {
                    'Accept':'application/json',
                    'Content-Type':'application/json',
                    //...options.headers,
<<<<<<< HEAD
=======
>>>>>>> ded10ec553451ce4a1052eea58a4b5c5526a7913:WebAdmin/classes/models/ReachUpWebAPI.ts
>>>>>>> ded10ec553451ce4a1052eea58a4b5c5526a7913
                },
              })
              
              const json = await response.json();
              return json;

         }

<<<<<<< HEAD
         public async httpPatch(str : string, options : Array<string> = [])
         {
            const response = await fetch(this._url + str, {
=======
<<<<<<< HEAD:WebAdmin/classes/models/models/ReachUpWebAPI.js
         async httpPatch(str, options = {})
         {
            const response = await fetch(this.url + str, {
=======
         public async httpPatch(str : string, options : Array<string> = [])
         {
            const response = await fetch(this._url + str, {
>>>>>>> ded10ec553451ce4a1052eea58a4b5c5526a7913:WebAdmin/classes/models/ReachUpWebAPI.ts
>>>>>>> ded10ec553451ce4a1052eea58a4b5c5526a7913
                method: 'PATCH',
                headers: {
                    'Accept':'application/json',
                    'Content-Type':'application/json',
<<<<<<< HEAD
                    //...options.headers,
=======
<<<<<<< HEAD:WebAdmin/classes/models/models/ReachUpWebAPI.js
                    ...options.headers,
=======
                    //...options.headers,
>>>>>>> ded10ec553451ce4a1052eea58a4b5c5526a7913:WebAdmin/classes/models/ReachUpWebAPI.ts
>>>>>>> ded10ec553451ce4a1052eea58a4b5c5526a7913
                },
              })

              const json = await response.json();
              return json;

         }

<<<<<<< HEAD
         public async httpDelete(str : string, options : Array<string> = [])
         {
            const response = await fetch(this._url + str, {
=======
<<<<<<< HEAD:WebAdmin/classes/models/models/ReachUpWebAPI.js
         async httpDelete(str, options = {})
         {
            const response = await fetch(this.url + str, {
=======
         public async httpDelete(str : string, options : Array<string> = [])
         {
            const response = await fetch(this._url + str, {
>>>>>>> ded10ec553451ce4a1052eea58a4b5c5526a7913:WebAdmin/classes/models/ReachUpWebAPI.ts
>>>>>>> ded10ec553451ce4a1052eea58a4b5c5526a7913
                method: 'DELETE',
                headers: {
                    'Accept':'application/json',
                    'Content-Type':'application/json',
<<<<<<< HEAD
                    //...options.headers,
=======
<<<<<<< HEAD:WebAdmin/classes/models/models/ReachUpWebAPI.js
                    ...options.headers,
=======
                    //...options.headers,
>>>>>>> ded10ec553451ce4a1052eea58a4b5c5526a7913:WebAdmin/classes/models/ReachUpWebAPI.ts
>>>>>>> ded10ec553451ce4a1052eea58a4b5c5526a7913
                },
              })
                
              const json = await response.json();
              return json;

         }
     }
<<<<<<< HEAD
}
=======
<<<<<<< HEAD:WebAdmin/classes/models/models/ReachUpWebAPI.js
=======
}
>>>>>>> ded10ec553451ce4a1052eea58a4b5c5526a7913:WebAdmin/classes/models/ReachUpWebAPI.ts
>>>>>>> ded10ec553451ce4a1052eea58a4b5c5526a7913

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
