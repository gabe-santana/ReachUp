/// <reference path='../ApiConnection.ts'/>
/// <reference path='MapMakerScripts/routines.script.js'/>

import { ApiConnection } from "../ApiConnection";

export module MallPlanController {

    export class clsMallPlanController extends ApiConnection.clsApiConnection {
         constructor(){
             super();
         }

         public async get()
         {
             const json = await this.httpGet('Map/Get', null);
             setJson(json);
         }

         public async put()
         {
            const json = getJson();
            return await this.httpPut('Map/Put', json, null);
         }
    } 
}
