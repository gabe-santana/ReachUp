// @dart=2.9
import 'package:ReachUp/Model/Category.model.dart';
import 'package:ReachUp/globals.dart';
import 'package:ReachUp/www/ReachUpAPI.dart';

class CategoryRepository extends ReachUpAPI {
  String getImage(int categoryId) {
    return "${Globals.urlAPI}/Category/GetImage?id=$categoryId";
  }

  Future<List<Category>> getAll() async {
    await super.httpGet("Category/GetAll");
    print(super.response.data);
    if (super.response.statusCode == 200) {
      List<Category> categories = List<Category>.from(
          super.response.data.map((i) => Category.fromJson(i)));
      return categories;
    }

    return null;
  }
}
