using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Text;

namespace ReachUp
{
    interface IDbConnection
    {
        public bool Connect();
        public void Disconnect();
        public bool DMLCommand(string command);
    }
}
