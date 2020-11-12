class AdmTypeController {
    api;
    constructor(){
        this.api = new clsApiConnection();
    }
    
    async getAll()
    {
        return await
         this.api.httpGet('AdmType/GetAll');
    }

    async add(name)
    {
        return await
         this.api.httpPost(
             'AdmType/',
             {
                name: name
             }
        );
    }

    async update(id, name)
    {
        return await
         this.api.httpPatch(
             'AdmType/',
             {
                id: id,
                name: name
             }
        );
    }

    async delete(id)
    {
        return await
         this.api.httpGet(`AdmType?id=${id}`);
    }
}