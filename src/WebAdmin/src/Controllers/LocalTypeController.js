class LocalTypeController {
    api;
    constructor(){
        this.api = new ApiConnection();
    }

    async getAll()
    {
        return await
         this.api.httpAnonymousGet('LocalType/GetAll');
    }

    async add(name)
    {
        return await
         this.api.httpAnonymousPost(
             'LocalType/',
             {
                name: name
             }
        );
    }

    async update(id, name)
    {
        return await
         this.api.httpAnonymousPatch(
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
         this.api.httpAnonymousDelete(`LocalType?id=${id}`);
    }
}