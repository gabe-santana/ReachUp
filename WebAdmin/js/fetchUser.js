/// <reference path='PageBase.ts'/>

import { AccountRepository } 
from '../classes/repositories/AccountRepository';

class fetchUser extends AccountRepository.clsAccountRepository {
    constructor(){
    super();

    document.querySelector("#btnLogin").click(function(){

      const email = document.querySelector('#txtEmail').val();
      const password = document.querySelector('#txtPassword').val();
      getUser(email, password);
   })

   async function getUser(email, password)
   {
     const nm_user = await this.login(email, password);
     return nm_user;
   }


}




}

$(() => {
     

    $("#btnLogin").click(function(){

       const email = ('#txtEmail').val();
       const password = ('#txtPassword').val();
       getUser(email, password);
    })

    async function getUser(email, password)
    {
      const UsersRepo = new clsAccountRepository();
      const nm_user = await UsersRepo.login(email, password);
      return nm_user;
    }

})*/