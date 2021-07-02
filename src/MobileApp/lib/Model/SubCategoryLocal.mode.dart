import 'package:ReachUp/Model/Local.dart';
import 'Category.model.dart';
import 'Subcategory.model.dart';

class SubcategoriesLocal {
  Local local;
  SubCategory subcategory;
  Category category;

  SubcategoriesLocal({this.local, this.subcategory, this.category});

  SubcategoriesLocal.fromJson(Map<String, dynamic> json) {
    local = json['local'] != null ? new Local.fromJson(json['local']) : null;
    subcategory = json['subcategory'] != null
        ? new SubCategory.fromJson(json['subcategory'])
        : null;
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.local != null) {
      data['local'] = this.local.toJson();
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