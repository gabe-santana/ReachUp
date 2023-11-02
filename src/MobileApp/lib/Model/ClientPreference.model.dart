// @dart=2.9
import 'Subcategory.model.dart';

class ClientPreference {
  List<SubCategory> subCategories;
  String clientEmail;

  ClientPreference({this.subCategories, this.clientEmail});

  ClientPreference.fromJson(Map<String, dynamic> json) {
    if (json['SubCategories'] != null) {
      subCategories = new List<SubCategory>();
      json['SubCategories'].forEach((v) {
        subCategories.add(new SubCategory.fromJson(v));
      });
    }
    clientEmail = json['ClientEmail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.subCategories != null) {
      data['SubCategories'] =
          this.subCategories.map((v) => v.toJson()).toList();
    }
    data['ClientEmail'] = this.clientEmail;
    return data;
  }
}
