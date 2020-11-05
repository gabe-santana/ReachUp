using System.Collections.Generic;
using System.Text.Json.Serialization;
using System.Threading.Tasks;
using MySql.Data.MySqlClient;
using System;

namespace ReachUp
{
    public class EmailConfig
    {
       public string From {get; set;}
       public string SmtpServer {get; set;}
       public int Port {get; set;}
       public string UserName {get; set;}
       public string Password {get; set;}
       
    }
}