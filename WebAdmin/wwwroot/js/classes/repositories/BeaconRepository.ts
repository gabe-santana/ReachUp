/// <reference path='../models/ReachUpWebAPI.ts'/>

import { ReachUpWebAPI } from "../models/ReachUpWebAPI";

export module BeaconRepository {

    export class clsBeaconRepository extends ReachUpWebAPI.clsReachUpWebAPI {
         constructor(){
            super();
         }

        public async getAll(type :number)
        {
           const beacons = await this.httpGet('Beacon/GetAll?Type=' + type);
           return beacons;
        }

        public async get(uuid : string)
        {
            const beacons = await this.httpGet('Beacon/Get?UUID=' + uuid);
            return beacons;
        }

        public async post(beacon : [number, string])
        {
           const httpStatus = await this.httpPost('Beacon/Post');
           return httpStatus;
        }

        public async patch(beacon : [number, string, number])
        {
           const httpStatus = await this.httpPatch('Beacon/Patch');
           return httpStatus;
        }

        public async delete(uuid : number)
        {
           const httpStatus = await this.httpDelete('Beacon/Delete?UUID=' + uuid);
           return httpStatus;
        }

    } 
}