using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using static WebsiteBanHang.Models.SanPham;
using System.Web.Mvc;

namespace WebsiteBanHang.Models
{
    [MetadataTypeAttribute(typeof(SanPhamMetadata))]
    public partial class SanPham
    {
        internal sealed class SanPhamMetadata
        {
            public int MaSP { get; set; }
            [Display(Name = "Tên sản phẩm")]
            [Required(ErrorMessage = "{0} không được để trống")]
            public string TenSP { get; set; }
            [Display(Name = "Đơn giá")]
            [Required(ErrorMessage = "{0} không được để trống")]
            public Nullable<decimal> DonGia { get; set; }
            [Display(Name = "Ngày Cập Nhật")]
            [DataType(DataType.Date)]
            [Required(ErrorMessage = "Ngày cập nhật là bắt buộc")]
            public Nullable<System.DateTime> NgayCapNhat { get; set; }
            [Display(Name = "Cấu hình")]
            [Required(ErrorMessage = "{0} không được để trống")]
            public string CauHinh { get; set; }
            [AllowHtml]
            public string MoTa { get; set; }
            [Display(Name = "Số lượng tồn")]
            [Required(ErrorMessage = "Số lượng tồn không được để trống")]
            [Range(0, int.MaxValue, ErrorMessage = "Số lượng tồn phải là số không âm")]
            public Nullable<int> SoLuongTon { get; set; }
            public Nullable<int> LuotXem { get; set; }
            public Nullable<int> LuotBinhChon { get; set; }
            public Nullable<int> LuotBinhLuan { get; set; }
            public Nullable<int> SoLanMua { get; set; }
            public Nullable<int> Moi { get; set; }
            public Nullable<int> MANCC { get; set; }
            public Nullable<int> MANSX { get; set; }
            public Nullable<int> MaLoaiSP { get; set; }
            public Nullable<bool> DaXoa { get; set; }
            public string HinhAnh { get; set; }
            public string HinhAnh1 { get; set; }
            public string HinhAnh2 { get; set; }
            public string HinhAnh3 { get; set; }
        }
    } 
}