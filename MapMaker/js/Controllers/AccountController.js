/// <reference path='../Models/Account.ts'/>
/// <reference path='../Models/UserToken.ts'/>

import { Account } from "../Models/Account";
import { UserToken } from "../Models/UserToken";

$(()=>{

   var email = '';
   var password = '';
   var account = new Account.clsAccount();
   var user = '';

   if (user = await account.login(email, password)){
      if (user.token != null){
      var tokenHandler = new clsTokenHandler();
      tokenHandler.putToken(user.token);
      }
      return;
   }

   console.log('Email e/ou senha incorretos!');

    class clsTokenHandler extends UserToken.clsUserToken {
       constructor(){
          super();
       }

       putToken(token){
         this.setToken(token);
       }
    }

});