class Communique {
    Id;
    Type;
    Name;
    LocalId;
    Description;
    StartDate;
    EndDate;

    constructor(id = -1, type = -1, name = '', localId = -1,
    description = '', startDate = '', endDate = ''){
       this.Id = id;
       this.Type = type;
       this.Name = name;
       this.LocalId = localId;
       this.Description = description;
       this.StartDate = startDate;
       this.endDate = endDate;

    }
}