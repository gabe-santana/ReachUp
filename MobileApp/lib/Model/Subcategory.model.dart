import 'Category.model.dart';

class SubCategory {
  Category category;
  String subCategoryName;
  int subCategoryId;

  SubCategory({this.category, this.subCategoryName, this.subCategoryId});

  SubCategory.fromJson(Map<String, dynamic> json) {
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    subCategoryName = json['subCategoryName'];
    subCategoryId = json['subCategoryId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.category != null) {
      data['category'] = this.category.toJson();
    }
    data['subCategoryName'] = this.subCategoryName;
    data['subCategoryId'] = this.subCategoryId;
    return data;
  }

  bool operator ==(other) {
    return this.subCategoryId  == other.subCategoryId;
  }
}