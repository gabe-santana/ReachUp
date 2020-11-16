import 'package:intl/intl.dart';

class Communique {
  int id;
  int localId;
  int type;
  String description;
  DateTime startDate;
  DateTime endDate;

  Communique(
      {this.id,
      this.localId,
      this.type,
      this.description,
      this.startDate,
      this.endDate});

  Communique.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    description = json['description'];
    startDate = DateFormat('dd/MM/yyyy hh:mm:ss').parse(json['startDate']);
    endDate = DateFormat('dd/MM/yyyy hh:mm:ss').parse(json['endDate']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    data['description'] = this.description;
    data['startDate'] = this.startDate;
    data['endDate'] = this.endDate;
    return data;
  }
}
