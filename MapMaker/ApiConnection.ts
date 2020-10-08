export module ApiConnection {
  
    export class clsApiConnection {
      public readonly _url: string;
      constructor() {
           this._url = 'https://192.168.0.109:8000/api';
       }

       public get url() : string {
         return this._url;
       }

       public async httpGet(str : string, options : Array<string> = [])
       {
          const response = await fetch(this._url + str, {
              mode: 'cors',
              method: 'GET',
              headers: {
                  'Accept':'application/json',
                  'Content-Type':'application/json',
                  //...options.headers,
              },
            })

            const json = await response.json();
            return json;
       }

       public async httpPost(str : string, options : Array<string> = [])
       {
          const response = await fetch(this._url + str, {
              mode: 'cors',
              method: 'POST',
              //body: options.body,
              headers: {
                  'Accept':'application/json',
                  'Content-Type':'application/json',
                  //...options.headers,
              },
            })
            
            const json = await response.json();
            return json;

       }

       public async httpPatch(str : string, options : Array<string> = [])
       {
          const response = await fetch(this._url + str, {
              mode: 'cors',
              method: 'PATCH',
              headers: {
                  'Accept':'application/json',
                  'Content-Type':'application/json',
                  //...options.headers,
              },
            })

            const json = await response.json();
            return json;

       }

       public async httpDelete(str : string, options : Array<string> = [])
       {
          const response = await fetch(this._url + str, {
              mode: 'cors',
              method: 'DELETE',
              headers: {
                  'Accept':'application/json',
                  'Content-Type':'application/json',
                  //...options.headers,
              },
            })
              
            const json = await response.json();
            return json;

       }
   }
}
