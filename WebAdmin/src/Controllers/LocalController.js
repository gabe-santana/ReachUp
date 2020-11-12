class LocalController {
    api;
    constructor(){
       this.api = new clsApiConnection();
    }

    async search(s)
    {
        return await 
          this.api.httpGet(`Local/Search?s=${s}`);
    }

    async getAll(type)
    {
        return await 
          this.api.httpGet(`Local/GetAll?type=${type}`);
    }

    async addOpHours(data)
    {
        return await 
          this.api.httpPost(
              `Local/AddOpHours`,
              {

              }
          );
    }

    async fetchOpHours(local, weekDay)
    {
        return await 
          this.api.httpGet(
              `Local/FetchOpHours?local=${local}&weekDay=${weekDay}`);
    }

    async deleteOpHours(local, weekDay)
    {
        return await 
          this.api.httpDelete(
              `Local/DeleteOpHours?local=${local}&weekDay=${weekDay}`);
    }

    async update(data)
    {
        return await 
          this.api.httpPatch(
              `Local/`,
              {

              }
          );
    }

    async addSubCategories(localId, subCategories = [,])
    {
        return await 
          this.api.httpPost(
              `Local/AddSubCategories/`,
              {
                 localId: localId,
                 subCategories: [
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

    async deleteSubCategory(local, category, subCategory)
    {
        return await 
          this.api.httpDelete(
              `Local/DeleteSubCategory?local=${local}&category=${category}&subCategory=${subCategory}`);
    }

    async delete(id)
    {
        return await 
          this.api.httpDelete(
              `Local?id=${id}`);
    }

}