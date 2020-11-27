class Local {
    Id;
    Name;
    Type;
    Floor;
    Admins;

    constructor(name = '', type = -1, floor = -1, id = -1, admins = []) {
      this.Id = id;
      this.Name = name;
      this.Type = type;
      this.Floor = floor;
      this.Admins = admins;
    }
  }