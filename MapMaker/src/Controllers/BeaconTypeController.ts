import { BeaconType } from "../Models/BeaconType";
import { ApiConnection } from "../services/ApiConnection";

export module BeaconTypeController {
  export class clsBeaconTypeController extends ApiConnection.clsApiConnection {
    constructor(){
      super();
    }

    public async Add(id : number, name : string)
    {
       return await this.httpPost(`BeaconType/Post`, 
         new BeaconType.clsBeaconType(id, name)
         );
    }

    public async Update(id : number, name : string)
    {
       return await this.httpPatch(`BeaconType/Patch`, 
         new BeaconType.clsBeaconType(id, name)
         );
    }

    public async Delete(id : number)
    {
       return await this.httpDelete(`BeaconType/Delete?id=${id}`)
    }

    public async GetAll()
    {
       return await this.httpGet('BeaconType/GetAll');
    }

    public async Get(id : number)
    {
       return await this.httpGet(`BeaconType/Get?id=${id}`);
    }
  }
}