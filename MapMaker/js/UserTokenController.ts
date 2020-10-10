/// <reference path='../ApiConnection.ts'/>

import { ApiConnection } from "../ApiConnection";

export module UserTokenController {

    export class clsUserTokenController extends ApiConnection.clsApiConnection {
         constructor(){
             super();
         }

         private static async getUserToken(){
             const token = localStorage.getItem('token');
             if (token != null){
               return token;
             }
             return false;
         }

         private static async setUserToken(token : string){
               try{
                 localStorage.setItem('token', token);
               }
               catch{
                 return false;
               }
         }
     }
}

