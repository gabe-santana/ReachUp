class clsAccountController {
         api;
         constructor(){
           this.api = new clsApiConnection();
         }
        
         async login(email, password)
         {
            return await 
             this.api.httpPost(
               `Account/SignIn/`,
               {
                   email: email,
                   password: password,
                   role: 'adm'
               }
            );
         } 
     }