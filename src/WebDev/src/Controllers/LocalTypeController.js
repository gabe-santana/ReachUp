class clsLocalTypeController {
    api;
    constructor(){
      this.api = new clsApiConnection();
    }

    async GetAll()
    {
       return await 
        this.api.httpGet('LocalType/GetAll');
    }

    async Add(LocalType)
    {
       return await 
        this.api.httpPost(
           `LocalType/`,
           {
              name: LocalType.Name
           }
         
         );
    }

    async Update(LocalType)
    {
       return await 
        this.api.httpPatch(
           `LocalType/`,
           {
              id: LocalType.Id,
              name: LocalType.Name

           }
         
         );
    }

    async Delete(id)
    {
       return await 
        this.api.httpDelete(`LocalType?id=${id}`)
    }
  }