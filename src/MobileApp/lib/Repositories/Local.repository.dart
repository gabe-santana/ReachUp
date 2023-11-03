// @dart=2.9
import 'dart:convert';

import 'package:ReachUp/Model/Local.dart';
import 'package:ReachUp/Model/SubCategoryLocal.mode.dart';
import 'package:ReachUp/www/ReachUpAPI.dart';

import '../globals.dart';

class LocalRepository extends ReachUpAPI {
  LocalRepository() : super() {}
  String getImage(Local local) {
    return "${Globals.urlAPI}/Local/GetImage?id=${local.idLocal}";
  }

  Future<List<Local>> search(String s) async {
    await super.httpGet("Local/Search?s=$s");
    print("response: ${super.response.data}");
    if (super.response.statusCode == 200) {
      List<Local> locates =
          List<Local>.from(super.response.data.map((i) => Local.fromJson(i)));
      print(locates[0].name);
      return locates;
    } else
      return null;
  }

  Future<bool> addSubcategory(
      List<SubcategoriesLocal> subcategoriesLocal) async {
    await super
        .httpPost("Local/AddSubCategories", json.encode(subcategoriesLocal));
    print("response: ${super.response.data}");
    if (super.response.statusCode == 200) {
      return true;
    } else
      return false;
  }

  Future<bool> deleteSubCategory(
      int local, int category, int subcategory) async {
    await super.httpDelete(
        "Local/DeleteSubCategory?local=$local&category=$category&subcategory=$subcategory");
    print("response: ${super.response.data}");
    if (super.response.statusCode == 200) {
      return true;
    } else
      return false;
  }
}
