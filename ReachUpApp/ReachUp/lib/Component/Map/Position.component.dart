class Position {
  double x;
  double y;
  int floor;

  Position({this.x, this.y, this.floor});

  Position.fromJson(Map<String, dynamic> json) {
    x = json['x'];
    y = json['y'];
    floor = json['floor'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['x'] = this.x;
    data['y'] = this.y;
    data['floor'] = this.floor;
    return data;
  }
}