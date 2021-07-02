class Admin {
     Email;
     Name;
     Password;

    constructor(email,
      name = '', password = ''){
      this.Email = email,
      this.Name = name,
      this.Password = password;
    }
  }
