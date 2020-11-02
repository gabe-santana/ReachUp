export module AdminType {
  export class clsAdminType {

    public Id : number;
    public Name: string;
    
    constructor(id : number, name : string){
      this.Id = id;
      this.Name = name;
    }
  }
}