/// <reference path='../models/ReachUpWebAPI.ts'/>

import { ReachUpWebAPI } from "../models/ReachUpWebAPI";

export module BeaconTypeRepository {

    export class clsBeaconTypeRepository extends ReachUpWebAPI.clsReachUpWebAPI {
         constructor(){
             super();
         }
         
        public async get()
        {
           const beaconTypes = await this.httpGet('BeaconType/Get');
           return beaconTypes;
        }
    } 
}