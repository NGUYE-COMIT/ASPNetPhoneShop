using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Principal;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;
using System.Web.Security;
namespace WebsiteBanHang
{
    public class MvcApplication : System.Web.HttpApplication
    {
        protected void Application_Start()
        {
            AreaRegistration.RegisterAllAreas();
            RouteConfig.RegisterRoutes(RouteTable.Routes);

            Application["SoNguoiTruyCap"] = 0;
            Application["SoNguoiDangHoatDong"] = 0;
        }
        protected void Session_Start()
        {
            Application.Lock();
            Application["SoNguoiTruyCap"] = (int)Application["SoNguoiTruyCap"] + 1;
            Application["SoNguoiDangHoatDong"] = (int)Application["SoNguoiDangHoatDong"] + 1;
            Application.UnLock();
        }
        protected void Session_End()
        {
            Application.Lock();
            Application["SoNguoiDangHoatDong"] = (int)Application["SoNguoiDangHoatDong"] - 1;
            Application.UnLock();
        }
        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {
            var taiKhoanCookie = Context.Request.Cookies[FormsAuthentication.FormsCookieName];
            if (taiKhoanCookie != null)
            {
                var authTicket = FormsAuthentication.Decrypt(taiKhoanCookie.Value);
                var quyen = authTicket.UserData.Split(new Char[] { ',' });
                var userPrincipal = new GenericPrincipal(new GenericIdentity(authTicket.Name), quyen);
                Context.User = userPrincipal;
            }
        }
    }
}
