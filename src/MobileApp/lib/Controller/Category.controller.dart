// @dart=2.9
import 'package:ReachUp/Model/Category.model.dart';
import 'package:ReachUp/Repositories/Category.repository.dart';

class CategoryController {
  CategoryRepository categoryRepository;

  CategoryController() {
    categoryRepository = new CategoryRepository();
  }

  Future<List<Category>> getAll() {
    return categoryRepository.getAll();
  }
}
