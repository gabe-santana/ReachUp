class BeaconController {
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

    async add(Beacon, localId)
    {
       return await 
        this.api.httpAnonymousPost(
           'Beacon/',
           {
              uuid: Beacon.UUID,
              type: Beacon.Type,
              localBeacon: {
                 idLocal: localId
              }
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
