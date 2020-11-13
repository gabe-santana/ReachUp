class clsAccountController {
         api;
         constructor(){
           this.api = new clsApiConnection();
         }
        
         async login(email, password)
         {
            return await 
             this.api.httpGet(
               `Account/SignIn?Email=${email}
               &Password=${password}
               &role=dev`
            );
         } 
     }
