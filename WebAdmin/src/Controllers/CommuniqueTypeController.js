class CommuniqueTypeController {
    api;
    constructor(){
        this.api = new ApiConnection();
    }

    async getAll()
    {
        return await
         this.api.httpAnonymousGet('CommuniqueType/GetAll');
    }

    async add(name)
    {
        return await
         this.api.httpAnonymousPost(
             'CommuniqueType/',
             {
                name: name
             }
        );
    }

    async update(id, name)
    {
        return await
         this.api.httpAnonymousPatch(
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
         this.api.httpAnonymousDelete(`CommuniqueType?id=${id}`);
    }
}