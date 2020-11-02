import { AdminType } from "./AdminType";
import { Local } from "./Local";


export module Admin {
  export class clsAdmin {
    
    public Email : string;
    public Type : AdminType.clsAdminType;
    public Local : Local.clsLocal;
    public Name : string;
    public Password : string;

    constructor(email : string, type: null, local : null,
      name : string, password : string ){
      this.Email = email,
      this.Type = type,
      this.Local = local,
      this.Name = name,
      this.Password = password;
    }
  }
}