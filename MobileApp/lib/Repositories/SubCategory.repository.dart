import 'package:ReachUp/Model/Subcategory.model.dart';
import 'package:ReachUp/globals.dart';
import 'package:ReachUp/www/ReachUpAPI.dart';

class SubCategoryRepository extends ReachUpAPI{


  String getImage(int categoryId, int subCategoryId){
    return "${Globals.urlAPI}/SubCategory/GetImage?categoryId=$categoryId&subCategoryId=$subCategoryId";
  }

  Future<List<SubCategory>>getByCatgory(int categoryId) async{
    await super.httpGet("SubCategory/ByCategory?category=$categoryId");
     print("response: ${super.response.data}");
    if (super.response.statusCode == 200) {
      List<SubCategory> subCategories =
          List<SubCategory>.from(super.response.data.map((i) => SubCategory.fromJson(i)));

      return subCategories;
    } else
      return null;
  }




   Future<List<SubCategory>>getByLocal(int localId) async{
    await super.httpGet("SubCategory/ByLocal?local=$localId");
     print("response: ${super.response.data}");
    if (super.response.statusCode == 200) {
      List<SubCategory> subCategories =
          List<SubCategory>.from(super.response.data.map((i) => SubCategory.fromJson(i)));

      return subCategories;
    } else
      return null;
  }
}