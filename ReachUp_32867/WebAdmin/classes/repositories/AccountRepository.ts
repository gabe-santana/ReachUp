/// <reference path='../models/ReachUpWebAPI.ts'/>

import { ReachUpWebAPI } from "../models/ReachUpWebAPI";

export module AccountRepository {

    export class clsAccountRepository extends ReachUpWebAPI.clsReachUpWebAPI {
         constructor(){
           super();
         }
        
         public async login(email : string, password : string)
         {
            const nm_user = await this.httpGet('Account/Login?Email=' + email + '&Password=' + password + '&role=adm');
            return nm_user;
         } 
     }
}
