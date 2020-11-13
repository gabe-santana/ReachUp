class CommuniqueTypeController {
    api;
    constructor(){
        this.api = new clsApiConnection();
    }

    async getAll()
    {
        return await
         this.api.httpGet('CommuniqueType/GetAll');
    }

    async add(name)
    {
        return await
         this.api.httpPost(
             'CommuniqueType/',
             {
                name: name
             }
        );
    }

    async update(id, name)
    {
        return await
         this.api.httpPatch(
             'CommuniqueType/',
             {
                id: id,
                name: name
             }
        );
    }

    async delete(id)
    {
        return await
         this.api.httpGet(`CommuniqueType?id=${id}`);
    }
}