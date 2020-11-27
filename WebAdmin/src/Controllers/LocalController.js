class LocalController {
    api;
    constructor(){
       this.api = new ApiConnection();
    }

    async get(id)
    {
        return await 
          this.api.httpAnonymousGet(`Local?id=${id}`);
    }

    async search(s)
    {
        return await 
          this.api.httpAnonymousGet(`Local/Search?s=${s}`);
    }

    async seek(s)
    {
      return await 
        this.api.httpAnonymousGet(`Local/Seek?s=${s}`);
    }

    async getAll(type)
    {
        return await 
          this.api.httpAnonymousGet(`Local/GetAll?type=${type}`);
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
             idLocal: Local.Id,
             type: Local.Type,
             name: Local.Name, 
             floor: Local.Floor,
             openingHour: null,
             closingHour: null
          }
        );
    }

    async addOpHours(id, openingHours)
    {
        return await 
          this.api.httpAnonymousPost(
              `Local/AddOpHours/`,
              {
                 idLocal : id,
                 openingHours: {
                     weekDay: openingHours.WeekDay,
                     openingTime: openingHours.OpeningTime,
                     closingTime: openingHours.ClosingTime
                 }
              }
          )
    }

    async getAdmins(id)
    {
        return await
          this.api.httpAnonymousGet(
             `Local/GetAdmins?local=${id}`
          )
    }

    async connectAdmin(email, localId)
    {
        return await
          this.api.httpAnonymousPost(`Local/ConnectAdmin?email=${email}&local=${localId}`);
    }
}