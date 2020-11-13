class clsBeaconTypeController {
    api;
    constructor(){
      this.api = new clsApiConnection();
    }

    async GetAll()
    {
       return await 
        this.api.httpGet('BeaconType/GetAll');
    }

    async Add(BeaconType)
    {
       return await 
        this.api.httpPost(
           `BeaconType/`,
           {
              name: BeaconType.Name
           }
         
         );
    }

    async Update(BeaconType)
    {
       return await 
        this.api.httpPatch(
           `BeaconType/`,
           {
              id: BeaconType.Id,
              name: BeaconType.Name

           }
         
         );
    }

    async Delete(id)
    {
       return await 
        this.api.httpDelete(`BeaconType?id=${id}`)
    }
}