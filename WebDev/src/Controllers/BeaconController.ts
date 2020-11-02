import { Beacon } from "../Models/Beacon";
import { BeaconType } from "../Models/BeaconType";
import { Local } from "../Models/Local";
import { ApiConnection } from "../services/ApiConnection";

export module BeaconController {

  export class clsBeaconController extends ApiConnection.clsApiConnection {
        
    constructor(){
       super();
    }

    public async Get(uuid : string)
    {
       return await this.httpGet(`Beacon/Get?uuid=${uuid}`);
    }

    public async GetAll(type : number)
    {
       return await this.httpGet(`Beacon/GetAll?type=${type}`);
    }

    public async ByLocal(id : number)
    {
       return await this.httpGet(`Beacon/ByLocal?local=${id}`);
    }

    public async Post(uuid : string, type : BeaconType.clsBeaconType, 
      local : Local.clsLocal)
    {
       return await this.httpPost('Beacon/Post',
         new Beacon.clsBeacon(uuid, type, local)
        );
    }

    public async Patch(uuid : string, type : BeaconType.clsBeaconType, 
      local : Local.clsLocal)
    {
       return await this.httpPatch('Beacon/Patch',
         new Beacon.clsBeacon(uuid, type, local));
    }

    public async Delete(uuid : string)
    {
       return await this.httpDelete(`Beacon/Delete?uuid=${uuid}`);
    }
  }
}
