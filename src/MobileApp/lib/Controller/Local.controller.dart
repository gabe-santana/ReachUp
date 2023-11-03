// @dart=2.9
import 'package:ReachUp/Model/Local.dart';
import 'package:ReachUp/Model/SubCategoryLocal.mode.dart';
import 'package:ReachUp/Repositories/Local.repository.dart';

class LocalController {
  LocalRepository localRepository;

  LocalController() {
    this.localRepository = new LocalRepository();
  }
  //Authorize
  //HttpGet
  Future<List<Local>> search(String search) async {
    return localRepository.search(search);
  }

  Future<bool> addSubcategory(
      List<SubcategoriesLocal> subcategoriesLocal) async {
    return localRepository.addSubcategory(subcategoriesLocal);
  }

  Future<bool> deleteSubCategory(
      int local, int category, int subcategory) async {
    return localRepository.deleteSubCategory(local, category, subcategory);
  }
}
