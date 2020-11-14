class FeedbackTypeController {
    api;
    constructor(){
        this.api = new ApiConnection();
    }

    async getAll()
    {
        return await
         this.api.httpAnonymousGet('FeedbackType/GetAll');
    }

    async add(name)
    {
        return await
         this.api.httpAnonymousPost(
             'FeedbackType/',
             {
                name: name
             }
        );
    }

    async update(id, name)
    {
        return await
         this.api.httpAnonymousPatch(
             'FeedbackType/',
             {
                id: id,
                name: name
             }
        );
    }

    async delete(id)
    {
        return await
         this.api.httpAnonymousDelete(`FeedbackType?id=${id}`);
    }
}