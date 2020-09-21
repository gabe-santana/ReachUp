$(function(){
     
    import { clsAccountRepository } 
    from '../classes/repositories/AccountRepository.js';

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

})