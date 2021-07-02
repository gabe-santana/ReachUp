class Feedback {
    Id;
    Type;
    ClientEmail;
    Description;
    Date;
    Stars;

    constructor(id = -1, type = -1, clientEmail = '', description = '',
      date = '', stars = ''){
       this.Id = id;
       this.Type = type;
       this.ClientEmail = clientEmail;
       this.Description = description;
       this.Date = date;
       this.Stars = stars;
    }
}