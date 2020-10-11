/// <reference path='js/Models/UserToken.ts'/>

import { UserToken } from "../MapMaker/js/Models/UserToken";

export module ApiConnection {
  
    export class clsApiConnection {
      public readonly _url: string;
      private readonly _token : string;
      constructor() {
           this._url = 'http://192.168.0.109:5000/api/';
           var tokenAcess = new UserToken.clsUserToken();
           this._token = tokenAcess.getToken();
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
                'Accept-Ranges': 'bytes',
                'Content-Type':'application/json',
                'Pragma': 'no-cache',
                'Authorization': 'Bearer ' + this._token,
                'X-Custom-Header': 'ProcessThisImmediately',
                'WWW-Authenticate': 'Basic',
                'Connection': 'close',
              },
              cache: 'no-cache',
              credentials: 'same-origin',
              redirect: 'follow',
              referrerPolicy: 'no-referrer'
            })

            const json = await response.json();
            return json;
       }

       public async httpPost(str : string, data : object, options : Array<string> = [])
       {
          const response = await fetch(this._url + str, {
              mode: 'cors',
              method: 'POST',
              body: JSON.stringify(data),
              headers: {
                'Accept':'application/json',
                  'Accept-Ranges': 'bytes',
                  'Content-Type':'application/json',
                  'Pragma': 'no-cache',
                  'Authorization': 'Bearer ' + this._token,
                  'X-Custom-Header': 'ProcessThisImmediately',
                  'WWW-Authenticate': 'Basic',
                  'Connection': 'close',
              },
              cache: 'no-cache',
              credentials: 'same-origin',
              redirect: 'follow',
              referrerPolicy: 'no-referrer'
            })
            
            const json = await response.json();
            return json;

       }

       public async httpPut(str : string, data : object, options : Array<string> = [])
       {
          const response = await fetch(this._url + str, {
              mode: 'cors',
              method: 'PUT',
              body: JSON.stringify(data),
              headers: {
                'Accept':'application/json',
                'Accept-Ranges': 'bytes',
                'Content-Type':'application/json',
                'Pragma': 'no-cache',
                'Authorization': 'Bearer ' + this._token,
                'X-Custom-Header': 'ProcessThisImmediately',
                'WWW-Authenticate': 'Basic',
                'Connection': 'close',
              },
              cache: 'no-cache',
              credentials: 'same-origin',
              redirect: 'follow',
              referrerPolicy: 'no-referrer'
            })

            const json = await response.json();
            return json;

       }

       public async httpPatch(str : string, data : object, options : Array<string> = [])
       {
          const response = await fetch(this._url + str, {
              mode: 'cors',
              method: 'PATCH',
              body: JSON.stringify(data),
              headers: {
                'Accept':'application/json',
                'Accept-Ranges': 'bytes',
                'Content-Type':'application/json',
                'Pragma': 'no-cache',
                'Authorization': 'Bearer ' + this._token,
                'X-Custom-Header': 'ProcessThisImmediately',
                'WWW-Authenticate': 'Basic',
                'Connection': 'close',
              },
              cache: 'no-cache',
              credentials: 'same-origin',
              redirect: 'follow',
              referrerPolicy: 'no-referrer'
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
                'Accept-Ranges': 'bytes',
                'Content-Type':'application/json',
                'Pragma': 'no-cache',
                'Authorization': 'Bearer ' + this._token,
                'X-Custom-Header': 'ProcessThisImmediately',
                'WWW-Authenticate': 'Basic',
                'Connection': 'close',
              },
              cache: 'no-cache',
              credentials: 'same-origin',
              redirect: 'follow',
              referrerPolicy: 'no-referrer'
            })
              
            const json = await response.json();
            return json;

       }
   }
}
