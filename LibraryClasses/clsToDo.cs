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
        public ToDoReachUp(){};

        public string Email;
        public string Name;
        public string Role;
        public string Password;
        public abstract string Token; // Toda classe que implemente esta deve conter uma implementação dessa propriedade 
        public abstract int Id; // Toda classe que implemente esta deve conter uma implementação dessa propriedade
        public int Type;
        public string Description;
        public DateTime Date;
    }
}