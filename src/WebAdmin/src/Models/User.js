class User {
    Name;
    Email;
    Password;
    Role;

    constructor(name = '', email = '', password = '', role = ''){
       this.Name = name;
       this.Email = email;
       this.Password = password;
       this.Role = role;
    }
}