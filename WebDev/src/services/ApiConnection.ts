import { ApiConfig } from "./ApiConfig";

export module ApiConnection {
  
    export class clsApiConnection extends ApiConfig.clsApiConfig {
      constructor() {
          super();
       }

       private getToken(name : string) : string
       {
          var cookies = document.cookie,
              prefix = name + '=',
              begin = cookies.indexOf('; ' + prefix);

          if (begin == -1) {
            begin = cookies.indexOf(prefix);

            if (begin != 0) {
              return null;
            }
          } else {
             begin += 2;
          }

          var end = cookies.indexOf(';', begin);

          if (end == -1) {
            end = cookies.length;
          }
          return unescape(cookies.substring(begin + prefix.length, end));
       }

       public async httpGet(str : string, options : Array<string> = [])
       {
          const response = await fetch(this.url() + str, {
              mode: 'cors',
              method: 'GET',
              headers: {
                'Accept':'application/json',
                'Accept-Ranges': 'bytes',
                'Content-Type':'application/json',
                'Pragma': 'no-cache',
                'Authorization': 'Bearer ' + this.getToken('userToken'),
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
          const response = await fetch(this.url() + str, {
              mode: 'cors',
              method: 'POST',
              body: JSON.stringify(data),
              headers: {
                'Accept':'application/json',
                  'Accept-Ranges': 'bytes',
                  'Content-Type':'application/json',
                  'Pragma': 'no-cache',
                  'Authorization': 'Bearer ' + this.getToken('userToken'),
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
          const response = await fetch(this.url() + str, {
              mode: 'cors',
              method: 'PUT',
              body: JSON.stringify(data),
              headers: {
                'Accept':'application/json',
                'Accept-Ranges': 'bytes',
                'Content-Type':'application/json',
                'Pragma': 'no-cache',
                'Authorization': 'Bearer ' + this.getToken('userToken'),
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
          const response = await fetch(this.url() + str, {
              mode: 'cors',
              method: 'PATCH',
              body: JSON.stringify(data),
              headers: {
                'Accept':'application/json',
                'Accept-Ranges': 'bytes',
                'Content-Type':'application/json',
                'Pragma': 'no-cache',
                'Authorization': 'Bearer ' + this.getToken('userToken'),
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
          const response = await fetch(this.url() + str, {
              mode: 'cors',
              method: 'DELETE',
              headers: {
                'Accept':'application/json',
                'Accept-Ranges': 'bytes',
                'Content-Type':'application/json',
                'Pragma': 'no-cache',
                'Authorization': 'Bearer ' + this.getToken('userToken'),
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

      /* public async httpGetBlob(str : string, options : Array<string> = []) : Promise<Blob>
       {
          const response = await fetch(this.url() + str, {
              mode: 'cors',
              method: 'GET',
              headers: {
                'Accept':'application/octet-stream',
                'Accept-Ranges': 'bytes',
                'Content-Type':'application/octet-stream',
                'Pragma': 'no-cache',
                'Authorization': 'Bearer ' + this.getToken('userToken'),
                'X-Custom-Header': 'ProcessThisImmediately',
                'WWW-Authenticate': 'Basic',
                'Connection': 'close',
              },
              cache: 'no-cache',
              credentials: 'same-origin',
              redirect: 'follow',
              referrerPolicy: 'no-referrer'
            })

            const json = await response.blob();
            return json;
       }

       public async httpPutBlob(str : string, data : Blob, options : Array<string> = [])
       {
          const response = await fetch(this.url() + str, {
              mode: 'cors',
              method: 'PUT',
              body: data,
              headers: {
                'Accept':'application/octet-stream',
                'Accept-Ranges': 'bytes',
                'Content-Type':'application/octet-stream',
                'Pragma': 'no-cache',
                'Authorization': 'Bearer ' + this.getToken('userToken'),
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

       } */
   }
}
