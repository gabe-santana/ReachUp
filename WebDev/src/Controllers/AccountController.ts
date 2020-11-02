import { ApiConnection } from "../services/ApiConnection";

export module AccountController {

    export class clsAccountController extends ApiConnection.clsApiConnection {
         constructor(){
           super();
         }
        
         public async login(email : string, password : string)
         {
            return await 
             this.httpGet(
               `Account/Login?Email=${email}
               &Password=${password}
               &role=dev`
            );
         } 
     }
}
