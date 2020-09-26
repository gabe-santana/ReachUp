import 'Subcategory.model.dart';
import 'Beacon.model.dart';
import 'User.model.dart';

class Local {
  int idLocal;
  int type;
  String name;
  int floor;
  User admin;
  String descriptionSubCategories;

  List<Beacon> beacons;
  List<SubCategory> subCategories;

  Local(
      {this.idLocal,
      this.type,
      this.name,
      this.floor,
      this.admin,
      this.beacons,
      this.subCategories,
      this.descriptionSubCategories});
      
  Local.fromJson(Map<String, dynamic> json) {
    descriptionSubCategories = json['descriptionSubCategories'];
    idLocal = json['idLocal'];
    type = json['type'];
    name = json['name'];
    floor = json['floor'];
    admin = json['admin'] != null ? new User.fromJson(json['admin']) : null;
    if (json['beacons'] != null) {
      beacons = new List<Beacon>();
      json['beacons'].forEach((v) {
        beacons.add(new Beacon.fromJson(v));
      });
    }
    if (json['subCategories'] != null) {
      subCategories = new List<SubCategory>();
      json['subCategories'].forEach((v) {
        subCategories.add(new SubCategory.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['descriptionSubCategories'] = this.descriptionSubCategories;
    data['idLocal'] = this.idLocal;
    data['type'] = this.type;
    data['name'] = this.name;
    data['floor'] = this.floor;
    if (this.admin != null) {
      data['admin'] = this.admin.toJson();
    }
    if (this.beacons != null) {
      data['beacons'] = this.beacons.map((v) => v.toJson()).toList();
    }
    if (this.subCategories != null) {
      data['subCategories'] =
          this.subCategories.map((v) => v.toJson()).toList();
    }
    return data;
  }
}



