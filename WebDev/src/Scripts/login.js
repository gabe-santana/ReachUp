///<reference path="../Controllers/AccountController.ts"/>

import { AccountController } from '../Controllers/AccountController';

$(() => {

    async function login(email, password)
    {
       const clsAccount = new AccountController.clsAccountController();
       return await clsAccount.login(email, password);
    }

    $("#btnLogin").click( async () => {
      const email = $("#txtEmail").val().trim();
      const user = email.substring(0, email.indexOf("@"));
      const domain = email.substring(email.indexOf("@") + 1, email.length);
      const password = $("#txtPassword").val().trim();

      if (email != null && password != null) {

        if ((user.length >= 1) && 
        (domain.length >= 3) && 
        (user.search("@")==-1) &&
        (domain.search("@")==-1) &&
        (user.search(' ')==-1) && 
        (domain.search(' ')==-1) && 
        (domain.search('.')!=-1) && 
        (domain.indexOf('.')>=-1) && 
        (domain.lastIndexOf('.')==-1 < domain.length -1)) {
           
          if (await login (email, password)){
            window.location.replace('boss.html');
          }
        }
        alert("Email inválido!");
        return;
      }
      alert("Dados de login incompletos!");
      return;
    })
})