using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ReachUp
{
    public abstract class ToDoReachUp
    {
        public ToDoReachUp(){}

        public string Email { get; set; }
        public string Name { get; set; }
        public string Role { get; set; }
        public string Password { get; set; }
        public abstract string Token { get; set; } // Toda classe que implemente esta deve conter uma implementação dessa propriedade 
        public abstract int Id { get; set; } // Toda classe que implemente esta deve conter uma implementação dessa propriedade
        public int Type { get; set; }
        public string Description { get; set; }
        public DateTime Date { get; set; }
    }
}