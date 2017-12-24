using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using LinuxDotnet.Models;

namespace LinuxDotnet.Controllers
{
    public class HomeController : Controller
    {
        public IActionResult Index()
        {
            var context = new Models.LinuxDotNetContext();

            var customerList = context.Customer.ToList();

            return View(customerList);
        }

        public IActionResult About()
        {
            ViewData["Message"] = "Your application description page.";

            return View();
        }

        public IActionResult Contact()
        {
            ViewData["Message"] = "Your contact page.";

            return View();
        }

        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
