/// <reference path='../../ApiConnection.ts'/>

import { ApiConnection } from "../../ApiConnection";

export module User {

    export class clsUser extends ApiConnection.clsApiConnection {
         constructor(){
             super();
          }

        public async get(email : string, password : string)
        {
           return null;
        }
    } 
}