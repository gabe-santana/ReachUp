/// <reference path='../ApiConnection.ts'/>
/// <reference path='MapMakerScripts/routines.script.js'/>

import { ApiConnection } from "../ApiConnection";

export module MallPlanController {

    export class clsMallPlanController extends ApiConnection.clsApiConnection {
         constructor(){
             super();
         }

         public async patch()
         {
            const json = getJson();
            return await this.httpPatch('Map/UpdatePlan', json, null);
         }
    } 
}
