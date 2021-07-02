using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;

namespace ReachUpWebAPI
{
    public static class HttpContextId
    {
        public static bool IsOwn(HttpContext httpContext, string id) 
        {
            return ((ClaimsIdentity)httpContext.User.Identity)
          .Claims.ToList()[0].Value == id;
        }
    }
}
