import { ApiConnection } from "../services/ApiConnection";

export module UserTokenController {
  export class clsUserTokenController extends ApiConnection.clsApiConnection {
    constructor(){
      super();
    }

    static getToken(){
      const token = localStorage.getItem('token');
      if (token != null){
        return token;
      }
    }

    static setToken(token : string){
      try {
        localStorage.setItem('token', token);
      }
      catch {
         return null;
      }
    }
  }
}

