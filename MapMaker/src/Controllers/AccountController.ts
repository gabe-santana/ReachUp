/// <reference path='../Models/Account.ts'/>
/// <reference path='../Models/UserToken.ts'/>

import { Account } from "../Models/Account";
import { UserToken } from "../Models/UserToken";
import { UserTokenController } from "./UserTokenController";

interface userLogging {
  email: string;
  password: string;
}

export module AccountController {

  export class clsAccountController extends Account.clsAccount {
 
    constructor(){
      super();
    }

    public async index(email : string, password : string) {
      const User : userLogging = {
        email: email,
        password: password
      }  
      return await this.login(User);
    }
  }
}
