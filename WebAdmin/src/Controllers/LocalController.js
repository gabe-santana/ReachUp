class LocalController {
    api;
    constructor(){
       this.api = new ApiConnection();
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

    async fetchOpHours(localId, weekDay)
    {
        return await
         this.api.httpAnonymousGet(`Local/FetchOpHours?local=${localId}&weekDay=${weekDay}`);
    }

    async update(Local)
    {
        return await 
          this.api.httpAnonymousPatch(
          `Local/`,
          {
             
             type: Local.LocalType,
             name: Local.Name, 
             floor: Local.Floor,
             openingHour: Local.OpeningHour,
             closingHour: Local.ClosingHour,
             beaconUUID: Local.BeaconUUID

          }
        );
    }

    async addSubCategories(local, subCategories)
    {
        return await
          this.api.httpAnonymousPost(
              `Local/AddSubCategories/`,
              {
                  IdLocal: local.Id,
                  subCategories: JSON.stringify(subCategories)
              }
          )
    }

    async deleteSubCategory(localId, categoryId, subCategoryId)
    {
        return await
         this.api.httpAnonymousDelete(
             `Local/DeleteSubCategory?local=${localId}&category=${categoryId}&subCategory=${subCategoryId}`
         )
    }

    async addOpHours(Local, openingHours)
    {
        return await 
          this.api.httpAnonymousPost(
              `Local/AddOpHours/`,
              {

              }
          )
    }

    async deleteOpHours(localId, weekDay)
    {
        return await
          this.api.httpAnonymousDelete(`Local/DeleteOpHours?local=${localId}&weekDay=${weekDay}`);
    }

    async uploadImage(image)
    {
        return await 
          this.api.httpPostFile(
             `Local/UploadImage/`, image, 'image/png'
          )
    }

    async getAdmins(id)
    {
        return await
          this.api.httpGet(
             `Local/GetAdmins?local=${id}`
          )
    }

    async connectAdmin(email, localId)
    {
        return await
          this.api.httpAnonymousPost(`Local/ConnectAdmin?email=${email}&local=${localId}`);
    }
}