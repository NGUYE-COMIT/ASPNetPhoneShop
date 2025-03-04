using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using WebsiteBanHang.Models;

namespace WebsiteBanHang.Controllers
{
    public class AdminController : Controller
    {
        public ActionResult LoginAdminPartial()
        {
            return View();
        }
    }
}