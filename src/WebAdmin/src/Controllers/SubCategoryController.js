class SubCategoryController {
    api;
    constructor(){
        this.api = new clsApiConnection();
    }

    async getByCategory(category)
    {
        return await
         this.api.httpGet(`SubCategory/ByCategory?category=${category}`);
    }

    async getByLocal(local)
    {
        return await
         this.api.httpGet(`SubCategory/ByLocal?local=${local}`);
    }
    
    async getByCommunique(communique)
    {
        return await
         this.api.httpGet(`SubCategory/ByCommunique?communique=${communique}`);
    }

    async add(categoryId, subCategoryName)
    {
        return await
         this.api.httpPost(
             'SubCategory/',
             {
                category: {
                    categoryId: categoryId
                },
                subCategoryName: subCategoryName
             }
        );
    }

    async delete(category, subCategory)
    {
        return await
         this.api.httpDelete(
             `SubCategory?category=${category}&subCategory=${subCategory}`);
    }
}