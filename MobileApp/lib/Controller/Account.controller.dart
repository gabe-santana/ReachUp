import 'package:ReachUp/Repositories/Account.repository.dart';
import 'package:ReachUp/View/SignView/SignUp.view.dart';

class AccountController {
  AccountRepository accountRepository;
  
  AccountController(){
      this.accountRepository = new AccountRepository();
  }

  Future signUp() async{
    return await this.accountRepository.signUp();
  }

    Future signIn() async{
    return await this.accountRepository.signIn();
  }
}
