/// <reference path='../ApiConnection.ts'/>

import { ApiConnection } from "../ApiConnection";

export module UserTokenController {

  export abstract class clsUser {
     public abstract async getToken() : Promise<any>;
     public abstract async setToken(token: string) : Promise<any>;
  }

    export class clsUserTokenController extends clsUser {
         constructor(){
             super();
         }

         async getToken(){
             const token = localStorage.getItem('token');
             if (token != null){
               return token;
             }
             return false;
         }

         async setToken(token : string){
             try{
                 localStorage.setItem('token', token);
             }
             catch{
                 return false;
             }
         }
     }
}

