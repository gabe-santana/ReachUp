class clsLocal {
    Id;
    LocalType;
    Name;
    Floor;
    OpeningHour;
    ClosingHour;
    Admins;
    Beacons;

    constructor(id, type, name, floor, openingHour, closingHour, admins, beacons) {
      this.Id = id;
      this.LocalType = type;
      this.Name = name;
      this.Floor = floor;
      this.OpeningHour = openingHour;
      this.ClosingHour = closingHour;
      this.Admins = admins;
      this.Beacons = beacons;
    }
  }
