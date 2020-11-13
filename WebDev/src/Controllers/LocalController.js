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

     async Add(type, name, floor, opening, closing)
     {
        return await 
          this.api.httpPost(
          `Local/`,
          {
             type: type,
             name: name, 
             floor: floor,
             openingHour: opening,
             closingHour: closing

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