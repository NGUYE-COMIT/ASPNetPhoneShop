using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebsiteBanHang.Models;

namespace WebsiteBanHang.Controllers
{
    [Authorize(Roles = "QuanTri,PhanQuyen")]
    public class QuyenController : Controller
    {
        QuanLyBanHangEntities db = new QuanLyBanHangEntities();
        public ActionResult MenuRolePartial()
        {
            return View();
        }
        public ActionResult ListRole()
        {
            if (Session["TaiKhoan"] != null)
            {
                var Role = db.Quyens.ToList();
                return View(Role);
            }
            else
            {
                return RedirectToAction("Http404", "Error");
            }
        }
        [HttpGet]
        public ActionResult CreateRole()
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
        public ActionResult CreateRole(Quyen model)
        {
            try
            {
                db.Quyens.Add(model);
                db.SaveChanges();
                return RedirectToAction("ListRole");
            }
            catch (Exception ex)
            {
                ModelState.AddModelError("", ex.Message);
                return View(model);
            }

        }
        [HttpGet]
        public ActionResult UpdateRole(string id)
        {
            if (id == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            Quyen Role = db.Quyens.SingleOrDefault(m => m.MaQuyen == id);
            if (Role == null)
            {
                return HttpNotFound();
            }
            return View(Role);
        }
        [HttpPost]
        public ActionResult UpdateRole(Quyen model)
        {
            var updateModel = db.Quyens.Find(model.MaQuyen);
            // Gán giá trị 
            updateModel.TenQuyen = model.TenQuyen;
            // Lưu thay đổi
            db.SaveChanges();
            return RedirectToAction("ListRole");
        }
        public ActionResult RemoveRole(string id)
        {
            if (id == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            Quyen Role = db.Quyens.SingleOrDefault(m => m.MaQuyen == id);
            if (Role == null)
            {
                return HttpNotFound();
            }
            db.Quyens.Remove(Role);
            db.SaveChanges();
            return RedirectToAction("ListRole");
        }
        public ActionResult Membershiptype()
        {
            if (Session["TaiKhoan"] != null)
            {
                return View(db.LoaiThanhViens.OrderBy(m => m.TenLoai).ToList());
            }
            else
            {
                return RedirectToAction("Http404", "Error");
            }
        }
        [HttpGet]
        public ActionResult CreateMembershiptype()
        {
            return View();
        }
        [HttpPost]
        public ActionResult CreateMembershiptype(LoaiThanhVien model)
        {
            try
            {
                db.LoaiThanhViens.Add(model);
                db.SaveChanges();
                return RedirectToAction("Membershiptype");
            }
            catch (Exception ex)
            {
                ModelState.AddModelError("", ex.Message);
                return View(model);
            }
        }
        public ActionResult RemoveMembershiptype(int id)
        {
            if (id == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            LoaiThanhVien Role = db.LoaiThanhViens.SingleOrDefault(m => m.MaLoaiTV == id);
            if (Role == null)
            {
                return HttpNotFound();
            }
            db.LoaiThanhViens.Remove(Role);
            db.SaveChanges();
            return RedirectToAction("ListRole");
        }
        [HttpGet]
        public ActionResult Decentralization(int? id)
        {
            if (id == null)
            {
                return RedirectToAction("Http404", "Error");
            }
            LoaiThanhVien listMember = db.LoaiThanhViens.SingleOrDefault(m => m.MaLoaiTV == id);
            if (listMember == null)
            {
                return HttpNotFound();
            }
            ViewBag.ListRole = db.Quyens.ToList();
            ViewBag.ListMemberRole = db.LoaiThanhVien_Quyen.Where(m => m.MaLoaiTV == id);
            return View(listMember);
        }
        [HttpPost]
        public ActionResult Decentralization(int? Id_Member, IEnumerable<LoaiThanhVien_Quyen> listDecentralization)
        {
            // Trường hợp: Nếu Đã Phân Quyền nhưng muốn phân quyền lại
            // Bước 1: Xóa những quyền thuộc loại tv đó 
            var listDecentralized = db.LoaiThanhVien_Quyen.Where(m => m.MaLoaiTV == Id_Member);
            if (listDecentralized.Count() != 0)
            {
                db.LoaiThanhVien_Quyen.RemoveRange(listDecentralized);
                db.SaveChanges();
            }
            // Kiểm tra danh sách quyền được check
            if (listDecentralized != null)
            {
                foreach (var item in listDecentralization)
                {
                    item.MaLoaiTV = int.Parse(Id_Member.ToString());
                    db.LoaiThanhVien_Quyen.Add(item);

                }
                db.SaveChanges();
            }
            return RedirectToAction("ListMember");
        }
    }
}