// @dart=2.9
import 'package:ReachUp/Model/Category.model.dart';
import 'package:ReachUp/Model/SubCategoryLocal.mode.dart';
import 'package:flutter_beacon/flutter_beacon.dart';

import 'Model/ClientPreference.model.dart';
import 'Model/Communique.model.dart';
import 'Model/CommuniqueSubCategory.model.dart';
import 'Model/Local.dart';
import 'Model/Subcategory.model.dart';
import 'Model/User.model.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class Globals {
  static User user = new User();
  static bool isLoggedIn = false;
  static String urlAPI = 'https://reachup-poc.azurewebsites.net/api';
  //static String urlAPI = 'https://localhost:5001/api';

  static List<Beacon> beacons = <Beacon>[];
  static List<CommuniqueSubCategory> communiqueSubCategories = [];

  static List<Category> categoriesChecked = [];

  static List<SubCategory> subCategoriesChecked = [];

  static List<SubCategory> subCategoriesPromotionChecked = [];

  static List<Communique> selectedCommuniques = [];

  static List<Communique> admLocalCommuniques = [];

  static List<SubCategory> subcategoriesLocal = [];

  static List<SubCategory> subCategoriesStoreChecked = [];

  static List<SubCategory> subCategoriesPreferenceChecked = [];

  static ClientPreference userPreference = new ClientPreference();
}

class VersionConfig {
  static bool isCommerceVersion = false;

  // static bool isCommerceVersion()  {
  //   parseJsonFromAssets('assets/config/global/config-global.json')
  //       .then((value) {
  //     return value["commerceVersion"];
  //   });
  //   return false;
  // }

  // static Future<Map<String, dynamic>> parseJsonFromAssets(String assetsPath) async {
  //   print('--- Parse json from: $assetsPath');
  //   return rootBundle
  //       .loadString(assetsPath)
  //       .then((jsonStr) => jsonDecode(jsonStr));
  // }
}
