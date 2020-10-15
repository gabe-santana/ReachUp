/// <reference path='../Models/Account.ts'/>
/// <reference path='../Models/UserToken.ts'/>

import { Account } from "../Models/Account";
import { UserToken } from "../Models/UserToken";
import { IUser } from "../Interfaces/IUser";
import { UserTokenController } from "./UserTokenController";

export module AccountController {

  export class clsAccountController extends Account.clsAccount {
 
    constructor(){
      super();
    }

    public async index(email : string, password : string) {
      const User : IUser = {
        email: email,
        password: password
      }  
      return await this.login(User);
    }
  }
}
