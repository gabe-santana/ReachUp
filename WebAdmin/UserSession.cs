using Microsoft.AspNetCore.Http;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using WebAdmin.Models;

namespace WebAdmin
{
    public static class UserSession
    {
        public static User Get(HttpContext context)
        {
            try
            {
                return JsonConvert.DeserializeObject<User>(context.Session.GetString("user"));
            }
            catch { return null; }
        }

        public static void Set(HttpContext context, User userStringfy)
        {
             context.Session.SetString("user", JsonConvert.SerializeObject(userStringfy));
        }
    }
}
