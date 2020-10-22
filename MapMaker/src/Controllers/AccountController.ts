/// <reference path='../Models/Account.ts'/>
/// <reference path='../Models/UserToken.ts'/>

import { Account } from "../Models/Account";
import { UserToken } from "../Models/UserToken";
import { IUser } from "../Interfaces/IUser";
import { UserTokenController } from "./UserTokenController";

interface IAccount {
  index(email : string, password : string) : Promise<any>;
}

export module AccountController {

  export class clsAccountController extends Account.clsAccount implements IAccount {
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
