$(() => {

  async function login(email, password)
  {
     const clsAccount = new AccountController();
     return await clsAccount.login(email, password);
  }

  $("#btnLogin").click(async function () {
    const email = $("#txtEmail").val();
    const user = email.substring(0, email.indexOf("@"));
    const domain = email.substring(email.indexOf("@") + 1, email.length);
    const password = $("#txtPassword").val();

    /*if (email != null && password != null) {

      if ((user.length >= 1) && 
      (domain.length >= 3) && 
      (user.search("@")==-1) &&
      (domain.search("@")==-1) &&
      (user.search(' ')==-1) && 
      (domain.search(' ')==-1) && 
      (domain.search('.')!=-1) && 
      (domain.indexOf('.')>=-1) && 
      (domain.lastIndexOf('.')==-1 < domain.length -1)) {*/
      
        const response = await login (email, password);

        if (typeof response.token != undefined) {
          localStorage.setItem('token', JSON.stringify(response.token));
          window.location.replace('../../public/boss.html');
          
        console.log(localStorage.getItem('token'));
          //console.log(document.cookie);

        }
      //}
      //alert("Email inválido!");
      //return;
    //}
    //alert("Dados de login incompletos!");
    //return;
  })
})