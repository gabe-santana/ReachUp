class Local {
    Id;
    LocalType;
    Name;
    Floor;
    OpeningHour;
    ClosingHour;
    BeaconUUID;
    Admins;
    Beacons;

    constructor(type = -1, name = '', floor = -1, openingHour = '', closingHour = '', beaconUUID = '', id = -1, admins = [], beacons = []) {
      this.Id = id;
      this.LocalType = type;
      this.Name = name;
      this.Floor = floor;
      this.OpeningHour = openingHour;
      this.ClosingHour = closingHour;
      this.BeaconUUID = beaconUUID;
      this.Admins = admins;
      this.Beacons = beacons;
    }
  }