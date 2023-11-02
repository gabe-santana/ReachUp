// @dart=2.9
import 'package:intl/intl.dart';

class Communique {
  int communiqueId;
  int localId;
  int type;
  String description;
  DateTime startDate;
  DateTime endDate;

  Communique(
      {this.communiqueId,
      this.localId,
      this.type,
      this.description,
      this.startDate,
      this.endDate});

  Communique.fromJson(Map<String, dynamic> json) {
    communiqueId = json['communiqueId'];
    localId = json['localId'];
    type = json['type'];
    description = json['description'];
    startDate = DateFormat('dd/MM/yyyy hh:mm').parse(json['startDate']);
    endDate = DateFormat('dd/MM/yyyy hh:mm').parse(json['endDate']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['communiqueId'] = this.communiqueId;
    data['localId'] = this.localId;
    data['type'] = this.type;
    data['description'] = this.description;
    data['startDate'] = DateFormat("yyyy-MM-dd hh:mm").format(this.startDate);
    data['endDate'] = DateFormat("yyyy-MM-dd hh:mm").format(this.endDate);
    return data;
  }
}
