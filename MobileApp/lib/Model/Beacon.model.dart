class Beacon {
  int type;
  String uuid;

  Beacon({this.type, this.uuid});

  Beacon.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    uuid = json['uuid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['uuid'] = this.uuid;
    return data;
  }
}