class ApiConnection {
  config;
  constructor() {
      this.config = new clsApiConfig();
   }

   async httpAnonymousGet(str, options = [])
   {
      const response = await fetch(this.config.url() + str, {
          mode: 'cors',
          method: 'GET',
          headers: {
            'Accept':'application/json',
            'Accept-Ranges': 'bytes',
            'Content-Type':'application/json',
            'Pragma': 'no-cache',
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
            'Authorization': 'Bearer ' + localStorage.getItem('token'),
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

   async httpGetFile(str, fileType, options = [])
   {
      const response = await fetch(this.config.url() + str, {
          mode: 'cors',
          method: 'GET',
          headers: {
            'Accept': `${fileType}`,
            'Content-Type':`${fileType}`,
          },
      })

        const blob = await response.blob();
        console.log(blob);
        return blob;
   }

   async httpAnonymousPost(str, data, options = [])
   {
      const response = await fetch(this.config.url() + str, {
          //mode: 'cors',
          method: 'POST',
          body: JSON.stringify(data),
          headers: {
            'Accept':'application/json',
              'Content-Type':'application/json',
          },
          /*cache: 'no-cache',
          credentials: 'same-origin',
          redirect: 'follow',
          referrerPolicy: 'no-referrer'*/
        })
        
        const json = await response.json();
        console.log(json);
        return json;

   }

   async httpPost(str, data, options = [])
   {
      const response = await fetch(this.config.url() + str, {
          //mode: 'cors',
          method: 'POST',
          body: JSON.stringify(data),
          headers: {
            'Accept':'application/json',
              'Content-Type':'application/json',
              'Authorization': 'Bearer ' + localStorage.getItem('token'),
          },
          /*cache: 'no-cache',
          credentials: 'same-origin',
          redirect: 'follow',
          referrerPolicy: 'no-referrer'*/
        })
        
        const json = await response.json();
        console.log(json);
        return json;

   }

   async httpPostFile(str, file, fileType, options = [])
   {
      const response = await fetch(this.config.url() + str, {
          mode: 'cors',
          method: 'POST',
          body: file,
          headers: {
            'Accept':`${fileType}`,
              'Content-Type':`${fileType}`,
          },
      })
      const json = await response.json();
      console.log(json);
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
            'Authorization': 'Bearer ' + localStorage.getItem('token'),
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

   async httpAnonymousPatch(str, data, options = [])
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
            'Authorization': 'Bearer ' + localStorage.getItem('token'),
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
            'Authorization': 'Bearer ' + localStorage.getItem('token'),
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