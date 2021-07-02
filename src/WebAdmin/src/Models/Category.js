class Category {
    Id;
    Name;
    Description;
    IsSpecial;

    constructor(id = -1, name = '', description = '', isSpecial = false){
        this.Id = id;
        this.Name = name;
        this.Description = description;
        this.isSpecial = isSpecial;
    }

}