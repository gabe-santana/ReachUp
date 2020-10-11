/// <reference path='../../ApiConnection.ts'/>

import { ApiConnection } from "../../ApiConnection";

export module Account {

    export class clsAccount extends ApiConnection.clsApiConnection {
         constructor(){
           super();
         }
        
         public async login(email : string, password : string)
         {
            const user = await this.httpGet('Account/Login?Email=' + email + '&Password=' + password + '&role=dev');
            return user;
         } 
     }
}
