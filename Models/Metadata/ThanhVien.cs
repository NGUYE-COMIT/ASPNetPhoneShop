using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
namespace WebsiteBanHang.Models
{
    [MetadataTypeAttribute(typeof(ThanhVienMetadata))]
    public partial class ThanhVien
    {
        internal sealed class ThanhVienMetadata
        {
            public int MaTV { get; set; }
            [Display(Name = "Tài khoản")]
            [Required(ErrorMessage = "{0} không được để trống")]
            public string TaiKhoan { get; set; }
            [Display(Name = "Mật khẩu")]
            [Required(ErrorMessage = "{0} không được để trống")]
            public string MatKhau { get; set; }
            [Compare("ConfirmPassword", ErrorMessage = "Mật khẩu không trùng khớp")]
            public string ConfirmPassword { get; set; }
            [Display(Name = "Họ tên")]
            [Required(ErrorMessage = "{0} không được để trống")]
            public string HoTen { get; set; }
            [Display(Name = "Địa chỉ")]
            [Required(ErrorMessage = "{0} không được để trống")]
            public string DiaChi { get; set; }
            [Display(Name = "Email")]
            [Required(ErrorMessage = "{0} không được để trống")]
            [RegularExpression("^[a-zA-Z0-9_\\.-]+@([a-zA-Z0-9-]+\\.)+[a-zA-Z]{2,6}$", ErrorMessage = "Email không hợp lệ")]
            public string Email { get; set; }
            [Display(Name = "Số điện thoại")]
            [Required(ErrorMessage = "{0} không được để trống")]
            [StringLength(10, ErrorMessage = "Số điện thoại không quá 10 ký tự")]
            public string SoDienThoai { get; set; }
            public string CauHoi { get; set; }
            public string CauTraLoi { get; set; }
            public Nullable<int> MaLoaiTV
            {
                get; set;
            }
        }
    }
}