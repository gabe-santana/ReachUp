using System;

namespace WebAdmin.Models
{
    public class User
    {
        // User myDeserializedClass = JsonConvert.DeserializeObject<Root>(myJsonResponse); 
        public string Email { get; set; }
        public string Name { get; set; }
        public string Password { get; set; }
        public string Role { get; set; }
        public object AdmLocal { get; set; }
        public string Token { get; set; }
       
    }
}