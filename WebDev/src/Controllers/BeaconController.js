class clsBeaconController {
    api;
        
    constructor(){
       this.api = new clsApiConnection();
    }

    async Get(uuid)
    {
       return await 
        this.api.httpGet(`Beacon?uuid=${uuid}`);
    }

    async GetAll(type)
    {
       return await 
        this.api.httpGet(`Beacon/GetAll?type=${type}`);
    }

    async ByLocal(id)
    {
       return await 
        this.api.httpGet(`Beacon/ByLocal?local=${id}`);
    }

    async Post(Beacon)
    {
       return await 
        this.api.httpPost(
           'Beacon/',
           {
              uuid: Beacon.uuid,
              type: Beacon.BeaconType.Id,
              local: Beacon.Local.Id
           }
          
        );
    }

    async Delete(uuid)
    {
       return await 
        this.api.httpDelete(
           `Beacon?uuid=${uuid}`);
    }
}
