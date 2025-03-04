using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using WebsiteBanHang.Models;
using PagedList;
using System.Web.UI;

namespace WebsiteBanHang.Controllers
{
    public class SanPhamController : Controller
    {
        QuanLyBanHangEntities db = new QuanLyBanHangEntities();
        public ActionResult Sanphamstyle1Partial()
        {
            return PartialView();
        }
        public ActionResult Sanphamstyle2Partial()
        {
            return PartialView();
        }
        public ActionResult Sanphamstyle3Partial()
        {
            return PartialView();
        }
        // xây dựng trang xem chi tiết
        public ActionResult ChiTietSanPham(int maLoai, int maNSX,int? id, string tensp)
        {
            var sanpham = db.SanPhams.SingleOrDefault(s => s.MaLoaiSP == maLoai && s.MANSX == maNSX && s.MaSP == id);
            if (sanpham == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(sanpham);
        }
        public ActionResult SanPhamLienQuan(int maLoai, int maNSX, int maSP)
        {
            // Lấy sản phẩm đang xem
            var sanphamDangXem = db.SanPhams.SingleOrDefault(s => s.MaLoaiSP == maLoai && s.MANSX == maNSX && s.MaSP == maSP);
            if (sanphamDangXem == null)
            {
                Response.StatusCode = 404;
                return null;
            }

            // Lấy sản phẩm liên quan
            var sanphamLienQuan = db.SanPhams
            .Where(s => s.MaLoaiSP == sanphamDangXem.MaLoaiSP && s.MANSX == sanphamDangXem.MANSX && s.MaSP != sanphamDangXem.MaSP && s.DaXoa == false)
            .OrderByDescending(s => s.NgayCapNhat).ToList();

            return View(sanphamLienQuan);
        }
        public ActionResult SidebarSanPhamPartial()
        {
            var sanPham = db.SanPhams;
            return View(sanPham);
        }
        public ActionResult SanPhamTheoLoai(int? maLoai, int? page)
        {
            var sanpham = db.SanPhams.Where(s => s.MaLoaiSP == maLoai && s.DaXoa == false).ToList();

            // Thực hiện phân trang theo loại 
            int pageSize = 12;// Số sản phẩm có trên trang 
            int pageNumbber = (page ?? 1); // số trang hiện tại

            ViewBag.MaLoai = maLoai;
            return View(sanpham.OrderBy(m => m.DonGia).ToPagedList(pageNumbber, pageSize));
        }
        public ActionResult SanPhamTheoNhaSanXuat(int? maLoai, int? maNSX, int? Page)
        {
            var sanpham = db.SanPhams.Where(m => m.MANSX == maNSX && m.MaLoaiSP == maLoai && m.DaXoa == false).ToList();
            int pageSize = 9;
            int pageNumbber = (Page ?? 1);

            ViewBag.MaLoai = maLoai;
            ViewBag.MaNSX = maNSX;
            return View(sanpham.OrderBy(m => m.DonGia).ToPagedList(pageNumbber, pageSize));
        }
        public ActionResult DonGia(int? maLoai, int? maNSX)
        {
            ViewBag.MaLoai = maLoai;
            ViewBag.MaNSX = maNSX;
            return View();
        }
        public ActionResult SanPhamTheoNhaSanXuatDonGia(int? maLoai, int? maNSX, int? Page, string priceRange)
        {
            int pageSize = 9;
            int pageNumbber = (Page ?? 1);
            // Xử lý tùy theo phạm vi giá
            switch (priceRange)
            {
                case "1-5":
                    var sanPham = db.SanPhams
                        .Where(m => m.MaLoaiSP == maLoai && m.MANSX == maNSX && m.DaXoa == false && m.DonGia >= 1000000 && m.DonGia <= 5000000).ToList();
                    return View(sanPham.OrderBy(m => m.DonGia).ToPagedList(pageNumbber, pageSize));
                case "5-10":
                    var sanPham1 = db.SanPhams
                        .Where(m => m.MANSX == maNSX && m.MaLoaiSP == maLoai && m.DaXoa == false && m.DonGia > 5000000 && m.DonGia <= 10000000).ToList();
                    return View(sanPham1.OrderBy(m => m.DonGia).ToPagedList(pageNumbber, pageSize));
                case "10-15":
                    var sanPham2 = db.SanPhams
                        .Where(m => m.MANSX == maNSX && m.MaLoaiSP == maLoai && m.DaXoa == false && m.DonGia > 10000000 && m.DonGia <= 15000000).ToList();
                    return View(sanPham2.OrderBy(m => m.DonGia).ToPagedList(pageNumbber, pageSize));
                case "15-30":
                    var sanPham3 = db.SanPhams
                        .Where(m => m.MANSX == maNSX && m.MaLoaiSP == maLoai && m.DaXoa == false && m.DonGia > 15000000 && m.DonGia <= 30000000).ToList();
                    return View(sanPham3.OrderBy(m => m.DonGia).ToPagedList(pageNumbber, pageSize));
                case "30-50":
                    var sanPham4 = db.SanPhams
                        .Where(m => m.MANSX == maNSX && m.MaLoaiSP == maLoai && m.DaXoa == false && m.DonGia > 30000000 && m.DonGia <= 50000000).ToList();
                    return View(sanPham4.OrderBy(m => m.DonGia).ToPagedList(pageNumbber, pageSize));
                case "50-100":
                    var sanPham5 = db.SanPhams
                        .Where(m => m.MANSX == maNSX && m.MaLoaiSP == maLoai && m.DaXoa == false && m.DonGia >= 50000000 && m.DonGia <= 100000000).ToList();
                    return View(sanPham5.OrderBy(m => m.DonGia).ToPagedList(pageNumbber, pageSize));
                case "Tren100":
                    var sanPham6 = db.SanPhams
                        .Where(m => m.MANSX == maNSX && m.MaLoaiSP == maLoai && m.DaXoa == false && m.DonGia > 100000000).ToList();
                    return View(sanPham6.OrderBy(m => m.DonGia).ToPagedList(pageNumbber, pageSize));
                // Thêm các phạm vi giá khác nếu cần
                default:
                    // Xử lý khi không có phạm vi giá được chọn
                    return View();
            }
        }
    }
}