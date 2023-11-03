// @dart=2.9
import 'dart:math';

class MapObject {
  double version;
  String shopping;
  String address;
  int metersByUnity;
  int widthUnits;
  int heightUnits;
  List<Floors> floors;

  MapObject(
      {this.version,
      this.shopping,
      this.address,
      this.metersByUnity,
      this.widthUnits,
      this.heightUnits,
      this.floors});

  getUserPosition(
      Position a, Position b, Position c, double dA, double dB, double dC) {
    var cogX = (a.x + b.x + c.x) / 3;
    var cogY = (a.y + b.y + c.y) / 3;
    var cog = new Position(x: cogX.toInt(), y: cogY.toInt(), floor: a.floor);

    Position nearestBeacon;
    double shortestDistanceInMeters;

    if (dA < dB && dA < dC) {
      nearestBeacon = a;
      shortestDistanceInMeters = dA;
    } else if (dB < dC) {
      nearestBeacon = b;
      shortestDistanceInMeters = dB;
    } else {
      nearestBeacon = c;
      shortestDistanceInMeters = dC;
    }

    var distanceToCog = (sqrt(
        pow(cog.x - nearestBeacon.x, 2) + pow(cog.y - nearestBeacon.y, 2)));

    var shortestDistanceInCoordinationUnits =
        shortestDistanceInMeters * metersByUnity;

    var t = shortestDistanceInCoordinationUnits / distanceToCog;
    var pointsDiff = new Position(
        x: (cog.x - nearestBeacon.x),
        y: (cog.y - nearestBeacon.y),
        floor: a.floor);
    var tTimesDiff = new Position(
        x: (pointsDiff.x * t).toInt(),
        y: (pointsDiff.y * t).toInt(),
        floor: a.floor);

    var userLocation = new Position(
        x: nearestBeacon.x + tTimesDiff.x,
        y: nearestBeacon.y + tTimesDiff.y,
        floor: a.floor);

    return userLocation;
  }

  MapObject.fromJson(Map<String, dynamic> json) {
    version = json['version'];
    shopping = json['shopping'];
    address = json['address'];
    metersByUnity = json['metersByUnity'];
    widthUnits = json['widthUnits'];
    heightUnits = json['heightUnits'];
    if (json['floors'] != null) {
      floors = new List<Floors>();
      json['floors'].forEach((v) {
        floors.add(new Floors.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['version'] = this.version;
    data['shopping'] = this.shopping;
    data['address'] = this.address;
    data['metersByUnity'] = this.metersByUnity;
    data['widthUnits'] = this.widthUnits;
    data['heightUnits'] = this.heightUnits;
    if (this.floors != null) {
      data['floors'] = this.floors.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Floors {
  List<Locates> locates;
  List<Halls> halls;

  Floors({this.locates, this.halls});

  Floors.fromJson(Map<String, dynamic> json) {
    if (json['locates'] != null) {
      locates = new List<Locates>();
      json['locates'].forEach((v) {
        locates.add(new Locates.fromJson(v));
      });
    }
    if (json['halls'] != null) {
      halls = new List<Halls>();
      json['halls'].forEach((v) {
        halls.add(new Halls.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.locates != null) {
      data['locates'] = this.locates.map((v) => v.toJson()).toList();
    }
    if (this.halls != null) {
      data['halls'] = this.halls.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Locates {
  String id;
  Beacons beacons;
  Area area;

  Locates({this.id, this.beacons, this.area});

  Locates.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    beacons =
        json['beacons'] != null ? new Beacons.fromJson(json['beacons']) : null;
    area = json['area'] != null ? new Area.fromJson(json['area']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.beacons != null) {
      data['beacons'] = this.beacons.toJson();
    }
    if (this.area != null) {
      data['area'] = this.area.toJson();
    }
    return data;
  }
}

class Beacons {
  String uuid;
  Position position;

  Beacons({this.uuid, this.position});

  Beacons.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    position = json['position'] != null
        ? new Position.fromJson(json['position'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uuid'] = this.uuid;
    if (this.position != null) {
      data['position'] = this.position.toJson();
    }
    return data;
  }
}

class Position {
  int x;
  int y;
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

  bool equals(Position p) {
    return this.x == p.x && this.y == p.y && this.floor == p.floor;
  }
}

class Area {
  int x0;
  int y0;
  int x;
  int y;

  Area({this.x0, this.y0, this.x, this.y});

  Area.fromJson(Map<String, dynamic> json) {
    x0 = json['x0'];
    y0 = json['y0'];
    x = json['x'];
    y = json['y'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['x0'] = this.x0;
    data['y0'] = this.y0;
    data['x'] = this.x;
    data['y'] = this.y;
    return data;
  }
}

class Halls {
  CornerInfo cornerInfo;
  Position position;

  Halls({this.cornerInfo, this.position});

  Halls.fromJson(Map<String, dynamic> json) {
    cornerInfo = json['cornerInfo'] != null
        ? new CornerInfo.fromJson(json['cornerInfo'])
        : null;
    position = json['position'] != null
        ? new Position.fromJson(json['position'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.cornerInfo != null) {
      data['cornerInfo'] = this.cornerInfo.toJson();
    }
    if (this.position != null) {
      data['position'] = this.position.toJson();
    }
    return data;
  }
}

class CornerInfo {
  bool isCorner;
  List<String> directions;

  CornerInfo({this.isCorner, this.directions});

  CornerInfo.fromJson(Map<String, dynamic> json) {
    isCorner = json['isCorner'];
    try {
      directions = json['directions'].cast<String>();
    } catch (e) {
      directions = null;
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isCorner'] = this.isCorner;
    data['directions'] = this.directions;
    return data;
  }
}

class Parser {
  int id;
  String direction;
  String inverseDirection;
  List<Halls> halls;

  Parser({this.id, this.halls, this.direction}) {
    switch (this.direction) {
      case "up":
        this.inverseDirection = "down";
        break;
      case "down":
        this.inverseDirection = "up";
        break;
      case "left":
        this.inverseDirection = "right";
        break;
      case "right":
        this.inverseDirection = "left";
        break;
    }
  }

  Halls getCurrentHall() {
    return this.halls.last;
  }
}
