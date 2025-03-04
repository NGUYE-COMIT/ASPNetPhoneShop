using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebsiteBanHang.Models;

namespace WebsiteBanHang.Controllers
{
    [Authorize(Roles = "QuanTri")]
    public class QuanLyNhapHangController : Controller
    {
        QuanLyBanHangEntities db = new QuanLyBanHangEntities();
        [HttpGet]
        public ActionResult NhapHang()
        {
            ViewBag.MaNCC = new SelectList(db.NhaCungCaps.OrderBy(m => m.TenNCC), "MANCC", "TenNCC");
            ViewBag.ListProduct = db.SanPhams;
            return View();
        }
        [HttpPost]
        public ActionResult NhapHang(IEnumerable<ChiTietPhieuNhap> model)
        {
            return View();
        }
    }
}