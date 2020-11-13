class clsLocalController {
    api;
    constructor(){
      this.api = new clsApiConnection();
    }
    
    async search(s)
    {
        return await 
          this.api.httpGet(`Local/Search?s=${s}`);
    }

    async getAll(type)
    {
        return await 
          this.api.httpGet(`Local/GetAll?type=${type}`);
    }

    async get(id)
    {
        return await
         this.api.httpGet(`Local?id=${id}`)
    }

     async GetByBeacon(uuid)
     {
        return await this.api.httpGet(`Local/ByBeacon?uuid=${uuid}`)
     }

     async GetAdmins(id)
     {
        return await
          this.api.httpGet(
             `Local/GetAdmins?local=${id}`
          )
     }

     async checkBeacon(uuid)
     {
        return await
         this.api.httpGet(
            `Local/CheckBeacon?uuid=${uuid}`
         )
     }

     async Add(Local)
     {
        console.log(JSON.stringify({type: Local.LocalType,
         name: Local.Name, 
         floor: Local.Floor,
         openingHour: Local.OpeningHour,
         closingHour: Local.ClosingHour,
         beaconUUID: Local.BeaconUUID}));
        return await 
          this.api.httpPost(
          `Local/`,
          {
             type: Local.LocalType,
             name: Local.Name, 
             floor: Local.Floor,
             openingHour: Local.OpeningHour,
             closingHour: Local.ClosingHour,
             beaconUUID: Local.BeaconUUID

          }
        );
     } 

     async delete(id)
     {
        return await 
          this.api.httpDelete(
              `Local?id=${id}`);
     }
  }