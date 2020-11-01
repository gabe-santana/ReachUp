using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Threading.Tasks;

namespace WebAdmin.Repositories
{
    static class clsApiConnection
    {
        public static readonly string BaseURL;

        static clsApiConnection()
        {
           this.BaseURL = "http://192.168.0.109:5000/api";
        }
    }
}
