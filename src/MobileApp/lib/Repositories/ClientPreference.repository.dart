// @dart=2.9
import 'package:ReachUp/Model/ClientPreference.model.dart';
import 'package:ReachUp/Model/Subcategory.model.dart';
import 'package:ReachUp/www/ReachUpAPI.dart';

class ClientePreferenceRepository extends ReachUpAPI {
  Future<bool> add(ClientPreference clientePreference) async {
    await super.httpPost("ClientPreference/", clientePreference.toJson());
    print(super.response.data);
    if (super.response.statusCode == 200) {
      return super.response.data;
    }

    return null;
  }

  Future<List<SubCategory>> byUser(String email) async {
    await super.httpGet("ClientPreference/GetAll?email=$email");
    print(super.response.data);
    if (super.response.statusCode == 200) {
      return List<SubCategory>.from(
          super.response.data.map((i) => SubCategory.fromJson(i)));
    }

    return null;
  }

  Future<bool> delete(String email, int category, int subCategory) async {
    await super.httpDelete(
        "ClientPreference?email=$email&category=$category&subCategory=$subCategory");
    print(super.response.data);
    if (super.response.statusCode == 200) {
      return super.response.data;
    }

    return null;
  }
}
