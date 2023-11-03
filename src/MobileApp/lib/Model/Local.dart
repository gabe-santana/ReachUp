// @dart=2.9
class Local {
  List<Beacons> beacons;
  int idLocal;
  int type;
  String name;
  int floor;
  String descriptionSubCategories;
  String openingHour;
  String closingHour;

  Local(
      {this.beacons,
      this.idLocal,
      this.type,
      this.name,
      this.floor,
      this.descriptionSubCategories,
      this.openingHour,
      this.closingHour});

  Local.fromJson(Map<String, dynamic> json) {
    if (json['beacons'] != null) {
      beacons = new List<Beacons>();
      json['beacons'].forEach((v) {
        beacons.add(new Beacons.fromJson(v));
      });
    }
    idLocal = json['idLocal'];
    type = json['type'];
    name = json['name'];
    floor = json['floor'];
    descriptionSubCategories = json['descriptionSubCategories'];
    openingHour = json['openingHour'];
    closingHour = json['closingHour'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.beacons != null) {
      data['beacons'] = this.beacons.map((v) => v.toJson()).toList();
    }
    data['idLocal'] = this.idLocal;
    data['type'] = this.type;
    data['name'] = this.name;
    data['floor'] = this.floor;
    data['descriptionSubCategories'] = this.descriptionSubCategories;
    data['openingHour'] = this.openingHour;
    data['closingHour'] = this.closingHour;
    return data;
  }
}

class Beacons {
  int type;
  String uuid;
  Null localBeacon;

  Beacons({this.type, this.uuid, this.localBeacon});

  Beacons.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    uuid = json['uuid'];
    localBeacon = json['localBeacon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['uuid'] = this.uuid;
    data['localBeacon'] = this.localBeacon;
    return data;
  }
}
