import 'package:ReachUp/Model/Category.model.dart';

import 'Model/Subcategory.model.dart';
import 'Model/User.model.dart';

class Globals{
  static User user;
  static bool isLoggedIn = false;
  static String urlAPI;


  static List<Category> categoriesChecked = new List<Category>();
  static List<SubCategory> subCategoriesChecked = new List<SubCategory>();
}