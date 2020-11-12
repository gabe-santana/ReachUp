class clsApiConnection  {
      config;
      constructor() {
          this.config = new clsApiConfig();
       }

       getToken(name)
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
          }.
          return unescape(cookies.substring(begin + prefix.length, end));
       }

       async httpGet(str, options = [])
       {
          const response = await fetch(this.config.url() + str, {
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

       async httpPost(str, data, options = [])
       {
          const response = await fetch(this.config.url() + str, {
              mode: 'cors',
              method: 'POST',
              body: JSON.stringify(data),
              headers: {
                'Accept':'application/json',
                  'Accept-Ranges': 'bytes',
                  'Content-Type':'application/json',
                  'Pragma': 'no-cache',
                  //'Authorization': 'Bearer ' + this.getToken('userToken'),
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

       async httpPut(str, data, options = [])
       {
          const response = await fetch(this.config.url() + str, {
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

       async httpPatch(str, data, options = [])
       {
          const response = await fetch(this.config.url() + str, {
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

       async httpDelete(str, options = [])
       {
          const response = await fetch(this.config.url() + str, {
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
}
