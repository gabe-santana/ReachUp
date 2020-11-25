import 'package:ReachUp/Model/Communique.model.dart';
import 'package:ReachUp/www/ReachUpAPI.dart';

import '../globals.dart';

class CommuniqueRepository extends ReachUpAPI {
  CommuniqueRepository() : super() {}


  String getImage(Communique communique) {
    return "${Globals.urlAPI}/Communique/GetImage?id=${communique.communiqueId}";
  }



  Future<List<Communique>> byLocal(int local, bool general) async {
    await super.httpGet("Communique/GetAll?local=$local&general=$general");
    if (super.response.statusCode == 200) {
      return List<Communique>.from(
          super.response.data.map((i) => Communique.fromJson(i)));

    } else
      return null;
  }

  Future<bool> add(Communique communique) async {
    await super.httpPost("Communique/", communique.toJson());
    print("response: ${super.response.data}");
    if (super.response.statusCode == 200) {
      return true;
    } else
      return false;
  }

  Future<bool> bindSubCategories(dynamic json) async {
    await super.httpPost("Communique/BindSubCategories", json);
    print("response: ${super.response.data}");
    if (super.response.statusCode == 200) {
      return true;
    } else
      return false;
  }

  // Future<bool> disbindSubCategories(dynamic json) async {
  //   await super.httpDelete("Communique/DisbindSubCategories", json);
  //   print("response: ${super.response.data}");
  //   if (super.response.statusCode == 200) {
  //     return true;
  //   } else
  //     return false;
  // }

  Future<bool> update(dynamic json) async {
    await super.httpPatch("Communique/", json);
    print("response: ${super.response.data}");
    if (super.response.statusCode == 200) {
      return true;
    } else
      return false;
  }

  Future<bool> delete(int id, int type) async {
    await super.httpDelete("Communique?id=$id&type=$type");
    print("response: ${super.response.data}");
    if (super.response.statusCode == 200) {
      return true;
    } else
      return false;
  }
}
