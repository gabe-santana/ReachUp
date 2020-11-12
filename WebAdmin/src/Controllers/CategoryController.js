class CategoryController {
    api;
    constructor(){
        this.api = new clsApiConnection();
    }
    
    async getById(id)
    {
        return await
         this.api.httpGet(`Category?id=${id}`);
    }

    async getAll(isGeneral)
    {
        return await
         this.api.httpGet(`Category/GetAll?isGeneral=${isGeneral}`);
    }

    async add(name, description, isSpecial)
    {
        return await
         this.api.httpPost(
             'Category/',
             {
                categoryName: name,
                categoryDescription: description,
                isSpecial: isSpecial
             }
        );
    }

    async update(id, name, description, isSpecial)
    {
        return await
         this.api.httpPatch(
             'Category/',
             {
                categoryId: id,
                categoryName: name,
                categoryDescription: description,
                isSpecial: isSpecial
             }
        );
    }

    async delete(id)
    {
        return await
         this.api.httpDelete(`Category?id=${id}`);
    }
}