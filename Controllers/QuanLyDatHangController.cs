using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebsiteBanHang.Models;
using System.Net.Mail;

namespace WebsiteBanHang.Controllers
{
    [Authorize(Roles = "QuanTri,QuanLyDonHang")]
    public class QuanLyDatHangController : Controller
    {
        QuanLyBanHangEntities db = new QuanLyBanHangEntities();
        public ActionResult MenuOrderPartial()
        {
                return View();
        }
        // GET: QuanLyDatHang
        public ActionResult ChuaThanhToan()
        {
            if (Session["TaiKhoan"] != null)
            {
                var Unpaid = db.DonDatHangs.Where(m => m.DaThanhToan == false && m.TinhTrangGiaoHang == false).OrderBy(m => m.NgayDat).ToList();
                return View(Unpaid);
            }
            else
            {
                return RedirectToAction("Http404", "Error");
            }
            
        }
        public ActionResult ChuaGiao()
        {
            if (Session["TaiKhoan"] != null)
            {
                var Unpaid = db.DonDatHangs.Where(m => m.TinhTrangGiaoHang == false && m.DaThanhToan == true).OrderBy(m => m.NgayDat).ToList();
                return View(Unpaid);
            }
            else
            {
                return RedirectToAction("Http404", "Error");
            }
            
        }
        public ActionResult DaGiaoDaThanhToan()
        {
            if (Session["TaiKhoan"] != null)
            {
                var Unpaid = db.DonDatHangs.Where(m => m.TinhTrangGiaoHang == true && m.DaThanhToan == true).OrderBy(m => m.NgayDat).ToList();
                return View(Unpaid);
            }
            else
            {
                return RedirectToAction("Http404", "Error");
            }
            
        }
        [HttpGet]
        public ActionResult DuyetDonHang(int? id)
        {
            if(id == null)
            {
                return new HttpStatusCodeResult(System.Net.HttpStatusCode.BadRequest);
            }
            DonDatHang donDatHang = db.DonDatHangs.SingleOrDefault(m => m.MaDDH == id);
            if(donDatHang == null)
            {
                return HttpNotFound();
            }

            // Hiển thị thi tiết đơn hàng lên view
            var listChiTietDonHang = db.ChiTietDonDatHangs.Where(m => m.MaDDH == id);
            ViewBag.ChiTietDonDatHang = listChiTietDonHang;

            return View(donDatHang);
        }
        [HttpPost]
        public ActionResult DuyetDonHang(DonDatHang model)
        {
            // Truy vấn dữ liệu đơn hàng đó
            DonDatHang updateDDH = db.DonDatHangs.SingleOrDefault(m => m.MaDDH == model.MaDDH);
            updateDDH.DaThanhToan = model.DaThanhToan;
            updateDDH.TinhTrangGiaoHang = model.TinhTrangGiaoHang;
            db.SaveChanges();

            var listChiTietDonHang = db.ChiTietDonDatHangs.Where(m => m.MaDDH == model.MaDDH);
            ViewBag.ChiTietDonDatHang = listChiTietDonHang;

            return RedirectToAction("ChuaThanhToan");
        }
        public static void GuiMail(string Title, string ToEmail, string FromEmail, string PassWord, string Content)
        {
            // Gọi mail 
            MailMessage mail = new MailMessage();
            mail.To.Add(ToEmail);// địa chỉ nhận     
            mail.From = new MailAddress(ToEmail); // địa chỉ gửi
            mail.Subject = Title;
            mail.Body = Content;
            mail.IsBodyHtml = true;
            SmtpClient smtp = new SmtpClient();
            smtp.Host = "smtp.gmail.com"; // host gửi gmail 
            smtp.Port = 578;// port của mail
            smtp.UseDefaultCredentials = false;
            smtp.Credentials = new System.Net.NetworkCredential(FromEmail, PassWord);// Tài khoản passwork người gửi 
            smtp.EnableSsl = true;
            smtp.Send(mail);
        }

        public ActionResult ChiTietDonHang (int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(System.Net.HttpStatusCode.BadRequest);
            }
            DonDatHang donDatHang = db.DonDatHangs.SingleOrDefault(m => m.MaDDH == id);
            if (donDatHang == null)
            {
                return HttpNotFound();
            }

            // Hiển thị thi tiết đơn hàng lên view
            var listChiTietDonHang = db.ChiTietDonDatHangs.Where(m => m.MaDDH == id);
            ViewBag.ChiTietDonDatHang = listChiTietDonHang;

            return View(donDatHang);
        }
    }
}