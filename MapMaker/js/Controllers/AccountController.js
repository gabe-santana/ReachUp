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
      var token = user.token;
      if (token.matches("/^[0-9a-zA-Z]+$/")){
      var tokenHandler = new clsTokenHandler();
      tokenHandler.putToken(token);
      return;
      }
   }

   /*test('Salvando o token', ()=> {
      expect(putToken).toThrow(Error);
   })*/

   console.log('Email e/ou senha incorretos, ou token de autenticação inválido!');

    class clsTokenHandler extends UserToken.clsUserToken {
       constructor(){
          super();
       }

       putToken(token){
         this.setToken(token);
         throw new Error('Não foi possível salvar o token');
       }
    }


    /*class clsAccountControllerTest extends clsTokenHandler {
       constructor(){
          super();
       }
      test('' ,()=> {
         expect(putToken).toThrow(Error);
      })
    }*/

});