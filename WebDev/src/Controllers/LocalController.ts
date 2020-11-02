import { Admin } from "../Models/Admin";
import { Beacon } from "../Models/Beacon";
import { Local } from "../Models/Local";
import { ApiConnection } from "../services/ApiConnection";

export module LocalController {
  export class clsLocalController extends ApiConnection.clsApiConnection {
    constructor(){
      super();
    }
    
     public async Get(id : number)
     {
        return await this.httpGet(`Local/Get?id=${id}`);
     }

     public async GetAll(type: number)
     {
        return await this.httpGet(`Local/GetAll?type=${type}`);
     }

     public async GetByBeacon(uuid : string)
     {
        return await this.httpGet(`Local/ByBeacon?uuid=${uuid}`)
     }

     public async Add(type : number, name : string, floor : number)
     {
        return await this.httpPost(`Local/Post`,
          new Local.clsLocal(null, type, name, floor, null, null)
          );
     } 

     public async Update(id : number, type : number, name : string, floor : number,
      admins : Admin.clsAdmin, beacons : Beacon.clsBeacon )
     {
        return await this.httpPatch(`Local/Patch`,
          new Local.clsLocal(id, type, name, floor, null, null)
          );
     }
  }
}