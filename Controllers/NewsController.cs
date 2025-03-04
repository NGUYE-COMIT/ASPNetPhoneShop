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
    [Authorize(Roles = "QuanTri,TinTuc")]
    public class NewsController : Controller
    {
        QuanLyBanHangEntities db = new QuanLyBanHangEntities();
        // GET: News
        public ActionResult MenuNews()
        {
            return View();
        }
        public ActionResult ListNews()
        {
            if (Session["TaiKhoan"] != null)
            {
                var listnew = db.TinTucs.ToList();
                return View(listnew);
            }
            else
            {
                return RedirectToAction("Http404", "Error");
            }
        }
        [HttpGet]
        public ActionResult CreateNews() 
        {
            if (Session["TaiKhoan"] != null)
            {
                return View();
            }
            else
            {
                return RedirectToAction("Http404", "Error");
            }
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult CreateNews(TinTuc model, HttpPostedFileBase Image)
        {
            if (Session["TaiKhoan"] != null)
            {
                try
                {
                   
                    if (Image != null && Image.ContentLength > 0)
                    {
                        // Lấy tên hình ảnh 
                        var fileName = Path.GetFileName(Image.FileName);
                        // Lấy hình ảnh chuyển vào thư mục hình ảnh
                        var path = Path.Combine(Server.MapPath("~/assets/images/News"), fileName);
                        // Nếu có rồi thì thông báo 
                        if (System.IO.File.Exists(path))
                        {
                            ViewBag.upload = "Hình đã tồn tại";
                            return View();
                        }
                        else
                        {
                            // lấy hình ảnh đưa vào thư mục 
                            Image.SaveAs(path);
                            model.HinhBia = fileName;
                        }
                    }
                    db.TinTucs.Add(model);
                    db.SaveChanges();
                    return RedirectToAction("ListNews");
                }
                catch (Exception ex)
                {
                    ModelState.AddModelError("", ex.Message);
                    return View(model);
                }
            }
            else
            {
                return RedirectToAction("Http404", "Error");
            }
        }
        [HttpGet]
        public ActionResult UpdateNews(int? id)
        {
            if (id == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            TinTuc news = db.TinTucs.SingleOrDefault(m => m.MaTin == id);
            if (news == null)
            {
                return HttpNotFound();
            }
            return View(news);
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult UpdateNews(TinTuc model)
        {
            if (ModelState.IsValid)
            {
                var updateNews = db.TinTucs.Find(model.MaTin);
                updateNews.TieuDe = model.TieuDe;
                updateNews.NoiDung = model.NoiDung;
                updateNews.HinhBia = model.HinhBia;
                updateNews.NgayDang = model.NgayDang;
                db.SaveChanges();
                return RedirectToAction("ListNews");
            }
            return View(model);
        }
        [HttpGet]
        public ActionResult RemoveNews(int? id)
        {
            if (id == null)
            {
                return RedirectToAction("Http404", "Error");
            }
            TinTuc news = db.TinTucs.SingleOrDefault(m => m.MaTin == id);
            if (news == null)
            {
                return HttpNotFound();
            }
            db.TinTucs.Remove(news);
            db.SaveChanges();
            return RedirectToAction("ListNews");
        }
    }
}