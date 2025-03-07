
GO
/****** Object:  Table [dbo].[BinhLuan]    Script Date: 01/19/2024 6:10:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BinhLuan](
	[MaBL] [int] IDENTITY(1,1) NOT NULL,
	[NoiDungBL] [nvarchar](max) NULL,
	[MaTV] [int] NULL,
	[MaSP] [int] NULL,
 CONSTRAINT [PK_BinhLuan] PRIMARY KEY CLUSTERED 
(
	[MaBL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTietDonDatHang]    Script Date: 01/19/2024 6:10:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietDonDatHang](
	[MaChiTietDatHang] [int] IDENTITY(1,1) NOT NULL,
	[MaDDH] [int] NULL,
	[MaSP] [int] NULL,
	[TenSP] [nvarchar](255) NULL,
	[SoLuong] [int] NULL,
	[DonGia] [decimal](18, 0) NULL,
 CONSTRAINT [PK_ChiTietDonDatHang] PRIMARY KEY CLUSTERED 
(
	[MaChiTietDatHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTietPhieuNhap]    Script Date: 01/19/2024 6:10:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietPhieuNhap](
	[MaChiTietPhieuNhap] [int] IDENTITY(1,1) NOT NULL,
	[MaPN] [int] NULL,
	[MaSP] [int] NULL,
	[DonGiaNhap] [decimal](18, 0) NULL,
	[SoLuongNhap] [int] NULL,
 CONSTRAINT [PK_ChiTietPhieuNhap] PRIMARY KEY CLUSTERED 
(
	[MaChiTietPhieuNhap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DonDatHang]    Script Date: 01/19/2024 6:10:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonDatHang](
	[MaDDH] [int] IDENTITY(1,1) NOT NULL,
	[NgayDat] [datetime] NULL,
	[TinhTrangGiaoHang] [bit] NULL,
	[NgayGiao] [datetime] NULL,
	[DaThanhToan] [bit] NULL,
	[MaKH] [int] NULL,
	[UuDai] [int] NULL,
	[DaHuy] [bit] NULL,
	[DaXoa] [bit] NULL,
 CONSTRAINT [PK_DonDatHang] PRIMARY KEY CLUSTERED 
(
	[MaDDH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 01/19/2024 6:10:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[MaKH] [int] IDENTITY(1,1) NOT NULL,
	[TenKH] [nvarchar](100) NULL,
	[DiaChi] [nvarchar](100) NULL,
	[Email] [nvarchar](255) NULL,
	[SoDienThoai] [nvarchar](12) NULL,
	[MaTV] [int] NULL,
 CONSTRAINT [PK_KhachHang] PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoaiSanPham]    Script Date: 01/19/2024 6:10:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiSanPham](
	[MaLoaiSP] [int] IDENTITY(1,1) NOT NULL,
	[TenLoai] [nvarchar](100) NULL,
	[Icon] [nvarchar](max) NULL,
	[BiDanh] [nvarchar](50) NULL,
 CONSTRAINT [PK_LoaiSanPham] PRIMARY KEY CLUSTERED 
(
	[MaLoaiSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoaiThanhVien]    Script Date: 01/19/2024 6:10:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiThanhVien](
	[MaLoaiTV] [int] IDENTITY(1,1) NOT NULL,
	[TenLoai] [nvarchar](50) NULL,
	[UuDai] [int] NULL,
 CONSTRAINT [PK_LoaiThanhVien] PRIMARY KEY CLUSTERED 
(
	[MaLoaiTV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoaiThanhVien_Quyen]    Script Date: 01/19/2024 6:10:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiThanhVien_Quyen](
	[MaLoaiTV] [int] NOT NULL,
	[MaQuyen] [nvarchar](50) NOT NULL,
	[GhiChu] [nvarchar](50) NULL,
 CONSTRAINT [PK_LoaiThanhVien_Quyen] PRIMARY KEY CLUSTERED 
(
	[MaLoaiTV] ASC,
	[MaQuyen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhaCungCap]    Script Date: 01/19/2024 6:10:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhaCungCap](
	[MaNCC] [int] IDENTITY(1,1) NOT NULL,
	[TenNCC] [nvarchar](100) NULL,
	[DiaChi] [nvarchar](255) NULL,
	[Email] [nvarchar](255) NULL,
	[SoDienThoai] [nvarchar](12) NULL,
	[Fax] [nvarchar](50) NULL,
 CONSTRAINT [PK_NhaCungCap] PRIMARY KEY CLUSTERED 
(
	[MaNCC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhaSanXuat]    Script Date: 01/19/2024 6:10:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhaSanXuat](
	[MaNSX] [int] IDENTITY(1,1) NOT NULL,
	[TenNSX] [nvarchar](100) NULL,
	[ThongTin] [nvarchar](255) NULL,
	[Logo] [nvarchar](max) NULL,
 CONSTRAINT [pk_NSX] PRIMARY KEY CLUSTERED 
(
	[MaNSX] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhieuNhap]    Script Date: 01/19/2024 6:10:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhieuNhap](
	[MaPN] [int] IDENTITY(1,1) NOT NULL,
	[MaNCC] [int] NULL,
	[NgayNhap] [datetime] NULL,
	[DaXoa] [bit] NULL,
 CONSTRAINT [PK_PhieuNhap] PRIMARY KEY CLUSTERED 
(
	[MaPN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Quyen]    Script Date: 01/19/2024 6:10:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Quyen](
	[MaQuyen] [nvarchar](50) NOT NULL,
	[TenQuyen] [nvarchar](50) NULL,
 CONSTRAINT [PK_Quyen] PRIMARY KEY CLUSTERED 
(
	[MaQuyen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 01/19/2024 6:10:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham](
	[MaSP] [int] IDENTITY(1,1) NOT NULL,
	[TenSP] [nvarchar](100) NULL,
	[DonGia] [decimal](18, 0) NULL,
	[NgayCapNhat] [datetime] NULL,
	[CauHinh] [nvarchar](max) NULL,
	[MoTa] [nvarchar](max) NULL,
	[SoLuongTon] [int] NULL,
	[LuotXem] [int] NULL,
	[LuotBinhChon] [int] NULL,
	[LuotBinhLuan] [int] NULL,
	[SoLanMua] [int] NULL,
	[Moi] [int] NULL,
	[MANCC] [int] NULL,
	[MANSX] [int] NULL,
	[MaLoaiSP] [int] NULL,
	[DaXoa] [bit] NULL,
	[HinhAnh] [nvarchar](max) NULL,
	[HinhAnh1] [nvarchar](max) NULL,
	[HinhAnh2] [nvarchar](max) NULL,
	[HinhAnh3] [nvarchar](max) NULL,
 CONSTRAINT [PK_SanPham] PRIMARY KEY CLUSTERED 
(
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ThanhVien]    Script Date: 01/19/2024 6:10:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThanhVien](
	[MaTV] [int] IDENTITY(1,1) NOT NULL,
	[TaiKhoan] [nvarchar](100) NULL,
	[MatKhau] [nvarchar](100) NULL,
	[HoTen] [nvarchar](100) NULL,
	[DiaChi] [nvarchar](255) NULL,
	[Email] [nvarchar](255) NULL,
	[SoDienThoai] [nvarchar](12) NULL,
	[CauHoi] [nvarchar](max) NULL,
	[CauTraLoi] [nvarchar](max) NULL,
	[MaLoaiTV] [int] NULL,
 CONSTRAINT [PK_ThanhVien] PRIMARY KEY CLUSTERED 
(
	[MaTV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TinTuc]    Script Date: 01/19/2024 6:10:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TinTuc](
	[MaTin] [int] IDENTITY(1,1) NOT NULL,
	[HinhBia] [nvarchar](150) NULL,
	[TieuDe] [nvarchar](150) NULL,
	[NoiDung] [nvarchar](max) NULL,
	[NgayDang] [datetime] NULL,
 CONSTRAINT [PK_TinTuc] PRIMARY KEY CLUSTERED 
(
	[MaTin] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ChiTietDonDatHang] ON 

INSERT [dbo].[ChiTietDonDatHang] ([MaChiTietDatHang], [MaDDH], [MaSP], [TenSP], [SoLuong], [DonGia]) VALUES (26, 23, 3, N'IPhone 14 Promax', 1, CAST(1000000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDonDatHang] ([MaChiTietDatHang], [MaDDH], [MaSP], [TenSP], [SoLuong], [DonGia]) VALUES (27, 23, 67, N'Xiaomi Redmi 13C 6GB-128GB', 1, CAST(3290000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDonDatHang] ([MaChiTietDatHang], [MaDDH], [MaSP], [TenSP], [SoLuong], [DonGia]) VALUES (28, 24, 3, N'IPhone 14 Promax', 1, CAST(1000000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDonDatHang] ([MaChiTietDatHang], [MaDDH], [MaSP], [TenSP], [SoLuong], [DonGia]) VALUES (29, 24, 46, N'Samsung Galaxy A04s', 1, CAST(3290000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDonDatHang] ([MaChiTietDatHang], [MaDDH], [MaSP], [TenSP], [SoLuong], [DonGia]) VALUES (30, 25, 3, N'IPhone 14 Promax', 1, CAST(1000000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDonDatHang] ([MaChiTietDatHang], [MaDDH], [MaSP], [TenSP], [SoLuong], [DonGia]) VALUES (31, 25, 14, N'IPhone 14 Plus', 1, CAST(21290000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDonDatHang] ([MaChiTietDatHang], [MaDDH], [MaSP], [TenSP], [SoLuong], [DonGia]) VALUES (32, 26, 27, N'Asus Rog Phone 7', 1, CAST(1700000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDonDatHang] ([MaChiTietDatHang], [MaDDH], [MaSP], [TenSP], [SoLuong], [DonGia]) VALUES (33, 27, 67, N'Xiaomi Redmi 13C 6GB-128GB', 1, CAST(3290000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDonDatHang] ([MaChiTietDatHang], [MaDDH], [MaSP], [TenSP], [SoLuong], [DonGia]) VALUES (34, 28, 67, N'Xiaomi Redmi 13C 6GB-128GB', 1, CAST(3290000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDonDatHang] ([MaChiTietDatHang], [MaDDH], [MaSP], [TenSP], [SoLuong], [DonGia]) VALUES (35, 29, 14, N'IPhone 14 Plus', 1, CAST(21290000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDonDatHang] ([MaChiTietDatHang], [MaDDH], [MaSP], [TenSP], [SoLuong], [DonGia]) VALUES (36, 31, 3, N'IPhone 14 Promax', 1, CAST(1000000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDonDatHang] ([MaChiTietDatHang], [MaDDH], [MaSP], [TenSP], [SoLuong], [DonGia]) VALUES (37, 32, 3, N'IPhone 14 Promax', 1, CAST(1000000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDonDatHang] ([MaChiTietDatHang], [MaDDH], [MaSP], [TenSP], [SoLuong], [DonGia]) VALUES (38, 32, 14, N'IPhone 14 Plus', 1, CAST(21290000 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[ChiTietDonDatHang] OFF
GO
SET IDENTITY_INSERT [dbo].[DonDatHang] ON 

INSERT [dbo].[DonDatHang] ([MaDDH], [NgayDat], [TinhTrangGiaoHang], [NgayGiao], [DaThanhToan], [MaKH], [UuDai], [DaHuy], [DaXoa]) VALUES (23, CAST(N'2023-12-06T20:01:34.780' AS DateTime), 1, NULL, 1, 25, 0, 0, 0)
INSERT [dbo].[DonDatHang] ([MaDDH], [NgayDat], [TinhTrangGiaoHang], [NgayGiao], [DaThanhToan], [MaKH], [UuDai], [DaHuy], [DaXoa]) VALUES (24, CAST(N'2023-12-07T15:42:24.990' AS DateTime), 0, NULL, 1, 26, 0, 0, 0)
INSERT [dbo].[DonDatHang] ([MaDDH], [NgayDat], [TinhTrangGiaoHang], [NgayGiao], [DaThanhToan], [MaKH], [UuDai], [DaHuy], [DaXoa]) VALUES (25, CAST(N'2023-12-08T07:59:39.830' AS DateTime), 1, NULL, 1, 27, 0, 0, 0)
INSERT [dbo].[DonDatHang] ([MaDDH], [NgayDat], [TinhTrangGiaoHang], [NgayGiao], [DaThanhToan], [MaKH], [UuDai], [DaHuy], [DaXoa]) VALUES (26, CAST(N'2023-12-12T22:14:15.377' AS DateTime), 1, NULL, 0, 28, 0, 0, 0)
INSERT [dbo].[DonDatHang] ([MaDDH], [NgayDat], [TinhTrangGiaoHang], [NgayGiao], [DaThanhToan], [MaKH], [UuDai], [DaHuy], [DaXoa]) VALUES (27, CAST(N'2023-12-12T22:26:08.370' AS DateTime), 0, NULL, 0, 29, 0, 0, 0)
INSERT [dbo].[DonDatHang] ([MaDDH], [NgayDat], [TinhTrangGiaoHang], [NgayGiao], [DaThanhToan], [MaKH], [UuDai], [DaHuy], [DaXoa]) VALUES (28, CAST(N'2023-12-14T15:37:26.267' AS DateTime), 0, NULL, 0, 30, 0, 0, 0)
INSERT [dbo].[DonDatHang] ([MaDDH], [NgayDat], [TinhTrangGiaoHang], [NgayGiao], [DaThanhToan], [MaKH], [UuDai], [DaHuy], [DaXoa]) VALUES (29, CAST(N'2023-12-16T15:48:58.723' AS DateTime), 0, NULL, 0, 31, 0, 0, 0)
INSERT [dbo].[DonDatHang] ([MaDDH], [NgayDat], [TinhTrangGiaoHang], [NgayGiao], [DaThanhToan], [MaKH], [UuDai], [DaHuy], [DaXoa]) VALUES (31, CAST(N'2024-01-04T11:25:03.530' AS DateTime), 0, NULL, 0, 32, 0, 0, 0)
INSERT [dbo].[DonDatHang] ([MaDDH], [NgayDat], [TinhTrangGiaoHang], [NgayGiao], [DaThanhToan], [MaKH], [UuDai], [DaHuy], [DaXoa]) VALUES (32, CAST(N'2024-01-19T13:59:50.430' AS DateTime), 1, NULL, 1, 33, 0, 0, 0)
SET IDENTITY_INSERT [dbo].[DonDatHang] OFF
GO
SET IDENTITY_INSERT [dbo].[KhachHang] ON 

INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [Email], [SoDienThoai], [MaTV]) VALUES (25, N'Phan Tấn Phúc', N'12/275 Nguyễn Du TP Tuy Hòa ', N'phuc35103@gamil.com', N'0987845632', 16)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [Email], [SoDienThoai], [MaTV]) VALUES (26, N'Phan Tấn Phúc', N'12/275 Nguyễn Du TP Tuy Hòa ', N'phuc35103@gamil.com', N'0987845632', 16)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [Email], [SoDienThoai], [MaTV]) VALUES (27, N'Phan Tấn Phúc', N'12/275 Nguyễn Du TP Tuy Hòa ', N'phuc35103@gamil.com', N'0987845632', 16)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [Email], [SoDienThoai], [MaTV]) VALUES (28, N'Phan Tấn Phúc', N'12/275 Nguyễn Du TP Tuy Hòa ', N'phuc35103@gamil.com', N'0987845632', 16)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [Email], [SoDienThoai], [MaTV]) VALUES (29, N'Phan Tấn Phúc', N'12/275 Nguyễn Du TP Tuy Hòa ', N'phuc35103@gamil.com', N'0987845632', 16)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [Email], [SoDienThoai], [MaTV]) VALUES (30, N'Phan Tấn Phúc', N'12/275 Nguyễn Du TP Tuy Hòa ', N'phuc35103@gamil.com', N'0987845632', 16)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [Email], [SoDienThoai], [MaTV]) VALUES (31, N'Phan Tấn Phúc', N'12/275 Nguyễn Du TP Tuy Hòa ', N'phuc35103@gamil.com', N'0987845632', 16)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [Email], [SoDienThoai], [MaTV]) VALUES (32, N'Phúc Tấn Phan', N'Phường 9 Tuy Hòa', N'phantanphuc@gmail.com', N'0333945872', 17)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [Email], [SoDienThoai], [MaTV]) VALUES (33, N'Phan Tấn Cường', N'Phường 9 Tuy Hòa', N'Tancuong@gmail.com', N'0333945872', 21)
SET IDENTITY_INSERT [dbo].[KhachHang] OFF
GO
SET IDENTITY_INSERT [dbo].[LoaiSanPham] ON 

INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoai], [Icon], [BiDanh]) VALUES (1, N'Điện Thoại ', N'fa-regular fa-mobile', N'Dien Thoai')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoai], [Icon], [BiDanh]) VALUES (2, N'Laptop ', N'fa-solid fa-laptop', N'Lap Top Xach Tay ')
SET IDENTITY_INSERT [dbo].[LoaiSanPham] OFF
GO
SET IDENTITY_INSERT [dbo].[LoaiThanhVien] ON 

INSERT [dbo].[LoaiThanhVien] ([MaLoaiTV], [TenLoai], [UuDai]) VALUES (1, N'Admin', 0)
INSERT [dbo].[LoaiThanhVien] ([MaLoaiTV], [TenLoai], [UuDai]) VALUES (2, N'Quản lý sản phẩm', 0)
INSERT [dbo].[LoaiThanhVien] ([MaLoaiTV], [TenLoai], [UuDai]) VALUES (3, N'Quản lý đơn hàng', 0)
INSERT [dbo].[LoaiThanhVien] ([MaLoaiTV], [TenLoai], [UuDai]) VALUES (4, N'Phân Quyền', 0)
INSERT [dbo].[LoaiThanhVien] ([MaLoaiTV], [TenLoai], [UuDai]) VALUES (5, N'Thường', 10)
INSERT [dbo].[LoaiThanhVien] ([MaLoaiTV], [TenLoai], [UuDai]) VALUES (6, N'Tin Tức', NULL)
SET IDENTITY_INSERT [dbo].[LoaiThanhVien] OFF
GO
INSERT [dbo].[LoaiThanhVien_Quyen] ([MaLoaiTV], [MaQuyen], [GhiChu]) VALUES (1, N'PhanQuyen', NULL)
INSERT [dbo].[LoaiThanhVien_Quyen] ([MaLoaiTV], [MaQuyen], [GhiChu]) VALUES (1, N'QuanLyDonHang', NULL)
INSERT [dbo].[LoaiThanhVien_Quyen] ([MaLoaiTV], [MaQuyen], [GhiChu]) VALUES (1, N'QuanLySanPham', N'')
INSERT [dbo].[LoaiThanhVien_Quyen] ([MaLoaiTV], [MaQuyen], [GhiChu]) VALUES (1, N'QuanTri', NULL)
INSERT [dbo].[LoaiThanhVien_Quyen] ([MaLoaiTV], [MaQuyen], [GhiChu]) VALUES (2, N'QuanLySanPham', NULL)
INSERT [dbo].[LoaiThanhVien_Quyen] ([MaLoaiTV], [MaQuyen], [GhiChu]) VALUES (3, N'QuanLyDonHang', NULL)
INSERT [dbo].[LoaiThanhVien_Quyen] ([MaLoaiTV], [MaQuyen], [GhiChu]) VALUES (4, N'PhanQuyen', NULL)
INSERT [dbo].[LoaiThanhVien_Quyen] ([MaLoaiTV], [MaQuyen], [GhiChu]) VALUES (5, N'Thuong', NULL)
INSERT [dbo].[LoaiThanhVien_Quyen] ([MaLoaiTV], [MaQuyen], [GhiChu]) VALUES (6, N'TinTuc', NULL)
GO
SET IDENTITY_INSERT [dbo].[NhaCungCap] ON 

INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [Email], [SoDienThoai], [Fax]) VALUES (1, N'FPT', N'Tp Tuy Hòa Phú Yên', N'fpt123@gmail.com', N'0324567895', N'56000')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [Email], [SoDienThoai], [Fax]) VALUES (2, N'TGDD', N'Tp Tuy Hòa Phú Yên 0', N'tgdd456@gmail.com', N'0354687985', N'56000')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [Email], [SoDienThoai], [Fax]) VALUES (3, N'Hoàng Hà Mobile', N'Tp Hồ Chí MInh ', N'hhmb784@gmail.com', N'0324699956', N'29000')
SET IDENTITY_INSERT [dbo].[NhaCungCap] OFF
GO
SET IDENTITY_INSERT [dbo].[NhaSanXuat] ON 

INSERT [dbo].[NhaSanXuat] ([MaNSX], [TenNSX], [ThongTin], [Logo]) VALUES (1, N'Acer', N'Acer@gmail.com', N'Acer.jpg')
INSERT [dbo].[NhaSanXuat] ([MaNSX], [TenNSX], [ThongTin], [Logo]) VALUES (2, N'Asus', N'Asus@gnail.com', N'Asus.png')
INSERT [dbo].[NhaSanXuat] ([MaNSX], [TenNSX], [ThongTin], [Logo]) VALUES (3, N'Samsung', N'Samsum@gmail.com', N'Samsung.png')
INSERT [dbo].[NhaSanXuat] ([MaNSX], [TenNSX], [ThongTin], [Logo]) VALUES (4, N'Apple', N'Apple@gmail.com', N'Apple.png')
INSERT [dbo].[NhaSanXuat] ([MaNSX], [TenNSX], [ThongTin], [Logo]) VALUES (5, N'HP', N'HP@gmail.com', N'HP.png')
INSERT [dbo].[NhaSanXuat] ([MaNSX], [TenNSX], [ThongTin], [Logo]) VALUES (6, N'MSI', N'MSI@gmail.com', N'MSI.png ')
INSERT [dbo].[NhaSanXuat] ([MaNSX], [TenNSX], [ThongTin], [Logo]) VALUES (7, N'Gigabyte', N'Gigabyte@Gmail.com', N'Gigabyte.jpg')
INSERT [dbo].[NhaSanXuat] ([MaNSX], [TenNSX], [ThongTin], [Logo]) VALUES (8, N'Lenovo', N'Lenovo@gmail.com', N'Lenovo.png')
INSERT [dbo].[NhaSanXuat] ([MaNSX], [TenNSX], [ThongTin], [Logo]) VALUES (9, N'Xiaomi', N'Xiaomi@gmail.com', N'Xiaomi.png')
SET IDENTITY_INSERT [dbo].[NhaSanXuat] OFF
GO
INSERT [dbo].[Quyen] ([MaQuyen], [TenQuyen]) VALUES (N'PhanQuyen', N'Phân Quyền')
INSERT [dbo].[Quyen] ([MaQuyen], [TenQuyen]) VALUES (N'QuanLyDonHang', N'Quản Lý Đơn Hàng')
INSERT [dbo].[Quyen] ([MaQuyen], [TenQuyen]) VALUES (N'QuanLySanPham', N'Quản Lý Sản Phẩm')
INSERT [dbo].[Quyen] ([MaQuyen], [TenQuyen]) VALUES (N'QuanTri', N'Quản Trị Viên')
INSERT [dbo].[Quyen] ([MaQuyen], [TenQuyen]) VALUES (N'Thuong', N'Khách Hàng')
INSERT [dbo].[Quyen] ([MaQuyen], [TenQuyen]) VALUES (N'TinTuc', N'Tin Tức')
GO
SET IDENTITY_INSERT [dbo].[SanPham] ON 

INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [CauHinh], [MoTa], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLanMua], [Moi], [MANCC], [MANSX], [MaLoaiSP], [DaXoa], [HinhAnh], [HinhAnh1], [HinhAnh2], [HinhAnh3]) VALUES (2, N'IPhone 12', CAST(5000000 AS Decimal(18, 0)), CAST(N'2020-10-01T00:00:00.000' AS DateTime), N'Snapdragon 845', N'<p>"CauHinh"&gt;</p>', 50, 2, 0, 0, 1, 0, 3, 4, 1, 0, N'iPhone 12.jpg', N'Iphone 12 xanh.jpg', N'Iphone 12.jpg', N'Iphone-12 den.jpg')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [CauHinh], [MoTa], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLanMua], [Moi], [MANCC], [MANSX], [MaLoaiSP], [DaXoa], [HinhAnh], [HinhAnh1], [HinhAnh2], [HinhAnh3]) VALUES (3, N'IPhone 14 Promax', CAST(1000000 AS Decimal(18, 0)), CAST(N'2023-11-09T00:00:00.000' AS DateTime), N'Apple A12', N'<div id ="CauHinh"></div>', 50, 2, 0, 0, 1, 0, 1, 4, 1, 0, N'iPhone 14 Promax.jpg', N'Iphone 14 pro max den.jpg', N'Iphone 14-pro max vang.jpg', N'Iphone-14 pro max bac.jpg')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [CauHinh], [MoTa], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLanMua], [Moi], [MANCC], [MANSX], [MaLoaiSP], [DaXoa], [HinhAnh], [HinhAnh1], [HinhAnh2], [HinhAnh3]) VALUES (4, N'IPhone 11', CAST(1000000 AS Decimal(18, 0)), CAST(N'2023-01-09T00:00:00.000' AS DateTime), N'Apple A12', N'<div id ="CauHinh"></div>', 50, 2, 0, 0, 1, 0, 1, 4, 1, 0, N'IPhone 11.jpg', N'Iphone 11 trang.jpg', N'638059306728859551_iphone-11-den-1.jpg', N'Iphone 11 trang.jpg')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [CauHinh], [MoTa], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLanMua], [Moi], [MANCC], [MANSX], [MaLoaiSP], [DaXoa], [HinhAnh], [HinhAnh1], [HinhAnh2], [HinhAnh3]) VALUES (5, N'Samsung Galaxy A54', CAST(15000000 AS Decimal(18, 0)), CAST(N'2022-01-09T00:00:00.000' AS DateTime), N'Snapdragon 800', N'<div id ="CauHinh"></div>', 50, 2, 0, 0, 1, 0, 1, 3, 1, 0, N'Samsung Galaxy A54.jpg', N'Samsung Galaxy A54 5g tim.jpg', N'Samsung galaxy a54 5g xanh.jpg', N'Samsung Galaxy A54 5g tim.jpg')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [CauHinh], [MoTa], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLanMua], [Moi], [MANCC], [MANSX], [MaLoaiSP], [DaXoa], [HinhAnh], [HinhAnh1], [HinhAnh2], [HinhAnh3]) VALUES (6, N'HP Gaming Victus 16-s0078AX', CAST(20000000 AS Decimal(18, 0)), CAST(N'2023-02-08T00:00:00.000' AS DateTime), N'R5 5625U', N'<div id ="CauHinh"></div>', 100, 0, 0, 0, 0, 0, 2, 5, 2, 0, N'Laptop HP Envy x360 13-bf0092TU.jpg', N'638134647807708258_hp-240-g9-bac-3.jpg', N'638134647806964476_hp-240-g9-bac-2.jpg', N'638001594003000417_hp-240-g9-bac-3.jpg')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [CauHinh], [MoTa], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLanMua], [Moi], [MANCC], [MANSX], [MaLoaiSP], [DaXoa], [HinhAnh], [HinhAnh1], [HinhAnh2], [HinhAnh3]) VALUES (7, N'MSI Gaming GF63 Thin 11SC-664VN', CAST(15000000 AS Decimal(18, 0)), CAST(N'2021-12-15T00:00:00.000' AS DateTime), N'i5 11400H/8GB/512GB/15.6"FHD/GeForce GTX 1650 4GB/', N'<div id ="CauHinh"></div>', 200, NULL, NULL, NULL, NULL, NULL, 2, 6, 2, 0, N'MSI Gaming GF63 Thin 11SC-664VN.jpg', N'Msi Gaming gf63  hin 11 den 5.jpg', N'Msi Gaming Gf63 Thin 11 den.jpg', N'msi-gaming-gf63-thin-11-den-4.jpg')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [CauHinh], [MoTa], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLanMua], [Moi], [MANCC], [MANSX], [MaLoaiSP], [DaXoa], [HinhAnh], [HinhAnh1], [HinhAnh2], [HinhAnh3]) VALUES (8, N'Asus TUF Gaming FX506HC-HN144W', CAST(15000000 AS Decimal(18, 0)), CAST(N'2021-12-15T00:00:00.000' AS DateTime), N'i5 11400H/8GB/512GB/15.6"FHD/GeForce RTX 3050 4GB', N'<div id ="CauHinh"></div>', 200, NULL, NULL, NULL, NULL, NULL, 2, 2, 2, 0, N'Asus TUF Gaming FX506HC-HN144W.jpg', N'637850092510552100_asus-tuf-gaming-fx506h-den-2.jpg', N'637850092511020843_asus-tuf-gaming-fx506h-den-4.jpg', N'637850092510395816_asus-tuf-gaming-fx506h-den-3.jpg')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [CauHinh], [MoTa], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLanMua], [Moi], [MANCC], [MANSX], [MaLoaiSP], [DaXoa], [HinhAnh], [HinhAnh1], [HinhAnh2], [HinhAnh3]) VALUES (9, N'Acer Nitro 5 Gaming AN515-57-53F9 ', CAST(15000000 AS Decimal(18, 0)), CAST(N'2021-12-15T00:00:00.000' AS DateTime), N' i5 11400H/8GB/512GB/15.6"FHD/RTX3050 4GB', N'<div id ="CauHinh"></div>', 200, NULL, NULL, NULL, NULL, NULL, 2, 1, 2, 0, N'Acer Nitro 5 Gaming AN515-57-53F9.jpg', N'637610884164112997_acer-nitro-gaming-an515-57-den-2.jpg', N'637610884160675434_acer-nitro-gaming-an515-57-den-4.jpg', N'637610884159112874_acer-nitro-gaming-an515-57-den-3.jpg')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [CauHinh], [MoTa], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLanMua], [Moi], [MANCC], [MANSX], [MaLoaiSP], [DaXoa], [HinhAnh], [HinhAnh1], [HinhAnh2], [HinhAnh3]) VALUES (10, N'Asus TUF Gaming FX507ZC4-HN095W', CAST(15000000 AS Decimal(18, 0)), CAST(N'2021-12-15T00:00:00.000' AS DateTime), N'i5 12500H/16GB/512GB/15.6"/Nvidia RTX 3050 4GB', N'<div id ="CauHinh"></div>', 200, NULL, NULL, NULL, NULL, NULL, 2, 2, 2, 0, N'Asus TUF Gaming FX507ZC4-HN095W.jpg', N'637850092510552100_asus-tuf-gaming-fx506h-den-2.jpg', N'637850092511020843_asus-tuf-gaming-fx506h-den-4.jpg', N'637850092510395816_asus-tuf-gaming-fx506h-den-3.jpg')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [CauHinh], [MoTa], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLanMua], [Moi], [MANCC], [MANSX], [MaLoaiSP], [DaXoa], [HinhAnh], [HinhAnh1], [HinhAnh2], [HinhAnh3]) VALUES (11, N'Samsung Galaxy S22 5G', CAST(11900000 AS Decimal(18, 0)), CAST(N'2023-05-03T00:00:00.000' AS DateTime), N'Snapdragon 8 Gen 1', N'<div id ="CauHinh"></div>', 1000, NULL, NULL, NULL, NULL, 0, 1, 3, 1, 0, N'Samsung Galaxy S22.jpg', N'Samsung Galaxy s22 den.jpg', N'Samsung Galaxy s22 xanh.jpg', N'Samsung Galaxy s22 den.jpg')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [CauHinh], [MoTa], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLanMua], [Moi], [MANCC], [MANSX], [MaLoaiSP], [DaXoa], [HinhAnh], [HinhAnh1], [HinhAnh2], [HinhAnh3]) VALUES (12, N'Samsung Galaxy A34', CAST(73000000 AS Decimal(18, 0)), CAST(N'2023-10-12T00:00:00.000' AS DateTime), N'MediaTek Dimensity 1080', N'<div id ="CauHinh"></div>', 500, NULL, NULL, NULL, NULL, NULL, 1, 3, 1, 0, N'Samsung Galaxy A34.jpg', N'Samsung Galaxy a34 den.jpg', N'Samsung Galaxy a34 xanh.jpg', N'Samsung Galaxy a34 den.jpg')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [CauHinh], [MoTa], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLanMua], [Moi], [MANCC], [MANSX], [MaLoaiSP], [DaXoa], [HinhAnh], [HinhAnh1], [HinhAnh2], [HinhAnh3]) VALUES (13, N'Samsung Galaxy A14', CAST(36000000 AS Decimal(18, 0)), CAST(N'2022-12-12T00:00:00.000' AS DateTime), N'Exynos 850', N'<div id ="CauHinh"></div>', 100, NULL, NULL, NULL, NULL, NULL, 1, 3, 1, 0, N'Samsung Galaxy A14.jpg', N'Samsung Galaxy a14 4g den.jpg', N'Samsung Galaxy a14 4g bac.jpg', N'Samsung Galaxy a14 4g den.jpg')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [CauHinh], [MoTa], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLanMua], [Moi], [MANCC], [MANSX], [MaLoaiSP], [DaXoa], [HinhAnh], [HinhAnh1], [HinhAnh2], [HinhAnh3]) VALUES (14, N'IPhone 14 Plus', CAST(21290000 AS Decimal(18, 0)), CAST(N'2023-11-08T00:00:00.000' AS DateTime), N'Apple A15 Bionic', N'<div id ="CauHinh"></div>', 120, NULL, NULL, NULL, NULL, NULL, 1, 4, 1, 0, N'iPhone 14 Plus.jpg', N'Iphone 14 plus trang.jpg', N'Iphone 14 plus tim.jpg', N'Iphone 14 plus trang.jpg')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [CauHinh], [MoTa], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLanMua], [Moi], [MANCC], [MANSX], [MaLoaiSP], [DaXoa], [HinhAnh], [HinhAnh1], [HinhAnh2], [HinhAnh3]) VALUES (15, N'IPhone 13', CAST(16390000 AS Decimal(18, 0)), CAST(N'2021-09-08T00:00:00.000' AS DateTime), N'Apple A14 Bionic', N'<div id ="CauHinh"></div>', 200, NULL, NULL, NULL, NULL, NULL, 2, 4, 1, 0, N'iPhone 13.jpg', N'Iphone 13 den.jpg', N'Iphone 13 hong.jpg', N'Iphone 13 den.jpg')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [CauHinh], [MoTa], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLanMua], [Moi], [MANCC], [MANSX], [MaLoaiSP], [DaXoa], [HinhAnh], [HinhAnh1], [HinhAnh2], [HinhAnh3]) VALUES (16, N'Gigabyte Gaming G5 MF-F2VN313SH', CAST(21000000 AS Decimal(18, 0)), CAST(N'2023-09-08T00:00:00.000' AS DateTime), N'i5 12450H/16GB/512GB/15.6"FHD/Geforce RTX4050 6GB', N'<div id ="CauHinh"></div>', 100, NULL, NULL, NULL, NULL, NULL, 1, 7, 2, 0, N'Gigabyte Gaming G5 MF-F2VN313SH.jpg', N'638188828260891148_gigabyte-gaming-g5-kf-e3vn313sh-i5-12500h-den-4.jpg', N'638188828261679579_gigabyte-gaming-g5-kf-e3vn313sh-i5-12500h-den-2.jpg', N'638188828261367028_gigabyte-gaming-g5-kf-e3vn313sh-i5-12500h-den-1.jpg')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [CauHinh], [MoTa], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLanMua], [Moi], [MANCC], [MANSX], [MaLoaiSP], [DaXoa], [HinhAnh], [HinhAnh1], [HinhAnh2], [HinhAnh3]) VALUES (17, N'Asus Gaming ROG Strix G533ZS-LN036W', CAST(50000000 AS Decimal(18, 0)), CAST(N'2022-12-04T00:00:00.000' AS DateTime), N'i7 12450H/16GB/512GB/15.6"FHD/Geforce RTX4050 6GB', N'<div id ="CauHinh"></div>', 2000, NULL, NULL, NULL, NULL, NULL, 2, 2, 2, 0, N'Asus Gaming ROG Strix G533ZS-LN036W.jpg', N'637850092510552100_asus-tuf-gaming-fx506h-den-2.jpg', N'637850092511020843_asus-tuf-gaming-fx506h-den-4.jpg', N'637850092510395816_asus-tuf-gaming-fx506h-den-3.jpg')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [CauHinh], [MoTa], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLanMua], [Moi], [MANCC], [MANSX], [MaLoaiSP], [DaXoa], [HinhAnh], [HinhAnh1], [HinhAnh2], [HinhAnh3]) VALUES (18, N'Lenovo Gaming Legion 5 15ARH7H', CAST(31200000 AS Decimal(18, 0)), CAST(N'2023-08-07T00:00:00.000' AS DateTime), N'i7 12450H/16GB/512GB/15.6"FHD/Geforce RTX4050 6GB', N'<div id ="CauHinh"></div>', 100, NULL, NULL, NULL, NULL, NULL, 1, 8, 2, 0, N'Lenovo Gaming Legion 5 15ARH7H.jpg', N'637850092510552100_asus-tuf-gaming-fx506h-den-2.jpg', N'638188828261679579_gigabyte-gaming-g5-kf-e3vn313sh-i5-12500h-den-2.jpg', N'msi-gaming-gf63-thin-11-den-4.jpg')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [CauHinh], [MoTa], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLanMua], [Moi], [MANCC], [MANSX], [MaLoaiSP], [DaXoa], [HinhAnh], [HinhAnh1], [HinhAnh2], [HinhAnh3]) VALUES (19, N' MSI Creator M16 B13VE-830VN', CAST(45000000 AS Decimal(18, 0)), CAST(N'2023-08-09T00:00:00.000' AS DateTime), N'i9 11450H/16GB/512GB/15.6"FHD/Geforce RTX4050 6GB', N'<div id ="CauHinh"></div>', 100, NULL, NULL, NULL, NULL, NULL, 1, 6, 2, 0, N'MSI Creator M16 B13VE-830VN.jpg', N'Msi Gaming gf63  hin 11 den 5.jpg', N'Msi Gaming Gf63 Thin 11 den.jpg', N'msi-gaming-gf63-thin-11-den-4.jpg')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [CauHinh], [MoTa], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLanMua], [Moi], [MANCC], [MANSX], [MaLoaiSP], [DaXoa], [HinhAnh], [HinhAnh1], [HinhAnh2], [HinhAnh3]) VALUES (20, N'MSI Gaming Raider GE68HX 13VF-050VN', CAST(65300000 AS Decimal(18, 0)), CAST(N'2022-12-12T00:00:00.000' AS DateTime), N'i9 12450H/16GB/512GB/15.6"FHD/Geforce RTX4050 6GB', N'<div id ="CauHinh"></div>', 200, NULL, NULL, NULL, NULL, NULL, 1, 6, 2, 0, N'MSI Gaming Raider GE68HX 13VF-050VN.jpg', N'Msi Gaming gf63  hin 11 den 5.jpg', N'Msi Gaming Gf63 Thin 11 den.jpg', N'msi-gaming-gf63-thin-11-den-4.jpg')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [CauHinh], [MoTa], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLanMua], [Moi], [MANCC], [MANSX], [MaLoaiSP], [DaXoa], [HinhAnh], [HinhAnh1], [HinhAnh2], [HinhAnh3]) VALUES (21, N'Xiaomi C51', CAST(65300000 AS Decimal(18, 0)), CAST(N'2023-04-04T00:00:00.000' AS DateTime), N'Snapdragon 888', N'<div id ="CauHinh"></div>', 500, NULL, NULL, NULL, NULL, NULL, 2, 9, 1, 0, N'Realme C51.jpg', N'Realme c51 den.jpg', N'Realme c51 xanh.jpg', N'Realme c51 den.jpg')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [CauHinh], [MoTa], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLanMua], [Moi], [MANCC], [MANSX], [MaLoaiSP], [DaXoa], [HinhAnh], [HinhAnh1], [HinhAnh2], [HinhAnh3]) VALUES (22, N'Xiaomi 11 4g', CAST(89540000 AS Decimal(18, 0)), CAST(N'2022-11-12T00:00:00.000' AS DateTime), N'Snapdragon 870', N'<div id ="CauHinh"></div>', 200, NULL, NULL, NULL, NULL, NULL, 2, 9, 1, 0, N'Realme 11 4g.jpg', N'Realme 11 4g den.jpg', N'Realme 11 4g vang.jpg', N'Realme 11 4g den.jpg')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [CauHinh], [MoTa], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLanMua], [Moi], [MANCC], [MANSX], [MaLoaiSP], [DaXoa], [HinhAnh], [HinhAnh1], [HinhAnh2], [HinhAnh3]) VALUES (23, N'Xiaomi11 Pro', CAST(99900000 AS Decimal(18, 0)), CAST(N'2023-02-04T00:00:00.000' AS DateTime), N'Snapdragon 865', N'<div id ="CauHinh"></div>', 100, NULL, NULL, NULL, NULL, NULL, 1, 9, 1, 0, N'Realme 11 Pro.jpg', N'Realme 11 pro 5g vang.jpg', N'Realme 11 pro 5g xanh.jpg', N'Realme 11 pro 5g vang.jpg')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [CauHinh], [MoTa], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLanMua], [Moi], [MANCC], [MANSX], [MaLoaiSP], [DaXoa], [HinhAnh], [HinhAnh1], [HinhAnh2], [HinhAnh3]) VALUES (24, N'Xiaomi C30', CAST(29000000 AS Decimal(18, 0)), CAST(N'2022-11-12T00:00:00.000' AS DateTime), N'Snapdragon 765', N'<div id ="CauHinh"></div>', 20, NULL, NULL, NULL, NULL, NULL, 2, 9, 1, 0, N'Realme C30.jpg', N'Realme c30s den.jpg', N'Realme c30s xanh.jpg', N'Realme c30s den.jpg')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [CauHinh], [MoTa], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLanMua], [Moi], [MANCC], [MANSX], [MaLoaiSP], [DaXoa], [HinhAnh], [HinhAnh1], [HinhAnh2], [HinhAnh3]) VALUES (25, N'Xiaomi C55', CAST(35000000 AS Decimal(18, 0)), CAST(N'2023-11-08T00:00:00.000' AS DateTime), N'Snapdragon 780', N'<div id ="CauHinh"></div>', 10, NULL, NULL, NULL, NULL, NULL, 1, 9, 1, 0, N'Realme C55.jpg', N'638150124687384654_realme-c55-vang-5.jpg', N'638150124686957517_realme-c55-den-5.jpg', N'638141305318292996_realme-c55-vang-1.jpg')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [CauHinh], [MoTa], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLanMua], [Moi], [MANCC], [MANSX], [MaLoaiSP], [DaXoa], [HinhAnh], [HinhAnh1], [HinhAnh2], [HinhAnh3]) VALUES (27, N'Asus Rog Phone 7', CAST(1700000 AS Decimal(18, 0)), CAST(N'2022-11-12T00:00:00.000' AS DateTime), N'Snapdragon 8 Gen 2', N'<div id ="CauHinh"></div>', 100, NULL, NULL, NULL, NULL, NULL, 2, 2, 1, 0, N'Asus Rog Phone 7.jpg', N'Asus rog phone 7 den.jpg', N'Asus rog phone 7 trang.jpg', N'Asus rog phone 7 den.jpg')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [CauHinh], [MoTa], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLanMua], [Moi], [MANCC], [MANSX], [MaLoaiSP], [DaXoa], [HinhAnh], [HinhAnh1], [HinhAnh2], [HinhAnh3]) VALUES (29, N'Samsung Galaxy A05s ', CAST(3990000 AS Decimal(18, 0)), CAST(N'2023-01-01T00:00:00.000' AS DateTime), N'Snapdragon 8 Gen 1', N'<div id ="CauHinh"></div>', 100, NULL, NULL, NULL, NULL, NULL, 2, 3, 1, 0, N'638336513272222519_samsung-galaxy-a05s-bac-dd.jpg', N'638320083059614200_samsung-galaxy-a05-bac-2.jpg', N'638320083060239206_samsung-galaxy-a05-xanh-3.jpg', N'638320083063534028_samsung-galaxy-a05-den-4.jpg')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [CauHinh], [MoTa], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLanMua], [Moi], [MANCC], [MANSX], [MaLoaiSP], [DaXoa], [HinhAnh], [HinhAnh1], [HinhAnh2], [HinhAnh3]) VALUES (31, N'Samsung Galaxy Z Fold4 5G ', CAST(21990000 AS Decimal(18, 0)), CAST(N'2023-11-01T00:00:00.000' AS DateTime), N'Snapdragon 865', N'<div id ="CauHinh"></div>', 100, NULL, NULL, NULL, NULL, NULL, 2, 3, 1, 0, N'638336510902563886_samsung-galaxy-z-fold4-do-dd.jpg', N'637957717267975494_samsung-galaxy-z-fold4-xanh-1.jpg', N'637957721237564298_samsung-galaxy-z-fold4-kem-1.jpg', N'638167221773541058_samsung-galaxy-z-fold4-do-1.jpg')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [CauHinh], [MoTa], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLanMua], [Moi], [MANCC], [MANSX], [MaLoaiSP], [DaXoa], [HinhAnh], [HinhAnh1], [HinhAnh2], [HinhAnh3]) VALUES (34, N'Samsung Galaxy Z Flip4 5G', CAST(12990000 AS Decimal(18, 0)), CAST(N'2023-01-01T00:00:00.000' AS DateTime), N'Snapdragon 855', N'<div id ="CauHinh"></div>', 100, NULL, NULL, NULL, NULL, NULL, 2, 3, 1, 0, N'638131739579610504_samsung-galaxy-z-flip4-tim-dd-tragop.jpg', N'637957658354316100_samsung-galaxy-z-flip4-tim-1.jpg', N'637957685772850661_samsung-galaxy-z-flip4-vang-1.jpg', N'637957695058070860_samsung-galaxy-z-flip4-xanh-1.jpg')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [CauHinh], [MoTa], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLanMua], [Moi], [MANCC], [MANSX], [MaLoaiSP], [DaXoa], [HinhAnh], [HinhAnh1], [HinhAnh2], [HinhAnh3]) VALUES (36, N'Samsung Galaxy S23 5G', CAST(24990000 AS Decimal(18, 0)), CAST(N'2023-01-01T00:00:00.000' AS DateTime), N'Snapdragon 765', N'<div id ="CauHinh"></div>', 100, NULL, NULL, NULL, NULL, NULL, 2, 3, 1, 0, N'638182973204556611_samsung-galaxy-s23-vang-dd-tragop.jpg', N'638108921261470112_samsung-galaxy-s23-plus-den-1.jpg', N'638108928863476807_samsung-galaxy-s23-plus-kem-1.jpg', N'638108928864459862_samsung-galaxy-s23-plus-xanh-1.jpg')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [CauHinh], [MoTa], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLanMua], [Moi], [MANCC], [MANSX], [MaLoaiSP], [DaXoa], [HinhAnh], [HinhAnh1], [HinhAnh2], [HinhAnh3]) VALUES (37, N'Samsung Galaxy Z Fold5 5G', CAST(36990000 AS Decimal(18, 0)), CAST(N'2023-11-01T00:00:00.000' AS DateTime), N'Snapdragon 8 Gen 1', N'<div id ="CauHinh"></div>', 100, NULL, NULL, NULL, NULL, NULL, 2, 3, 1, 0, N'638288178411574751_samsung-galaxy-fold5-xanh-dd-tragop.jpg', N'637957717267975494_samsung-galaxy-z-fold4-xanh-1.jpg', N'637957721237564298_samsung-galaxy-z-fold4-kem-1.jpg', N'638167221773541058_samsung-galaxy-z-fold4-do-1.jpg')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [CauHinh], [MoTa], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLanMua], [Moi], [MANCC], [MANSX], [MaLoaiSP], [DaXoa], [HinhAnh], [HinhAnh1], [HinhAnh2], [HinhAnh3]) VALUES (38, N'Samsung Galaxy S23 Plus 5G', CAST(26990000 AS Decimal(18, 0)), CAST(N'2023-11-01T00:00:00.000' AS DateTime), N'Snapdragon 8 Gen 2', N'<div id ="CauHinh"></div>', 100, NULL, NULL, NULL, NULL, NULL, 2, 3, 1, 0, N'638182970630939004_samsung-galaxy-s23-plus-tim-dd-tragop.jpg', N'638108921261470112_samsung-galaxy-s23-plus-den-1.jpg', N'638108928863476807_samsung-galaxy-s23-plus-kem-1.jpg', N'638108928864459862_samsung-galaxy-s23-plus-xanh-1.jpg')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [CauHinh], [MoTa], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLanMua], [Moi], [MANCC], [MANSX], [MaLoaiSP], [DaXoa], [HinhAnh], [HinhAnh1], [HinhAnh2], [HinhAnh3]) VALUES (39, N'Samsung Galaxy Z Flip4 5G Bespoke Edition', CAST(15990000 AS Decimal(18, 0)), CAST(N'2023-11-01T00:00:00.000' AS DateTime), N'Snapdragon 8 Gen 1', N'<div id ="CauHinh"></div>', 100, NULL, NULL, NULL, NULL, NULL, 2, 3, 1, 0, N'638167465484591506_samsung-galaxy-z-flip4-xanh-dd.jpg', N'638167457680102931_samsung-galaxy-z-flip4-xanh-1.jpg', N'638167457680001485_samsung-galaxy-z-flip4-xanh-2.jpg', N'638167457679900746_samsung-galaxy-z-flip4-xanh-3.jpg')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [CauHinh], [MoTa], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLanMua], [Moi], [MANCC], [MANSX], [MaLoaiSP], [DaXoa], [HinhAnh], [HinhAnh1], [HinhAnh2], [HinhAnh3]) VALUES (40, N'Samsung Galaxy Z Flip5 5G ', CAST(21990000 AS Decimal(18, 0)), CAST(N'2023-01-01T00:00:00.000' AS DateTime), N'Snapdragon 8 Gen 1', N'<div id ="CauHinh"></div>', 100, NULL, NULL, NULL, NULL, NULL, 2, 3, 1, 0, N'638288178412655978_samsung-galaxy-z-flip5-xanh-dd-tragop.jpg', N'638259894331140188_samsung-galaxy-z-flip5-vang-2.jpg', N'638271949124450821_samsung-galaxy-z-flip5-tim-2.jpg', N'638271957052937345_samsung-galaxy-z-flip5-xanh-2.jpg')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [CauHinh], [MoTa], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLanMua], [Moi], [MANCC], [MANSX], [MaLoaiSP], [DaXoa], [HinhAnh], [HinhAnh1], [HinhAnh2], [HinhAnh3]) VALUES (41, N'Samsung Galaxy A05', CAST(3090000 AS Decimal(18, 0)), CAST(N'2023-11-01T00:00:00.000' AS DateTime), N'Snapdragon 8 Gen 2', N'<div id ="CauHinh"></div>', 100, NULL, NULL, NULL, NULL, NULL, 2, 3, 1, 0, N'638320081768382285_samsung-galaxy-a05-dd-moi.jpg', N'638320088629844543_samsung-galaxy-a05s-bac-2.jpg', N'638320089647880796_samsung-galaxy-a05s-den-2.jpg', N'638320090553138430_samsung-galaxy-a05s-xanh-2.jpg')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [CauHinh], [MoTa], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLanMua], [Moi], [MANCC], [MANSX], [MaLoaiSP], [DaXoa], [HinhAnh], [HinhAnh1], [HinhAnh2], [HinhAnh3]) VALUES (42, N'Samsung Galaxy M34 5G ', CAST(7690000 AS Decimal(18, 0)), CAST(N'2023-11-01T00:00:00.000' AS DateTime), N'Snapdragon 787', N'<div id ="CauHinh"></div>', 100, NULL, NULL, NULL, NULL, NULL, 2, 3, 1, 0, N'638309118225649175_samsung-galaxy-m34-5g-dd-moi.jpg', N'638308848064182529_samsung-galaxy-m34-5g-xanh-4.jpg', N'638308852223855535_samsung-galaxy-m34-5g-xanhden-1.jpg', N'638308848064182529_samsung-galaxy-m34-5g-xanh-4.jpg')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [CauHinh], [MoTa], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLanMua], [Moi], [MANCC], [MANSX], [MaLoaiSP], [DaXoa], [HinhAnh], [HinhAnh1], [HinhAnh2], [HinhAnh3]) VALUES (43, N'Samsung Galaxy A04', CAST(2390000 AS Decimal(18, 0)), CAST(N'2023-01-01T00:00:00.000' AS DateTime), N'Snapdragon 655', N'<div id ="CauHinh"></div>', 100, NULL, NULL, NULL, NULL, NULL, 2, 3, 1, 0, N'638204396768989147_samsung-galaxy-a04-dd.jpg', N'638204396769573258_samsung-galaxy-a04-den-3.jpg', N'638204396770676643_samsung-galaxy-a04-cam-3.jpg', N'638204396773490668_samsung-galaxy-a04-xanh-5.jpg')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [CauHinh], [MoTa], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLanMua], [Moi], [MANCC], [MANSX], [MaLoaiSP], [DaXoa], [HinhAnh], [HinhAnh1], [HinhAnh2], [HinhAnh3]) VALUES (44, N'Samsung Galaxy A53 5G ', CAST(7990000 AS Decimal(18, 0)), CAST(N'2023-01-01T00:00:00.000' AS DateTime), N'Snapdragon 865', N'<div id ="CauHinh"></div>', 100, NULL, NULL, NULL, NULL, NULL, 2, 3, 1, 0, N'637990012849243485_samsung-galaxy-a53-xanh-dd-docquyen.jpg', N'637824382369440628_samsung-galaxy-a53-cam-2.jpg', N'637825310288115049_samsung-galaxy-a53-den-4.jpg', N'637831411395902690_samsung-galaxy-a53-xanh-1.jpg')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [CauHinh], [MoTa], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLanMua], [Moi], [MANCC], [MANSX], [MaLoaiSP], [DaXoa], [HinhAnh], [HinhAnh1], [HinhAnh2], [HinhAnh3]) VALUES (46, N'Samsung Galaxy A04s', CAST(3290000 AS Decimal(18, 0)), CAST(N'2023-01-01T00:00:00.000' AS DateTime), N'Snapdragon 4 Gen 1', N'<div id ="CauHinh"></div>', 100, NULL, NULL, NULL, NULL, NULL, 2, 3, 1, 0, N'638204396768989147_samsung-galaxy-a04-dd.jpg', N'638204394273382414_samsung-galaxy-a04s-den-4.jpg', N'638204394274328482_samsung-galaxy-a04s-xanh-2.jpg', N'638204394274484741_samsung-galaxy-a04s-nau-1.jpg')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [CauHinh], [MoTa], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLanMua], [Moi], [MANCC], [MANSX], [MaLoaiSP], [DaXoa], [HinhAnh], [HinhAnh1], [HinhAnh2], [HinhAnh3]) VALUES (67, N'Xiaomi Redmi 13C 6GB-128GB', CAST(3290000 AS Decimal(18, 0)), CAST(N'2023-11-26T00:00:00.000' AS DateTime), N'<ul>
<li data-info="M&agrave;n h&igrave;nh">
<p>6.74 inch, IPS LCD, HD+, 720 x 1600 Pixels</p>
</li>
<li data-info="Camera sau">
<p>50.0 MP + 2.0 MP</p>
</li>
<li data-info="Camera Selfie">
<p>8.0 MP</p>
</li>
<li data-info="CPU">
<p>Helio G85</p>
</li>
<li data-info="Bộ nhớ trong">
<p>128 GB</p>
</li>
</ul>', NULL, 100, 10, 0, 0, 0, 100, 1, 9, 1, 0, N'638350317315831967_realme-13c-dd-bh-18-thang.jpg', N'638349478237981356_realme-13c-xanh-5.jpg', N'638349481897106744_realme-13c-xanh-la-5.jpg', N'638349482643770648_realme-13c-den-5.jpg')
SET IDENTITY_INSERT [dbo].[SanPham] OFF
GO
SET IDENTITY_INSERT [dbo].[ThanhVien] ON 

INSERT [dbo].[ThanhVien] ([MaTV], [TaiKhoan], [MatKhau], [HoTen], [DiaChi], [Email], [SoDienThoai], [CauHoi], [CauTraLoi], [MaLoaiTV]) VALUES (16, N'quanlysanpham', N'$2a$11$jy3JelECAgn4gEhS453u6ewZIhyBgUEtK2QxAuSPugLu6FLZb090C', N'Phan Tấn Phúc', N'12/275 Nguyễn Du TP Tuy Hòa ', N'phuc35103@gamil.com', N'0987845632', NULL, NULL, 2)
INSERT [dbo].[ThanhVien] ([MaTV], [TaiKhoan], [MatKhau], [HoTen], [DiaChi], [Email], [SoDienThoai], [CauHoi], [CauTraLoi], [MaLoaiTV]) VALUES (17, N'admin', N'$2a$11$aAgodMCYMLZXrI8mc89YDuCr3UYX6Vw7HeSyLWVoc.aQA6LFQU4OG', N'Phúc Tấn Phan', N'Phường 9 Tuy Hòa', N'phantanphuc@gmail.com', N'0333945872', NULL, NULL, 1)
INSERT [dbo].[ThanhVien] ([MaTV], [TaiKhoan], [MatKhau], [HoTen], [DiaChi], [Email], [SoDienThoai], [CauHoi], [CauTraLoi], [MaLoaiTV]) VALUES (18, N'quanlydonhang', N'$2a$11$nirMUecWktYjH3woqS.aZe00Jurs1u3SlkM5iUcNQ1FMLbxs5kFB2', N'Võ Xuân Tuấn', N'Phường 9 Tuy Hòa', N'voxuantuan@gmail.com', N'0333945872', NULL, NULL, 3)
INSERT [dbo].[ThanhVien] ([MaTV], [TaiKhoan], [MatKhau], [HoTen], [DiaChi], [Email], [SoDienThoai], [CauHoi], [CauTraLoi], [MaLoaiTV]) VALUES (19, N'phanquyen', N'$2a$11$FrYUiCZ5Max1JxJUZgwC4uJoFPwO4PAVJdsKW76itdjMhffgfkslq', N'Võ Xuân Tuấn', N'Phường 9 Tuy Hòa', N'voxuantuan@gmail.com', N'0333945872', NULL, NULL, 4)
INSERT [dbo].[ThanhVien] ([MaTV], [TaiKhoan], [MatKhau], [HoTen], [DiaChi], [Email], [SoDienThoai], [CauHoi], [CauTraLoi], [MaLoaiTV]) VALUES (20, N'tintuc', N'$2a$11$zM11niIlIYly7l.v.Rm.5.wjE96ew3egDaaR31jhH.U4TOdqLeMUy', N'Võ Xuân Bảo', N'Phường 9 Tuy Hòa', N'voxuantuan@gmail.com', N'0333945872', NULL, NULL, 6)
INSERT [dbo].[ThanhVien] ([MaTV], [TaiKhoan], [MatKhau], [HoTen], [DiaChi], [Email], [SoDienThoai], [CauHoi], [CauTraLoi], [MaLoaiTV]) VALUES (21, N'khachhang1', N'$2a$11$NcU88wJ9ZVZVlMAZoS8Oiuoetled0UY7PV2vv0JdBU3TwkEPxKPDq', N'Phan Tấn Cường', N'Phường 9 Tuy Hòa', N'Tancuong@gmail.com', N'0333945872', NULL, NULL, 5)
INSERT [dbo].[ThanhVien] ([MaTV], [TaiKhoan], [MatKhau], [HoTen], [DiaChi], [Email], [SoDienThoai], [CauHoi], [CauTraLoi], [MaLoaiTV]) VALUES (22, N'nhanvien2', N'$2a$11$LJpW0vtZdc1Nopm5TkMbp.WOTmRqESVgyaM7TCT5IVptM6SPDehf6', N'Võ Xuân Nghĩa', N'Phường 9 Tuy Hòa', N'voxuannghia@gmail.com', N'0333945872', NULL, NULL, 5)
INSERT [dbo].[ThanhVien] ([MaTV], [TaiKhoan], [MatKhau], [HoTen], [DiaChi], [Email], [SoDienThoai], [CauHoi], [CauTraLoi], [MaLoaiTV]) VALUES (25, N'khachhang4', N'$2a$11$hvQIb1D9opa9utnxLAr0vOo/Zrxvx4XY332SyiW4QsZz2xc.FfNnu', N'Võ Xuân Hậu', N'Phường 9 Tuy Hòa', N'voxuantuan@gmail.com', N'0333945872', NULL, NULL, 5)
INSERT [dbo].[ThanhVien] ([MaTV], [TaiKhoan], [MatKhau], [HoTen], [DiaChi], [Email], [SoDienThoai], [CauHoi], [CauTraLoi], [MaLoaiTV]) VALUES (26, N'khachhang5', N'$2a$11$p8r0plq8hrpuxWDHa9hmAunJOJvMsHjgnELubOQwqKOEzN9X8BEyK', N'Võ Xuân Phương', N'Phường 9 Tuy Hòa', N'voxuantuan@gmail.com', N'0333945872', NULL, NULL, 5)
INSERT [dbo].[ThanhVien] ([MaTV], [TaiKhoan], [MatKhau], [HoTen], [DiaChi], [Email], [SoDienThoai], [CauHoi], [CauTraLoi], [MaLoaiTV]) VALUES (27, N'khachhang6', N'$2a$11$ssuebgq5IjBOLZ0IGrHtc.ik/mmYDT0lFsUYBfV8axMYjxco.CPEy', N'Võ Xuân Bảo ', N'Phường 9 Tuy Hòa', N'voxuantuan@gmail.com', N'0333945872', NULL, NULL, 5)
SET IDENTITY_INSERT [dbo].[ThanhVien] OFF
GO
SET IDENTITY_INSERT [dbo].[TinTuc] ON 

INSERT [dbo].[TinTuc] ([MaTin], [HinhBia], [TieuDe], [NoiDung], [NgayDang]) VALUES (2, N'1-thong-tin-tong-hop-ve-iphone-15-pro-max.jpg', N'Thông tin tổng hợp về iPhone 15 Pro Max với nhiều cải tiến đáng mong đợi', N'<p>Theo dự đo&aacute;n Apple sẽ tr&igrave;nh l&agrave;ng iPhone 15 Series v&agrave;o khoảng cuối năm 2023. Si&ecirc;u phẩm cao cấp&nbsp;<a href="https://dienmaycholon.vn/dien-thoai-di-dong/iphone-15-pro-max-256gb-titan-tu-nhien" target="_blank" rel="noopener">iPhone 15 Pro Max 256GB titan tự nhi&ecirc;n</a> trở th&agrave;nh mối quan t&acirc;m v&agrave; t&igrave;m kiếm của người d&ugrave;ng to&agrave;n thế giới. Mỗi lần Apple ra mắt sản phẩm mới đều khiến người d&ugrave;ng kh&ocirc;ng khỏi trầm trồ v&agrave; kinh ngạc về những trang bị v&agrave; t&iacute;nh năng m&agrave; h&atilde;ng mang đến tr&ecirc;n chiếc điện thoại của m&igrave;nh. B&agrave;i viết dưới đ&acirc;y sẽ gi&uacute;p bạn tổng hợp về điện thoại&nbsp;iPhone 15 Pro Max để xem si&ecirc;u phẩm n&agrave;y được dự kiến sẽ mang đến những cải tiến mới n&agrave;o.</p>', CAST(N'2024-01-09T00:00:00.000' AS DateTime))
INSERT [dbo].[TinTuc] ([MaTin], [HinhBia], [TieuDe], [NoiDung], [NgayDang]) VALUES (8, N'iphone-15-pro-max-co-khung-vien-lam-tu-hop-kim-titan.jpg', N'Thời gian ra mắt iPhone 15 Pro Max', N'<p>sdfsdfsd</p>', CAST(N'2024-01-19T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[TinTuc] OFF
GO
ALTER TABLE [dbo].[BinhLuan]  WITH CHECK ADD  CONSTRAINT [FK_BinhLuan_SanPham] FOREIGN KEY([MaSP])
REFERENCES [dbo].[SanPham] ([MaSP])
GO
ALTER TABLE [dbo].[BinhLuan] CHECK CONSTRAINT [FK_BinhLuan_SanPham]
GO
ALTER TABLE [dbo].[BinhLuan]  WITH CHECK ADD  CONSTRAINT [FK_BinhLuan_ThanhVien] FOREIGN KEY([MaTV])
REFERENCES [dbo].[ThanhVien] ([MaTV])
GO
ALTER TABLE [dbo].[BinhLuan] CHECK CONSTRAINT [FK_BinhLuan_ThanhVien]
GO
ALTER TABLE [dbo].[ChiTietDonDatHang]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietDonDatHang_DonDatHang] FOREIGN KEY([MaDDH])
REFERENCES [dbo].[DonDatHang] ([MaDDH])
GO
ALTER TABLE [dbo].[ChiTietDonDatHang] CHECK CONSTRAINT [FK_ChiTietDonDatHang_DonDatHang]
GO
ALTER TABLE [dbo].[ChiTietDonDatHang]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietDonDatHang_SanPham] FOREIGN KEY([MaSP])
REFERENCES [dbo].[SanPham] ([MaSP])
GO
ALTER TABLE [dbo].[ChiTietDonDatHang] CHECK CONSTRAINT [FK_ChiTietDonDatHang_SanPham]
GO
ALTER TABLE [dbo].[ChiTietPhieuNhap]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietPhieuNhap_PhieuNhap] FOREIGN KEY([MaPN])
REFERENCES [dbo].[PhieuNhap] ([MaPN])
GO
ALTER TABLE [dbo].[ChiTietPhieuNhap] CHECK CONSTRAINT [FK_ChiTietPhieuNhap_PhieuNhap]
GO
ALTER TABLE [dbo].[ChiTietPhieuNhap]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietPhieuNhap_SanPham] FOREIGN KEY([MaSP])
REFERENCES [dbo].[SanPham] ([MaSP])
GO
ALTER TABLE [dbo].[ChiTietPhieuNhap] CHECK CONSTRAINT [FK_ChiTietPhieuNhap_SanPham]
GO
ALTER TABLE [dbo].[DonDatHang]  WITH CHECK ADD  CONSTRAINT [FK_DonDatHang_KhachHang] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhachHang] ([MaKH])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DonDatHang] CHECK CONSTRAINT [FK_DonDatHang_KhachHang]
GO
ALTER TABLE [dbo].[KhachHang]  WITH CHECK ADD  CONSTRAINT [FK_KhachHang_ThanhVien] FOREIGN KEY([MaTV])
REFERENCES [dbo].[ThanhVien] ([MaTV])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[KhachHang] CHECK CONSTRAINT [FK_KhachHang_ThanhVien]
GO
ALTER TABLE [dbo].[LoaiThanhVien_Quyen]  WITH CHECK ADD  CONSTRAINT [FK_LoaiThanhVien_Quyen_LoaiThanhVien] FOREIGN KEY([MaLoaiTV])
REFERENCES [dbo].[LoaiThanhVien] ([MaLoaiTV])
GO
ALTER TABLE [dbo].[LoaiThanhVien_Quyen] CHECK CONSTRAINT [FK_LoaiThanhVien_Quyen_LoaiThanhVien]
GO
ALTER TABLE [dbo].[LoaiThanhVien_Quyen]  WITH CHECK ADD  CONSTRAINT [FK_LoaiThanhVien_Quyen_Quyen] FOREIGN KEY([MaQuyen])
REFERENCES [dbo].[Quyen] ([MaQuyen])
GO
ALTER TABLE [dbo].[LoaiThanhVien_Quyen] CHECK CONSTRAINT [FK_LoaiThanhVien_Quyen_Quyen]
GO
ALTER TABLE [dbo].[PhieuNhap]  WITH CHECK ADD  CONSTRAINT [FK_PhieuNhap_NhaCungCap] FOREIGN KEY([MaNCC])
REFERENCES [dbo].[NhaCungCap] ([MaNCC])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PhieuNhap] CHECK CONSTRAINT [FK_PhieuNhap_NhaCungCap]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_LoaiSanPham] FOREIGN KEY([MaLoaiSP])
REFERENCES [dbo].[LoaiSanPham] ([MaLoaiSP])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SanPham_LoaiSanPham]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_NhaCungCap] FOREIGN KEY([MANCC])
REFERENCES [dbo].[NhaCungCap] ([MaNCC])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SanPham_NhaCungCap]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_NhaSanXuat] FOREIGN KEY([MANSX])
REFERENCES [dbo].[NhaSanXuat] ([MaNSX])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SanPham_NhaSanXuat]
GO
ALTER TABLE [dbo].[ThanhVien]  WITH CHECK ADD  CONSTRAINT [FK_ThanhVien_LoaiThanhVien] FOREIGN KEY([MaLoaiTV])
REFERENCES [dbo].[LoaiThanhVien] ([MaLoaiTV])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ThanhVien] CHECK CONSTRAINT [FK_ThanhVien_LoaiThanhVien]
GO
