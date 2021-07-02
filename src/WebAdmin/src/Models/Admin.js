class Admin {
    Email;
    Name;
    Password;
    LocalId;

    constructor(email, name = '', password = '', localId = -1){
       this.Email = email;
       this.Name = name;
       this.Password = password;
       this.LocalId = localId;
    }
}