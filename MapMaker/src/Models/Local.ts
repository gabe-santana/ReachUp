/// <reference path='../services/ApiConnection.ts'/>
/// <reference path='../Models/User.ts'/>
/// <reference path='../Models/Beacon.ts'/>

import { ApiConnection } from "../services/ApiConnection";
import { User } from "../Models/User";
import { Beacon } from "../Models/Beacon";

export module Local {

  export class clsLocal extends ApiConnection.clsApiConnection {

     public id : number;
     public type : number;
     public name : string;
     public floor : number;
     public admins : Array<User.clsUser>;
     public beacons : Array<Beacon.clsBeacon>;

     constructor(id : number, type: number, name : string, floor : number,
      admins: null, beacons : null ){
       super();
       this.id = id;
       this.type = type;
       this.name = name;
       this.floor = floor;
       this.admins = new Array<User.clsUser>();
       this.beacons = new Array<Beacon.clsBeacon>();
     }

     public async Get(id : number)
     {
        return await this.httpGet(`Local/Get?id=${id}`)
     }

     public async GetByBeacon(uuid : string)
     {
        return await this.httpGet(`Local/ByBeacon?uuid=${uuid}`)
     }

     public async Add(local : clsLocal)
     {
        return await this.httpPost(`Local/Post`, local)
     } 

     public async Update(local : clsLocal)
     {
        return await this.httpPatch(`Local/Patch`, local)
     }

  }
}