using Fluent.Infrastructure.FluentModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;
using WebsiteBanHang.Models;
using System.Net.Mail;

namespace WebsiteBanHang.Controllers
{
    public class GioHangController : Controller
    {
        QuanLyBanHangEntities db = new QuanLyBanHangEntities();
        public List<ItemGioHang> LayGioHang()
        {
            // Giỏ hàng đã tồn tại 
            List<ItemGioHang> lstGioHang = Session["GioHang"] as List<ItemGioHang>;
            if (lstGioHang == null)
            {
                // nếu giỏ session giỏ hàng chưa tồn tại thì khởi tạo giỏ hàng 
                lstGioHang = new List<ItemGioHang>();
                Session["GioHang"] = lstGioHang;
            }
            return lstGioHang;
        }
        public ActionResult ThemGioHang(int maSP, string strULR)
        {
            //Kiểm tra sản phẩm có tồn tại trong cơ sở dữ liệu hay không
            SanPham sanPham = db.SanPhams.SingleOrDefault(m => m.MaSP == maSP);
            if (sanPham == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            //Lấy Giỏ Hàng
            List<ItemGioHang> lstGioHang = LayGioHang();
            //Sản phẩm đã tồn tại ở giỏ hàng
            ItemGioHang spCheck = lstGioHang.SingleOrDefault(m => m.MaSP == maSP);
            if (spCheck != null)
            {
                //kiểm tra số lượng tồn trước khi khách hàng mua hàng
                if (sanPham.SoLuongTon < spCheck.SoLuong)
                {
                    return View("ThongBao");
                }
                spCheck.SoLuong++;
                spCheck.ThanhTien = spCheck.SoLuong * spCheck.DonGia;
                return Redirect(strULR);
            }
            ItemGioHang itemGioHang = new ItemGioHang(maSP);
            if (sanPham.SoLuongTon < itemGioHang.SoLuong)
            {
                return View("ThongBao");
            }
            lstGioHang.Add(itemGioHang);
            return Redirect(strULR);
        }
        public ActionResult ThemGioHangAjax(int maSP, string strULR)
        {
            // Kiểm tra sản phẩm có tồn tại trong cơ sở dữ liệu hay không 
            SanPham sanPham = db.SanPhams.SingleOrDefault(m => m.MaSP == maSP);
            if (sanPham == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            // Lấy Giỏ Hàng 
            List<ItemGioHang> lstGioHang = LayGioHang();
            // Sản phẩm đã tồn tại ở giỏ hàng 
            ItemGioHang spCheck = lstGioHang.SingleOrDefault(m => m.MaSP == maSP);
            if (spCheck != null)
            {
                // kiểm tra số lượng tồn trước khi khách hàng mua hàng 
                if (sanPham.SoLuongTon < spCheck.SoLuong)
                {
                    return View("ThongBao");
                }
                spCheck.SoLuong++;
                spCheck.ThanhTien = spCheck.SoLuong * spCheck.DonGia;
                ViewBag.TinhSoLuong = TinhTongSoLuong();
                ViewBag.TongTien = TinhTongTien();
                return PartialView("GioHangPartial");
            }
            ItemGioHang itemGioHang = new ItemGioHang(maSP);
            if (sanPham.SoLuongTon < itemGioHang.SoLuong)
            {
                return View("ThongBao");
            }
            lstGioHang.Add(itemGioHang);
            ViewBag.TinhSoLuong = TinhTongSoLuong();
            ViewBag.TongTien = TinhTongTien();
            return PartialView("GioHangPartial");
        }
        public double TinhTongSoLuong()
        {
            List<ItemGioHang> lstGioHang = Session["GioHang"] as List<ItemGioHang>;
            if (lstGioHang == null)
            {
                return 0;
            }
            return lstGioHang.Sum(m => m.SoLuong);
        }
        public decimal TinhTongTien()
        {
            List<ItemGioHang> lstGioHang = Session["GioHang"] as List<ItemGioHang>;
            if (lstGioHang == null)
            {
                return 0;
            }
            return lstGioHang.Sum(m => m.ThanhTien);
        }
        public ActionResult GioHangPartial()
        {
            if (TinhTongSoLuong() == 0)
            {
                ViewBag.TinhSoLuong = 0;
                ViewBag.TongTien = 0;
                return PartialView();
            }
            ViewBag.TinhSoLuong = TinhTongSoLuong();
            ViewBag.TongTien = TinhTongTien();

            return View();
        }
        public ActionResult XemGioHang()
        {
            // Lấy giỏ hàng 
            List<ItemGioHang> lstGioHang = LayGioHang();
            ViewBag.TinhSoLuong = TinhTongSoLuong();
            ViewBag.TongTien = TinhTongTien();
            return View(lstGioHang);
        }
        //Chỉnh sửa giỏ hàng
        //public ActionResult ChinhSuaGioHang(int maSP)
        //{
        //    // kiểm tra session giỏ hàng tồn tại hay chưa 
        //    if (Session["GioHang"] == null)
        //    {
        //        return RedirectToAction("DanhSachSanPham");
        //    }
        //    // Kiểm tra sản phẩm tồn tại trong csdl hay chưa 
        //    SanPham sanPham = db.SanPhams.SingleOrDefault(m => m.MaSP == maSP);
        //    if (sanPham == null)
        //    {
        //        Response.StatusCode = 404;
        //        return null;
        //    }
        //    // lấy list giỏ hàng từ session 
        //    List<ItemGioHang> lstGioHang = LayGioHang();
        //    // Kiểm tra sản phẩm đó có tôn tại trong giỏ hàng hay không 
        //    ItemGioHang spCheck = lstGioHang.SingleOrDefault(m => m.MaSP == maSP);

        //    if (spCheck == null)
        //    {
        //        return RedirectToAction("DanhSachSanPham", "Home");
        //    }
        //    // Lấy list giỏ hàng tạo giao diện 
        //    ViewBag.ListGioHang = lstGioHang;

        //    // Nếu tồn tại rồi ta sẽ trả về View

        //    return View(spCheck);

        //}

        //[HttpPost]
        //public ActionResult CapNhatGioHang(ItemGioHang itemGH)
        //{
        //    // Kiểm tra số lượng tồn 
        //    SanPham spcheck = db.SanPhams.Single(m => m.MaSP == itemGH.MaSP);
        //    if (spcheck.SoLuongTon < itemGH.SoLuong)
        //    {
        //        return View("ThongBao");
        //    }
        //    List<ItemGioHang> lstGH = LayGioHang();

        //    ItemGioHang updateGioHang = lstGH.Find(m => m.MaSP == itemGH.MaSP);
        //    updateGioHang.SoLuong = itemGH.SoLuong;
        //    updateGioHang.ThanhTien = updateGioHang.SoLuong * updateGioHang.DonGia;
        //    return View();
        //}
        public ActionResult XoaGioHang(int maSP)
        {
            // kiểm tra session giỏ hàng tồn tại hay chưa 
            if (Session["GioHang"] == null)
            {
                return RedirectToAction("DanhSachSanPham");
            }
            // Kiểm tra sản phẩm tồn tại trong csdl hay chưa 
            SanPham sanPham = db.SanPhams.SingleOrDefault(m => m.MaSP == maSP);
            if (sanPham == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            // lấy list giỏ hàng từ session 
            List<ItemGioHang> lstGioHang = LayGioHang();
            // Kiểm tra sản phẩm đó có tôn tại trong giỏ hàng hay không 
            ItemGioHang spCheck = lstGioHang.SingleOrDefault(m => m.MaSP == maSP);
            if (spCheck == null)
            {
                return RedirectToAction("DanhSachSanPham", "Home");
            }
            lstGioHang.Remove(spCheck);
            return RedirectToAction("XemGioHang", "GioHang");
        }
        [HttpPost]
        public ActionResult MuaHang()
        {
            // Kiểm tra session đã tồn tại hay chưa 
            if (Session["GioHang"] == null)
            {
                return RedirectToAction("DanhSachSanPham", "SanPham");
            }
            KhachHang kH = new KhachHang();
            if (Session["TaiKhoan"] != null)
            {
                // Đối với khách hàng là thành viên 
                ThanhVien tv = Session["TaiKhoan"] as ThanhVien;
                kH.TenKH = tv.HoTen;
                kH.DiaChi = tv.DiaChi;
                kH.Email = tv.Email;
                kH.SoDienThoai = tv.SoDienThoai;
                kH.MaTV = tv.MaTV;
                db.KhachHangs.Add(kH);
                db.SaveChanges();
            }
            // Thêm đơn hàng 
            DonDatHang donDatHang = new DonDatHang();
            donDatHang.MaKH = kH.MaKH;
            donDatHang.NgayDat = DateTime.Now;
            donDatHang.TinhTrangGiaoHang = false;
            donDatHang.DaThanhToan = false;
            donDatHang.UuDai = 0;
            donDatHang.DaHuy = false;
            donDatHang.DaXoa = false;
            db.DonDatHangs.Add(donDatHang);
            db.SaveChanges();
            // Thêm chi tiết đơn đặt hàng 
            List<ItemGioHang> lstDonDatHang = LayGioHang();
            // Sau khi save thì mã trong đơn đặt hàng sẽ được lưu vào chi tiết đơn hàng 
            foreach (var item in lstDonDatHang)
            {
                ChiTietDonDatHang chiTietDonDatHang = new ChiTietDonDatHang();
                chiTietDonDatHang.MaDDH = donDatHang.MaDDH;
                chiTietDonDatHang.MaSP = item.MaSP;
                chiTietDonDatHang.TenSP = item.TenSP;
                chiTietDonDatHang.SoLuong = item.SoLuong;
                chiTietDonDatHang.DonGia = item.DonGia;
                db.ChiTietDonDatHangs.Add(chiTietDonDatHang);
            }
            db.SaveChanges();
            Session["GioHang"] = null;
            //QuanLyDatHangController.GuiMail("Cảm ơn quý khách đã mua hàng tại chúng tôi",kH.Email,"phuccode77@gmail.com","phantanphuc12345??","Thank you");
            return RedirectToAction("XemGioHang", "GioHang");
        }
        [HttpGet]
        public ActionResult UpdateCard(int maSP)
        {
            SanPham sanPham = db.SanPhams.SingleOrDefault(m => m.MaSP == maSP);
            if (sanPham == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            List<ItemGioHang> lstGioHang = LayGioHang();
            ItemGioHang spCheck = lstGioHang.SingleOrDefault(m => m.MaSP == maSP);
            if (spCheck == null)
            {
                return RedirectToAction("XemGioHang", "GioHang");
            }
            ViewBag.ListGioHang = lstGioHang;
            return View(spCheck);
        }
        [HttpPost]
        public ActionResult UpdateCard(ItemGioHang itemGioHang)
        {
            SanPham check = db.SanPhams.SingleOrDefault(m => m.MaSP == itemGioHang.MaSP);
            if (check.SoLuongTon < itemGioHang.SoLuong)
            {
                return View("ThongBao");
            }
            List<ItemGioHang> listcard = LayGioHang();
            ItemGioHang update = listcard.Find(m => m.MaSP == itemGioHang.MaSP);

            update.SoLuong = itemGioHang.SoLuong;
            update.ThanhTien = update.DonGia * update.SoLuong;
            
            return RedirectToAction("XemGioHang");
        }
    }
}