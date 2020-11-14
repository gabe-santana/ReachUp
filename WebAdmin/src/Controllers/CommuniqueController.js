class CommuniqueController {
    api;
    constructor(){
        this.api = new clsApiConnection();
    }

    async getByLocal(local)
    {
        return await
         this.api.httpGet(`Communique?local=${local}`);
    }

    async add(localId, type, description, start, end)
    {
        return await
         this.api.httpPost(
             'Communique/',
             {
                localId: localId,
                type: type,
                description: description,
                startDate: start,
                endDate: end
             }
         );
    }

    async bindSubCategories(communiqueId, subCategories = [,])
    {
        return await
         this.api.httpPost(
             'Communique/BindSubCategories/',
             {
                communiqueId: communiqueId,
                communiqueSubCategory: [
                    {
                        subCategoryId: 0,
                        category: {
                            categoryId: 2
                        }
                    },
                ]
             }
         );
    }

    async disbindSubCategories(communiqueId, subCategories = [,])
    {
        return await
         this.api.httpPost(
             'Communique/DisbindSubCategories/',
             {
                communiqueId: communiqueId,
                communiqueSubCategory: [
                    {
                        subCategoryId: 0,
                        category: {
                            categoryId: 2
                        }
                    },
                ]
             }
         );
    }

    async update(id, localId, type, description, start, end)
    {
        return await
         this.api.httpPatch(
             'Communique/',
             {
                communiqueId: id,
                localId: localId,
                type: type,
                description: description,
                startDate: start,
                endDate: end
             }
         );
    }

    async delete(id, type)
    {
        return await this.api.httpDelete(
            `Communique?id=${id}&type=${type}`
        );
    }
}