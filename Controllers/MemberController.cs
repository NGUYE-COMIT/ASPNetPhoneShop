using System;
using System.Collections.Generic;
using System.Data.Entity.Validation;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebsiteBanHang.Models;

namespace WebsiteBanHang.Controllers
{
    public class MemberController : Controller
    {
        QuanLyBanHangEntities db = new QuanLyBanHangEntities();
        // GET: Member
        public ActionResult ListMember()
        {
            if (Session["TaiKhoan"] != null)
            {
                var member = db.ThanhViens.ToList();
                return View(member);
            }
            else
            {
                return RedirectToAction("Http404", "Error");
            }

        }
        [HttpGet]
        public ActionResult CreateMember()
        {
            if (Session["TaiKhoan"] != null)
            {
                ViewBag.MaLoaiTV = new SelectList(db.LoaiThanhViens.OrderBy(m => m.TenLoai), "MaLoaiTV", "TenLoai");
                return View();
            }
            else
            {
                return RedirectToAction("Http404", "Error");
            }
        }
        [HttpPost]
        public ActionResult CreateMember(ThanhVien model)
        {
            ViewBag.MaLoaiTV = new SelectList(db.LoaiThanhViens.OrderBy(m => m.TenLoai), "MaLoaiTV", "TenLoai");
            if (ModelState.IsValid)//Kiểm tra xem liệu dữ liệu được submit từ trang web có hợp lệ hay không. 
            {
                ThanhVien thanhVien = db.ThanhViens.SingleOrDefault(m => m.TaiKhoan == model.TaiKhoan);
                if (thanhVien == null)
                {
                    string salt = BCrypt.Net.BCrypt.GenerateSalt();
                    string hashedPassword = BCrypt.Net.BCrypt.HashPassword(model.MatKhau, salt);
                    model.MatKhau = hashedPassword;
                    model.ConfirmPassword = hashedPassword;
                    db.ThanhViens.Add(model);
                    db.SaveChanges();
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
            return RedirectToAction("ListMember", "Member");
        }
        [HttpGet]
        public ActionResult EditMember(int? id)
        {
            if (id == null)
            {
                return RedirectToAction("Http404", "Error");
            }
            ThanhVien member = db.ThanhViens.SingleOrDefault(m => m.MaTV == id);
            if (member == null)
            {
                return HttpNotFound();
            }
            ViewBag.MaLoaiTV = new SelectList(db.LoaiThanhViens.ToList(), "MaLoaiTV", "Tenloai", member.MaLoaiTV);
            return View(member);
        }
        [HttpPost]
        public ActionResult EditMember(ThanhVien model)
        {
                ViewBag.MaLoaiTV = new SelectList(db.LoaiThanhViens.ToList(), "MaLoaiTV", "Tenloai", model.MaLoaiTV);
                // Lấy sản phẩm hiện tại từ cơ sở dữ liệu
                var existingProduct = db.ThanhViens.Find(model.MaTV);

                // Cập nhật các thuộc tính với các giá trị từ biểu mẫu
                existingProduct.HoTen = model.HoTen;
                existingProduct.DiaChi = model.DiaChi;
                existingProduct.Email = model.Email;
                existingProduct.SoDienThoai = model.SoDienThoai;
                existingProduct.MaLoaiTV = model.MaLoaiTV;
                db.SaveChanges();
                return RedirectToAction("ListMember");
        }
        public ActionResult RemoveMember(int? id)
        {
            if (id == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            ThanhVien member = db.ThanhViens.SingleOrDefault(m => m.MaTV == id);
            if (member == null)
            {
                return HttpNotFound();
            }
            db.ThanhViens.Remove(member);
            db.SaveChanges();
            return RedirectToAction("ListMember");
        }
    }
}