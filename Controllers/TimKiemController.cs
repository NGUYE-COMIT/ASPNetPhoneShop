using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebsiteBanHang.Models;
using PagedList.Mvc;
using PagedList;

namespace WebsiteBanHang.Controllers
{
    public class TimKiemController : Controller
    {
        QuanLyBanHangEntities db = new QuanLyBanHangEntities();
        public ActionResult KetQuaTimKiem(string tuKhoa, int? Page)
        {
            int pageSize = 12;
            int pageNumber = (Page ?? 1);
            var listSanPham = db.SanPhams.Where(m => m.TenSP.Contains(tuKhoa));
            ViewBag.TuKhoa = tuKhoa;
            return View(listSanPham.OrderBy(m => m.TenSP).ToPagedList(pageNumber, pageSize));
        }
        public ActionResult LayTuKhoaTimKiem(string tuKhoa)
        {
            // Láy từ khóa tìm kiếm sau đó gọi đến KetQuaTimKiem
            return RedirectToAction("KetQuaTimKiem", new { @tuKhoa = tuKhoa });
        }

        public ActionResult Menuleft()
        {
            var Producer = db.NhaSanXuats.ToList();
            return View(Producer);
        }

    }
}