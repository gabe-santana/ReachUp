import 'package:ReachUp/Model/Subcategory.model.dart';
import 'package:ReachUp/www/ReachUpAPI.dart';

class SubCategoryRepository extends ReachUpAPI{

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
}