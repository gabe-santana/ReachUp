// @dart=2.9
class Category {
  int categoryId;
  String categoryName;
  String categoryDescription;

  Category({this.categoryId, this.categoryName, this.categoryDescription});

  Category.fromJson(Map<String, dynamic> json) {
    categoryId = json['categoryId'];
    categoryName = json['categoryName'];
    categoryDescription = json['categoryDescription'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['categoryId'] = this.categoryId;
    data['categoryName'] = this.categoryName;
    data['categoryDescription'] = this.categoryDescription;
    return data;
  }
}
