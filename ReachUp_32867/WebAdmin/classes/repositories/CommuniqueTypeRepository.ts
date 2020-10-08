/// <reference path='../models/ReachUpWebAPI.ts'/>

import { ReachUpWebAPI } from "../models/ReachUpWebAPI";

export module CommuniqueTypeRepository {
  
    export class clsCommuniqueTypeRepository extends ReachUpWebAPI.clsReachUpWebAPI {
         constructor(){
             super();
         }

        public async get()
        {
            const communiqueTypes = await this.httpGet('CommuniqueType/Get');
            return communiqueTypes;
        }
    } 
}