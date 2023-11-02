// @dart=2.9
import 'Category.model.dart';
import 'Communique.model.dart';
import 'Subcategory.model.dart';

class CommuniqueSubCategory {
  Communique communique;
  Category category;
  SubCategory subcategory;

  CommuniqueSubCategory({this.communique, this.subcategory, this.category});

  CommuniqueSubCategory.fromJson(Map<String, dynamic> json) {
    communique = json['communique'] != null
        ? new Communique.fromJson(json['communique'])
        : null;
    subcategory = json['subcategory'] != null
        ? new SubCategory.fromJson(json['subcategory'])
        : null;
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.communique != null) {
      data['communique'] = this.communique.toJson();
    }
    if (this.subcategory != null) {
      data['subcategory'] = this.subcategory.toJson();
    }
    if (this.category != null) {
      data['category'] = this.category.toJson();
    }
    return data;
  }
}
