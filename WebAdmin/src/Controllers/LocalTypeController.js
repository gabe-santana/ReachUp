class LocalTypeController {
    api;
    constructor(){
        this.api = new clsApiConnection();
    }

    async getAll()
    {
        return await
         this.api.httpGet('LocalType/GetAll');
    }

    async add(name)
    {
        return await
         this.api.httpPost(
             'LocalType/',
             {
                name: name
             }
        );
    }

    async update(id, name)
    {
        return await
         this.api.httpPatch(
             'LocalType/',
             {
                id: id,
                name: name
             }
        );
    }

    async delete(id)
    {
        return await
         this.api.httpGet(`LocalType?id=${id}`);
    }
}