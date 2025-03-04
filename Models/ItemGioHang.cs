using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WebsiteBanHang.Controllers;
namespace WebsiteBanHang.Models
{
    public class ItemGioHang
    {
        public int MaSP { get; set; }
        public string TenSP { get; set; }
        public int SoLuong { get; set; }
        public decimal DonGia { get; set; }
        public decimal ThanhTien { get; set; }
        public string HinhAnh { get; set; }
        public int MaLoai { get; set; }
        public int MaNSX { get; set; }
        public ItemGioHang()
        {

        }
        public ItemGioHang(int maSP)
        {
            using (QuanLyBanHangEntities db = new QuanLyBanHangEntities())
            {
                this.MaSP = maSP;
                SanPham sanPham = db.SanPhams.Single(m => m.MaSP == maSP);
                this.TenSP = sanPham.TenSP;
                this.HinhAnh = sanPham.HinhAnh;
                this.DonGia = sanPham.DonGia.Value;
                this.ThanhTien = DonGia * SoLuong;
                this.MaLoai = (int)sanPham.MaLoaiSP;
                this.MaNSX = (int)sanPham.MANSX;
            }
        }
        public ItemGioHang(int maSP, int soLuong)
        {
            using (QuanLyBanHangEntities db = new QuanLyBanHangEntities())
            {
                this.MaSP = maSP;
                SanPham sanPham = db.SanPhams.Single(m => m.MaSP == maSP);
                this.TenSP = sanPham.TenSP;
                this.HinhAnh = sanPham.HinhAnh;
                this.DonGia = sanPham.DonGia.Value;
                this.SoLuong = soLuong;
                this.SoLuong = 1;
                this.ThanhTien = DonGia * SoLuong;
                this.MaLoai = (int)sanPham.MaLoaiSP;
                this.MaNSX = (int)sanPham.MANSX;
            }
        }
    }
}