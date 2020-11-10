import 'package:ReachUp/Model/Category.model.dart';
import 'package:ReachUp/www/ReachUpAPI.dart';

class CategoryRepository extends ReachUpAPI{

  Future<List<Category>> getAll()async{
    await super.httpGet("Category/GetAll");
    print(super.response.data);
     if (super.response.statusCode == 200) {
       List<Category> categories =    
        List<Category>.from(super.response.data.map((i) => Category.fromJson(i)));
        return categories;
     }

     return null;
  } 
}