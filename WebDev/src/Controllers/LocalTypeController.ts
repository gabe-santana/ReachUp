import { LocalType } from "../Models/LocalType";
import { ApiConnection } from "../services/ApiConnection";

export module LocalTypeController {
  export class clsLocalTypeController extends ApiConnection.clsApiConnection {
    constructor(){
      super();
    }

    public async Add(id : number, name : string)
    {
       return await this.httpPost(`LocalType/Post`, 
         new LocalType.clsLocalType(id, name)
         );
    }

    public async Update(id : number, name : string)
    {
       return await this.httpPatch(`LocalType/Patch`, 
         new LocalType.clsLocalType(id, name)
         );
    }

    public async Delete(id : number)
    {
       return await this.httpDelete(`LocalType/Delete?id=${id}`)
    }

    public async GetAll()
    {
       return await this.httpGet('LocalType/GetAll');
    }

    public async Get(id : number)
    {
       return await this.httpGet(`LocalType/Get?id=${id}`);
    }
  }
}