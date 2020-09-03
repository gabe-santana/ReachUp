using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ReachUp
{
    static class clsConnectionString
    {
        /// <summary>
        /// Local Host Properties
        /// </summary>
        public static readonly string Server = "localhost";
        public static readonly string User = "root";
        public static readonly string Password = "root";
        public static readonly string Schema = "reachup";

        /// <summary>
        /// Remote Host Properties
        /// </summary>
        //public static readonly string Server = "";
        //public static readonly string User = "";
        //public static readonly string Password = "";
        //public static readonly string Schema = "";

        public static string getConnectionString()
        {
            return $"SERVER = {Server};" +
                   $"USER = {User};" +
                   $"PASSWORD = {Password};" +
                   $"DATABASE = {Schema};";
        }
    }
}