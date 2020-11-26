import 'package:ReachUp/Model/Subcategory.model.dart';
import 'package:ReachUp/Repositories/SubCategory.repository.dart';

class SubCategoryController {
  SubCategoryRepository subCategoryRepository;

  SubCategoryController() {
    this.subCategoryRepository = new SubCategoryRepository();
  }

 Future<List<SubCategory>> getByCategory(int categoryId){
    return this.subCategoryRepository.getByCatgory(categoryId);
  }

   Future<List<SubCategory>> getByLocal(int localId){
    return this.subCategoryRepository.getByLocal(localId);
  }


}
