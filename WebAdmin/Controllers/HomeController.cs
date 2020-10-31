using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using Newtonsoft.Json;
using WebAdmin.Models;

namespace WebAdmin.Controllers
{
    /*public class HomeController : Controller
    {

        private readonly ILogger<HomeController> _logger;

        public HomeController(ILogger<HomeController> logger)
        {
            _logger = logger;
          
        }

        public IActionResult Index()
        {
            if (UserSession.Get(HttpContext) != null)
            {
                try { ViewBag.User = UserSession.Get(HttpContext); } catch { }
                return View();
            }
            return RedirectToAction("Sigin","Account");
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }*/
}
