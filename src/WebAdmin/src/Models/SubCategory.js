class SubCategory {
    Id;
    Category;
    CategoryId;
    Name;

    constructor(id = -1, category = {}, categoryId = -1, name = ''){
        this.Id = id;
        this.Category = category;
        this.CategoryId = categoryId;
        this.Name = name;
    }
}