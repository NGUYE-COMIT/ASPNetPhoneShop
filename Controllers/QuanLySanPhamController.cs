using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Runtime.InteropServices;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using WebsiteBanHang.Models;

namespace WebsiteBanHang.Controllers
{
    [Authorize(Roles = "QuanTri,QuanLySanPham")]
    public class QuanLySanPhamController : Controller
    {
        QuanLyBanHangEntities db = new QuanLyBanHangEntities();
        public ActionResult MenuProductPartial()
        {
            return View();
        }
        public ActionResult ThongTinSanPham()
        {
            if (Session["TaiKhoan"] != null)
            {
                return View(db.SanPhams.Where(m => m.DaXoa == false).OrderBy(m => m.MaLoaiSP).ToList());
            }
            else
            {
                return RedirectToAction("Http404", "Error");
            }
        }
        [HttpGet]
        public ActionResult ThemMoi()
        {
            if (Session["TaiKhoan"] != null)
            {
                // Load Drowpdowlist
                ViewBag.MaNCC = new SelectList(db.NhaCungCaps.OrderBy(m => m.TenNCC), "MANCC", "TenNCC");
                ViewBag.MaLoaiSP = new SelectList(db.LoaiSanPhams.OrderBy(m => m.TenLoai), "MaLoaiSP", "TenLoai");
                ViewBag.MaNSX = new SelectList(db.NhaSanXuats.OrderBy(m => m.TenNSX), "MANSX", "TenNSX");
                return View();
            }
            else
            {
                return RedirectToAction("Http404", "Error");
            }
        }
        [HttpPost]
        public ActionResult ThemMoi(SanPham sanPham, HttpPostedFileBase HinhAnh, HttpPostedFileBase HinhAnh1, HttpPostedFileBase HinhAnh2, HttpPostedFileBase HinhAnh3) // giao thức truyền dữ liệu hình ảnh 
        {
            // load DropDownList
            ViewBag.MaNCC = new SelectList(db.NhaCungCaps.OrderBy(m => m.TenNCC), "MANCC", "TenNCC");
            ViewBag.MaLoaiSP = new SelectList(db.LoaiSanPhams.OrderBy(m => m.TenLoai), "MaLoaiSP", "TenLoai");
            ViewBag.MaNSX = new SelectList(db.NhaSanXuats.OrderBy(m => m.TenNSX), "MANSX", "TenNSX");
            if (HinhAnh == null || HinhAnh1 == null || HinhAnh2 == null || HinhAnh3 == null)
            {
                ViewBag.Images = "Cần chọn hình trước khi lưu";
                return View();
            }
            if (HinhAnh != null && HinhAnh.ContentLength > 0)
            {
                // Lấy tên hình ảnh 
                var fileName = Path.GetFileName(HinhAnh.FileName);
                // Lấy hình ảnh chuyển vào thư mục hình ảnh
                var path = Path.Combine(Server.MapPath("~/assets/images/product"), fileName);
                // Nếu có rồi thì thông báo 
                if (System.IO.File.Exists(path))
                {
                    ViewBag.upload = "Hình đã tồn tại";
                    return View();
                }
                else
                {
                    // lấy hình ảnh đưa vào thư mục 
                    HinhAnh.SaveAs(path);
                    sanPham.HinhAnh = fileName;
                }
            }
            if (HinhAnh1 != null && HinhAnh1.ContentLength > 0)
            {
                // Lấy tên hình ảnh 
                var fileName = Path.GetFileName(HinhAnh1.FileName);
                // Lấy hình ảnh chuyển vào thư mục hình ảnh
                var path = Path.Combine(Server.MapPath("~/assets/images/product-mini"), fileName);
                // Nếu có rồi thì thông báo 
                if (System.IO.File.Exists(path))
                {
                    ViewBag.upload = "Hình đã tồn tại";
                    return View();
                }
                else
                {
                    // lấy hình ảnh đưa vào thư mục 
                    HinhAnh1.SaveAs(path);
                    sanPham.HinhAnh1 = fileName;
                }
            }
            if (HinhAnh2 != null && HinhAnh2.ContentLength > 0)
            {
                // Lấy tên hình ảnh 
                var fileName = Path.GetFileName(HinhAnh2.FileName);
                // Lấy hình ảnh chuyển vào thư mục hình ảnh
                var path = Path.Combine(Server.MapPath("~/assets/images/product-mini"), fileName);
                // Nếu có rồi thì thông báo 
                if (System.IO.File.Exists(path))
                {
                    ViewBag.upload = "Hình đã tồn tại";
                    return View();
                }
                else
                {
                    // lấy hình ảnh đưa vào thư mục 
                    HinhAnh2.SaveAs(path);
                    sanPham.HinhAnh2 = fileName;
                }
            }
            if (HinhAnh3 != null && HinhAnh3.ContentLength > 0)
            {
                // Lấy tên hình ảnh 
                var fileName = Path.GetFileName(HinhAnh3.FileName);
                // Lấy hình ảnh chuyển vào thư mục hình ảnh
                var path = Path.Combine(Server.MapPath("~/assets/images/product-mini"), fileName);
                // Nếu có rồi thì thông báo 
                if (System.IO.File.Exists(path))
                {
                    ViewBag.upload = "Hình đã tồn tại";
                    return View();
                }
                else
                {
                    // lấy hình ảnh đưa vào thư mục 
                    HinhAnh3.SaveAs(path);
                    sanPham.HinhAnh3 = fileName;
                }
            }
            sanPham.DaXoa = false;
            db.SanPhams.Add(sanPham);
            db.SaveChanges();
            return RedirectToAction("ThongTinSanPham");
        }
        [HttpGet]
        public ActionResult ChinhSua(int? id)
        {
            if (id == null)
            {
                return RedirectToAction("Http404", "Error");
            }
            SanPham sp = db.SanPhams.SingleOrDefault(m => m.MaSP == id);
            if (sp == null)
            {
                return HttpNotFound();
            }
            ViewBag.MaNCC = new SelectList(db.NhaCungCaps.OrderBy(m => m.TenNCC), "MaNCC", "TenNCC", sp.MANCC);
            ViewBag.MaLoaiSP = new SelectList(db.LoaiSanPhams.OrderBy(m => m.TenLoai), "MaLoaiSP", "TenLoai", sp.MaLoaiSP);
            ViewBag.MaNSX = new SelectList(db.NhaSanXuats.OrderBy(m => m.TenNSX), "MaNSX", "TenNSX", sp.MANSX);
            return View(sp);
        }
        [HttpPost]
        public ActionResult ChinhSua(SanPham model, HttpPostedFileBase HinhAnh, HttpPostedFileBase HinhAnh1, HttpPostedFileBase HinhAnh2, HttpPostedFileBase HinhAnh3)
        {
            if (ModelState.IsValid)
            {
                // Lấy sản phẩm hiện tại từ cơ sở dữ liệu
                var existingProduct = db.SanPhams.Find(model.MaSP);

                // Cập nhật các thuộc tính với các giá trị từ biểu mẫu
                existingProduct.TenSP = model.TenSP;
                existingProduct.DonGia = model.DonGia;
                existingProduct.NgayCapNhat = model.NgayCapNhat;
                existingProduct.CauHinh = model.CauHinh;
                existingProduct.MoTa = model.MoTa;
                existingProduct.SoLuongTon = model.SoLuongTon;
                existingProduct.LuotXem = model.LuotXem;
                existingProduct.LuotBinhLuan = model.LuotBinhLuan;
                existingProduct.LuotBinhChon = model.LuotBinhChon;
                existingProduct.SoLanMua = model.SoLanMua;
                existingProduct.Moi = model.Moi;
                existingProduct.MANCC = model.MANCC;
                existingProduct.MANSX = model.MANSX;
                existingProduct.MaLoaiSP = model.MaLoaiSP;
                existingProduct.HinhAnh = model.HinhAnh;
                existingProduct.HinhAnh1 = model.HinhAnh1;
                existingProduct.HinhAnh2 = model.HinhAnh2;
                existingProduct.HinhAnh3 = model.HinhAnh3;


                // Kiểm tra xem có hình ảnh mới được cung cấp hay không và cập nhật đường dẫn tương ứng
                if (HinhAnh != null && HinhAnh.ContentLength > 0)
                {
                    var fileName = Path.GetFileName(HinhAnh.FileName);
                    var path = Path.Combine(Server.MapPath("~/assets/images/product"), fileName);
                    HinhAnh.SaveAs(path);
                    existingProduct.HinhAnh = fileName;
                }

                if (HinhAnh1 != null && HinhAnh1.ContentLength > 0)
                {
                    var fileName = Path.GetFileName(HinhAnh1.FileName);
                    var path = Path.Combine(Server.MapPath("~/assets/images/product"), fileName);
                    HinhAnh1.SaveAs(path);
                    existingProduct.HinhAnh1 = fileName;
                }
                if (HinhAnh2 != null && HinhAnh2.ContentLength > 0)
                {
                    var fileName = Path.GetFileName(HinhAnh2.FileName);
                    var path = Path.Combine(Server.MapPath("~/assets/images/product"), fileName);
                    HinhAnh2.SaveAs(path);
                    existingProduct.HinhAnh2 = fileName;
                }
                if (HinhAnh3 != null && HinhAnh3.ContentLength > 0)
                {
                    var fileName = Path.GetFileName(HinhAnh3.FileName);
                    var path = Path.Combine(Server.MapPath("~/assets/images/product"), fileName);
                    HinhAnh3.SaveAs(path);
                    existingProduct.HinhAnh = fileName;
                }

                // Lưu các thay đổi vào cơ sở dữ liệu
                db.SaveChanges();

                return RedirectToAction("ThongTinSanPham");
            }
            return View(model);
        }
        [HttpGet]
        public ActionResult Remove(int? id)
        {
            if (id == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            SanPham sp = db.SanPhams.SingleOrDefault(m => m.MaSP == id);
            if (sp == null)
            {
                return HttpNotFound();
            }
            ViewBag.MaNCC = new SelectList(db.NhaCungCaps.OrderBy(m => m.TenNCC), "MaNCC", "TenNCC", sp.MANCC);
            ViewBag.MaLoaiSP = new SelectList(db.LoaiSanPhams.OrderBy(m => m.TenLoai), "MaLoaiSP", "TenLoai", sp.MaLoaiSP);
            ViewBag.MaNSX = new SelectList(db.NhaSanXuats.OrderBy(m => m.TenNSX), "MaNSX", "TenNSX", sp.MANSX);
            return View(sp);
        }
        [HttpPost]
        public ActionResult Remove(int id)
        {
            if (id == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            SanPham sp = db.SanPhams.SingleOrDefault(m => m.MaSP == id);
            if (sp == null)
            {
                return HttpNotFound();
            }
            db.SanPhams.Remove(sp);
            db.SaveChanges();
            return RedirectToAction("ThongTinSanPham");
        }
    }
}