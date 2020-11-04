import { AccountController } from '../Controllers/AccountController';
import { clsUserToken } from '../Scripts/userToken';

$(() => {
  
    deleteCookies();
    
    function deleteCookies()
    {
       var cookies = document.cookie.split(';');

       for (let i = 0; i < cookies.length; i++) {
         let cookie = cookies[i];
         let eqPos = cookie.indexOf('=');
         let name = eqPos > -1 ? cookie.substr(0, eqPos) : cookie;
         document.cookie = name + '=';
        }
    }

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

          const response = await login (email, password);

          if (typeof response.token != undefined) {
            document.cookie = `userToken=${response.token}`;
            window.location.replace('../../public/boss.html');
          }
        }
        alert("Email inválido!");
        return;
      }
      alert("Dados de login incompletos!");
      return;
    })
})