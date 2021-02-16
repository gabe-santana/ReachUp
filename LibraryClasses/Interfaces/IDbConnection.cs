using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Text;

namespace ReachUp
{
    public interface IDbConnection
    {
        public bool Connect();
        public void Disconnect();
        public bool DMLCommand(string command);
    }
}
