class Shopping {
    Id;
    Name;
    Message;
    OpeningHours;

    constructor(id = 0, name = '', message = '', openingHours = {}){
       this.Id = id;
       this.Name = name;
       this.Message = message;
       this.OpeningHours = openingHours;
    }
}