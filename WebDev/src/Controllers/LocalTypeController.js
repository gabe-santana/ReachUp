class clsLocalTypeController {
    api;
    constructor(){
      this.api = new clsApiConnection();
    }

    async Add(id, name)
    {
       return await this.api.httpPost(`LocalType/Post`, 
         new clsLocalType(id, name)
         );
    }

    async Update(id, name)
    {
       return await this.api.httpPatch(`LocalType/Patch`, 
         new clsLocalType(id, name)
         );
    }

    async Delete(id)
    {
       return await this.api.httpDelete(`LocalType/Delete?id=${id}`)
    }

    async GetAll()
    {
       return await this.api.httpGet('LocalType/GetAll');
    }

    async Get(id)
    {
       return await this.api.httpGet(`LocalType/Get?id=${id}`);
    }
  }
}