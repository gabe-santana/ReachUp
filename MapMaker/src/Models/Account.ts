/// <reference path='../services/ApiConnection.ts'/>

import { ApiConnection } from "../services/ApiConnection";

export module Account {

    export class clsAccount extends ApiConnection.clsApiConnection {
         constructor(){
           super();
         }
        
         public async login(User : any)
         {
            const logIn = await this.httpGet(`Account/Login?Email=${User.email}&Password=${User.password}&role=dev`);
            return logIn;
         } 
     }
}
