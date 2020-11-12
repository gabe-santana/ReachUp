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
}
