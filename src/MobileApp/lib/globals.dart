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
  static String urlAPI;

  static List<Beacon> beacons = <Beacon>[];
  static List<CommuniqueSubCategory> communiqueSubCategories =
      new List<CommuniqueSubCategory>();

  static List<Category> categoriesChecked = new List<Category>();

  static List<SubCategory> subCategoriesChecked = new List<SubCategory>();

  static List<SubCategory> subCategoriesPromotionChecked =
      new List<SubCategory>();

  static List<Communique> selectedCommuniques = new List<Communique>();

  static List<Communique> admLocalCommuniques = new List<Communique>();

  static List<SubCategory> subcategoriesLocal = new List<SubCategory>();

  static List<SubCategory> subCategoriesStoreChecked = new List<SubCategory>();

  static List<SubCategory> subCategoriesPreferenceChecked =
      new List<SubCategory>();

  static ClientPreference userPreference = new ClientPreference();
}

class VersionConfig {
  static bool isCommerceVersion = true;

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
