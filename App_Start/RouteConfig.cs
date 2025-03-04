using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace WebsiteBanHang
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            routes.MapRoute(
                name: "DanhSachSanPham",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "Home", action = "DanhSachSanPham", id = UrlParameter.Optional }
            );
            routes.MapRoute(
               name: "ChiTietSanPham",
               url: "{tensp}-{id}",
               defaults: new { controller = "Sanpham", action = "ChiTietSanPham", id = UrlParameter.Optional }
           );
        }
    }
}
