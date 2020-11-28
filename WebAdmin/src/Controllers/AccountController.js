class AccountController {
         api;
         constructor(){
           this.api = new ApiConnection();
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
         
         async signUp(email, name, password)
         {
             return await
              this.api.httpPost(
                `Account/SignUp`,
                {
                   email: email,
                   name: name,
                   password: password,
                   role: 'adm'
                }
            );
         }

         async recoverPassword(email)
         {
             return await
               this.api.httpGet(
                 `Account/RecoverPassword?Email=${email}`
               );
         }

         async tryUpdatePassword(email, code)
         {
             return await
               this.api.httpGet(
                 `Account/TryUpdatePassword?Email=${email}&Code=${code}`
               );
         }

         async updatePassword(email, role, password)
         {
              return await
                this.api.httpPatch(
                 `Account/UpdatePassword?Email=${email}&role=${role}&password=${password}`
                );
         }

         async searchShopkeeperByName(name)
         {
             return await
              this.api.httpAnonymousGet(`Account/SearchShopkeeperByName?name=${name}`);
         }

         async getShopkeeperLocal(email)
         {
            return await 
              this.api.httpAnonymousGet(`Account/GetShopkeeperLocal?email=${email}`);
         }

     }