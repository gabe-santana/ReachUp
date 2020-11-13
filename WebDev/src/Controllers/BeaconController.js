class clsBeaconController {
    api;
        
    constructor(){
       this.api = new clsApiConnection();
    }

    async Get(uuid)
    {
       return await this.api.httpGet(`Beacon/Get?uuid=${uuid}`);
    }

    async GetAll(type)
    {
       return await this.api.httpGet(`Beacon/GetAll?type=${type}`);
    }

    async ByLocal(id)
    {
       return await this.api.httpGet(`Beacon/ByLocal?local=${id}`);
    }

    async Post(uuid, Type, 
      Local)
    {
       return await this.api.httpPost('Beacon/Post',
         new Beacon.clsBeacon(uuid, type, local)
        );
    }

    async Patch(uuid, Type, 
      Local)
    {
       return await this.api.httpPatch('Beacon/Patch',
         new Beacon.clsBeacon(uuid, type, local));
    }

    async Delete(uuid)
    {
       return await this.api.httpDelete(`Beacon/Delete?uuid=${uuid}`);
    }
  }
