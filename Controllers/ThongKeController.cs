using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebsiteBanHang.Models;

namespace WebsiteBanHang.Controllers
{
    [Authorize(Roles = "QuanTri,PhanQuyen")]
    public class ThongKeController : Controller
    {
        QuanLyBanHangEntities db = new QuanLyBanHangEntities();
        // GET: ThongKe
        public ActionResult ThongKeSanPham()
        {
            //ViewBag.SoNguoiTruyCap = HttpContext.Application["SoNguoiTruyCap"].ToString(); // Lấy số lượng người truy cập từ application đã được tạo 
            ViewBag.SoNguoiDangHoatDong = HttpContext.Application["SoNguoiDangHoatDong"].ToString();
            ViewBag.TongDoanhThu = ThongKeTongDoanhThu();
            ViewBag.TongThanhVien = ThongKeThanhVien();
            ViewBag.ThongKeDonDatHang = ThongKeDonDatHang();
            return View();
        }
        public decimal? ThongKeTongDoanhThu()
        {
            decimal? TongDoanhThu = db.ChiTietDonDatHangs.Where(m=>m.DonDatHang.DaThanhToan == true).Sum(m => m.SoLuong * m.DonGia).Value;
            ViewData["TongDoanhThu"] = TongDoanhThu;
            return TongDoanhThu;
        }
        public decimal ThongKeDoanhThuTheoThang(int Thang, int Nam)
        {
            // Đưa ra nhưng đơn hàng có tháng năm tương ứng
            var list = db.DonDatHangs.Where(m => m.NgayDat.Value.Month == Thang && m.NgayDat.Value.Year == Nam);
            decimal TongTien = 0;
            // Duyệt chi tiết đơn đặt hàng đó và lấy Tổng tiền các sản phẩm  của tất cả các sản phẩm thuộc đơn hàng đó
            foreach (var item in list)
            {
                TongTien += decimal.Parse(item.ChiTietDonDatHangs.Sum(m => m.SoLuong * m.DonGia).Value.ToString());
            }
            return TongTien;
        }
        public double ThongKeDonDatHang()
        {
            int donDatHang = db.DonDatHangs.Count();
            return donDatHang;
        }
        public double ThongKeThanhVien()
        {
            int thanhVien = db.ThanhViens.Count();
            return thanhVien;
        }
    }
}