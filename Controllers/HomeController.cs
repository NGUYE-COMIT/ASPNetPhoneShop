using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebsiteBanHang.Models;
using CaptchaMvc.HtmlHelpers;
using CaptchaMvc;
using PagedList;
using BCrypt.Net;
using System.Data.Entity;
using System.Net;
using System.Web.Security;

namespace WebsiteBanHang.Controllers
{
    public class HomeController : Controller
    {
        QuanLyBanHangEntities db = new QuanLyBanHangEntities();
        // GET: Home
        public ActionResult DanhSachSanPham(int? page)
        {
            var sanPham = db.SanPhams.Where(m => m.MaLoaiSP == 1 && m.DaXoa == false).OrderBy(m => m.DonGia).ToList();
            int pageSize = 12;
            int pageNumber = (page ?? 1);
            return View(sanPham.ToPagedList(pageNumber, pageSize));
        }
        public ActionResult SanPhamMoi()
        {
            var sanpham = db.SanPhams.Where(s => s.DaXoa == false).OrderByDescending(s => s.NgayCapNhat).Take(10).ToList();
            return View(sanpham);
        }
        public ActionResult Menupartial()
        {
            // Truy vấn lấy về 1 list các sản phẩm
            var listSanPham = db.SanPhams;
            return PartialView(listSanPham);
        }
        [HttpGet]
        public ActionResult DangKy()
        {
            return View();
        }
        [HttpPost]
        public ActionResult DangKy(ThanhVien model, FormCollection f)
        {
            // Kiem tra capcha 
            if (this.IsCaptchaValid("Capcha is not valid"))
            {

                if (ModelState.IsValid)//Kiểm tra xem liệu dữ liệu được submit từ trang web có hợp lệ hay không. 
                {
                    ThanhVien thanhVien = db.ThanhViens.SingleOrDefault(m => m.TaiKhoan == model.TaiKhoan);
                    if (thanhVien == null)
                    {
                        string salt = BCrypt.Net.BCrypt.GenerateSalt();
                        string hashedPassword = BCrypt.Net.BCrypt.HashPassword(model.MatKhau, salt);
                        string hashedConfirmPassword = BCrypt.Net.BCrypt.HashPassword(model.ConfirmPassword, salt); // Hash mật khẩu xác nhận
                        model.MatKhau = hashedPassword;
                        model.ConfirmPassword = hashedConfirmPassword;
                        model.MaLoaiTV = 5;
                        if(model.MatKhau != model.ConfirmPassword)
                        {
                            ViewBag.NoMatch = "Mật khẩu không trùng khớp";
                            return View();
                        }
                        db.ThanhViens.Add(model);
                        db.SaveChanges();
                        return RedirectToAction("DangNhap");
                    }
                    else
                    {
                        ViewBag.TrungLap = "Tên tài khoản giống với tài khoản khác";
                        return View();
                    }
                }
                else
                {
                    ViewBag.ThongBao = "Đăng ký không thành công";
                }
                return View();
            }
            ViewBag.Captcha = "Sai mã Captcha";
            return View();
        }
        [HttpGet]
        public ActionResult DangNhap()
        {
            return View();
        }
        [HttpPost]
        public ActionResult DangNhap(FormCollection f)
        {
            // Kiểm tra tên đăng nhập và mật khẩu 
            string Username = f["Username"].ToString();
            string Password = f["Password"].ToString();

            ThanhVien thanhVien = db.ThanhViens.SingleOrDefault(m => m.TaiKhoan == Username);
            if (thanhVien != null)
            {
                bool isPasswordCorrect = BCrypt.Net.BCrypt.Verify(Password, thanhVien.MatKhau);
                if (isPasswordCorrect)
                {
                    var listQuyen = db.LoaiThanhVien_Quyen.Where(m => m.MaLoaiTV == thanhVien.MaLoaiTV);
                    string quyen = "";
                    foreach(var item in listQuyen)
                    {
                        quyen += item.Quyen.MaQuyen + ",";
                    }
                    quyen = quyen.Substring(0, quyen.Length - 1); // Cắt đi dấu , thừa
                    PhanQuyen(thanhVien.TaiKhoan.ToString(), quyen);
                    Session["TaiKhoan"] = thanhVien;
                    if (quyen == "PhanQuyen,QuanLyDonHang,QuanLySanPham,QuanTri")
                    {
                        Session["Quyen"] = quyen;
                        return RedirectToAction("ThongTinSanPham","QuanLySanPham");
                    }
                    if (quyen == "QuanLySanPham")
                    {
                        Session["Quyen"] = quyen;
                        return RedirectToAction("ThongTinSanPham", "QuanLySanPham");
                    }
                    if (quyen == "QuanLyDonHang")
                    {
                        Session["Quyen"] = quyen;
                        return RedirectToAction("ChuaThanhToan", "QuanLyDatHang");
                    }
                    if (quyen == "PhanQuyen")
                    {
                        Session["Quyen"] = quyen;
                        return RedirectToAction("ListRole", "Quyen");
                    }
                    if (quyen == "TinTuc")
                    {
                        Session["Quyen"] = quyen;
                        return RedirectToAction("ListNews", "News");
                    }
                    return RedirectToAction("DanhSachSanPham");
                    
                }
            }
            TempData["ThongBao"] = "Tài khoản hoặc mật khẩu không đúng";
            return View();
        }
        public ActionResult DangXuat()
        {
            Session["TaiKhoan"] = null;
            FormsAuthentication.SignOut();
            Session["GioHang"] = null;
            return RedirectToAction("DanhSachSanPham");
        }
        public ActionResult SlideNhaSanXuatPartial()
        {
            var nhaSanXuat = db.NhaSanXuats.ToList();
            return PartialView(nhaSanXuat);
        }
        public ActionResult SlideChiTietNhaSanXuat(int maNSX, int? Page)
        {
            var sanpham = db.SanPhams.Where(m => m.MANSX == maNSX).ToList();
            int pageSize = 9;
            int pageNumbber = (Page ?? 1);
            ViewBag.MaNSX = maNSX;
            return View(sanpham.OrderBy(m => m.DonGia).ToPagedList(pageNumbber, pageSize));
        }
        [HttpGet]
        public ActionResult TaiKhoanCuaToi(int? id)
        {
            ThanhVien thanhVien = db.ThanhViens.SingleOrDefault(m => m.MaTV == id);
            return View(thanhVien);
        }
        public ActionResult GioiThieu()
        {
            var listnew = db.TinTucs.OrderByDescending(m => m.NgayDang).ToList();
            return View(listnew);
        }
        public ActionResult LienHe()
        {
            return View();
        }
        public void PhanQuyen(string TaiKhoan, string Quyen)
        {
            FormsAuthentication.Initialize();

            var ticket = new FormsAuthenticationTicket(1,
                TaiKhoan, // User
                DateTime.Now, //Bắt đầu 
                DateTime.Now.AddHours(3), //Kết thúc
                true,// remember
                Quyen,
                FormsAuthentication.FormsCookiePath
                );
            var cookie = new HttpCookie(FormsAuthentication.FormsCookieName, FormsAuthentication.Encrypt(ticket));
            if(ticket.IsPersistent ) cookie.Expires = ticket.Expiration;

            Response.Cookies.Add(cookie);
        }
    }
}