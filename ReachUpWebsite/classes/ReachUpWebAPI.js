//$document.ready(function(){

     export default {
        class: clsReachUpWebAPI,
        methods: [
          httpGet(),
          httpPost(),
          httpPatch(),
          httpDelete()
        ]
     }

     export class clsReachUpWebAPI {
        constructor() {
            this.url = 'https://192.168.0.109:8000/api';
            this.response = "";
         }

         async httpGet(str)
         {
            await fetch(this.url + str, {
                method: 'GET',
                headers: {
                    'Accept':'application/json',
                    'Content-Type':'application/json'
                },
              })
                .then (this.response = JSON.parse(response => response.json()))
                /*.then(() => {
                  return this.response;
                })*/
         }

         async httpPost(str)
         {
            await fetch(this.url + str, {
                method: 'POST',
                headers: {
                    'Accept':'application/json',
                    'Content-Type':'application/json'
                },
              })
                .then (this.response = JSON.parse(response => response.json()))
                /*.then(() => {
                  return this.response;
                })*/
         }

         async httpPatch(str)
         {
            await fetch(this.url + str, {
                method: 'PATCH',
                headers: {
                    'Accept':'application/json',
                    'Content-Type':'application/json'
                },
              })
                .then (this.response = JSON.parse(response => response.json()))
                /*.then(() => {
                  return this.response;
                })*/
         }

         async httpDelete(str)
         {
            await fetch(this.url + str, {
                method: 'DELETE',
                headers: {
                    'Accept':'application/json',
                    'Content-Type':'application/json'
                },
              })
                .then (this.response = JSON.parse(response => response.json()))
                /*.then(() => {
                  return this.response;
                })
                return false;*/
         }
     }

     const ReachUpWebApi;
     ReachUpWebApi = new clsReachUpWebAPI("");

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
//})
