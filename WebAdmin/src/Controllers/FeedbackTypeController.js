class FeedbackTypeController {
    api;
    constructor(){
        this.api = new clsApiConnection();
    }

    async getAll()
    {
        return await
         this.api.httpGet('FeedbackType/GetAll');
    }

    async add(name)
    {
        return await
         this.api.httpPost(
             'FeedbackType/',
             {
                name: name
             }
        );
    }

    async update(id, name)
    {
        return await
         this.api.httpPatch(
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
         this.api.httpGet(`FeedbackType?id=${id}`);
    }
}