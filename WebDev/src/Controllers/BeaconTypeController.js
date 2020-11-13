class clsBeaconTypeController {
    api;
    constructor(){
      this.api = new clsApiConnection();
    }

    async Add(id, name)
    {
       return await this.api.httpPost(`BeaconType/Post`, 
         new clsBeaconType(id, name)
         );
    }

    async Update(id, name)
    {
       return await this.api.httpPatch(`BeaconType/Patch`, 
         new clsBeaconType(id, name)
         );
    }

    async Delete(id)
    {
       return await this.api.httpDelete(`BeaconType/Delete?id=${id}`)
    }

    async GetAll()
    {
       return await this.api.httpGet('BeaconType/GetAll');
    }

    async Get(id)
    {
       return await this.api.httpGet(`BeaconType/Get?id=${id}`);
    }
  }