import 'Category.model.dart';

class SubCategory {
  Category category;
  String subCategoryName;

  SubCategory({this.category, this.subCategoryName});

  SubCategory.fromJson(Map<String, dynamic> json) {
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    subCategoryName = json['subCategoryName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.category != null) {
      data['category'] = this.category.toJson();
    }
    data['subCategoryName'] = this.subCategoryName;
    return data;
  }
}