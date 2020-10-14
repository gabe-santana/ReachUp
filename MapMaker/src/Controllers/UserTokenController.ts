import { UserToken } from "../Models/UserToken";

export module UserTokenController {
   
   export class clsUserTokenController extends UserToken.clsUserToken {
    constructor(){
       super();
    }

    public async putToken(token : string){
      this.setToken(token);
    }
  }
}