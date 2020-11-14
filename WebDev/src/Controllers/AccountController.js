class clsAccountController {
         api;
         constructor(){
           this.api = new clsApiConnection();
         }
        
         async login(email, password)
         {
            return await 
             this.api.httpAnonymousPost(
               `Account/SignIn`,
               {
                  email: email,
                  password: password,
                  role: 'dev'
               }
               
            )
         }

         async recoverPassword(email)
         {
             return await
               this.api.httpAnonymousGet(
                 `Account/RecoverPassword?Email=${email}`
               );
         }

         async tryUpdatePassword(email, code)
         {
             return await
               this.api.httpAnonymousGet(
                 `Account/TryUpdatePassword?email=${email}&cod=${code}`
               );
         }

         async updatePassword(email, password)
         {
              return await
                this.api.httpAnonymousPatch(
                 `Account/UpdatePassword?Email=${email}&role=dev&password=${password}`
                );
         }
     }
