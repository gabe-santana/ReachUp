import 'package:ReachUp/Model/Local.dart';
import 'package:ReachUp/Model/User.model.dart';
import 'package:ReachUp/View/SignView/SignUp.view.dart';
import 'package:ReachUp/globals.dart';
import 'package:ReachUp/www/ReachUpAPI.dart';

class AccountRepository extends ReachUpAPI {
  signUp() async {
    await super.httpPost("Account/SignUp", Globals.user);
    print(super.response.data);
    if (super.response.statusCode == 200) {
      if (response.data) {
        return signIn();
      }
    }

    return null;
  }

  Future<User> signIn() async {
    await super.httpPost("Account/SignIn", Globals.user);
    print(super.response.data);
    if (super.response.statusCode == 200) {
      return User.fromJson(response.data);
    }

    return null;
  }


  Future<bool> checkEmail() async{
    await super.httpGet("Account/CheckEmail?email=${Globals.user.email}&role=${Globals.user.role}");
    print(super.response.data);
    if (super.response.statusCode == 200) {
      return super.response.data;
    }

    return null;
  }

  Future<Local> getShopkeeperLocal() async{
    await super.httpGet("Account/GetShopkeeperLocal?Email=${Globals.user.email}");
    print(super.response.data);
    if (super.response.statusCode == 200) {
      return Local.fromJson(super.response.data);
    }

    return null;
  }

}
