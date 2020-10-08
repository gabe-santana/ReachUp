/// <reference path='../ApiConnection.ts'/>
/// <reference path='../js/MapMakerScripts/routines.script.js'/>


import { ApiConnection } from "../ApiConnection";

    export class clsMallPlanController extends ApiConnection.clsApiConnection {
         constructor(){
             super();
         }

         public async patch()
         {
            if (getJson()){
               const map = await this.httpGet('Map/UpdatePlan');
               return map;
            }
            return false;
         }
 
    } 
