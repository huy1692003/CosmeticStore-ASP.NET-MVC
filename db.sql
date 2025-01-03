USE [master]
GO
/****** Object:  Database [THNN]    Script Date: 23/12/2024 19:51:11 ******/
CREATE DATABASE [THNN]
GO
USE [THNN]
GO
/****** Object:  Table [dbo].[CTKM]    Script Date: 23/12/2024 19:51:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CTKM](
	[MaCTKM] [nvarchar](10) NOT NULL,
	[TenCTKM] [nvarchar](255) NULL,
	[NgayBatDau] [datetime] NULL,
	[NgayKetThuc] [datetime] NULL,
	[Discount] [float] NULL,
 CONSTRAINT [PK_CTKM] PRIMARY KEY CLUSTERED 
(
	[MaCTKM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiNhanh]    Script Date: 23/12/2024 19:51:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiNhanh](
	[MaChiNhanh] [nvarchar](10) NOT NULL,
	[TenChiNhanh] [nvarchar](255) NULL,
	[DiaChi] [nvarchar](255) NULL,
	[ThanhPho] [nvarchar](255) NULL,
	[QuanHuyen] [nvarchar](255) NULL,
	[SDT] [nvarchar](max) NULL,
	[HinhAnh] [nvarchar](max) NULL,
 CONSTRAINT [PK_ChiNhanh] PRIMARY KEY CLUSTERED 
(
	[MaChiNhanh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTietDonHang]    Script Date: 23/12/2024 19:51:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietDonHang](
	[MaDH] [nvarchar](20) NOT NULL,
	[MaSanPham] [nvarchar](10) NULL,
	[SoLuongSanPham] [int] NULL,
	[TongTien] [float] NULL,
	[MaChiNhanh] [nvarchar](10) NULL,
	[GiaSP] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTietDonHangNhap]    Script Date: 23/12/2024 19:51:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietDonHangNhap](
	[MaDN] [nvarchar](20) NOT NULL,
	[MaSP] [nvarchar](10) NOT NULL,
	[SoLuong] [int] NULL,
	[TongTien] [float] NULL,
	[MaChiNhanh] [nvarchar](10) NULL,
	[LoaiSP] [int] NULL,
 CONSTRAINT [PK_ChiTietDonHangNhap] PRIMARY KEY CLUSTERED 
(
	[MaDN] ASC,
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DanhMuc]    Script Date: 23/12/2024 19:51:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DanhMuc](
	[MaDanhMuc] [nvarchar](10) NOT NULL,
	[TenDanhMuc] [nvarchar](255) NULL,
 CONSTRAINT [PK_DanhMuc] PRIMARY KEY CLUSTERED 
(
	[MaDanhMuc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DonHang]    Script Date: 23/12/2024 19:51:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonHang](
	[MaDH] [nvarchar](20) NOT NULL,
	[NgayDH] [datetime] NULL,
	[PTTT] [nvarchar](255) NULL,
	[TenNguoiNhan] [nvarchar](255) NULL,
	[Email] [nvarchar](155) NULL,
	[SoDienThoai] [nvarchar](55) NULL,
	[DiaChiChiTiet] [nvarchar](555) NULL,
	[Tinh] [nchar](10) NULL,
	[Huyen] [nchar](10) NULL,
	[Phuong] [nchar](10) NULL,
	[TongTien] [float] NULL,
	[MaCTKM] [nvarchar](50) NULL,
	[GiaGiam] [float] NULL,
 CONSTRAINT [PK_DonHang] PRIMARY KEY CLUSTERED 
(
	[MaDH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DonNhapHang]    Script Date: 23/12/2024 19:51:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonNhapHang](
	[MaDN] [nvarchar](20) NOT NULL,
	[NgayNhap] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaDN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 23/12/2024 19:51:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham](
	[MaSanPham] [nvarchar](10) NOT NULL,
	[TenSanPham] [nvarchar](255) NULL,
	[MaThuongHieu] [nvarchar](10) NULL,
	[NguyenGia] [float] NULL,
	[HinhAnh] [nvarchar](max) NULL,
	[ThongTinSanPham] [nvarchar](max) NULL,
	[CongDungSanPham] [nvarchar](max) NULL,
	[ThanhPhanSanPham] [nvarchar](max) NULL,
	[HuongDanSuDungSanPham] [nvarchar](max) NULL,
	[XuatXu] [nvarchar](50) NULL,
	[SoLuong] [int] NULL,
 CONSTRAINT [PK_SanPham] PRIMARY KEY CLUSTERED 
(
	[MaSanPham] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SanPham_DanhMuc]    Script Date: 23/12/2024 19:51:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham_DanhMuc](
	[MaSanPham] [nvarchar](10) NOT NULL,
	[MaDanhMuc] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_SanPham_DanhMuc] PRIMARY KEY CLUSTERED 
(
	[MaDanhMuc] ASC,
	[MaSanPham] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaiKhoan]    Script Date: 23/12/2024 19:51:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaiKhoan](
	[MaKhachHang] [nvarchar](10) NOT NULL,
	[HoKH] [nvarchar](255) NULL,
	[TenKH] [nvarchar](255) NULL,
	[GioiTinh] [nvarchar](255) NULL,
	[SoDienThoai] [nvarchar](255) NULL,
	[Email] [nvarchar](255) NULL,
	[NgaySinh] [nvarchar](255) NULL,
	[MatKhau] [nvarchar](255) NULL,
	[LoaiTaiKhoan] [int] NULL,
	[TenDangNhap] [nvarchar](255) NULL,
	[ID] [int] NULL,
 CONSTRAINT [PK_TaiKhoan] PRIMARY KEY CLUSTERED 
(
	[MaKhachHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ThuongHieu]    Script Date: 23/12/2024 19:51:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThuongHieu](
	[MaThuongHieu] [nvarchar](10) NOT NULL,
	[TenThuongHieu] [nvarchar](255) NULL,
 CONSTRAINT [PK_ThuongHien] PRIMARY KEY CLUSTERED 
(
	[MaThuongHieu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[CTKM] ([MaCTKM], [TenCTKM], [NgayBatDau], [NgayKetThuc], [Discount]) VALUES (N'CTKM001', N'Vui hè', CAST(N'2024-01-04T00:00:00.000' AS DateTime), CAST(N'2025-01-04T00:00:00.000' AS DateTime), 1.5)
INSERT [dbo].[CTKM] ([MaCTKM], [TenCTKM], [NgayBatDau], [NgayKetThuc], [Discount]) VALUES (N'CTKM002', N'Mừng ngày lương về', CAST(N'2024-01-07T00:00:00.000' AS DateTime), CAST(N'2025-01-04T00:00:00.000' AS DateTime), 2.5)
INSERT [dbo].[CTKM] ([MaCTKM], [TenCTKM], [NgayBatDau], [NgayKetThuc], [Discount]) VALUES (N'CTKM003', N'Đặc quyền thành viên', CAST(N'2024-01-06T00:00:00.000' AS DateTime), CAST(N'2025-01-04T00:00:00.000' AS DateTime), 4)
GO
INSERT [dbo].[ChiNhanh] ([MaChiNhanh], [TenChiNhanh], [DiaChi], [ThanhPho], [QuanHuyen], [SDT], [HinhAnh]) VALUES (N'MaCH0001', N'Guardian Nguyễn Văn Tăng', N'209 Nguyễn Văn Tăng, Ấp Gò Công, Phường Long Thạnh Mỹ, Thành phố Thủ Đức, Thành phố Hồ Chí Minh', N'Thành Phố Thủ Đức', N'Q.9', N'1.90044e+007', N'image/15150213_house-7387050_1920.jpg')
INSERT [dbo].[ChiNhanh] ([MaChiNhanh], [TenChiNhanh], [DiaChi], [ThanhPho], [QuanHuyen], [SDT], [HinhAnh]) VALUES (N'MaCH0002', N'Guardian Lê Văn Việt', N'118 – 120 Đường Lê Văn Việt, Phường Hiệp Phú, Thành phố Thủ Đức', N'Thành Phố Thủ Đức', N'Q.9', N'1.92836e+007', N'image/15150227_th.jfif')
INSERT [dbo].[ChiNhanh] ([MaChiNhanh], [TenChiNhanh], [DiaChi], [ThanhPho], [QuanHuyen], [SDT], [HinhAnh]) VALUES (N'MaCH0003', N'Guardian Đỗ Xuân Hợp', N'373 Đường Đỗ Xuân Hợp, Phường Phước Long B, Thành phố Thủ Đức', N'Thành Phố Thủ Đức', N'Q.9', N'1.92836e+007', N'image/19202700_ch1.jpg')
INSERT [dbo].[ChiNhanh] ([MaChiNhanh], [TenChiNhanh], [DiaChi], [ThanhPho], [QuanHuyen], [SDT], [HinhAnh]) VALUES (N'MaCH0004', N'Guardian Nguyễn Thị Minh Khai', N'18C Đường Nguyễn Thị Minh Khai, Phường Đa Kao, Quận 1, Thành phố Hồ Chí Minh', N'Thành phố Hồ Chí Minh', N'Q.1', N'1.92838e+007', N'image/19202709_ch3.jpg')
INSERT [dbo].[ChiNhanh] ([MaChiNhanh], [TenChiNhanh], [DiaChi], [ThanhPho], [QuanHuyen], [SDT], [HinhAnh]) VALUES (N'MaCH0005', N'Guardian Trần Quang Diệu', N'67-69 Đường Trần Quang Diệu, Phường 14, Quận 3, Thành phố Hồ Chí Minh', N'Thành phố Hồ Chí Minh', N'Q.3', N'1.92833e+007', N'image/19202722_ch4.jpg')
INSERT [dbo].[ChiNhanh] ([MaChiNhanh], [TenChiNhanh], [DiaChi], [ThanhPho], [QuanHuyen], [SDT], [HinhAnh]) VALUES (N'MaCH0006', N'Guardian Tôn Đản', N'17-19 Đường Tôn Đản, Phường 13, Quận 4, Thành phố Hồ Chí Minh', N'Thành phố Hồ Chí Minh', N'Q.4', N'1.99284e+007', N'image/19202731_ch5.jpg')
INSERT [dbo].[ChiNhanh] ([MaChiNhanh], [TenChiNhanh], [DiaChi], [ThanhPho], [QuanHuyen], [SDT], [HinhAnh]) VALUES (N'MaCH0007', N'Guardian Nguyễn Trãi 2', N'346 Đường Nguyễn Trãi, Phường 08, Quận 5, Thành phố Hồ Chí Minh', N'Thành phố Hồ Chí Minh', N'Q.5', N'1.92838e+007', N'image/19202743_ch6.jpg')
INSERT [dbo].[ChiNhanh] ([MaChiNhanh], [TenChiNhanh], [DiaChi], [ThanhPho], [QuanHuyen], [SDT], [HinhAnh]) VALUES (N'MaCH0008', N'Guardian Hậu Giang 2', N'1002 – 1004 Hậu Giang, Phường 12, Quận 6, Thành phố Hồ Chí Minh', N'Thành phố Hồ Chí Minh', N'Q.6', N'1.92838e+007', N'image/19202753_ch7.jpg')
INSERT [dbo].[ChiNhanh] ([MaChiNhanh], [TenChiNhanh], [DiaChi], [ThanhPho], [QuanHuyen], [SDT], [HinhAnh]) VALUES (N'MaCH0009', N'Guardian Nguyễn Gia Trí', N'15 Nguyễn Gia Trí, Phường 25, Quận Bình Thạnh, Thành phố Hồ Chí Minh', N'Thành phố Hồ Chí Minh', N'Q. Bình Thạch', N'1.92838e+007', N'image/19202801_ch8.jpg')
INSERT [dbo].[ChiNhanh] ([MaChiNhanh], [TenChiNhanh], [DiaChi], [ThanhPho], [QuanHuyen], [SDT], [HinhAnh]) VALUES (N'MaCH0010', N'Guardian Nguyễn Thái Sơn', N'288-290 Nguyễn Thái Sơn, Phường 04, Quận Gò Vấp, Thành phố Hồ Chí Minh', N'Thành phố Hồ Chí Minh', N'Q. Gò Vấp', N'1.92837e+007', N'image/19202811_ch10.jpg')
INSERT [dbo].[ChiNhanh] ([MaChiNhanh], [TenChiNhanh], [DiaChi], [ThanhPho], [QuanHuyen], [SDT], [HinhAnh]) VALUES (N'MaCH0011', N'Guardian Phan Đình Phùng', N'226 – 228 Đường Phan Đình Phùng, Phường 01, Quận Phú Nhuận, Thành phố Hồ Chí Minh', N'Thành phố Hồ Chí Minh', N'Q. Phú Nhuận', N'1.92837e+007', N'image/19202906_ch7.jpg')
INSERT [dbo].[ChiNhanh] ([MaChiNhanh], [TenChiNhanh], [DiaChi], [ThanhPho], [QuanHuyen], [SDT], [HinhAnh]) VALUES (N'MaCH0012', N'Guardian Hoàng Hoa Thám 2', N'Số 23-25, Hoàng Hoa Thám, Phường 13, Quận Tân Bình, Thành phố Hồ Chí Minh', N'Thành phố Hồ Chí Minh', N'Q. Tân Bình', N'1.92837e+007', N'image/19202914_ch14.jpg')
INSERT [dbo].[ChiNhanh] ([MaChiNhanh], [TenChiNhanh], [DiaChi], [ThanhPho], [QuanHuyen], [SDT], [HinhAnh]) VALUES (N'MaCH0013', N'Guardian Nguyễn Huy Tưởng', N'Số 1 Đường Nguyễn Huy Tưởng, Phường Thanh Xuân Trung, Quận Thanh Xuân, Thành phố Hà Nội', N'Thành phố Hà Nội', N'Q. Thanh Xuân', N'1.92837e+007', N'image/19202923_ch18.jpg')
INSERT [dbo].[ChiNhanh] ([MaChiNhanh], [TenChiNhanh], [DiaChi], [ThanhPho], [QuanHuyen], [SDT], [HinhAnh]) VALUES (N'MaCH0014', N'Guardian Times City', N'Tầng B1, Vincom Mega Mall Times City, 458 Đường Minh Khai, Phường Vĩnh Tuy, Quận Hai Bà Trưng, Thành phố Hà Nội', N'Thành phố Hà Nội', N'Q. Hai Bà Trưng', N'1.92837e+007', N'image/19202932_ch17.jpg')
INSERT [dbo].[ChiNhanh] ([MaChiNhanh], [TenChiNhanh], [DiaChi], [ThanhPho], [QuanHuyen], [SDT], [HinhAnh]) VALUES (N'MaCH0015', N'Guardian Hồ Tùng Mậu', N'392-394 Đường Hồ Tùng Mậu, Phường Phú Diễn, Quận Bắc Từ Liêm, Thành phố Hà Nội', N'Thành phố Hà Nội', N'Q. Bắc Từ Liêm', N'1.92837e+007', N'image/19203004_ch10.jpg')
INSERT [dbo].[ChiNhanh] ([MaChiNhanh], [TenChiNhanh], [DiaChi], [ThanhPho], [QuanHuyen], [SDT], [HinhAnh]) VALUES (N'MaCH0016', N'Guardian GO! Hải Phòng', N'Tầng 1 - GO! Hải Phòng, Ngã Năm Sân Bay, 20 Khu Đô Thị Mới, Phường Đông Khê, Quận Ngô Quyền, Thành phố Hải Phòng', N'Thành phố Hải Phòng', N'Q. Ngô Quyên', N'1.92837e+007', N'image/19203012_ch23.jpg')
INSERT [dbo].[ChiNhanh] ([MaChiNhanh], [TenChiNhanh], [DiaChi], [ThanhPho], [QuanHuyen], [SDT], [HinhAnh]) VALUES (N'MaCH0017', N'Guardian Hoàng Diệu', N'308 Đường Hoàng Diệu, Phường Bình Hiên, Quận Hải Châu, Thành phố Đà Nẵng', N'Thành phố Đà Nẵng', N'Q. Hải Châu', N'1.92837e+007', N'image/19203033_ch9.jpg')
INSERT [dbo].[ChiNhanh] ([MaChiNhanh], [TenChiNhanh], [DiaChi], [ThanhPho], [QuanHuyen], [SDT], [HinhAnh]) VALUES (N'MaCH0018', N'Guardian Núi Thành', N'Lô 09B2-2 và Lô 10B2-2 Đường Núi Thành, KDC Nguyễn Thiện Thuật - Phan Thành Tài. P, bình thuận, Quận Hải Châu, TP Đà Nẵng', N'Thành phố Đà Nẵng', N'Q. Hải Châu', N'1.92837e+007', N'image/19203043_ch20.jpg')
INSERT [dbo].[ChiNhanh] ([MaChiNhanh], [TenChiNhanh], [DiaChi], [ThanhPho], [QuanHuyen], [SDT], [HinhAnh]) VALUES (N'MaCH0019', N'Guardian GO! Bà Rịa', N'Số 2 Nguyễn Đình Chiểu, khu phố 1, Phường Phước Hiệp, Thành phố Bà Rịa, Tỉnh Bà Rịa - Vũng Tàu', N'Tỉnh Bà Rịa - Vũng Tàu', N'Vân Du', N'1.92837e+007', N'image/19203054_hinh8.jpg')
INSERT [dbo].[ChiNhanh] ([MaChiNhanh], [TenChiNhanh], [DiaChi], [ThanhPho], [QuanHuyen], [SDT], [HinhAnh]) VALUES (N'MaCH0020', N'Guardian Ba Cu', N'251 Đường Ba Cu, Phường 4, Thành phố Vũng Tàu, Tỉnh Bà Rịa - Vũng Tàu', N'Tỉnh Bà Rịa - Vũng Tàu', N'Vân Du', N'1.92837e+007', N'image/19203025_ch24.jpg')
INSERT [dbo].[ChiNhanh] ([MaChiNhanh], [TenChiNhanh], [DiaChi], [ThanhPho], [QuanHuyen], [SDT], [HinhAnh]) VALUES (N'MaCH0021', N'Guardian GO! Dĩ An', N'1S12, Trung Tâm Thương Mại Go! Dĩ An, Quốc lộ 1K, Phường Đông Hòa, Thị xã Dĩ An, Tỉnh Bình Dương', N'Tỉnh Bình Dương', N'Vân Du', N'1.92837e+007', N'image/19202956_ch3.jpg')
INSERT [dbo].[ChiNhanh] ([MaChiNhanh], [TenChiNhanh], [DiaChi], [ThanhPho], [QuanHuyen], [SDT], [HinhAnh]) VALUES (N'MaCH0022', N'Guardian Lái Thiêu', N'51 Đông Tư, Lái Thiêu TP. Thuận An, Bình Dương', N'Tỉnh Bình Dương', N'Vân Du', N'1.92837e+007', N'image/19202944_ch23.jpg')
INSERT [dbo].[ChiNhanh] ([MaChiNhanh], [TenChiNhanh], [DiaChi], [ThanhPho], [QuanHuyen], [SDT], [HinhAnh]) VALUES (N'MaCH0023', N'Guardian LOTTE Nha Trang', N'Tầng 1 - LOTTE Nha Trang, Số 58, Đường 23/10, Phường Phương Sơn, Thành phố Nha Trang, Tỉnh Khánh Hòa', N'Tỉnh Khánh Hòa', N'Vân Du', N'1.92837e+007', N'image/19202855_ch12.jpg')
INSERT [dbo].[ChiNhanh] ([MaChiNhanh], [TenChiNhanh], [DiaChi], [ThanhPho], [QuanHuyen], [SDT], [HinhAnh]) VALUES (N'MaCH0024', N'Guardian GO! Mỹ Tho', N' 545 Lê Văn Thẩm, Phường 5, Thành phố Mỹ Tho, Tỉnh Tiền Giang', N'Tỉnh Tiền Giang', N'Vân Du', N'1.92837e+007', N'image/19202839_ch15.jpg')
INSERT [dbo].[ChiNhanh] ([MaChiNhanh], [TenChiNhanh], [DiaChi], [ThanhPho], [QuanHuyen], [SDT], [HinhAnh]) VALUES (N'MaCH0025', N'Guardian CMT8 Biên Hòa', N'284 CMT8, Phường Quang Vinh, Thành phố Biên Hòa, Tỉnh Đồng Nai', N'Tỉnh Đồng Nai', N'Vân Du', N'1.92837e+007', N'image/19202828_ch12.jpg')
GO
INSERT [dbo].[ChiTietDonHang] ([MaDH], [MaSanPham], [SoLuongSanPham], [TongTien], [MaChiNhanh], [GiaSP]) VALUES (N'DH20241215222254', N'SP0003', 10, 390000, NULL, 39000)
INSERT [dbo].[ChiTietDonHang] ([MaDH], [MaSanPham], [SoLuongSanPham], [TongTien], [MaChiNhanh], [GiaSP]) VALUES (N'DH20241215225615', N'SP0002', 1, 20000, NULL, 20000)
INSERT [dbo].[ChiTietDonHang] ([MaDH], [MaSanPham], [SoLuongSanPham], [TongTien], [MaChiNhanh], [GiaSP]) VALUES (N'DH20241215225623', N'SP0002', 1, 20000, NULL, 20000)
INSERT [dbo].[ChiTietDonHang] ([MaDH], [MaSanPham], [SoLuongSanPham], [TongTien], [MaChiNhanh], [GiaSP]) VALUES (N'DH20241215225838', N'SP0002', 1, 20000, NULL, 20000)
INSERT [dbo].[ChiTietDonHang] ([MaDH], [MaSanPham], [SoLuongSanPham], [TongTien], [MaChiNhanh], [GiaSP]) VALUES (N'DH20241215230615', N'SP0002', 1, 20000, NULL, 20000)
INSERT [dbo].[ChiTietDonHang] ([MaDH], [MaSanPham], [SoLuongSanPham], [TongTien], [MaChiNhanh], [GiaSP]) VALUES (N'DH20241222214053', N'SP0002', 1, 20000, NULL, 20000)
INSERT [dbo].[ChiTietDonHang] ([MaDH], [MaSanPham], [SoLuongSanPham], [TongTien], [MaChiNhanh], [GiaSP]) VALUES (N'DH20241215230434', N'SP0002', 1, 20000, NULL, 20000)
GO
INSERT [dbo].[ChiTietDonHangNhap] ([MaDN], [MaSP], [SoLuong], [TongTien], [MaChiNhanh], [LoaiSP]) VALUES (N'HDN20241214100323', N'SP0002', 1000, 23423230, N'MaCH0011', 0)
INSERT [dbo].[ChiTietDonHangNhap] ([MaDN], [MaSP], [SoLuong], [TongTien], [MaChiNhanh], [LoaiSP]) VALUES (N'HDN20241216080211', N'SP0002', 100, 20000034, N'MaCH0012', 0)
GO
INSERT [dbo].[DanhMuc] ([MaDanhMuc], [TenDanhMuc]) VALUES (N'DM001', N'Độc Quyền Guardian')
INSERT [dbo].[DanhMuc] ([MaDanhMuc], [TenDanhMuc]) VALUES (N'DM002', N'Chăm Sóc Da Mặt')
INSERT [dbo].[DanhMuc] ([MaDanhMuc], [TenDanhMuc]) VALUES (N'DM003', N'Trang Điểm')
INSERT [dbo].[DanhMuc] ([MaDanhMuc], [TenDanhMuc]) VALUES (N'DM004', N'Chăm Sóc Cơ Thể')
INSERT [dbo].[DanhMuc] ([MaDanhMuc], [TenDanhMuc]) VALUES (N'DM005', N'Chăm Sóc Sức Khỏe')
INSERT [dbo].[DanhMuc] ([MaDanhMuc], [TenDanhMuc]) VALUES (N'DM006', N'Chăm Sóc Tóc')
INSERT [dbo].[DanhMuc] ([MaDanhMuc], [TenDanhMuc]) VALUES (N'DM007', N'Góc Nam Giới')
INSERT [dbo].[DanhMuc] ([MaDanhMuc], [TenDanhMuc]) VALUES (N'DM008', N'Mẹ và Bé')
GO
INSERT [dbo].[DonHang] ([MaDH], [NgayDH], [PTTT], [TenNguoiNhan], [Email], [SoDienThoai], [DiaChiChiTiet], [Tinh], [Huyen], [Phuong], [TongTien], [MaCTKM], [GiaGiam]) VALUES (N'DH20241215222254', CAST(N'2024-12-14T00:00:00.000' AS DateTime), N'COD', N'huy', N'daohuy1692003@gmail.com', N'1223423423', N'2342323', N'23423423  ', N'23423234  ', N'4234234   ', 390000, NULL, NULL)
INSERT [dbo].[DonHang] ([MaDH], [NgayDH], [PTTT], [TenNguoiNhan], [Email], [SoDienThoai], [DiaChiChiTiet], [Tinh], [Huyen], [Phuong], [TongTien], [MaCTKM], [GiaGiam]) VALUES (N'DH20241215225243', CAST(N'2024-11-14T00:00:00.000' AS DateTime), N'COD', N'huy', N'daohuy1692003@gmail.com', N'1223423423', N'2342323', N'23423423  ', N'23423234  ', N'4234234   ', 410000, NULL, 0)
INSERT [dbo].[DonHang] ([MaDH], [NgayDH], [PTTT], [TenNguoiNhan], [Email], [SoDienThoai], [DiaChiChiTiet], [Tinh], [Huyen], [Phuong], [TongTien], [MaCTKM], [GiaGiam]) VALUES (N'DH20241215225330', CAST(N'2024-10-14T00:00:00.000' AS DateTime), N'COD', N'huy', N'daohuy1692003@gmail.com', N'1223423423', N'2342323', N'23423423  ', N'23423234  ', N'4234234   ', 410000, NULL, 0)
INSERT [dbo].[DonHang] ([MaDH], [NgayDH], [PTTT], [TenNguoiNhan], [Email], [SoDienThoai], [DiaChiChiTiet], [Tinh], [Huyen], [Phuong], [TongTien], [MaCTKM], [GiaGiam]) VALUES (N'DH20241215225411', CAST(N'2024-09-14T00:00:00.000' AS DateTime), N'COD', N'huy', N'daohuy1692003@gmail.com', N'1223423423', N'2342323', N'23423423  ', N'23423234  ', N'4234234   ', 410000, NULL, 0)
INSERT [dbo].[DonHang] ([MaDH], [NgayDH], [PTTT], [TenNguoiNhan], [Email], [SoDienThoai], [DiaChiChiTiet], [Tinh], [Huyen], [Phuong], [TongTien], [MaCTKM], [GiaGiam]) VALUES (N'DH20241215225615', CAST(N'2024-08-14T00:00:00.000' AS DateTime), N'COD', N'huy', N'daohuy1692003@gmail.com', N'1223423423', N'2342323', N'23423423  ', N'23423234  ', N'4234234   ', 410000, NULL, 0)
INSERT [dbo].[DonHang] ([MaDH], [NgayDH], [PTTT], [TenNguoiNhan], [Email], [SoDienThoai], [DiaChiChiTiet], [Tinh], [Huyen], [Phuong], [TongTien], [MaCTKM], [GiaGiam]) VALUES (N'DH20241215225623', CAST(N'2024-12-14T00:00:00.000' AS DateTime), N'COD', N'huy', N'daohuy1692003@gmail.com', N'1223423423', N'2342323', N'23423423  ', N'23423234  ', N'4234234   ', 410000, NULL, 0)
INSERT [dbo].[DonHang] ([MaDH], [NgayDH], [PTTT], [TenNguoiNhan], [Email], [SoDienThoai], [DiaChiChiTiet], [Tinh], [Huyen], [Phuong], [TongTien], [MaCTKM], [GiaGiam]) VALUES (N'DH20241215225838', CAST(N'2024-12-14T00:00:00.000' AS DateTime), N'COD', N'huy', N'daohuy1692003@gmail.com', N'1223423423', N'2342323', N'23423423  ', N'23423234  ', N'4234234   ', 410000, NULL, 0)
INSERT [dbo].[DonHang] ([MaDH], [NgayDH], [PTTT], [TenNguoiNhan], [Email], [SoDienThoai], [DiaChiChiTiet], [Tinh], [Huyen], [Phuong], [TongTien], [MaCTKM], [GiaGiam]) VALUES (N'DH20241215230434', CAST(N'2024-12-14T00:00:00.000' AS DateTime), N'COD', N'huy', N'daohuy1692003@gmail.com', N'1223423423', N'2342323', N'23423423  ', N'23423234  ', N'4234234   ', 20000, NULL, 0)
INSERT [dbo].[DonHang] ([MaDH], [NgayDH], [PTTT], [TenNguoiNhan], [Email], [SoDienThoai], [DiaChiChiTiet], [Tinh], [Huyen], [Phuong], [TongTien], [MaCTKM], [GiaGiam]) VALUES (N'DH20241215230615', CAST(N'2024-12-14T00:00:00.000' AS DateTime), N'COD', N'huy', N'daohuy1692003@gmail.com', N'1223423423', N'2342323', N'23423423  ', N'23423234  ', N'4234234   ', 20000, NULL, 0)
INSERT [dbo].[DonHang] ([MaDH], [NgayDH], [PTTT], [TenNguoiNhan], [Email], [SoDienThoai], [DiaChiChiTiet], [Tinh], [Huyen], [Phuong], [TongTien], [MaCTKM], [GiaGiam]) VALUES (N'DH20241222214053', CAST(N'2024-12-22T21:40:53.630' AS DateTime), N'COD', N'huy', N'duongdatx2004@gmail.com', N'1223423423', N'2342323', N'          ', N'23423234  ', N'4234234   ', 20000, NULL, 0)
GO
INSERT [dbo].[DonNhapHang] ([MaDN], [NgayNhap]) VALUES (N'HDN20241214100323', CAST(N'2024-12-14T00:00:00.000' AS DateTime))
INSERT [dbo].[DonNhapHang] ([MaDN], [NgayNhap]) VALUES (N'HDN20241216080211', CAST(N'2024-11-10T08:02:00.000' AS DateTime))
GO
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MaThuongHieu], [NguyenGia], [HinhAnh], [ThongTinSanPham], [CongDungSanPham], [ThanhPhanSanPham], [HuongDanSuDungSanPham], [XuatXu], [SoLuong]) VALUES (N'SP0001', N'Khăn Giấy Gói Lẻ Siêu Mềm Guardian Ultra Soft Mini Tissues Không Mùi 10 Tờ', N'TH001', 3000, N'image\hinh1.jpg', N'Khăn Giấy Gói Lẻ Siêu Mềm Guardian Ultra Soft Mini Tissues Không Mùi 10 Tờ

Khăn Giấy Gói Lẻ Siêu Mềm Guardian Ultra Soft Mini Tissues Không Mùi', N'Được làm từ 100% bột gỗ nguyên chất, cực kỳ mềm mại, độ dai lý tưởng, hợp vệ sinh và khả năng thấm hút cao, lý tưởng để sử dụng mỗi ngày. 

Tham khảo thêm các sản phẩm khác của Guardian tại đây', N'100% từ bột gỗ nguyên chất.', N'CÁCH DÙNG – DIRECTION FOR USE:

Dùng hàng ngày để vệ sinh cá nhân và phục vụ các nhu cầu khác nhau của bạn.

CHÚ Ý - CAUTION:

Tránh xa tầm tay trẻ em để tránh nguy cơ gây ngạt thở. 

Bảo quản:

Bảo quản nơi khô ráo, thoáng mát.
Tránh xa ánh nắng trực tiếp của mặt trời. 
Quy cách: 1 gói x 10 tờ.', N'Xuất xứ : Malaysia', 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MaThuongHieu], [NguyenGia], [HinhAnh], [ThongTinSanPham], [CongDungSanPham], [ThanhPhanSanPham], [HuongDanSuDungSanPham], [XuatXu], [SoLuong]) VALUES (N'SP0002', N'Bông Phấn Trang Điểm Compact Velour Puffs Guardian 2 Cái', N'TH001', 20000, N'image\hinh2.jpg', N'Bông Phấn Trang Điểm Compact Velour Puffs Guardian 2 Cái', N'Sử dụng dặm phấn nén, phủ bột, má hồng,... hoặc lấy bớt lượng phấn thừa trên mặt khi trang điểm', NULL, N'CÁCH DÙNG – DIRECTION FOR USE
 
- Dùng bông lấy phấn trang điểm và vỗ nhẹ lên mặt ngoài bàn tay để loại bỏ lớp phấn thừa. Lăn và vỗ nhẹ bông phấn lên da để trang điểm
- Để làm sạch: rửa sạch bông phấn bằng xà phòng loãng và nước ấm sau khi sử dụng, đặt ở phẳng và phơi khô. Bảo quản:

Bảo quản nơi khô ráo, thoáng mát.
Tránh xa ánh nắng trực tiếp của mặt trời. ', N'Xuất xứ : Malaysia', 1001210)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MaThuongHieu], [NguyenGia], [HinhAnh], [ThongTinSanPham], [CongDungSanPham], [ThanhPhanSanPham], [HuongDanSuDungSanPham], [XuatXu], [SoLuong]) VALUES (N'SP0003', N'Dầu Dưỡng Da Cho Bé Guardian Baby Oil 125ml', N'TH001', 39000, N'image\hinh3.jpg', N'Dầu dưỡng ẩm da cho bé Guardian Baby Moisturising Oil chứa dầu Argan, dầu ô liu và dầu hạt hướng dương, giúp nhẹ nhàng dưỡng ẩm và mát-xa cho da bé.', N'Chứa các thành phần thiên nhiên như dầu Argan, dầu ô liu và dầu hạt hướng dương, giúp nhẹ nhàng dưỡng ẩm và mát-xa cho da bé.

Công thức không chứa Paraben và chất tạo màu.

Sản phẩm được thử nghiệm và chứng minh bởi bác sĩ nhi khoa, phù hợp cho trẻ sơ sinh. 
 ', N'Paraffinum Liquidum, Argania Spinosa Kernel Oil, Helianthus Annuus (Sunflower) Seed Oil, Olea Europaea (Olive) Fruit Oil, Parfum, Tocopheryl Acetate.', N'CÁCH DÙNG – DIRECTION FOR USE:

Lấy lượng vừa đủ vào lòng bàn tay, thoa và masage nhẹ nhàng trên da bé cho đến khi hấp thụ hoàn toàn. 

Lưu ý: 

- Chỉ sử dụng ngoài da. Tránh xa tầm tay trẻ em. 

- Tránh tiếp xúc với mắt và vùng da bị tổn thương. 

- Nếu sản phẩm dính vào mắt, rửa sạch bằng nước. 

- Ngừng sử dụng sản phẩm nếu xảy ra kích ứng da đầu và hỏi ý kiến bác sĩ.

Bảo quản: Bảo quản nơi khô ráo, thoáng mát. Tránh xa ánh nắng mặt trời trực tiếp.', N'Xuất xứ : Malaysia', 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MaThuongHieu], [NguyenGia], [HinhAnh], [ThongTinSanPham], [CongDungSanPham], [ThanhPhanSanPham], [HuongDanSuDungSanPham], [XuatXu], [SoLuong]) VALUES (N'SP0004', N'Mặt Nạ Dưỡng Ẩm, Hỗ Trợ Sáng Da Allione Radiance Mung Beans Chiết Xuất Đậu Xanh 30gr', N'TH001', 35000, N'image\hinh4.jpg', N'Mặt Nạ Dưỡng Ẩm, Hỗ Trợ Sáng Da Chiết Xuất Đậu Xanh Allione Radiance Mung Beans, Được thiết kế tùy chỉnh cho nhu cầu chăm sóc da khẩn cấp', N'Mặt nạ có công dụng làm sáng da với các thành phần làm sáng hiệu quả bao gồm Chiết xuất đậu xanh giàu Vitamin và Crithmum Maritimum Callus
Culture Filtrate: cải thiện màu da, cung cấp độ ẩm cho làn da tươi sáng.
Tấm vi sợi xanh siêu mịn: Tấm vi sợi xanh có cấu trúc tinh xảo mang lại sự vừa vặn và mịn màng cho khuôn mặt, tránh thất thoát dưỡng chất và đưa hoạt chất vào sâu trong da
Dưỡng chất giúp làm da tươi sáng rạng rỡ: các thành phần làm sáng da bao gồm Mung Bean Extract và Crithmum Manritimum Callus Culture Filtrate cho làn da sáng và khỏe mạnh.
Hydrat hóa kép: Phức Hợp Axit Hyaluronic Octuple giúp hình thành lớp màng dưỡng ẩm, giúp duy trì độ ẩm thời gian dài.', N'Water, Dipropylene Glycol, Glycerin, Butylene Glycol, Niacinamide, Methylpropanediol, Hydroxyacetophenone, PEG-60 Hydrogenated Castor Oil, Carbomer, Allantoin, Caffeine, Xanthan Gum, Tromethamine, Caprylyl Glycol, Ethylhexylglycerin, 1,2-Hexanediol, Pentylene Glycol, Dipotassium Glycyrrhizate, Fragrance (Parfum), Sodium Hyaluronate, Acetyl Glucosamine, Propanediol, Disodium EDTA, Althaea Rosea Flower Extract, Benzyl Glycol, Hydrolyzed Glycosaminoglycans, Sodium Hyaluronate Crosspolymer, Vigna Radiata Seed Extract, Hydrolyzed Hyaluronic Acid, Hydroxypropyltrimonium Hyaluronate, Hyaluronic Acid, Sodium Acetylated Hyaluronate, Tuber Magnatum Extract, Crithmum Maritimum Callus Culture Filtrate, Leuconostoc/Radish Root Ferment Filtrate, Bambusa Vulgaris Water.
', N'CÁCH DÙNG – DIRECTION FOR USE:

1. Chuẩn bị cho da bằng nước cân bằng sau khi rửa mặt.
2. Mở túi, lấy mặt nạ ra, gỡ miếng phim ra khỏi mặt nạ và đắp lên mặt
3. Tháo mặt nạ sau khoảng 10-20 phút và vỗ nhẹ để giúp da hấp thụ các tinh chất còn lại

Bảo quản:

Bảo quản nơi khô ráo, thoáng mát.
Tránh xa ánh nắng trực tiếp của mặt trời.', N'Xuất xứ: Korea', 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MaThuongHieu], [NguyenGia], [HinhAnh], [ThongTinSanPham], [CongDungSanPham], [ThanhPhanSanPham], [HuongDanSuDungSanPham], [XuatXu], [SoLuong]) VALUES (N'SP0005', N'Sữa Tắm Dạng Kem Dưỡng Ẩm Guardian Essential Rice Milk Moisturising Shower Cream Chiết Xuất Sữa Gạo 250Ml', N'TH001', 24000, N'image\hinh5.jpg', N'Sữa Tắm Dạng Kem Dưỡng Ẩm Guardian Essential Rice Milk Moisturising Shower Cream Chiết Xuất Sữa Gạo 250Ml', N'Công thức đặc biệt với chiết xuất sữa gạo thiên nhiên và Glycerin, kem tắm giúp nhẹ nhàng làm sạch da toàn thân mà không làm mất đi hàng rào độ ẩm tự nhiên của da. 
Sữa gạo có chứa các đặc tính giúp duy trì một làn da trông khỏe mạnh và rạng rỡ. 
Cung cấp độ ẩm cho da, mang lại làn da mịn màng, mềm mại. 
Công thức không chứa xà phòng', N'Aqua, Sodium Laureth Sulfate, Cocamidopropyl Betaine, Palm Kernelamide Dea, Glycerin, Sodium Chloride, Polyquaternium-39, Styrene/Acrylates Copolymer, Parfum, Tetrasodium Edta, Citric Acid, Oryza Sativa (Rice) Extract, Methylchloroisothiazolinone, Potassium Sorbate, Methylisothiazolinone.', N'CÁCH DÙNG – DIRECTION FOR USE:
 
- Lấy một lượng kem tắm vào lòng bàn tay hoặc bông tắm, tạo bọt với nước và nhẹ nhàng mát-xa đều lên da, sau đó xả sạch.

Bảo quản: Nơi khô ráo thoáng mát, tránh ánh sáng trực tiếp.', N'Xuất xứ: Korea', 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MaThuongHieu], [NguyenGia], [HinhAnh], [ThongTinSanPham], [CongDungSanPham], [ThanhPhanSanPham], [HuongDanSuDungSanPham], [XuatXu], [SoLuong]) VALUES (N'SP0006', N'Serum Lolane Dành Cho Tóc Khô & Hư Tổn Chai 50Ml', N'TH001', 79000, N'image\hinh6.jpg', NULL, N'Serum dưỡng tóc chiết xuất từ Jojoba, Macadacia, và vitamin E giúp nuôi dưỡng mái tóc và các lớp men biểu bì cho những loại tóc khô, tóc hư tổn và tóc bị chẻ ngọn.

Giúp cho mái tóc trở nên khỏe mạnh, mềm mại và tạo cho tóc có độ bóng sáng rực rỡ.

Hạt Jojoba giúp dưỡng ẩm cho tóc, giúp cho mái tóc mềm mại mượt mà và trở nên đẹp hơn.

Hạt Macadamia giúp nuôi dưỡng mái tóc và các lớp men biểu bì và làm cho tóc bóng sáng rực rỡ hơn

Tia UV giúp bảo vệ và làm cho tóc bóng hơn.', N'Cyclomethicone, Dimethicone, dầu hạt Macadamia Terrifolia, dầu thực vật Hydro hóa, dầu hạt jojoba Simmondsia chinensis, dầu hạt hoa hướng dương helianthus annuus, chất hóa học tocopheryl axetat, Octyl Methoxycinnamate, hương thơm, BHT

 ', N'CÁCH DÙNG – DIRECTION FOR USE

Trước khi gội đầu, nhỏ một ít sản phẩm vào tóc, để trong vòng 10 phút sau đó rửa sạch và gội lại bình thường.

Trước khi sấy khô tóc, uốn tóc hay duỗi tóc: nhỏ 1 ít serum lên tóc giúp cho tóc mềm, mượt tóc.

Đối với tóc khô: nhỏ 1 ít lên tóc cách chân tóc khoảng 5cm, giúp cho tóc mềm mượt, kiểm soát độ dầu hơn.

Để một phút và sau đó xả lại bằng nước sạch. 

 

Bảo quản:

Tránh ánh nắng trực tiếp, nơi có nhiệt độ cao hoặc ẩm ướt.

Để xa tầm tay trẻ em.

Đậy nắp kín sau khi sử dụng.', N'Xuất xứ: Thái Lan', 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MaThuongHieu], [NguyenGia], [HinhAnh], [ThongTinSanPham], [CongDungSanPham], [ThanhPhanSanPham], [HuongDanSuDungSanPham], [XuatXu], [SoLuong]) VALUES (N'SP0007', N'Sữa Tắm Dưỡng Trắng Mịn Màng De Leaf Thanaka White And Smooth Serum Shower Cream Dạng Sữa 450ml', N'TH001', 99000, N'image\hinh7.jpg', N'Sản phẩm Sữa Tắm Dưỡng Trắng Mịn Màng De Leaf Thanaka White And Smooth Serum Shower Cream 450ml giàu tinh chất, được kết hợp 2 trong 1, giúp dưỡng sáng da với hương thơm thư giãn và nhẹ nhàng suốt ngày dài.', N'CÔNG DỤNG CHÍNH – MAIN FUNCTION

Sự kết hợp Thanaka và Vitamin B3 giúp dưỡng sáng da.
Mật ong hữu cơ Manuka giúp dưỡng ẩm cho làn da mềm mịn.
Nước khoáng thiên nhiên giúp giữ ẩm và tươi trẻ làn da, mang lại làn da mịn màng và rạng rỡ.
Giảm mụn, tẩy tế bào chết và ngăn ngừa mùi cơ thể.', N'Aqua, Lauric Acid, Sodium Laureth Sulface, Myristic Acid, Potassium Hydroxide, Glycol Distearate, Propylene Glycol, Sodium Chloride, Parfum (Fragrance), Palmitic Acid, Glycerin, Cocamide DEA, Caprylyl/Capryl Glucoside, Hydroxylpropyl Methylcellulose, Disodium EDTA, Honey, Niacinamide, Limonia Acidissima Extract, Alcohol, Lecithin, Leuconostoc/Radish Root Rerment Filtrate, Citrus Limon (Lemon) Fruit Extract, Potassium Sorbate, Sodium Benzoate, Linalool, Butylphenyl Methypropional, Hexyl Cinnamal, Limonene, Hydroxycitronellal, CI 19140 (Yellow 5), CI 14700 (Red 4).', N'CÁCH DÙNG – DIRECTION FOR USE

Lấy một lượng vừa đủ vào lòng bàn tay hoặc miếng bông tắm, thoa đều lên khắp cơ thể đến khi tạo bọt và massage nhẹ nhàng trên da, sau đó rửa sạch. Sử dụng buổi sáng và tối để có làn da tươi sáng, tươi trẻ hơn.

Bảo quản:
Bảo quản nơi khô ráo thoáng mát. Tránh xa ánh nắng mặt trời trực tiếp.
Chỉ sử dụng ngoài da.
Để xa tầm tay trẻ em.', N'Xuất xứ: Thái Lan', 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MaThuongHieu], [NguyenGia], [HinhAnh], [ThongTinSanPham], [CongDungSanPham], [ThanhPhanSanPham], [HuongDanSuDungSanPham], [XuatXu], [SoLuong]) VALUES (N'SP0008', N'Nước Hoa Hồng Làm Dịu Da Giảm Mụn Ottie Blemish Clean Toner 210ml', N'TH001', 199000, N'image\hinh8.jpg', N'Nước hoa hồng dưỡng ẩm và làm dịu da của thương hiệu Ottie được thiết kế phù hợp cho làn da nhạy cảm và dễ nổi mụn, giúp làm sạch sâu bụi bẩn, bã nhờn, giảm mụn cũng như cấp ẩm tức thì giúp da trông căng mọng, đàn hồi.', N'CÔNG DỤNG CHÍNH – MAIN FUNCTION 

Nước hoa hồng Ottie Blemish Clean Toner với thành phần AXIT HYALURONIC, AXIT SALICYLIC, BHA tự nhiên, BETA-GLUCAN có tác dụng cấp ẩm, giảm sưng viêm, cân bằng Dầu - Nước cho da 
Đồng thời làm sạch bụi bẩn, bã nhờn giúp thông thoáng lỗ chân lông, giảm mụn hiệu quả. 
Đặc biệt, sản phẩm còn có công thức CLEAN SAVER & MultiEx BSABM™ độc quyền chứa 10 loại tinh chất thảo dược hỗ trợ dưỡng sáng, củng cố hàng rào bảo vệ và làm chậm quá trình lão hóa da.', N'NON - COMEDOGENIC TESTED: Không gây bít tắc da, giảm mụn vượt trội - Hiệu quả đã được thử nghiệm lâm sàng
AXIT HYALURONIC: phân tử HA cực nhỏ đi sâu vào các lớp biểu bì da hỗ trợ cấp ẩm tức giúp da trông căng mọng, đàn hồi.
BHA TỰ NHIÊN (từ chiết xuất Lộc Đề Xanh): Giúp giảm bã nhờn, kiềm dầu và giảm mụn hiệu quả
BETA-GLUCAN: kháng khuẩn, làm dịu da, giảm sưng viêm, mẩn đỏ.
CLEAN SAVER & MultiEx BSABM™: 10 loại tinh chất thảo dược giúp cấp ẩm, hỗ trợ dưỡng sáng, củng cố hàng rào bảo vệ và làm chậm quá trình lão hóa da.', N'CÁCH DÙNG – DIRECTION FOR USE

Lấy một lượng vừa đủ thoa và mát-xa nhẹ nhàng cho đến khi tinh chất thẩm thấu hoàn toàn vào da. 

Nên sử dụng 2 lần/ngày. ', N'Xuất xứ: Korea', 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MaThuongHieu], [NguyenGia], [HinhAnh], [ThongTinSanPham], [CongDungSanPham], [ThanhPhanSanPham], [HuongDanSuDungSanPham], [XuatXu], [SoLuong]) VALUES (N'SP0009', N'Tinh Chất Dưỡng Tóc Cho Tóc Hư Tổn Epunol Cerablutin Hair Essence 100ml', N'TH001', 199000, N'image\hinh9.jpg', N'Tinh chất dưỡng tóc chăm sóc chuyên sâu Epunol là dưỡng chất chuyên dụng cho tóc hư tổn, tóc khô xơ, xỉn màu giúp mái tóc mềm mượt, giảm tình trạng khô xơ, cho mái tóc phồng đẹp.', N'CÔNG DỤNG CHÍNH – MAIN FUNCTION 

Sản phẩm cung cấp dưỡng chất dồi dào được kết hợp từ 6 loại dầu thực vật giúp tóc bóng mượt
11 loại protein và axit amin cho mái tóc được nuôi dưỡng toàn diện và chăm sóc tóc hư tổn từ sâu bên trong
Thành phần độc quyền Cerablutin gồm Ceramide giúp tạo hàng rào bảo vệ cho tóc tránh khỏi các tác động nhiệt của việc tạo kiểu
Chiết xuất cây thùa xanh giúp duy trì độ ẩm cho mái tóc
Cải thiện lớp biểu bì thô ráp một cách rõ rệt, cho mái tóc phồng đẹp, chắc khỏe
Hương trái cây kết hợp với hoa hồng giúp tóc giữ được mùi hương nhẹ nhàng, tự nhiên', N'Cyclopentasiloxane, Dimethicone, C12-15 Alkyl Benzoate, Cyclohexasiloxane, Dầu Hạt Nho, Dầu Ô Liu, Dầu Hạt Hướng Dương, Dầu Hạt Argan, Dầu Hạt Chùm Ngây, Dầu Hạt Jojoba, Tocopheryl Axetat, Butylene Glycol, Glycerin, Octyldodecanol, 1,2-Hexanediol, Chiết Xuất Cây Cỏ Mực,Chiết Xuất Lá Cây Neem Ấn Độ, Chiết Xuất Hoa Cây Neem Ấn Độ, Chiết Xuất Quả Ivygod, Chiết Xuất Quả Cà Tím, Chiết Xuất Hoa Lô Hội, Chiết Xuất Lá Ocimum Sanctum, Chiết Xuất Rễ Củ Nghệ, Chiết Xuất Corallina Officinalis, Nước Hoa Hồng Damask, Chiết Xuất Hoa Cúc Vạn Thọ, Nước Hoa Hồng Provence, Chiết Xuất Kén Tằm, Chiết Xuất Protein Sữa, Chiết Xuất Đậu Xanh, Chiết Xuất Quả Chiêu Liêu, Chiết Xuất Kỷ Tử, Chiết Xuất Tảo Bẹ, Chiết Xuất Đậu Đen, Chiết Xuất Lá Molokhiya, Chiết Xuất Quả Hồng, Chiết Xuất Quả Carob, Chiết Xuất Lá Camellia, Nước Tinh Khiết, Protein Lúa Mì Thủy Phân, Protein Đậu Nành Thủy Phân, Tơ Tằm Thủy Phân, Protein Gạo Thủy Phân, Keratin Thủy Phân, Elastane Thủy Phân, Collagen Thủy Phân, Lecithin Hydro Hóa, Natri Hyaluronate, Bột Tơ Tằm, Axit Amin Keratin, NP Ceramide, Caprylyl Glycol, Caprylic/Capric Triglyceride, Cholesterol, Hương Liệu', N'CÁCH DÙNG – DIRECTION FOR USE

- Lấy một lượng vừa đủ ra tay và thoa lên tóc ướt hoặc tóc khô.

- Sản phẩm với tinh chất không bết dính, bạn có thể thoa dưỡng chất lên tóc thường xuyên.

- Bạn không cần phải rửa sạch bằng nước. ', N'Xuất xứ: Korea', 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MaThuongHieu], [NguyenGia], [HinhAnh], [ThongTinSanPham], [CongDungSanPham], [ThanhPhanSanPham], [HuongDanSuDungSanPham], [XuatXu], [SoLuong]) VALUES (N'SP0010', N'Phấn Má Hồng Judydoll Pretty Blush Powder #49 Cream Raspberry 2gr', N'TH001', 105000, N'image\hinh10.jpg', N'Phấn má hồng Pretty Blush Powder của thương hiệu Judydoll mang lại màu sắc độc đáo giúp tạo thêm vẻ ửng hồng tự nhiên cho má và dễ dàng hòa trộn lên da. Sản phẩm được thiết kế nhỏ gọn xinh xắn, dễ dàng mang theo trong túi trang điểm.', N'CÔNG DỤNG CHÍNH – MAIN FUNCTION 

Phấn má hồng JUDYDOLL Blush Powder sở hữu các đặc tính nổi bật như:

Tông màu tự nhiên phù hợp với làn da châu Á. 
Các hạt phấn kết cấu nhẹ và mịn tạo hiệu ứng gò má ửng hồng tự nhiên.
Chất phấn mịn, đa dạng màu sắc, phù hợp cho nhiều kiểu make up và tone da khác nhau.
Bao bì nhỏ nhắn, dễ dàng mang theo trong túi xách', NULL, N'CÁCH DÙNG – DIRECTION FOR USE

- Dùng cọ lấy một lượng phấn vừa đủ rồi phủ nhẹ lên da. 

- Tiếp tục dặm thêm phấn nếu cần thiết.

Bảo quản:

- Tránh ánh nắng trực tiếp.

- Để nơi khô ráo, thoáng mát.

Lưu ý:

- Ngưng sử dụng nếu xảy ra tình trạng kích ứng

- Để xa tầm tay trẻ em.

- Sau khi mở sản phẩm, nên giữ sản phẩm ở trạng thái kín (tránh tiếp xúc không khí, nước) để tiếp tục sử dụng vào những lần kế tiếp.', N'Xuất xứ: Trung Quốc', 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MaThuongHieu], [NguyenGia], [HinhAnh], [ThongTinSanPham], [CongDungSanPham], [ThanhPhanSanPham], [HuongDanSuDungSanPham], [XuatXu], [SoLuong]) VALUES (N'SP0011', N'Nước Tẩy Trang Dưỡng Ẩm Cho Da Thường, Khô L''Oreal Paris Micellar Water 3-In-1 Moisturizing Even For Sensitive Skin 400Ml', N'TH003', 179000, N'image\hinh11.jpg', N'Với công nghệ mới nhất, Nước tẩy trang thương hiệu L''Oreal Paris 3-in-1 Micellar Water đa tác dụng vừa giúp làm sạch lấy đi sạch cặn trang điểm những vẫn giúp da giữ ẩm, thông thoáng và mềm mượt chỉ trong một bước', N'CÔNG DỤNG CHÍNH – MAIN FUNCTION 
Với kết cấu hai lớp chất lỏng, giúp hòa tan chất bẩn và loại bỏ toàn bộ lớp trang điểm hiệu quả, kể cả lớp trang điểm lâu trôi và không thấm nước chỉ trong một bước.
Lớp Micellar chứa các hạt mixen siêu nhỏ để len lỏi sâu và dễ dàng lấy đi bụi bẩn, dầu thừa, lớp trang điểm và chất bẩn khác mà không làm khô da.
Công nghệ Mi-xen đột phá giúp hút sạch cặn trang điểm, bụi bẩn mà không làm khô căng da.
Thành phần chiết xuất hoa hồng Pháp giúp cấp ẩm cho làn da ẩm mượt sau khi tẩy trang.', NULL, N'Lắc đều
- Cho sản phẩm vào bông tẩy trang rồi nhẹ nhàng lau lên mặt, mắt và môi theo chuyển động tròn
- không cần rửa lại với nước', N'Xuất xứ: France', 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MaThuongHieu], [NguyenGia], [HinhAnh], [ThongTinSanPham], [CongDungSanPham], [ThanhPhanSanPham], [HuongDanSuDungSanPham], [XuatXu], [SoLuong]) VALUES (N'SP0012', N'Kem Chống Nắng L''Oreal Mỏng Nhẹ Bảo Vệ Tối Đa Uv Defender Invisible Fluid SPF50+ PA++++ 50Ml', N'TH003', 299000, N'image\hinh12.jpg', N'Kem Chống Nắng thương hiệu L’Oreal Paris UV Defender Serum Invisible Fluid SPF50+ PA++++ x20 Mỏng Nhẹ (Mới) sở hữu màng bảo vệ UV mạnh mẽ, giúp cản nắng tối đa nhưng vẫn nhẹ nhàng trên da. Với chỉ số chống nắng SPF50+ và khả năng chống lại tia UVA dài, sả', N'20X kết cấu mỏng nhẹ: kem chống nắng dạng sữa lỏng, thẩm thấu nhanh và siêu mỏng nhẹ tựa như vô hình trên da, không gây nhờn dính.

Công nghệ Netlock độc quyền của L''Oreál: tạo lớp màng chắn UV mỏng nhẹ vô hình, giúp bảo vệ da tối đa khỏi tia UV, đặc biệt UVA dài có bước sóng từ 380nm - 400nm xâm nhập vào sâu trong da.

3X bền bỉ: với độ bám dính cao trên da, bền bỉ hơn dưới các tác động của ô nhiễm / độ ẩm / nhiệt độ cao, chống nước và mồ hôi, duy trì khả năng bảo vệ suốt cả ngày dài.

3 không: không dính, không vệt trắng, không bóng.', NULL, N'Dùng 1 lượng kem vừa đủ và chia đều trên mặt và cổ, sau đó thoa đều nhẹ nhàng khắp mặt và cổ.
- Sử dụng vào ban ngày, trước khi ra nắng 30 phút, sau các bước dưỡng da thông thường, và trước các bước trang điểm tiếp theo (nếu có).', N'Xuất xứ: France', 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MaThuongHieu], [NguyenGia], [HinhAnh], [ThongTinSanPham], [CongDungSanPham], [ThanhPhanSanPham], [HuongDanSuDungSanPham], [XuatXu], [SoLuong]) VALUES (N'SP0013', N'Serum Siêu Cấp Ẩm Hỗ Trợ Sáng Da L''Oréal Paris Pure Hyaluronic Acid 1.5% 30Ml', N'TH003', 379000, N'image\hinh13.jpg', N'Tinh Chất Hyaluronic Acid Cấp Ẩm Sáng Da L''Oreal Revitalift 1.5% Hyaluronic Acid là dòng sản phẩm serum đến từ thương hiệu L''Oréal Paris nổi tiếng của Pháp, chứa 2 loại Hyaluronic Acid cô đặc ở nồng độ 1.5% giúp cung cấp độ ẩm tối đa cho làn da căng mịn v', N'Giải pháp cho tình trạng da thiếu ẩm - thiếu nước, xỉn màu, thiếu sức sống, lão hóa & nếp nhăn, kém đàn hồi săn chắc', N'Aqua/Water, Glycerin, Hydroxyethylpiperazine Ethane Sulfonic Acid, Sodium Hyaluronate, Peg-60 Hydrogenated Castor Oil, Secale Cereale Seed Extract / Rye Seed Extract, Calcium Pantothenate, Dipeptide Diaminobutyroyl Benzylamide Diacetate, Ascorbyl Glucoside, Disodium Edta, Pentylene Glycol, Phenoxyethanol, Chlorphenesin', N'Sau khi làm sạch và sử dụng nước hoa hồng để cân bằng da, lấy một lượng tinh chất vừa đủ thoa đều lên da và massage nhẹ nhàng theo kết cấu da để dưỡng chất được thẩm thấu tối đa', N'Xuất xứ: France', 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MaThuongHieu], [NguyenGia], [HinhAnh], [ThongTinSanPham], [CongDungSanPham], [ThanhPhanSanPham], [HuongDanSuDungSanPham], [XuatXu], [SoLuong]) VALUES (N'SP0014', N'Dầu Gội L''Oreal Paris Extraordinary Oil Dưỡng Tóc Suôn Mượt Tóc Cao Cấp 440Ml', N'TH003', 205000, N'image\hinh14.jpg', N'Dầu Gội Dưỡng Tóc Suôn Mượt L''Oreal Paris Extraordinary Oil Cao Cấp đến từ thương hiệu mỹ phẩm L''Oreal Paris, với thành phần được chiết xuất từ 100% tinh dầu gỗ tuyết tùng tự nhiên từ Pháp dưỡng ẩm sâu cho tóc khô và xơ rối, giúp tóc suôn mượt và ngăn ngừ', N'Giúp dưỡng ẩm sâu cho tóc khô và xơ rối

- Giúp tóc suôn mượt và ngăn ngừa tóc chẻ ngọn.
', N'Aqua/Water, Sodium Laureth Sulfate, Citric Acid, Cocamidopropyl Betaine, Sodium Chloride, Ammonium Hydroxide, Hexylene Glycol, Ci 15985/Yellow 6, Ci 19140/Yellow 5, Sodium Benzoate, Sodium Hydroxide, Sodium Acetate, Cedrus Atlantica Bark Oil, Polyquaternium-10, Salicylic Acid, Limonene, Menthol, Linalool, Propylene Glycol, Isopropyl Alcohol, 2-Oleamido-1,3-Octadecanediol,  Parfum, Piroctone Olamine, Coumarin, Lavandula Angustifolia Oil/Lavender Oil, Hexyl Cinnamal.', N'CÁCH DÙNG – DIRECTION FOR USE

Nhẹ nhàng cho dầu gội lên tóc và massage nhẹ nhàng da đầu tạo bọt.
Xả sạch dầu gội với nước lạnh.
Để có kết quả tối ưu, hãy sử dụng với Dầu xả dưỡng tóc suôn mượt tóc cao cấp L''Oreal Paris Extraordinary Oil Sleek Nourishing Conditioner 440ml.
Lưu ý: 

Để xa tầm tay trẻ em.
Tránh ánh nắng trực tiếp hoặc nhiệt độ cao.', N'Xuất xứ: France', 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MaThuongHieu], [NguyenGia], [HinhAnh], [ThongTinSanPham], [CongDungSanPham], [ThanhPhanSanPham], [HuongDanSuDungSanPham], [XuatXu], [SoLuong]) VALUES (N'SP0015', N'Kem Nền Lâu Trôi Loreal Infallible 24H Fresh Wear Spf25 Pa+++ #120 Vanilla Giúp Làm Sáng 30Ml', N'TH003', 359000, N'image\hinh15.jpg', N'Kem nền L''Oreal Infallible 24H Fresh Wear là kem nền đến từ thương hiệu L''Oreal với công nghệ Oxygen Techology đột phá mới giúp lớp nền thoáng mịn, lâu trôi suốt 24H, đồng thời mang đến độ che phủ hoàn hảo. Công thức chống thấm nước, không lem không trôi,', N'Kem Nền Trang Điểm Infallible Giúp Làn Da Mịn Mượt Và Lâu Trôi

- Chất kem mịn mượt, dễ tán đều và có độ bám tốt trên da, giúp hạn chế da bị xuống tông màu sau một thời gian trang điểm.

- Giúp che phủ các khuyết điểm trên khuôn mặt như: mụn, vết thâm,...

- Thành phần chiết xuất từ các loại khoáng chất thiên nhiên nên đảm bảo không gây hại cho da.

- Công thức không chứa dầu giúp lớp nền trang điểm mịn mượt, tự nhiên, hạn chế tình trạng bóng nhờn.

- Kem nền giúp kiểm soát dầu nhờn trên da, không nhờn rít, khó chịu.', N'Aqua / Water, Dimethicone, Isododecane, Alcohol Denat., Ethylhexyl Methoxycinnamate, Trimethylsiloxysilicate, Butylene Glycol, Titanium Dioxide, Peg-10 Dimethicone, Perlite, Synthetic Fluorphlogopite, Nylon-12, Isopropyl Lauroyl Sarcosinate, Diisopropyl Sebacate, Disteardimonium Hectorite, Hdi/Trimethylol Hexyllactone Crosspolymer, Bis-Peg/Ppg-14/14 Dimethicone, Magnesium Sulfate, Aluminum Hydroxide, Phenoxyethanol, Disodium Stearoyl Glutamate, Hydrogen Dimethicone, Dipentaerythrityl Tetrahydroxystearate/Tetraisostearate, Parfum / Fragrance, Silica Silylate, Acrylonitrile/Methyl Methacrylate/Vinylidene Chloride Copolymer, Tocopherol, Silica, Isobutane, Bht, Ci 77891 / Titanium Dioxide, Ci 77491, Ci 77492, Ci 77499 / Iron Oxides, Hexyl Cinnamal, Benzyl Salicylate, Linalool, Alpha-Isomethyl Ionone, Benzyl Alcohol, Citronellol', N'CÁCH DÙNG – DIRECTION FOR USE 

- Lấy một lượng sản phẩm vừa đủ
- Dùng cọ hoặc đầu ngón tay thoa đều lên mặt', N'Xuất xứ: France', 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MaThuongHieu], [NguyenGia], [HinhAnh], [ThongTinSanPham], [CongDungSanPham], [ThanhPhanSanPham], [HuongDanSuDungSanPham], [XuatXu], [SoLuong]) VALUES (N'SP0016', N'Dầu Dưỡng Tóc L''Oréal Paris Elseve Extraordinary Oil Từ Tinh Dầu Hoa Tự Nhiên 100ml', N'TH003', 239000, N'image\hinh16.jpg', N'Sản phẩm dầu dưỡng tóc từ tinh dầu hoa thiên nhiên của L''oreal - bao gồm dầu gội và dầu dưỡng với thành phần có chứa dưỡng chất 6 loại hoa tự nhiên: dầu argan, hoa hồng, hoa sen, hoa hướng dương, hoa cúc và đậu nành, có công dụng rất tốt trong việc nuôi d', N'Chiết xuất từ 6 loại hoa thiên nhiên giúp nuôi dưỡng mái tóc mềm mại, suôn mượt
Thành phần dưỡng ẩm Giúp Phục Hồi tóc khô xơ, hư tổn
Nuôi dưỡng tóc chắc khỏe, bồng bềnh, giảm thiểu tình trạng rụng tóc', NULL, N'CÁCH DÙNG 

Dùng 3 - 4 giọt tinh dầu lên tóc. Dầu dưỡng tóc có thể sử dụng theo 7 cách:
- Trước khi gội đầu để tăng cường dưỡng chất cho tóc.
- Khi tóc ướt để giữ nếp cho tóc.
- Trước khi sấy tóc để bảo vệ tóc khỏi gãy rụng.
- Sử dụng cho ngọn tóc để tránh chẻ ngọn.
- Sử dụng cho tóc khô, hư tổn nhằm giúp tóc khỏe mạnh, bóng mượt hơn.
- Trộn với kem nhuộm tóc để bảo vệ tọc khỏi hư tổn.
- Trộn với dầu gội, dầu xả, kem ủ để tăng cường dưỡng chất.', N'Xuất xứ: France', 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MaThuongHieu], [NguyenGia], [HinhAnh], [ThongTinSanPham], [CongDungSanPham], [ThanhPhanSanPham], [HuongDanSuDungSanPham], [XuatXu], [SoLuong]) VALUES (N'SP0017', N'Nước Tẩy Trang L’Oréal Paris Revitalift Crystal Purifying Micellar Water Cho Da Dầu 400Ml', N'TH003', 209000, N'image\hinh17.jpg', N'Nước Tẩy Trang Làm Sạch Cho Da Dầu Revitalift Crystal Purifying Micellar Water L''OREAL 400Ml là nước tẩy trang dành cho da dầu với công dụng hỗ trợ làm sạch sâu lỗ chân lông, nhẹ nhàng chăm sóc làn da, góp phần lấy đi các tạp chất nhỏ nhất, bã nhờn dư thừ', N' Là dòng nước tẩy trang cao cấp dành cho da dầu với khả năng làm sạch sâu gấp 5 lần tẩy trang thông thường, chứa vô số phân tử siêu nhỏ với khả năng hút sạch những tạp chất, bã nhờn nằm sâu trong lỗ chân lông, đồng thời cấp nước và làm mềm da, có thể sử dụng để làm sạch da mà không cần rửa mặt lại với nước
- Có chứa vô số phân tử Mixen siêu nhỏ với 1 cực ưa dầu có khả năng hút mọi bụi bẩn, dầu thừa, lớp trang điểm và 1 cực ưa nước giúp mixen dễ hòa tan và cuốn trôi mọi bụi bẩn. Đây là công nghệ được sử dụng đầu tiên tại Paris, là giải pháp giúp mang lại làn da sạch nhanh chóng
- Nhẹ nhàng làm sạch đi 5 tạp chất gây tắc nghẽn lỗ chân lông gồm: Bụi mịn từ không khí ô nhiễm, cặn trang điểm, kem chống nắng có độ bám cao, bã nhờn và dầu thừa cho làn da sạch khỏe và tươi mát', NULL, N'CÁCH DÙNG – DIRECTION FOR USE 

Đổ 1 lượng vừa đủ vào bông tẩy trang và lau đều khắp mặt theo chiều kết cấu da để làm sạch hoàn toàn bụi bẩn và lớp trang điểm và bụi bẩn', N'Xuất xứ: France', 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MaThuongHieu], [NguyenGia], [HinhAnh], [ThongTinSanPham], [CongDungSanPham], [ThanhPhanSanPham], [HuongDanSuDungSanPham], [XuatXu], [SoLuong]) VALUES (N'SP0018', N'Dầu Xả Bảo Vệ Dành Cho Tóc Nhuộm L''Oréal Paris 280Ml', N'TH003', 111000, N'image\hinh18.jpg', N'Đối với tóc nhuộm, việc gội và chải thường xuyên cùng với tác động bên ngoài của môi trường sẽ làm cho màu tóc mau phai. Dầu gội cho tóc nhuộm Dầu Gội Paris Bảo Vệ Và Giữ Màu Tóc Nhuộm L''ORÉAL 280Ml sẽ giúp chăm sóc tóc nhuộm một cách chuyên nghiệp và hiệ', N'Nuôi dưỡng tối ưu: Công thức với các thành phần nuôi dưỡng vượt trội, giúp chăm sóc cho tóc và làm tóc mềm mượt hơn trông thấy
- Bảo vệ màu nhuộm: Màng lọc tia UV, giúp bảo vệ tóc khỏi tia UVA & UVB, cùng những tác nhân gây hại bên ngoài
- Dầu gội giữ màu Color Vive của thương hiệu Mỹ Phẩm Loreal từ L oreal Việt Nam, một trong những nhãn hiệu dầu gội hàng đầu trên thế giới, giúp chăm sóc tóc nhuộm một cách chuyên nghiệp và hiệu quả', NULL, N'CÁCH DÙNG – DIRECTION FOR USE 

Sau khi đã sử dụng dầu gội giúp làm sạch tóc, thoa nhẹ dầu xả lên tóc ướt, massage nhẹ nhàng từ 3 - 5 phút, sau đó xả lại với nước sạch', N'Xuất xứ: France', 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MaThuongHieu], [NguyenGia], [HinhAnh], [ThongTinSanPham], [CongDungSanPham], [ThanhPhanSanPham], [HuongDanSuDungSanPham], [XuatXu], [SoLuong]) VALUES (N'SP0019', N'Son Kem Lì L’Oréal Chiffon Signature Lip Gloss 224 Roll Hồng Nude 7Ml', N'TH003', 239000, N'image\hinh19.jpg', N'Son mịn lì cao cấp L’Oréal Paris Chiffon Signature Matte Liquid Lipstick là bộ sưu tập son tint mới từ thương hiệu L’Oréal Paris, với kết cấu son mỏng nhẹ như không, cho bạn cảm giác đôi môi mềm mại, mịn màng như nhung trong suốt thời gian sử dụng. ', N'Bộ sưu tập Chiffon Signature mới với 9 tông màu son kem thời thượng, nổi bật cho nàng dễ dàng chọn lựa
Kết cấu son siêu nhẹ như mây và có độ dưỡng ẩm, cho cảm giác cực kỳ thoải mái khi thoa, môi "trần" nhẹ tênh', NULL, N'CÁCH DÙNG:

- Thoa son dưỡng nếu môi bạn bị khô
- Dùng cọ lấy lượng son vừa đủ
- Đánh full môi hay chỉ đánh lòng môi tùy sở thích
- Chất son cực mịn và mỏng nhẹ, dễ tán nên đặc biệt phù hợp khi đánh lòng môi', N'Xuất xứ: France', 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MaThuongHieu], [NguyenGia], [HinhAnh], [ThongTinSanPham], [CongDungSanPham], [ThanhPhanSanPham], [HuongDanSuDungSanPham], [XuatXu], [SoLuong]) VALUES (N'SP0020', N'Phấn Nền Siêu Che Phủ Kiềm Dầu L''Oreal Infallible 24H Oil Killer High Coverage Powder #110 Rose Vanilla 6Gr', N'TH003', 249000, N'image\hinh20.jpg', N'Phấn Nền Siêu Che Phủ Kiềm Dầu L''Oreal Infallible 24h Oil Killer High Coverage Powder #110 Rose Vanilla 6Gr

Phấn Nền Siêu Che Phủ Kiềm Dầu L''Oreal Paris Infallible Lasting Powder với khả năng kiểm soát dầu 24H, phấn phủ Infallible Lasting Powder SPF 32 P', N'Kiểm soát 24H: Được phủ bởi bột thấm dầu để tiệp da mịn lì ngay lập tức.
Độ che phủ cao cho lớp nền mịn lì hoàn hảo: chứa các vi sắc tố để làm mịn da và lỗ chân lông.
Chống nước, cách nhiệt và chống ẩm.
Công thức thoáng khí, không bí không lem khi đeo khẩu trang.
Kết cấu nhẹ che phủ đều. không bị vón cục, không bị khô. 
Có chỉ số chống nắng SPF32, PA+++.
Không gây mụn.', N'Thành phần chính:

Talc, Perlite, Titanium Dioxide, Kaolin, Homosalate, Ethylhexyl Triazone, Aluminum Hydroxide, Stearic Acid, Ethylhexyl Salicylate, Dimethicone, Caprylyl Glycol, Ethylhexylglycerin, Tocopherol, Silica.

Một số thành phần khác:

CI 77491, CI 77492, Ci 77499/Iron Oxides, CI 77891/Titanium Dioxide.', N'CÁCH DÙNG – DIRECTION FOR USE:

Dùng bông phấn lấy một lượng phấn nền.
Dặm đều lên mặt theo chuyển động tròn.
Sản phẩm có thể được sử dụng riêng hoặc thay thế kem nền dạng lỏng để có lớp nền mờ cả ngày.', N'Xuất xứ: France', 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MaThuongHieu], [NguyenGia], [HinhAnh], [ThongTinSanPham], [CongDungSanPham], [ThanhPhanSanPham], [HuongDanSuDungSanPham], [XuatXu], [SoLuong]) VALUES (N'SP0021', N'Xịt Khoáng Mineralizing Thermal Water Vichy 300Ml', N'TH002', 445000, N'image\hinh21.jpg', N'Xịt Khoáng Mineralizing Thermal Water Vichy 300Ml
Xịt Khoáng Dưỡng Da VICHY Eau Thermale Spa Water là xịt khoáng đến từ thương hiệu mỹ phẩm Vichy, với 15 khoáng chất quý hiếm bao gồm sắt, Potassium, canxi , manganese, silicon,.. được công nhận bởi tác dụn', N'Sản phẩm phù hợp cho mọi loại da
Giải pháp tình trạng da: Da mệt mỏi, thiếu sức sống, cảm giác da khô, thiếu nước
Giúp làm dịu da, hỗ trợ kháng viêm và hạn chế kích ứng
Bảo vệ da trước tác hại ô nhiễm môi trường, ổn định lại tình trạng cân bằng của da
Củng cố tăng cường khả năng phòng vệ của da, hỗ trợ tái tạo da
Tăng cường sức đề kháng, thúc đẩy sự trao đổi giữa các tế bào, tăng khả năng tái sinh cho làn da', N'Được làm giàu tự nhiên với 15 khoáng chất quý hiếm bao gồm sắt, potassium, canxi, manganese, silicon,...', N'CÁCH DÙNG – DIRECTION FOR USE
 
- Xịt khắp mặt 
- Vỗ nhẹ 
- Thấm khô
- Có thể sử dụng nhiều lần trong ngày', N'Xuất xứ: France', 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MaThuongHieu], [NguyenGia], [HinhAnh], [ThongTinSanPham], [CongDungSanPham], [ThanhPhanSanPham], [HuongDanSuDungSanPham], [XuatXu], [SoLuong]) VALUES (N'SP0022', N'Kem Dưỡng Ẩm Ngừa Lão Hóa Vichy 50Ml', N'TH002', 1048000, N'image\hinh22.jpg', N'Kem Dưỡng Ẩm Ngừa Lão Hóa Vichy Collagen Specialist 50Ml

Collagen Specialist 50Ml là sản phẩm dưỡng ẩm ngừa lão hóa được ra mắt năm 2019 của thương hiệu dược mỹ phẩm Vichy nổi tiếng tại Pháp. Sản phẩm thuộc dòng giúp ngừa lão hoá cao cấp Liftactiv với kh', N'Giúp thúc đẩy sản xuất collagen để giúp nâng cơ, củng cố chắc chắn sợi tế bào
Tăng cường độ đàn hồi, giảm sự xuất hiện của nếp nhăn
Định hình lại đường nét trên khuôn mặt
Cải thiện tông da sáng mịn, rạng rỡ
Làm mờ, đầy các nếp nhăn
Giúp kết cấu da đồng nhất
Dưỡng ẩm da suốt 48 giờ
Sau khi sử dụng, làn da nhìn sáng hơn, mềm mại và tươi trẻ hơn
Giúp làn da căng mịn hơn 52% ngay
Giảm nếp nhăn 16% sau 4 tuần và lên đến 24% sau 8 tuần sử dụng', N'2 hoạt chất Peptide: giúp kích hoạt sản sinh collagen trên da.
Vitamin CG: giúp da sáng mịn và cải thiện các nếp nhăn tiềm ẩn. Đây là một dạng tổng hợp của Vitamin C có khả năng mang lại những lợi ích dưỡng da tương tự như hỗ trợ làm chậm quá trình oxy hóa, bảo vệ da trước các gốc tự do gây hại, ngăn ngừa lão hóa da, mang lại làn da tươi sáng rạng rỡ hơn.
Nước khoáng núi lửa Vichy: được chứng minh khoa học giúp phục hồi và nuôi dưỡng da, sản phẩm được bác sĩ da liễu kiểm nghiệm', N'CÁCH DÙNG:

- Sử dụng buổi sáng, sau bước thoa tinh chất
- Lấy lượng kem bằng hạt bắp chấm lên 5 điểm: trán, mũi, cằm và hai bên má rồi thoa từ trong ra ngoài và từ trên xuống dưới

Bảo quản: Nơi khô ráo, thoáng mát. Tránh ánh nắng trực tiếp', N'Xuất xứ: France', 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MaThuongHieu], [NguyenGia], [HinhAnh], [ThongTinSanPham], [CongDungSanPham], [ThanhPhanSanPham], [HuongDanSuDungSanPham], [XuatXu], [SoLuong]) VALUES (N'SP0023', N'Kem Dưỡng Gel Sữa Cho Da Mụn Vichy 50Ml', N'TH002', 645000, N'image\hinh23.jpg', N'Kem dưỡng dạng gel sữa dành cho da mụn với tác động kép Vichy Normaderm Phytosolution Double-Correction Daily Care 50Ml của thương hiệu Vichy có thành phần hoạt tính hoàn toàn từ thiên nhiên, an toàn cho mọi loại da kể cả da nhạy cảm.

Kết cấu kem mỏng nh', N'Tác động kép:

Tác động chuyên biệt đối với mụn và khuyết điểm: Giảm mụn đầu đen, mụn ẩn, mụn trứng cá, làm mờ vết thâm mụn, thu nhỏ lỗ chân lông
Cải thiện chất lượng làn da: làm đều màu da, giảm bóng dầu, giúp phục hồi & dưỡng da ẩm mịn', N'Nước Khoáng Núi Lửa Vichy 60%: giúp củng cố & phục hồi hàng rào bảo vệ da
Salicylic Acid 2%: tẩy tế bào chết
Phyco Saccharide 0,055%: (bao gồm Zinc sulfate 0,005%, Hydrolyzed algin 0,05%): giảm tiết bã nhờn & tổn thương viêm
Hyaluronic Acid 0,2%: giữ ẩm giúp da trông căng mịn hơn
Probiotic Bifidus 0,9%: giảm tình trạng khô da', N'CÁCH DÙNG:

- Sử dụng sáng và tối, sau bước làm sạch da mặt 

- Lấy một lượng sản phẩm vừa đủ cỡ hạt đậu, chấm đều lên 5 điểm: trán, mũi, cằm và 2 bên má rồi nhẹ nhàng massage theo hình tròn, hướng lên trên (tránh thoa lên vùng mắt)

- Có thể sử dụng làm lớp nền trang điểm   ', N'Xuất xứ: France', 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MaThuongHieu], [NguyenGia], [HinhAnh], [ThongTinSanPham], [CongDungSanPham], [ThanhPhanSanPham], [HuongDanSuDungSanPham], [XuatXu], [SoLuong]) VALUES (N'SP0024', N'Kem Dưỡng Làm Giảm Nếp Nhăn & Nâng Mí Mắt Vichy 15Ml', N'TH002', 1600000, N'image\hinh24.jpg', N'Kem dưỡng giúp giảm nếp nhăn & săn chắc da vùng mắt Vichy Liftactiv Eyes Supreme Global Anti-Wrinkle & Firming Care 15Ml là gợi ý tuyệt vời dành cho bạn. Vichy Liftactiv Source Eye Cream chứa Rhamnose có tác dụng kích thích quá trình Giúp Tái Tạo Da, cùng', N'Giảm 85% nếp nhăn mí, 30% vết chân chim và thu nhỏ 70% bọng mắt chỉ sau 4 tuần sử dụng
Rhamnose là một loại đường thực vật tự nhiên 100%, có tác dụng làm dịu da, đồng thời kích thích quá trình Giúp Tái Tạo Da tại lớp Derm Source, làm giảm vết nhăn và làm săn chắc da
Caffeine giúp tăng tuần hoàn máu, xóa mờ quầng thâm
Escine làm giảm bọng mắt và hiện tượng sưng húp', N'Sự kết hợp của 3 hoạt chất hiệu quả cao nhưng vô cùng dịu nhẹ cho da vùng mắt:

- Rhamnose (hàm lượng 5%), một loại đường thực vật tự nhiên 100% vừa có tác dụng làm dịu da, vừa làm chậm quá trình lão hóa, chống nhăn vùng mắt bằng cách kích thích quá trình tái tạo da tại lớp Derm Source, cho hiệu quả làm chậm lão hóa da toàn diện: giảm vết nhăn và làm săn chắc da

- Caffeine xóa mờ quầng thâm, tăng tuần hoàn máu

- Escine làm giảm bọng mắt và hiện tượng sưng húp', N'CÁCH DÙNG

- Sử dụng 2 lần/ ngày, sáng và tối, trên làn da sạch, không trang điểm

- Lấy lượng sản phẩm vừa đủ, thoa lên vùng da quanh mắt và mát-xa nhẹ nhàng trong vài phút để dưỡng chất thẩm thấu sâu

Quy cách: Tuýp, 15Ml

Bảo quản: Nơi khô ráo, thoáng mát. Tránh ánh nắng trực tiếp', N'Xuất xứ: France', 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MaThuongHieu], [NguyenGia], [HinhAnh], [ThongTinSanPham], [CongDungSanPham], [ThanhPhanSanPham], [HuongDanSuDungSanPham], [XuatXu], [SoLuong]) VALUES (N'SP0025', N'Nước Cân Bằng Cấp Ẩm Dành Cho Da Nhạy Cảm Vichy 200Ml', N'TH002', 670000, N'image\hinh25.jpg', N'Nước cân bằng cấp ẩm dành cho da nhạy cảm Vichy Purete Thermale Perfecting Toner 200ml từ thương hiệu dược mỹ phẩm Vichy của Pháp, là sản phẩm thuộc dòng Purete Thermal làm sạch bề mặt da và lỗ chân lông. ', N'Nước cân bằng da giúp làm sạch sâu, loại bỏ những lớp bụi bẩn trên da. Phù hợp cho mọi loại da, ngay cả làn da nhạy cảm.
Với công thức gồm nước khoáng VICHY chứa 15 khoáng chất quý hiếm và Glycerin giúp cấp ẩm hiệu quả.
Giảm tình trạng khô da giúp cho da trông khỏe hơn, và sáng hơn.
Loại bỏ các tạp chất còn sót lại, kể cả cặn makeup và dầu thừa, làm sạch sâu lỗ chân lông.
Không chứa cồn và Paraben, không gây dị ứng.', N'Nước Khoáng Núi Lửa Vichy: giúp củng cố và phục hồi hàng rào bảo vệ da
Glycerin: giàu bọt mịn, độ ẩm cao giảm khô căng da
', N'CÁCH DÙNG:

Sử dụng 2 lần/ngày với bông tẩy trang trên vùng da mặt và cổ.
Miết nhẹ từ vùng trong mặt ra ngoài, và từ dưới cổ lên trên 
Áp dụng sau khi sử dụng nước/sữa tẩy trang VICHY để hiệu quả được tốt nhất
Bảo quản: Nơi khô ráo, thoáng mát. Tránh ánh nắng trực tiếp

Quy cách: Chai, 200Ml', N'Xuất xứ: France', 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MaThuongHieu], [NguyenGia], [HinhAnh], [ThongTinSanPham], [CongDungSanPham], [ThanhPhanSanPham], [HuongDanSuDungSanPham], [XuatXu], [SoLuong]) VALUES (N'SP0026', N'Dầu Gội Giảm Gàu Vichy Dercos Dành Cho Da Đầu Dầu 200ml', N'TH002', 415000, N'image\hinh26.jpg', N'Dầu gội thuộc dòng Dercos là dòng chứa các hoạt chất được sử dụng rộng rãi trong ngành da liễu nhằm thúc đẩy và cải thiện da đầu và sợi tóc khỏe mạnh. Kết cấu sản phẩm dịu nhẹ, an toàn cho da nhạy cảm và đem lại kết quả rõ ràng từ gốc tới ngọn', N'Tuyến dầu dưới da đầu hoạt động chậm lại.

- Da đầu sạch, khỏe mạnh.

- Tăng độ dày của tóc.

- Kết quả lâm sàng đã được chứng minh.

- Cải thiện da đầu khoẻ mạnh, kiểm soát nhờn hiệu quả mang lại bộ tóc sạch khoẻ, khô thoáng.', N'Phức hợp Anti Sebum giúp kiểm soát bã nhờn, tuyến dầu dưới da đầu hoạt động chậm lại.', N'CÁCH DÙNG:

- Áp dụng cho tóc đã làm ướt. Thoa trực tiếp vào da đầu sau đó massage nhẹ nhàng làm sạch tuyến bã nhờn và bụi bẩn trên da đầu.

- Sử dụng 3 lần/1 tuần.', N'Xuất xứ: France', 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MaThuongHieu], [NguyenGia], [HinhAnh], [ThongTinSanPham], [CongDungSanPham], [ThanhPhanSanPham], [HuongDanSuDungSanPham], [XuatXu], [SoLuong]) VALUES (N'SP0027', N'Kem Chống Nắng Chống Ô Nhiễm Bụi Mịn Vichy Capital Soleil Spf50+ 50Ml', N'TH002', 585000, N'image\hinh27.jpg', N'Kem Chống Nắng thương hiệu Vichy Capital Soleil Chống Ô Nhiễm Bụi Mịn SPF50+ 50Ml dành cho da dầu mụn với kết cấu dạng kem cùng công nghệ tiên tiến, mang lại hiệu quả chống nắng và ngăn ngừa lão hóa hoàn hảo. Khả năng thẩm thấu tốt, không gây nhờn, bít tr', N'Đảm bảo khả năng bảo vệ da và chống lại các tia UV một cách hiệu quả, giảm thiểu tác hại của tia cực tím, ngăn ngừa sạm da, nám, tàn nhang
Lớp kem mịn tệp màu với da giúp thay thế lớp kem lót trang điểm cùng khả năng che khuyết điểm hoàn hảo, cho làn da luôn sáng khỏe tự nhiên', N'Aqua; Glycerin; Alcohol Denat; Butylene Glycol; Peg/Ppg/Polybutylene Glycol-8/5/3 Glycerin; Dimethicone; Isononyl Isononanoate; Ci 17200; Ci 42090; Dimethiconol; Sodium Hyaluronate; Phenoxyethanol; Ammonium Polyacryloyldimethyl Taurate; Disodium Edta', N'CÁCH DÙNG

- Bước 1: Làm sạch da và dưỡng da cơ bản
- Bước 2: Lấy một lượng sản phẩm vừa đủ ra tay
- Bước 3: Chấm đều các điểm lên vùng má, trán, cằm và cổ, thoa đều để làm đều màu và bảo vệ toàn diện

Quy cách: Tuýp, 50Ml

Bảo quản:
Bảo quản nơi khô ráo và tránh ánh nắng mặt trời.
Tránh ánh nắng trực tiếp mặt trời.
Đậy nắp kín sau khi sử dụng.

Lưu ý: Thoa lại mỗi 2-4 tiếng để mang lại hiệu quả chống nắng tốt nhất', N'Xuất xứ: France', 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MaThuongHieu], [NguyenGia], [HinhAnh], [ThongTinSanPham], [CongDungSanPham], [ThanhPhanSanPham], [HuongDanSuDungSanPham], [XuatXu], [SoLuong]) VALUES (N'SP0028', N'Dầu Gội Bưởi Cocoon 500Ml', N'TH004', 375000, N'image\hinh28.jpg', N'Từ tinh dầu vỏ bưởi Việt Nam truyền thống kết hợp với vitamin B5, hoạt chất dưỡng ẩm Xylishine™ cùng công thức dịu nhẹ không chứa sulfate, dầu gội bưởi giúp làm sạch tóc và giảm gãy rụng, mang lại mái tóc đen dày, chắc khoẻ và mượt mà', N'Làm sạch tóc với công thức dịu nhẹ không sulfate, không làm tổn thương da đầu.

Giải pháp giảm gãy rụng và làm mềm mái tóc.

Hỗ trợ sự phát triển của tóc, mang lại mái tóc đen dày và mềm mại.', N'Tinh dầu vỏ bưởi, Xylishine™, Vitamin B5 (D-panthenol), Axít amin', N'Thoa sản phẩm lên tóc ướt và tạo bọt, mát-xa nhẹ nhàng từ gốc đến ngọn, sau đó gội sạch

- Sử dụng hằng ngày để có kết quả tốt nhất

- Tránh tiếp xúc với mắt', N'Xuất xứ: Việt Nam', 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MaThuongHieu], [NguyenGia], [HinhAnh], [ThongTinSanPham], [CongDungSanPham], [ThanhPhanSanPham], [HuongDanSuDungSanPham], [XuatXu], [SoLuong]) VALUES (N'SP0029', N'Thạch Bí Đao Cocoon 30Ml', N'TH004', 195000, N'image\hinh29.jpg', N'Thạch Bí Đao Cocoon là sản phẩm kem dưỡng da đến từ thương hiệu mỹ phẩm Cocoon của Việt Nam, với sự kết hợp giữa chiết xuất bí đao thanh mát, 5α-AVOCUTA® được chưng cất phân tử từ dầu quả bơ và TECA™ trích ly từ rau má, mang lại độ ẩm cân bằng, giảm lượng', N'Chiết xuất bí đao có đặc tính Giúp Sạch Khuẩn, chống oxy hoá, làm dịu các đốm mụn sưng viêm
5α-AVOCUTA® (Butyl Avocadate) chiết xuất từ quả bơ giúp kiểm soát lượng dầu thừa, điều tiết bã nhờn và ngăn ngừa tình trạng mụn
TECA™ chiết xuất từ rau má Giúp Phục Hồi và làm lành các đốm mụn sưng viêm, tăng cường sản sinh collagen và hạn chế để lại thâm sẹo
Niacinamide tăng cường hàng rào bảo vệ da, giảm viêm và điều hoà sự tiết bã nhờn của da', N'Aqua/Water, Niacinamide, Butyl Avocadate, Butylene Glycol, Sodium Acrylates Copolymer, Betaine, Benincasa Cerifera Fruit Extract, Glycerin, Propanediol, Madecassic Acid, Asiatic Acid, Asiaticoside, Centella Asiatica Extract, Pentylene Glycol, Ferulic Acid, Potassium Azeloyl Diglycinate, Oleyl Erucate, Coco-Caprylate/Caprate, Dicaprylyl Carbonate, Epilobium Angustifolium Flower/Leaf/Stem Extract, Caprylic/Capric Triglyceride, Aloe Barbadensis Leaf Juice, Bisabolol, Glycereth-26, Lecithin, Phellodendron Amurense Bark Extract, Allantoin, Ethylhexylglycerin, Tocopherol, Hydroxyacetophenone, Trisodium Ethylenediamine Disuccinate, Phenoxyethanol, Melaleuca Alternifolia Leaf Oil, Rosmarinus Officinalis Leaf Oil', N'CÁCH DÙNG

- Thoa đều một lượng vừa đủ lên da mặt
- Dùng 2 lần mỗi ngày, sáng và tối để đạt hiệu quả tốt nhất
- Tránh vùng mắt

Lượng dùng

Một lượng bằng nửa đồng xu.

Quy cách: Hũ, 30Ml

Bảo quản:

- Nơi khô ráo, thoáng mát.

- Tránh ánh nắng trực tiếp', N'Xuất xứ: Việt Nam', 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MaThuongHieu], [NguyenGia], [HinhAnh], [ThongTinSanPham], [CongDungSanPham], [ThanhPhanSanPham], [HuongDanSuDungSanPham], [XuatXu], [SoLuong]) VALUES (N'SP0030', N'Tinh Chất Bí Đao Cocoon 70Ml', N'TH004', 295000, N'image\hinh30.jpg', N'Tinh Chất Bí Đao Cocoon Winter Melon Serum 70ml là sản phẩm tinh chất giúp chăm sóc da mụn của thương hiệu mỹ phẩm thuần chay Cocoon. Sản phẩm chứa các thành phần từ thực vật làm chủ đạo gồm chiết xuất bí đao, rau má, tràm trà và được bổ sung thêm 7% Niac', N'Làm mờ vết thâm
Cung cấp độ ẩm cho da
Làm thông thoáng lỗ chân lông
Cải thiện tình trạng mụn ẩn và mụn đầu đen
Làm dịu da, giảm các vết đỏ', N'Aqua/Water, Niacinamide, Salicylic Acid, Cocamidopropyl Dimethylamine, Benincasa Cerifera Fruit Extract, Centella Asiatica Extract, Butylene Glycol, Pentylene Glycol, Bisabolol, Zinc PCA, Phellodendron Amurense Bark Extract, Glycereth-26, Bis-PEG-18 Methyl Ether Dimethyl Silane, Melaleuca Alternifolia Leaf Oil, Lavandula Angustifolia Flower Oil, Rosmarinus Officinalis Leaf Oil, Phenoxyethanol, Trisodium Ethylenediamine Disuccinate, Ethylhexylglycerin, Farnesol', N'CÁCH DÙNG

- Lấy vài giọt tinh chất vào lòng bàn tay, xoa đều và mát-xa lên da mặt sạch, tránh vùng mắt.

- Sử dụng sáng và tối sau khi rửa mặt sạch và dùng toner.

Quy cách: Chai, 70Ml

Bảo quản: Bảo quản nơi thoáng mát, tránh tiếp xúc trực tiếp với ánh sáng mặt trời', N'Xuất xứ: Việt Nam', 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MaThuongHieu], [NguyenGia], [HinhAnh], [ThongTinSanPham], [CongDungSanPham], [ThanhPhanSanPham], [HuongDanSuDungSanPham], [XuatXu], [SoLuong]) VALUES (N'SP0031', N'Gel Rửa Mặt Bí Đao Cocoon 310Ml', N'TH004', 251000, N'image\hinh31.jpg', N'Sản phẩm chứa các thành phần tự nhiên gồm bí đao, rau má, tràm trà, bổ sung thêm Vitamin B3, B5, Betaine. Gel rửa mặt bí đao có pH 5.5 giúp làm sạch sâu bụi bẩn và dầu thừa, làm giảm việc hình thành mụn ẩn mà vẫn giữ được độ ẩm mịn tự nhiên và không gây k', N'Làm sạch sâu lỗ chân lông
- Giảm lượng dầu thừa tiết ra trên da
- Giảm mụn (đặc biệt là mụn ẩn)
- Giữ được độ ẩm mịn tự nhiên của da và không gây khô da sau khi sử dụng', NULL, N'CÁCH DÙNG – DIRECTION FOR USE
 
- Lấy một lượng vừa đủ mát-xa nhẹ nhàng trên da ướt. Rửa sạch lại với nước. Dùng buổi sáng và tối
 
Thành phần: Bí đao, Rau má, Tràm trà, Niacinamide, Panthenol
 
Quy cách: Chai, 310Ml

Bảo quản: Nơi khô ráo thoáng mát. Tránh ánh nắng trực tiếp, nơi có nhiệt độ caô', N'Xuất xứ: Việt Nam', 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MaThuongHieu], [NguyenGia], [HinhAnh], [ThongTinSanPham], [CongDungSanPham], [ThanhPhanSanPham], [HuongDanSuDungSanPham], [XuatXu], [SoLuong]) VALUES (N'SP0032', N'Nước Dưỡng Tóc Tinh Dầu Bưởi Cocoon 140ml', N'TH004', 157000, N'image\hinh32.jpg', N'Với tinh dầu bưởi nguyên chất từ vỏ bưởi, kết hợp với hoạt chất Xylishine (chiết xuất từ gỗ và tảo nâu Pelvetia Canaliculata) và Vitamin B5 (Panthenol), nước dưỡng tóc dầu bưởi của CoCoon giúp tóc giảm gãy rụng và khô xơ, cung cấp dưỡng chất giúp tóc luôn', N'Nuôi dưỡng da đầu và cung cấp độ ẩm cẩn thiết cho mái tóc.
Tăng cường độ bóng và chắc khỏe của tóc.
Cung cấp dưỡng chất giúp tóc suôn mượt và mềm mại.', NULL, N'Lắc đều chai trước khi vặn đầu vòi để mở. 
- Sau đó, cầm dốc ngược sản phẩm sao cho đầu vòi tiếp xúc với da đầu, di chuyển chuyển vòi và cảm nhận nước dưỡng tóc phủ đều trên da đầu. 
- Dùng ngón tay mát-xa để sản phẩm thẩm thấu. 
- Dùng trên tóc khô và sạch, 2 lần mỗi ngày vào sáng và tối để mang lại hiệu quả tốt nhất.

Quy cách: Chai, 140ml

Bảo quản: Bảo quản ở nhiệt độ phòng, tránh ánh sáng trực tiếp, tránh xa tầm với trẻ em

Lưu ý: Tránh để sản phẩm tiếp xúc với mắt.', N'Xuất xứ: Việt Nam', 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MaThuongHieu], [NguyenGia], [HinhAnh], [ThongTinSanPham], [CongDungSanPham], [ThanhPhanSanPham], [HuongDanSuDungSanPham], [XuatXu], [SoLuong]) VALUES (N'SP0033', N'Dầu Xả Bưởi Giúp Giảm Gãy Rụng, Nuôi Dưỡng Tóc Cocoon 310ml', N'TH004', 185000, N'image\hinh33.jpg', N'Sự kết hợp hài hoà giữa tinh dầu bưởi Việt Nam truyền thống, vitamin B5 và hoạt chất dưỡng ẩm Xylishine™ đã tạo nên dầu xả bưởi của thương hiệu Cocoon giàu dưỡng chất giúp giảm gãy rụng và làm mềm từng sợi tóc, mang lại mái tóc mượt mà và nhẹ nhàng sau kh', N'Giảm gãy rụng và làm mềm tóc.
Cung cấp dưỡng chất và bổ sung độ ẩm cho tóc.
Mang lại mái tóc mềm mại và suôn mượt sau khi xả.', NULL, N'CÁCH DÙNG:

- Thoa sản phẩm lên tóc ướt, mát-xa nhẹ nhàng lên thân tóc, sau đó xả sạch lại với nước.

- Sử dụng hằng ngày để có kết quả tốt nhất.

- Tránh tiếp xúc với mắt.

Lượng dùng: Từ 2-3 lần nhấn.

Kết cấu: Dạng kem đặc màu trắng ngà.

Mùi hương: Mùi tinh dầu bưởi thơm mát.

Lưu ý: Tránh dùng vùng mắt, chỉ dùng ngoài da

Bảo quản: Bảo quản nơi khô thoáng, tránh ánh nắng trực tiếp ', N'Xuất xứ: Việt Nam', 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MaThuongHieu], [NguyenGia], [HinhAnh], [ThongTinSanPham], [CongDungSanPham], [ThanhPhanSanPham], [HuongDanSuDungSanPham], [XuatXu], [SoLuong]) VALUES (N'SP0034', N'Nước Hoa Hồng Không Mùi Dưỡng Ẩm Và Làm Mềm Da Dear Klairs Supple Preparation Unscented Toner 180Ml', N'TH005', 244000, N'image\hinh34.jpg', N'Nước hoa hồng không mùi Dear Klairs dưỡng ẩm và làm mềm da Supple Preparation Unscented Toner có chiết xuất từ thực vật, giúp cân bằng độ pH, tăng cường hiệu quả chăm sóc da Toner có dạng trong suốt, không màu, lỏng, nhẹ, hơi nhớt, thấm rất nhanh trên da.', N'Cung cấp và duy trì độ ẩm cho da nhờ Hyaluronic acid, giữ cho da căng mọng mịn màng. 
Đồng thời có khả năng giúp giảm viêm và ngừa mụn hiệu quả, giúp da chống lại các tác động xấu từ môi trường và luôn khỏe mạnh
Giúp cân bằng độ PH của da với chiết xuất từ thực vật, không chứa hương liệu và tinh dầu, phù hợp với cả những làn da nhạy cảm nhất', N'Water, Butylene Glycol, Dimethyl Sulfone, Betaine, Caprylic/Capric Triglyceride, Natto Gum, Sodium Hyaluronate, Disodium EDTA, Centella Asiatica Extract, Glycyrrhiza Glabra (Licorice) Root Extract, Polyquaternium-51, Chlorphenesin, Tocopheryl Acetate, Carbomer, Panthenol, Arginine, Luffa Cylindrica Fruit/Leaf/Stem Extract, Beta-Glucan, Althaea Rosea Flower Extract, Aloe Barbadensis Leaf Extract, Hydroxyethylcellulose, Portulaca, Oleracea Extract, Lysine HCL, Proline, Sodium Ascorbyl Phosphate, Acetyl Methionine, Theanine, Copper Tripeptide-1
 ', N'CÁCH DÙNG – DIRECTION FOR USE
 
- Dùng sau sữa rửa mặt để cân bằng lại độ pH cho da.
- Thấm 3-4 giọt ra bông tẩy trang thoa đều lên mặt, hoặc đổ trực tiếp cho ra tay vỗ nhẹ để nước hoa hồng thấm đều vào da.

Quy cách: Chai, 180Ml
 
Bảo quản: Nơi khô ráo, thoáng mát. Tránh ánh nắng trực tiếp', N'Xuất xứ: Korea', 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MaThuongHieu], [NguyenGia], [HinhAnh], [ThongTinSanPham], [CongDungSanPham], [ThanhPhanSanPham], [HuongDanSuDungSanPham], [XuatXu], [SoLuong]) VALUES (N'SP0035', N'Tinh Chất Dưỡng Sáng Và Làm Đều Màu Da Freshly Juiced Vitamin Drop Dear Klairs 35Ml', N'TH005', 364000, N'image\hinh35.jpg', N'Tinh Chất Dưỡng Sáng Và Làm Đều Màu Da Freshly Juiced Vitamin Drop Dear Klairs 35Ml
Sản phẩm chứa 5% acid ascorbic phù hợp với mọi loại da và lứa tuổi ngay cả với những làn da nhạy cảm nhất. Klairs Freshly Juiced Vitamin Drop với thành phần 4 KHÔNG: ""khô', N'Siêu phẩm tăng năng lượng và Giúp Tái Tạo Da làn da với sức mạnh của vitamin C tươi tinh khiết. Đồng thời giúp Hỗ Trợ Se Khít Lỗ Chân Lông
 ', NULL, N'CÁCH DÙNG – DIRECTION FOR USE
 
- Dùng sau nước hoa hồng. Lấy một lượng vừa đủ (khoảng 2-3 giọt) cho ra tay rồi vỗ nhẹ lên mặt và cổ

Quy cách: Chai, 35Ml
 
Bảo quản: Nơi khô ráo, thoáng mát. Tránh ánh nắng trực tiếp', N'Xuất xứ: Korea', 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MaThuongHieu], [NguyenGia], [HinhAnh], [ThongTinSanPham], [CongDungSanPham], [ThanhPhanSanPham], [HuongDanSuDungSanPham], [XuatXu], [SoLuong]) VALUES (N'SP0036', N'Mặt Nạ Ngủ Dưỡng Ẩm & Sáng Da Freshly Juiced Vitamin E Mask Dear Klairs 90Ml', N'TH005', 436000, N'image\hinh36.jpg', N'Klairs Freshly Juiced Vitamin E Mask chứa hàm lượng cao Vitamin E – hoạt chất chống oxy hóa mạnh mẽ vốn được biết đến nhờ khả năng làm chậm quá trình lão hóa tế bào, duy trì sự tươi trẻ và rạng rỡ cho làn da. Kết hợp với thành phần Niacinamide (Vitamin B3', N'Dưỡng ẩm và làm mềm da, duy trì làn da luôn căng mọng mịn màng.
Hỗ trợ ngăn ngừa lão hóa da, ngăn ngừa hình thành nếp nhăn.
Hỗ trợ tái tạo làn da, cải thiện kết cấu da trở nên săn chắc hơn.
Dưỡng sáng, làm đều màu da, làm mờ các đốm sắc tố trên da.
Chứa hàm lượng cao Vitamin E có khả năng ổn định thành phần Vitamin C và giúp Vitamin C hoạt động tốt hơn, vì vậy thích hợp để sử dụng kèm với serum Vitamin C mà bạn yêu thích.', N'Water, Glycerin, Butylene Glycol, Tocopheryl Acetate, Niacinamide, Sodium Hyaluronate, Carrageenan, Gellan Gum, Betaine, Algin, Mannan, Ceramide NP, PEG-60 Hydrogenated Castor Oil, Acrylates/C10-30 Alkyl Acrylate Crosspolymer, Chlorphenesin, Arginine, Ethylhexylglycerin, Centella Asiatica Extract, Rubus Fruticosus (Blackberry) Fruit Extract, Salicornia Herbacea Extract, Phragmites Communis Extract, Adenosine, Lavandula Angustifolia (Lavender) Oil, Eucalyptus Globulus Leaf Oil, Pelargonium Graveolens Flower Oil, Citrus Limon (Lemon) Peel Oil, Citrus Aurantium Dulcis (Orange) Peel Oil, Cananga Odorata Flower Oil', N'CÁCH DÙNG

- Sử dụng 2 lần/ ngày, sáng và tối. Bước cuối cùng trong quy trình dưỡng da, ban ngày lấy một lượng vừa đủ thoa đều và vỗ nhẹ khắp mặt, buổi tối có thể sử dụng một lượng nhiều hơn như mặt nạ ngủ

Quy cách: Hũ, 90Ml

Bảo quản: Nơi khô ráo, thoáng mát. Tránh ánh nắng trực tiếp

Lưu ý: Để xa tầm tay trẻ em', N'Xuất xứ: Korea', 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MaThuongHieu], [NguyenGia], [HinhAnh], [ThongTinSanPham], [CongDungSanPham], [ThanhPhanSanPham], [HuongDanSuDungSanPham], [XuatXu], [SoLuong]) VALUES (N'SP0037', N'Kem Dưỡng Làm Dịu Và Giúp Phục Hồi Da Midnight Blue Calming Cream Dear Klairs 60Ml', N'TH005', 344000, N'image\hinh37.jpg', N' Kem Dưỡng Dear Klairs Làm Dịu Và Giúp Phục Hồi Da Midnight Blue Calming Cream 60ml được dùng vào bước cuối cùng của quy trình chăm sóc da , sau khi thực hiện các bước chăm sóc da hàng ngày
- Butylene Glycol, Glycerin, Sodium Hyaluronate: Cung cấp và duy ', N'Cetyl Ethylhexanoate, Stearic Acid: Điều tiết lượng dầu, nhờn cho da
- Morus Alba Root Extract: Thành phần có khả năng làm giúp sáng da và giúp da đều màu hơn
- Guaiazulene (chiết xuất hoa cúc La Mã): Cân bằng độ pH tự nhiên cho da và Giúp Phục Hồi Da sau các tổn thương.
- Niacinamide (hay được biết đến là một loại Vitamin B3): Làm tăng khả năng bảo vệ da tốt hơn nhờ “hàng rào” tự nhiên trên da
- Morus Alba Root Extract: Thành phần này có tác dụng giúp làm giúp làm sáng da
- Ceramide 3: Thành phần giúp tăng sức đề kháng, giúp da luôn khỏe mạnh, săn chắc
- Centella Asiatica Extract (Chiết xuất rau má): Làm dịu da, giảm thâm, nám. Đồng thời còn giúp cồi mụn lên nhanh hơn, hỗ trợ quá trình giảm mụn thêm hiệu quả hơn
 ', NULL, N'CÁCH DÙNG – DIRECTION FOR USE
 
Lấy một lượng kem vừa đủ ra tay. Sau đó chấm đều lên các điểm trên gương mặt: Trán, 2 bên má, cằm. Dùng tay massage cho kem dưỡng ẩm thẩm thấu vào da mặt
 
Quy cách: Tuýp, 60Ml
 
Bảo quản: Bảo quản nơi khô ráo, thoáng mát, tránh ánh sáng trực tiếp', N'Xuất xứ: Korea', 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MaThuongHieu], [NguyenGia], [HinhAnh], [ThongTinSanPham], [CongDungSanPham], [ThanhPhanSanPham], [HuongDanSuDungSanPham], [XuatXu], [SoLuong]) VALUES (N'SP0038', N'Kem Chống Nắng Ẩm Mượt, Làm Dịu Da Klairs All Day Airy Sunscreen SPF50+ PA++++ 50G', N'TH005', 384000, N'image\hinh38.jpg', N'Kem Chống Nắng Klairs All-day Airy Sunscreen SPF50+ PA++++ là sản phẩm kem chống nắng phiên bản mới được thương hiệu Klairs cho ra mắt chính thức vào tháng 05/2022. Với màng lọc hữu cơ phổ rộng và chỉ số SPF 50+ PA++++, Airy Sunscreen đã trải qua 3 xét ng', N'Màng lọc chống nắng hữu cơ phổ rộng và chỉ số SPF 50+ PA ++++ giúp bảo vệ da trước tác hại của tia UVA, UVB.
Panthenol & Allantoin bổ sung độ ẩm nhẹ cho da mềm mượt.
Thành phần chiết xuất thực vật có khả năng hỗ trợ làm chậm quá trình oxy hóa, làm dịu và hạn chế mẩn đỏ do tia UV.', NULL, N'CÁCH DÙNG – DIRECTION FOR USE:

Sử dụng mỗi ngày, sau bước làm sạch da.
Bôi kem 30 - 45 phút trước khi tiếp xúc với ánh nắng mặt trời để đạt hiệu quả tốt nhất.
Sử dụng lại sau mỗi 4 giờ để tăng hiệu quả bảo vệ làn da.
Tham khảo một số sản phẩm chăm sóc cơ thể khác tại đây.

Bảo quản:

Bảo quản nơi khô ráo, thoáng mát, tránh ánh nắng trực tiếp hoặc nơi có nhiệt độ cao/ẩm ướt.
Tránh xa tầm tay trẻ em.
Đậy nắp kín sau khi sử dụng.
Quy cách: Tuýp, 50g.', N'Xuất xứ: Korea', 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MaThuongHieu], [NguyenGia], [HinhAnh], [ThongTinSanPham], [CongDungSanPham], [ThanhPhanSanPham], [HuongDanSuDungSanPham], [XuatXu], [SoLuong]) VALUES (N'SP0039', N'Kem Dưỡng Mắt Cải Thiện Nếp Nhăn Fundamental Nourishing Eye Butter Dear Klairs 20Gr', N'TH005', 510000, N'image\hinh39.jpg', N'Kem Dưỡng Mắt Cải Thiện Nếp Nhăn Fundamental Nourishing Eye Butter Dear Klairs 20Gr chứa dầu hạt hướng dương giàu vitamin A và vitamin E để bảo vệ vùng da mỏng xung quanh mắt của bạn và đồng thời chứa các peptide giúp cải thiện nếp nhăn. Sản phẩm phù hợp ', N'4 loại peptide (Acetyl Hexapeptide-8, Copper Tripeptide-1, Oligopeptide-29, Oligopeptides-32) cho đôi mắt long lanh: Chứa quad-peptide và dầu hạt hướng dương hỗ trợ làm chậm quá trình oxy hóa vùng da quanh mắt
- Kết cấu dạng bơ giúp hấp thụ nhanh chóng nên bạn có thể thoa kem dưỡng mắt ngay trước khi trang điểm
- Cải thiện nếp nhăn và độ đàn hồi, bạn có thể thoa kem ở vùng da quanh cổ để cải thiện nếp nhăn', NULL, N'CÁCH DÙNG – DIRECTION FOR USE
 
- Thoa toner sau khi rửa mặt
- Ở bước dưỡng ẩm, thoa một lượng vừa đủ sản phẩm kem mắt quanh mắt
- Kết thúc qui trình dưỡng da của bạn với kem dưỡng ẩm cho da mặt

Quy cách: Tuýp, 20Gr
 
Bảo quản: Bảo quản nơi khô ráo, thoáng mát, tránh ánh sáng trực tiếp', N'Xuất xứ: Korea', 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MaThuongHieu], [NguyenGia], [HinhAnh], [ThongTinSanPham], [CongDungSanPham], [ThanhPhanSanPham], [HuongDanSuDungSanPham], [XuatXu], [SoLuong]) VALUES (N'SP0040', N'Dầu Tẩy Trang Klairs Làm Sạch Sâu Cho Mọi Loại Da Gentle Black Deep Cleansing Oil 150Ml', N'TH005', 340000, N'image\hinh40.jpg', N'Dầu Tẩy Trang Làm Sạch Sâu Cho Mọi Loại Da Klairs Gentle Black Deep Cleansing Oil 150ml là sản phẩm tẩy trang mặt đến từ thương hiệu Klairs của Korea, với chiết xuất từ 6 loại dầu thực vật có khả năng làm sạch sâu cho da, loại bỏ các lớp trang điểm “cứng ', N'Dầu tẩy trang Klairs Gentle Black Deep Cleansing Oil làm sạch và dưỡng ẩm cho da.
Chứa thành phần tinh dầu Jojoba thích hợp để sử dụng cho da nhạy cảm, nhẹ nhàng và không gây nhờn dính.
Thành phần Bơ hạt mỡ (shea butter) và dầu hạt nam việt quất có khả năng chống oxy hóa tốt, dưỡng da mềm mịn.', NULL, N'CÁCH DÙNG 

- Lấy hai pumps, cho ra tay sạch và khô, massage lên mặt khô khoảng 2 phút. Lấy một ít nước ấm massage tiếp 1p. Rửa lại bằng sữa rửa mặt

Quy cách: Chai, 150Ml

Bảo quản: Nơi khô ráo, thoáng mát. Tránh ánh nắng trực tiếp

Lưu ý: Để xa tầm tay trẻ em', N'Xuất xứ: Korea', 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MaThuongHieu], [NguyenGia], [HinhAnh], [ThongTinSanPham], [CongDungSanPham], [ThanhPhanSanPham], [HuongDanSuDungSanPham], [XuatXu], [SoLuong]) VALUES (N'SP0041', N'Bộ Acnes Du Lịch Travel Set Acnes', N'TH006', 109000, N'image\hinh41.jpg', N'Set sản phẩm này gồm 4 bước chăm da mặt và cơ thể căn bản nhưng không thể thiếu cho da mụn: Sửa rửa mặt Creamy Wash. Lotion cân bằng độ ẩm Soothing Lotion. Gel giảm mụn Acnes Sealing Gel. Sữa tắm giảm mụn Acnes Body Shower', N'Du lịch luôn là sở thích và niềm đam mê bất tận của các bạn teen.
Nhưng dù đi nhiều nơi, dừng chân ở nhiều điểm đến khác nhau, Bạn vẫn luôn cần dùng cùng 1 dòng sản phẩm chăm sóc cho làn da dễ nổi mụn và cũng thật nhạy cảm của mình
Teen đi du lịch, nhưng mụn thì không
Nắm bắt được nhu cầu đó , Acnes giới thiệu sản phẩm chăm sóc da mụn mới gọn nhẹ, dễ mang theo cất giữ trong hành lý du lịch: Acnes Travel Set
 ', N'Set sản phẩm này gồm 4 bước chăm da mặt và cơ thể căn bản nhưng không thể thiếu cho da mụn: Sửa rửa mặt Creamy Wash. Lotion cân bằng độ ẩm Soothing Lotion. Gel giảm mụn Acnes Sealing Gel. Sữa tắm giảm mụn Acnes Body Shower', N'Quy cách: Bộ, 1 Bộ 4 sản phẩm

Bảo quản: Nơi khô ráo thoáng mát. Tránh ánh nắng trực tiếp, nơi có nhiệt độ cao', N'Xuất xứ: Việt Nam', 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MaThuongHieu], [NguyenGia], [HinhAnh], [ThongTinSanPham], [CongDungSanPham], [ThanhPhanSanPham], [HuongDanSuDungSanPham], [XuatXu], [SoLuong]) VALUES (N'SP0042', N'Kem Rửa Mặt Vitamin Cleanser Acnes 50Gr', N'TH006', 41000, N'image\hinh42.jpg', N'Kem Rửa Mặt Acnes Vitamin Cleanser với các thành phần vitamin cần thiết như: Vitamin A, E, C, B3, B5,...sẽ vừa giúp nhẹ nhàng làm sạch da hiệu quả, vừa có thể giúp da sáng khỏe, mờ dần vết thâm mụn và giúp mô sợi collagen trở nên săn chắc hơn', N'Kem Rửa Mặt Acnes Vitamin Cleanser với công thức dịu nhẹ giúp nhẹ nhàng lấy đi bã nhờn, bụi bẩn trên da và sâu trong lỗ chân lông
Sản phẩm có kết cấu dạng kem mềm mịn giúp dễ dàng tạo bọt, và giúp loại bỏ các tạp chất trên da khá dễ dàng
Vitamin A: Giúp làm giảm các dấu hiệu lão hóa, đồng thời hỗ trợ làm sáng vùng da xỉn màu
Vitamin E: Hạn chế tiến trình oxy hóa và hỗ trợ thúc đẩy quá trình tái tạo tế bào tổn thương do mụn
Vitamin C: Hỗ trợ quá trình tăng tạo sợi collagen, giúp làm mờ sắc tố melanin, Giúp Phục Hồi làn da săn chắc, mờ sẹo thâm
Vitamin B3, B5, B6: Giúp cân bằng độ ẩm, Hỗ Trợ Se Khít Lỗ Chân Lông, hỗ trợ ức chế sự hình thành melanin và giúp dưỡng da trắng mịn', N'Water, Stearic Acid, Glycerin, Butylene Glycol, Myristic Acid, Palmitic Acid, Potassium Hydroxide, Cocamidopropyl Betaine, Lauric Acid, Niacinamide, Palm Kernelamide DEA*, Glyceryl Stearate, Olea Europaea (Olive) Fruit Oil, Tocopheryl Acetate, Magnesium Ascorbyl Phosphate, Panthenol, Pyridoxine HCl, Retinyl Palmitate, Helianthus Annuus (Sunflower) Seed Oil, Polyquaternium-7**, Isopropylmethylphenol (O-cymen-5-ol), Dipotassium Glycyrrhizate, Disodium EDTA, BHT, Fragrance, Methylparaben, Propylparaben, CI 16035, CI 19140
 ', N'CÁCH DÙNG – DIRECTION FOR USE 
 
- Làm ướt mặt, cho một lượng kem rửa mặt vừa đủ vào lòng bàn tay, tạo bọt và thoa nhẹ nhàng lên da mặt. Rửa sạch lại với nước
- Dùng vài lần trong ngày

Quy cách: Tuýp, 50Gr 

Bảo quản: Nơi khô ráo thoáng mát. Tránh ánh nắng trực tiếp, nơi có nhiệt độ cao', N'Xuất xứ: Việt Nam', 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MaThuongHieu], [NguyenGia], [HinhAnh], [ThongTinSanPham], [CongDungSanPham], [ThanhPhanSanPham], [HuongDanSuDungSanPham], [XuatXu], [SoLuong]) VALUES (N'SP0043', N'Kem Dưỡng Da Vitamin Cream Acnes 40Gr', N'TH006', 99000, N'image\hinh43.jpg', N'Mụn làm tế bào, mô tổn thương liên tiếp, cấu trúc da trở nên kém đàn hồi, sần sùi và không tươi sáng. Acnes Vitamin Cream cung cấp 6 Vitamin và Acid amin thiết yếu nuôi dưỡng và giúp phục hồi làn da sau mụn. Kem thẩm thấu nhanh, không bóng nhờn, dưỡng da ', N'Acnes Vitamin Cream với 6 Vitamin và Acid amin thiết yếu giúp nuôi dưỡng và giúp phục hồi làn da sau mụn. Kem thẩm thấu nhanh, không bóng nhờn, dưỡng da mịn màng, tươi sáng, săn chắc
Vitamin A: Giúp ngăn ngừa các dấu hiệu lão hóa, hỗ trợ làm sáng vùng da xỉn màu
Vitamin E: Giúp hạn chế quá trình oxy hóa, và hỗ trợ thúc đẩy quá trình tái tạo tế bào tổn thương do mụn
Vitamin C: Hỗ trợ quá trình tăng tạo sợi collagen, giúp làm mờ sắc tố melanin, mờ sẹp thâm, đồng thời Giúp Phục Hồi làn da trở nên săn chắc
Vitamin B3, B5, B6: Giúp cân bằng độ ẩm, se lỗ chân lông, hỗ trựo ức chế sự hình thành melanin, và giúp dưỡng da trắng mịn', N'Water, Glycerin, Paraffinum Liquidum (Mineral Oil), Dimethicone, Isopropyl Palmitate, Stearic Acid, Cetyl Alcohol, Polysorbate 60, Niacinamide, Glyceryl Stearate, Ascorbyl Glucoside, Tocopheryl Acetate, Pyridoxine HCl, Panthenol, Acrylates/C10-30 Alkyl Acrylate Crosspolymer, Carbomer, BHT, Betaine, Sodium PCA, Sorbitol, Serine, Glycine, Glutamic Acid, Alanine, Lysine, Arginine, Threonine, Proline, Retinyl Palmitate, Helianthus Annuus, (Sunflower) Seed Oil, BHT, Triethanolamine, Methylparaben, Propylparaben, Disodium EDTA, Fragrance, CI 16035, CI 19140, CI 77891', N'CÁCH DÙNG – DIRECTION FOR USE 
 
- Lấy một lượng kem vừa đủ thoa đều lên khắp mặt, đặc biệt vùng da sần sùi, xỉn màu sau mụn. Massage nhẹ nhàng cho kem thấm đều vào da
- Dùng hằng ngày sáng và tối

Quy cách: Hộp, 40Gr 

Bảo quản: Nơi khô ráo thoáng mát. Tránh ánh nắng trực tiếp, nơi có nhiệt độ cao', N'Xuất xứ: Việt Nam', 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MaThuongHieu], [NguyenGia], [HinhAnh], [ThongTinSanPham], [CongDungSanPham], [ThanhPhanSanPham], [HuongDanSuDungSanPham], [XuatXu], [SoLuong]) VALUES (N'SP0044', N'Sữa Rửa Mặt Giúp Dưỡng Sáng Whitening+ Acnes 100Gr', N'TH006', 70000, N'image\hinh44.jpg', N'Sữa Rửa Mặt Acnes Pure White Cleanser là sản phẩm sữa rửa mặt dưỡng sáng, chăm sóc da sau mụn. Công thức chứa phức hợp dưỡng sáng da White+ Complex, phức hợp tẩy tế bào chết dịu nhẹ AHA & BHA, cùng thành phần dưỡng ẩm Hyaluronic Acid giúp mang lại cho bạn', N'Sữa Rửa Mặt Acnes Pure White Cleanser sử dụng công nghệ giúp dưỡng sáng từ Acnes được nghiên cứu dựa trên khả năng tự tái sinh và giúp phục hồi của làn da, kết hợp hiệu quả các thành phần được đặc chế chuyên biệt, nuôi dưỡng da tươi sáng, mịn màng từ bên trong:
White+ Complex: Phức hợp C-Booster và Alpinia White từ thiên nhiên giúp làm mờ sắc tố melanin, dưỡng da sáng mịn
AHA & BHA: làm sạch bã nhờn dư thừa và bụi bẩn, nhẹ nhàng lấy đi lớp sừng già, hỗ trợ ngăn ngừa vi khuẩn gây mụn
Hyaluronic Acid: Cung cấp độ ẩm cần thiết, cho làn da ẩm mượt, sáng khỏe', N'Water, Potassium Cocoyl Glycinate,  Cocamidopropyl Betaine, Potassium Cocoate, Sorbitol, Sodium Cocoyl Glycinate, Glycol Distearate, Acrylates Copolymer, Sodium Chloride, Sodium Lauroyl Sarcosinate, Silica, Maltooligosyl Glucoside, Lauric Acid, Stearic Acid, Hydrogenated Starch Hydrolysate, Citric Acid, Tocopheryl Acetate, Isopropylmethylphenol, Disodium EDTA, Tetrasodium EDTA, Sodium Hyaluronate, Butylene Glycol, Sodium Lactate, Glycerin, Lactic Acid (AHA), Salicylic Acid (BHA), Terminalia Ferdinandiana Fruit Extract, Alpinia Katsumadai Seed Extract, Sodium Metabisulfite, Methylparaben, Propylparaben, Sodium Benzoate, Fragrance', N'CÁCH DÙNG – DIRECTION FOR USE 
 
- Làm ướt mặt, lấy một lượng sữa rửa mặt vừa đủ vào lòng bàn tay, tạo bọt và thoa nhẹ nhàng lên da mặt. Rửa sạch lại với nước
- Dùng vài lần trong ngày
- Nên sử dụng kết hợp với Acnes Pure White Cream để giúp dưỡng sáng hiệu quả
 ', N'Xuất xứ: Việt Nam', 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MaThuongHieu], [NguyenGia], [HinhAnh], [ThongTinSanPham], [CongDungSanPham], [ThanhPhanSanPham], [HuongDanSuDungSanPham], [XuatXu], [SoLuong]) VALUES (N'SP0045', N'Dung Dịch Làm Mờ Sẹo Và Vết Thâm C10 Acnes 15Ml', N'TH006', 249000, N'image\hinh45.jpg', N'Vitamin C còn gọi là Acid Ascorbic là một chất hỗ trợ làm chậm quá trình oxy hóa mạnh, có khả năng đối ứng với nhiều vấn đề của da như lấy đi những nốt đen trên da (lớp sừng già), ức chế việc tạo thành melanin và làm mờ sắc tố melanin giúp làm sáng da, mờ', N'Mờ vết thâm, sáng da xỉn màu.
Giúp sẹo mụn trơn phẳng, lỗ chân lông thu nhỏ, da mịn màng
Hỗ trợ mờ nám, tàn nhang và làm giảm nếp nhăn.', N'Vitamin C, Propanediol, Water, Ascorbic Acid, Propylene Glycol, Alcohol, Butylene Glycol, PEG-8, PPG-6-Decyltetradeceth-30, Citrus Grandis (Grapefruit) Fruit Extract, Betaine, Fragrance', N'CÁCH DÙNG – DIRECTION FOR USE

Bóp nhẹ đầu ống, lấy một lượng thích hợp (1-2 giọt) ra lòng bàn tay.
Dùng đầu ngón tay thoa đều lên vùng da cần chăm sóc 2 lần mỗi ngày (sáng và tối)

Bảo quản: Nơi khô ráo thoáng mát. Tránh ánh nắng trực tiếp, nơi có nhiệt độ cao

Quy cách: Chai, 15Ml', N'Xuất xứ: Việt Nam', 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MaThuongHieu], [NguyenGia], [HinhAnh], [ThongTinSanPham], [CongDungSanPham], [ThanhPhanSanPham], [HuongDanSuDungSanPham], [XuatXu], [SoLuong]) VALUES (N'SP0046', N'Dung Dịch Tạo Bọt Hỗ Trợ Ngăn Ngừa Mụn Foaming Wash Acnes 150Ml', N'TH006', 67000, N'image\hinh46.jpg', N'Dung Dịch Tạo Bọt Ngăn Ngừa Mụn Foaming Wash Acnes 150Ml', N'Rửa mặt hàng ngày giúp da sạch thoáng, giảm mụn, hạn chế sẹo – thâm, giúp da mịn màng, ngăn ngừa hình thành mụn mới', NULL, N'CÁCH DÙNG – DIRECTION FOR USE 
 
- Làm ướt mặt
- Bơm lượng bọt rửa mặt vừa đủ vào lòng bàn tay và thoa nhẹ nhàng lên da mặt
- Rửa sạch lại với nước
- Dùng vài lần trong ngày
- Nên kết hợp sử dụng Acnes Soothing Lotion để tăng cường hiệu quả kiểm soát mụn', N'Xuất xứ: Việt Nam', 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MaThuongHieu], [NguyenGia], [HinhAnh], [ThongTinSanPham], [CongDungSanPham], [ThanhPhanSanPham], [HuongDanSuDungSanPham], [XuatXu], [SoLuong]) VALUES (N'SP0047', N'Gel Rửa Mặt Da Khô Bioderma 200Ml', N'TH007', 425000, N'image\hinh47.jpg', N'Gel Rửa Mặt Da Khô BIODERMA 200Ml', N'Gel làm sạch dụi nhẹ, hạn chế sự xâm nhập của tụ cầu vàng S.aureus và tác nhân gây dị ứng. Làm dịu cảm giác khó chịu và kích ứng, tăng cường hàng rào bảo vệ da bằng giải pháp sinh học. Phù hợp cho cả gia đình sử dụng', NULL, N'CÁCH DÙNG – DIRECTION FOR USE 
 
- Lấy một ít sản phẩm lên tay ướt đã rửa sạch và tạo bọt
- Massage nhẹ nhàng lên vùng da đã làm ướt rồi rửa lại thật sạch
- Lau khô nhẹ nhàng bằng khăn sạch
- Dùng đều đặn 2 lần mỗi ngày sáng và tối
 
Quy cách: Tuýp, 200Ml

Bảo quản: Đậy nắp kín sau khi sử dụng. Bảo quản nơi thoáng mát, tránh ánh nắng và nhiệt độ cao', N'Xuất xứ: Pháp', 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MaThuongHieu], [NguyenGia], [HinhAnh], [ThongTinSanPham], [CongDungSanPham], [ThanhPhanSanPham], [HuongDanSuDungSanPham], [XuatXu], [SoLuong]) VALUES (N'SP0048', N'Kem Dưỡng Da Mụn Trứng Cá Bioderma 30Ml', N'TH007', 390000, N'image\hinh48.jpg', N'Kem giảm mụn Bioderma dành cho da hỗn hợp, da dầu đến da mụn 30 ML', N' Kem dưỡng giảm mụn nhẹ. Điều hòa chất lượng bã nhờn khỏe mạnh, tránh gây tắc lỗ chân lông. Giảm mụn và ngăn ngừa mụn quay trở lại, cải thiện bề mặt da', NULL, N'CÁCH DÙNG – DIRECTION FOR USE 
 
- Sau khi làm sạch da bằng Sebium H2O hoặc Sebium Gel Moussant, thoa Sebium Global 2 lần trong ngày
- Chỉ dành cho mặt, với da đang bị mụn trứng cá nhiều
- Sản Phẩm Dành Cho Mọi Loại Da
 
Quy cách: Tuýp, 30Ml

Bảo quản: Bảo quản nơi thoáng mát, tránh ánh nắng và nhiệt độ cao', N'Xuất xứ: Pháp', 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MaThuongHieu], [NguyenGia], [HinhAnh], [ThongTinSanPham], [CongDungSanPham], [ThanhPhanSanPham], [HuongDanSuDungSanPham], [XuatXu], [SoLuong]) VALUES (N'SP0049', N'Kem Dưỡng Làm Dịu Da Kích Ứng Bioderma 40Ml', N'TH007', 345000, N'image\hinh49.jpg', N'Bioderma Cicabio Crème là sản phẩm kem dưỡng ẩm hỗ trợ phục hồi và làm dịu làn da tổn thương, da nhạy cảm - kích ứng đến từ thương hiệu dược mỹ phẩm Bioderma nổi tiếng của Pháp, được các bác sĩ da liễu Pháp tin dùng.', N'Kem dưỡng ẩm và giúp phục hồi Bioderma dành cho da sau vết thương từ nhẹ đến vừa, Giúp Phục Hồi Da tổn thương
Hoạt chất độc quyền Antalgicine® giúp loại bỏ sự khó chịu ngay tức thì, giảm ngứa trong suốt quá trình phục hồi.
Đồng và kẽm có tác dụng kháng viêm, làm dịu và làm lành các tổn thương ngoài da, bên cạnh đó giúp ngăn chặn sự phát triển vi khuẩn.', NULL, N'CÁCH DÙNG – DIRECTION FOR USE 

Dùng từ một đến hai lần mỗi ngày cho đến khi da bạn được phục hồi hoàn toàn.

Bước 1: Làm sạch da và nhẹ nhàng lau khô.
Bước 2: Bôi lên vùng da bị kích ứng.', N'Xuất xứ: Pháp', 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MaThuongHieu], [NguyenGia], [HinhAnh], [ThongTinSanPham], [CongDungSanPham], [ThanhPhanSanPham], [HuongDanSuDungSanPham], [XuatXu], [SoLuong]) VALUES (N'SP0050', N'Nước Tẩy Trang Dành Cho Da Nhạy Cảm Bioderma Sensibio H2O 500Ml', N'TH007', 393000, N'image\hinh50.jpg', N'Nước Tẩy Trang H2O Dành Cho Da Nhạy Cảm Sensibio BIODERMA', N'Dung dịch làm sạch và tẩy trang dạng hạt mixen (micelle)
- Không cần rửa lại với nước
- Làm sạch diụ nhẹ, lấy đi lớp trang điểm và bụi bẩn nhưng không gây khô da
- Hạn chế tiết dầu, mang lại cảm giác  sảng khoái', NULL, N'CÁCH DÙNG – DIRECTION FOR USE 
 
- Bước 1: Thấm Sébium H2O lên bông tẩy trang
- Bước 2: Nhẹ nhàng làm sạch và / hoặc tẩy trang vùng mặt
- Bước 3: Không cần rửa lại với nước
 
Quy cách: Chai, 500Ml

Bảo quản: Đậy nắp kín sau khi sử dụng. Bảo quản nơi thoáng mát, tránh ánh nắng và nhiệt độ cao', N'Xuất xứ: Pháp', 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MaThuongHieu], [NguyenGia], [HinhAnh], [ThongTinSanPham], [CongDungSanPham], [ThanhPhanSanPham], [HuongDanSuDungSanPham], [XuatXu], [SoLuong]) VALUES (N'SP0051', N'Kem Dưỡng Giảm Mụn Và Ngừa Thâm Mụn Bioderma Sébium Kerato+ 30Ml', N'TH007', 378000, N'image\hinh51.jpg', N'Mụn trứng cá là tình trạng da phổ biến, thường gặp là mụn đầu đen, mụn đầu trắng hoặc mụn đỏ với mức độ nặng nhẹ khác nhau. Trong nhiều trường hợp mụn trứng cá nhẹ, không nhất thiết phải giảm thiểu bằng thuốc. Một số sản phẩm hiệu quả nhưng có thể quá mạn', N'SỰ KẾT HỢP BỘ ĐÔI HOẠT CHẤT TIÊU SỪNG (axit salicylic và axit malic ester), hiệu quả ở độ pH của da, tác động cả trên và dưới bề mặt da, để loại bỏ mụn và vết thâm đồng thời giúp da luôn thoải mái.

- MALIC ACID ESTER là một thành phần hoạt tính có tác dụng kép: làm tiêu sừng, đồng thời điều tiết lượng bã nhờn dư thừa.', NULL, N'CÁCH DÙNG – DIRECTION FOR USE:

- Làm sạch da với Sébium H2O và Sébium Gel Moussant.

- Sử dụng sản phẩm 1-2 lần/ngày sau khi làm sạch da mặt.

- Massage nhẹ nhàng cho đến khi hấp thụ.', N'Xuất xứ: Pháp', 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MaThuongHieu], [NguyenGia], [HinhAnh], [ThongTinSanPham], [CongDungSanPham], [ThanhPhanSanPham], [HuongDanSuDungSanPham], [XuatXu], [SoLuong]) VALUES (N'SP0052', N'Kem Chống Nắng Dành Cho Da Dầu Bioderma Akn Mat SPF30 PA++++ 40Ml', N'TH007', 363000, N'image\hinh52.jpg', N'Kem chống nắng Photoderm AKN Mat SPF30 PA++++ đến từ thương hiệu Bioderma mang lại hiệu quả 2 trong 1 chỉ số chống nắng cao và ngăn ngừa sự phát triển của mụn. Kết cấu mịn màng, không màu, không bết dính hay để lại vệt trắng.', N'Kem chống nắng cho da dầu, da hỗn hợp và da mụn. Kem chống nắng 2 trong 1: chỉ số chống nắng cao và ngăn ngừa mụn. 

Tác động sinh học điều chỉnh chất lượng bã nhờn, tránh gây tắc lỗ chân lông. ', NULL, N'CÁCH DÙNG – DIRECTION FOR USE 
 
- Dùng vài lần/ ngày trong cả ngày tiếp xúc với ánh nắng mặt trời
- Bôi sản phẩm đều và đủ lượng trước khi đi ra nắng (nếu dùng không đủ sẽ giảm tác dụng bảo vệ da trước ánh nắng)
- Bôi lại kem chống nắng thường xuyên, trước và sau khi bơi lội, lau mồ hôi và chơi thể thao', N'Xuất xứ: Pháp', 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MaThuongHieu], [NguyenGia], [HinhAnh], [ThongTinSanPham], [CongDungSanPham], [ThanhPhanSanPham], [HuongDanSuDungSanPham], [XuatXu], [SoLuong]) VALUES (N'SP0053', N'Nước Tẩy Trang Bioderma Dành Cho Da Hỗn Hợp, Da Dầu & Da Mụn Sébium H2O 500Ml', N'TH007', 420000, N'image\hinh53.jpg', N'Dung dịch làm sạch và tẩy trang Sebium H20 dành cho da hỗn hợp đến da dầu và có mụn là sản phẩm từ thương hiệu mỹ phẩm  Bioderm, giúp làm sạch bụi bẩn, dầu thừa và lớp trang điểm trên da. Ngoài ra, nước tẩy trang dành cho da hỗn hợp, da dầu & da mụn sébiu', N'Dung dịch làm sạch và tẩy trang dạng hạt mixen (micelle)
Không cần rửa lại với nước
Làm sạch diụ nhẹ, lấy đi lớp trang điểm và bụi bẩn nhưng không gây khô da', NULL, N'CÁCH DÙNG – DIRECTION FOR USE 
- Bước 1: Thấm Sébium H2O lên bông tẩy trang
- Bước 2: Nhẹ nhàng làm sạch và / hoặc tẩy trang vùng mặt
- Bước 3: Không cần rửa lại với nước', N'Xuất xứ: Pháp', 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MaThuongHieu], [NguyenGia], [HinhAnh], [ThongTinSanPham], [CongDungSanPham], [ThanhPhanSanPham], [HuongDanSuDungSanPham], [XuatXu], [SoLuong]) VALUES (N'SP0054', N'Kem Dưỡng Ban Đêm Regenerist Olay 50Gr', N'TH008', 499000, N'image\hinh54.jpg', N'Olay Regenerist Micro-Sculpting Moisturizer Cream là kem dưỡng ẩm giúp ngừa lão hoá. Với công thức Amino-peptide phức hợp tiên tiến thấm sâu vào bề mặt da để làm giảm rõ ràng sự xuất hiện của các nếp nhăn. ', N'Công thức với phức hợp Amino-peptide đậm đặc giúp kích thích sản xuất collagen trong da, từ đó làm giảm nếp nhăn, hỗ trợ tái tạo tế bào da trên bề mặt và làm săn chắc da.
Niacinamide (Vitamin B3) giúp thúc đẩy tái tạo tế bào da mới, hỗ trợ làm giảm nếp nhăn.', N'Water, Cyclopentasiloxane, Glycerin, Niacinamide, Aluminum Starch Octenylsuccinate, Sodium PEG-7 Olive Oil Carboxylate…', N'CÁCH DÙNG – DIRECTION FOR USE

- Massage đều một lượng nhỏ kem trên da mặt và cổ theo hướng xoay tròn đi lên

- Sử dụng đều đặn mỗi ngày

Quy cách: Hũ, 50g

Bảo quản: Bảo quản nơi khô ráo, thoáng mát, tránh ánh sáng mặt trời trực tiếp

Lưu ý: Để xa tầm tay trẻ em', N'Xuất xứ: United States', 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MaThuongHieu], [NguyenGia], [HinhAnh], [ThongTinSanPham], [CongDungSanPham], [ThanhPhanSanPham], [HuongDanSuDungSanPham], [XuatXu], [SoLuong]) VALUES (N'SP0055', N'Sữa Tắm Dâu & Bạc Hà Olay 650Ml', N'TH008', 218000, N'image\hinh55.jpg', N'Sữa tắm thương hiệu Olay tươi mát dài lâu hương Dâu Trắng và Bạc Hà - Fresh Outlast, Cooling White Strawberry & Mint 650Ml nhập khẩu từ Mỹ cấp nước và cải thiện làn da sau 14 ngày sử dụng', N'Chứa phức hợp B3 Complex hỗ trợ làm chậm quá trình oxy hóa, dưỡng ẩm cũng như bảo vệ lớp màng tự nhiên cho da, tăng khả năng miễn dịch, đặc biệt giúp ngừa lão hoá da hiệu quả
Mùi hương ngọt ngào, năng động, kết hợp giữa các thành phần tự nhiên: Dâu trắng và Bạc hà thanh mát', NULL, N'CÁCH DÙNG:

- Làm ướt cơ thể
- Lấy một lượng sản phẩm vừa đủ ra lòng bàn tay hoặc bông tắm rồi tạo bọt với ít nước, sau đó mát-xa lên cơ thể theo chuyển động tròn
- Tắm sạch lại với nước', N'Xuất xứ: United States', 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MaThuongHieu], [NguyenGia], [HinhAnh], [ThongTinSanPham], [CongDungSanPham], [ThanhPhanSanPham], [HuongDanSuDungSanPham], [XuatXu], [SoLuong]) VALUES (N'SP0056', N'Kem Dưỡng Ban Đêm Total Effects Olay 50Gr', N'TH008', 329000, N'image\hinh56.jpg', N'Kem Dưỡng Ban Đêm Olay Total Effects Ngừa Lão Hóa thuộc dòng sản phẩm kem dưỡng làm chậm quá trình lão hóa đa tác dụng Olay Total Effects 7 in One giúp cung cấp hàm lượng dưỡng chất dồi dào nuôi dưỡng làn da suốt cả đêm dài, ngăn ngừa 7 dấu hiệu lão hóa d', N'Dưỡng ẩm tối ưu cho da
Ngăn ngừa 7 dấu hiệu lão hóa, mang lại tổng thể làn da tươi trẻ và rạng rỡ hơn
Kết cấu kem mịn và thấm nhanh, không làm tắc nghẽn lỗ chân lông
Đã qua kiểm nghiệm da liễu, không làm kích ứng da', N'Kem dưỡng OLAY Total Effects được cải tiến bổ sung 50% Vitamin E kết hợp cùng hệ dưỡng chất vitamin C, B5 và không chứa dầu, giúp phục hồi và hỗ trợ làm chậm 7 dấu hiệu lão hóa của da', N'CÁCH DÙNG 

- Rửa sạch mặt bằng sữa rửa mặt Thoa nước hoa hồng và dùng serum (nếu có)
- Lấy một lượng vừa đủ kem dưỡng da Olay ra tay, dùng các đầu ngón tay thoa đều sản phẩm lên da vùng mặt và cổ
- Sử dụng vào mỗi tối trước khi đi ngủ

Quy cách: Hũ, 50Gr

Bảo quản: Bảo quản nơi khô ráo, thoáng mát, tránh ánh sáng mặt trời trực tiếp', N'Xuất xứ: United States', 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MaThuongHieu], [NguyenGia], [HinhAnh], [ThongTinSanPham], [CongDungSanPham], [ThanhPhanSanPham], [HuongDanSuDungSanPham], [XuatXu], [SoLuong]) VALUES (N'SP0057', N'Tinh Chất Vi Dưỡng Hỗ Trợ Tái Tạo Da Essence Olay 150Ml', N'TH008', 499000, N'image\hinh57.jpg', N'Tinh Chất Vi Dưỡng Giúp Tái Tạo Da Essence OLAY 150Ml
Tinh Chất giúp ngừa lão hoá OLAY được bào chế với phức hợp làm săn chắc Hydra giúp giữ lại vẻ tươi trẻ cho làn da', N'Cấp ẩm cho làn da căng mịn hơn
- Làm giảm sự xuất hiện của các nếp nhăn trên da 
- Có khả năng tẩy tế bào chết để làn da trở nên mịn màng hơn
- Giúp Tái Tạo Da làn da', NULL, N'CÁCH DÙNG – DIRECTION FOR USE
 
- Dùng đầu ngón tay lấy một lượng nhỏ sản phẩm và thoa lên mặt và vùng cổ
- Sau đó, thoa đều theo hình tròn và theo chiều kim đồng hồ
- Khuyến khích sử dụng đều đặn cho cả ngày và đêm
 
Quy cách: Chai, 150Ml

Bảo quản: Nơi khô ráo thoáng mát. Tránh ánh nắng trực tiếp, nơi có nhiệt độ cao', N'Xuất xứ: United States', 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MaThuongHieu], [NguyenGia], [HinhAnh], [ThongTinSanPham], [CongDungSanPham], [ThanhPhanSanPham], [HuongDanSuDungSanPham], [XuatXu], [SoLuong]) VALUES (N'SP0058', N'Kem Dưỡng Mắt Ban Đêm Regenerist Eyes Retinol 24 Night Eye Cream Olay 15Ml', N'TH008', 549000, N'image\hinh58.jpg', N'Kem Dưỡng Mắt Ban Đêm Regenerist Eyes Retinol 24 Night Eye Cream Olay 15Ml là kem dưỡng chăm sóc da vùng mắt ban đêm thuộc dòng sản phẩm Regenerist Retinol 24 mới từ thương hiệu Olay của Mỹ, với phức hợp Retinol và Niacinamide giúp làm vùng da quanh mắt t', N'Chứa phức hợp Retinol + Niacinamide có khả năng thẩm thấu sâu vào lớp biểu bì mỏng manh quanh vùng mắt, mang đến hiệu quả tái tạo và Giúp Phục Hồi Da vượt trội, cải thiện rõ rệt các dấu hiệu lão hóa, mang đến làn da săn chắc và tươi sáng mịn màng hơn
Cung cấp độ ẩm liên tục cho da lên đến 24 giờ, thích hợp sử dụng hàng ngày mà không làm khô da.
Công thức không hương liệu & chất tạo màu, an toàn khi sử dụng cho vùng da mắt nhạy cảm.', NULL, N'CÁCH DÙNG

- Dùng ngày 2 lần vào sáng và tối sau khi rửa mặt sạch

- Dùng ngón áp út lấy 1 lượng kem vừa đủ xoa nhẹ theo vòng tròn cấu tạo mắt, sau đó vỗ nhẹ để kem thấm vào da', N'Xuất xứ: United States', 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MaThuongHieu], [NguyenGia], [HinhAnh], [ThongTinSanPham], [CongDungSanPham], [ThanhPhanSanPham], [HuongDanSuDungSanPham], [XuatXu], [SoLuong]) VALUES (N'SP0059', N'Nước Tẩy Trang Cho Da Dầu Mụn Micellar Water Garnier 400Ml', N'TH009', 155000, N'image\hinh59.jpg', N'Nước Tẩy Trang Garnier Micellar Cleansing Water là dòng sản phẩm tẩy trang nổi tiếng đến từ thương hiệu Garnier của Pháp, sử dụng công nghệ Micelles (Micellar Technology) có chứa các phân tử mi-xen hoạt động theo cơ chế nam châm giúp nhẹ nhàng làm sạch da', N'Sử dụng công nghệ Micelles (Micellar Technology) - phân tử Micelles lấy đi bụi bẩn sâu bên trong lỗ chân lông theo cơ chế hoạt động của nam châm khi lau nhẹ trên da mà không cần chà xát
- Làm sạch sâu da và loại bỏ dầu thừa hiệu quả - một trong những nguyên nhân gây nên tình trạng mụn, giúp lỗ chân lông thông thoáng, giảm thiểu bít tắc
- Không chứa hương liệu, không gây kích ứng da
- Kết cấu lỏng nhẹ, tươi mát, không bết dính, không cần rửa lại với nước
 ', N'Aqua/Water, Hexylene, Glycol, Glycerin, Alcohol Denat, Disodium Cocoamphodiacetate, Disodium Edta, Poloxamer 184, Polyaminopropyl Biguanide (B166370/1)', N'CÁCH DÙNG – DIRECTION FOR USE
 
- Lắc đều, thấm một lượng vừa đủ ra bông tẩy trang
- Lau nhẹ trên da mặt, vùng da quanh mắt và môi theo hướng xoay tròn (không chà xát da), không cần rửa lại với nước
- Nên dùng hằng ngày ngay cả khi không trang điểm
- Liều lượng: 1 lần sử dụng khoảng 2ml', N'Xuất xứ: Pháp', 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MaThuongHieu], [NguyenGia], [HinhAnh], [ThongTinSanPham], [CongDungSanPham], [ThanhPhanSanPham], [HuongDanSuDungSanPham], [XuatXu], [SoLuong]) VALUES (N'SP0060', N'Nước Tẩy Trang Cho Da Nhạy Cảm Garnier Micellar Water 400Ml', N'TH009', 140000, N'image\hinh60.jpg', N'Nước Tẩy Trang Garnier Micellar Cleansing Water là dòng sản phẩm tẩy trang nổi tiếng đến từ thương hiệu Garnier của Pháp, sử dụng công nghệ Micelles (Micellar Technology) có chứa các phân tử mi-xen hoạt động theo cơ chế nam châm giúp nhẹ nhàng làm sạch da', N'Sử dụng công nghệ Micelles (Micellar Technology) - phân tử Micelles lấy đi bụi bẩn sâu bên trong lỗ chân lông theo cơ chế hoạt động của nam châm khi lau nhẹ trên da mà không cần chà xát
- Làm sạch da dịu nhẹ, loại bỏ bụi bẩn, dầu thừa và lớp trang điểm hiệu quả
- Không chứa cồn & hương liệu, không gây kích ứng da
- Kết cấu lỏng nhẹ, tươi mát, không bết dính, không cần rửa lại với nước
 ', N'Aqua/Water, Hexylene, Glycol, Glycerin, Disodium Cocoamphodiacetate, Disodium Edta, Poloxamer 184, Polyaminopropyl Biguanide (B162919/4)
 ', N'CÁCH DÙNG – DIRECTION FOR USE
 
- Lắc đều, thấm một lượng vừa đủ ra bông tẩy trang
- Lau nhẹ trên da mặt, vùng da quanh mắt và môi theo hướng xoay tròn (không chà xát da), không cần rửa lại với nước
- Nên dùng hằng ngày ngay cả khi không trang điểm
- Liều lượng: 1 lần sử dụng khoảng 2ml', N'Xuất xứ: Pháp', 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MaThuongHieu], [NguyenGia], [HinhAnh], [ThongTinSanPham], [CongDungSanPham], [ThanhPhanSanPham], [HuongDanSuDungSanPham], [XuatXu], [SoLuong]) VALUES (N'SP0061', N'Sữa Rửa Mặt Dạng Bọt Garnier Light Complete Speed Brightening Whip Foam 100Ml', N'TH009', 98000, N'image\hinh61.jpg', N'Sữa Rửa Mặt Tạo Bọt Sáng Da Light Complete Vitamin C Whip Foam GARNIER 100Ml là dòng sữa rửa mặt đến từ thương hiệu mỹ phẩm Garnier của Pháp, thành phần bổ sung Vitamin C và tinh chất quả Yuzu giúp dưỡng sáng, loại bỏ làn da thâm sạm, không đều màu. Sản p', N' Làm sạch bụi bẩn, cặn bã trang điểm còn dư thừa, thông thoáng lỗ chân lông, hấp thụ tối ưu các dưỡng chất
- lớp bọt dày mịn, có độ đàn hồi giúp đưa các dưỡng chất vào sâu bên trong da
- Chứa Vitamin C cải thiện vết thâm, da không đều màu, tăng khả năng làm sáng da
- Tinh chất quả Yuzu giúp da rạng rỡ, mịn màng, tràn đầy sức sống', NULL, N'CÁCH DÙNG – DIRECTION FOR USE
 
- Làm ướt da mặt
- Lấy một lượng vừa đủ ra lòng bàn tay
- Tạo bọt với nước và thoa lên mặt
- Massage nhẹ trong 30 giây rồi rửa sạch với nước
- Chú ý: Tránh tiếp xúc trực tiếp với mắt', N'Xuất xứ: Pháp', 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MaThuongHieu], [NguyenGia], [HinhAnh], [ThongTinSanPham], [CongDungSanPham], [ThanhPhanSanPham], [HuongDanSuDungSanPham], [XuatXu], [SoLuong]) VALUES (N'SP0062', N'Kem Chống Nắng Kiềm Dầu Hỗ Trợ Sáng Da Garnier Super Uv Matte Spf50+ Pa+++ 30Ml', N'TH009', 127000, N'image\hinh62.jpg', N'Kem Chống Nắng Kiềm Dầu Sáng Da Garnier Super UV Matte SPF50+ PA+++ 30Ml là dòng kem chống nắng đến từ thương hiệu mỹ phẩm Garnier của Pháp, với chỉ số chống nắng SPF50 PA+++ giúp bảo vệ da tối ưu khỏi các tia UVA, UVB, ngăn da khỏi sạm đen, bỏng nắng, đồ', N'Kem chống nắng có khả năng kiềm dầu hiệu quả và kiểm soát dầu nhờn trên da
Thành phần Vitamin C dưỡng sáng, làm đều màu da, cải thiện vùng da thâm sạm', NULL, N'CÁCH DÙNG

- Dùng 1 lượng kem vừa đủ và thoa đều nhẹ nhàng khắp vùng da mặt và cổ
- Thoa lại kem chống nắng sau 4 tiếng
- Sử dụng sau bước dưỡng da bằng Dưỡng chất tăng cường sáng da & mờ thâm Garnier Light Complete Vitamin C Booster Serum cho hiệu quả dưỡng sáng và bảo vệ da tối đa dưới ánh mặt trời', N'Xuất xứ: Pháp', 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MaThuongHieu], [NguyenGia], [HinhAnh], [ThongTinSanPham], [CongDungSanPham], [ThanhPhanSanPham], [HuongDanSuDungSanPham], [XuatXu], [SoLuong]) VALUES (N'SP0063', N'Dưỡng Chất Tăng Cường Sáng Da Mờ Thâm Garnier Bright Complete Pure Vitamin C 30Ml', N'TH009', 285000, N'image\hinh63.jpg', N'Tinh Chất Hỗ Trợ Sáng Da Và Mờ Thâm Garnier Bright Complete Pure Vitamin C là công thức vượt trội giúp dưỡng da hiệu quả  vào ban đêm, giúp làm mờ thâm cho làn da trông sáng khỏe rạng rỡ​ hơn.', N'Chứa 10% Vitamin C nguyên chất từ thành phần tự nhiên + Hyaluronic Acid (HA)

- Là thành phần vitamin C mạnh mẽ nhất ở nồng độ tối ưu trong dưỡng sáng, ngăn ngừa thâm và nuôi dưỡng da sáng khỏe đều màu.

- Sở hữu công nghệ độc quyền của Garnier giúp hoạt chất ổn định, ngăn ngừa tình trạng ô xy hóa để mang lại trải nghiệm sử dụng tốt nhất cho người dùng', NULL, N'CÁCH DÙNG – DIRECTION FOR USE

Sử dụng hàng ngày vào buổi đêm ở mặt và cổ, sau bước làm sạch da.
Nên sử dụng cùng kem dưỡng ban đêm để đạt được hiệu quả chăm sóc da tối ưu.
Kết hợp cùng Garnier 30x Vitamin C Booster Serum và kem chống nắng có SPF30 tối thiểu vào buổi sáng để bảo vệ da.
Bảo quản: 

Nơi khô ráo, thoáng mát.
Tránh ánh nắng trực tiếp, nơi có nhiệt độ cao hoặc ẩm ướt.
Đậy nắp kín sau khi sử dụng.', N'Xuất xứ: Pháp', 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MaThuongHieu], [NguyenGia], [HinhAnh], [ThongTinSanPham], [CongDungSanPham], [ThanhPhanSanPham], [HuongDanSuDungSanPham], [XuatXu], [SoLuong]) VALUES (N'SP0064', N'Tinh Chất Tăng Cường Hỗ Trợ Sáng Da Mờ Thâm Light Complete 30X Vitamin C Booster Serum Garnier 30Ml', N'TH009', 265000, N'image\hinh64.jpg', N'Tinh Chất Tăng Cường Sáng Da Mờ Thâm Light Complete 30x Vitamin C Booster Serum GARNIER 30Ml là dòng tinh chất dưỡng da đến từ thương hiệu mỹ phẩm Garnier của Pháp, với công thức nồng độ vitamin C gấp 30 lần từ vitamin C và tinh chất chiết xuất quả Yuzu.', N'Dẫn xuất Vitamin C 3-O-Ethyl Ascorbic Acid (E-AA) với cấu trúc bền vững: Giúp sản phẩm chịu nhiệt độ 45 độ C ngăn ngừa tình trạng oxy hoá trong điều kiện bảo quản thông thường, giữ kết cấu và thành phần tinh chất đạt hiệu quả tối ưu. Khả năng làm sáng da vượt trội nhất trong các dẫn xuất Vitamin C.
Có khả năng thẩm thấu sâu tới lớp hạ bì dưỡng sáng da từ sâu bên trong. Lành tính, giúp giảm viêm, có thể sử dụng trên da mụn nhẹ', NULL, N'CÁCH DÙNG – DIRECTION FOR USE

- Sử dụng sau bước toner

- Sử dụng nắp bóp nhỏ giọt, chấm đều vài giọt khắp mặt

- Nhẹ nhàng thoa đều khắp mặt

- Khóa lớp tinh chất bằng cách vỗ nhẹ để dưỡng chất còn lại thấm vào da', N'Xuất xứ: Pháp', 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MaThuongHieu], [NguyenGia], [HinhAnh], [ThongTinSanPham], [CongDungSanPham], [ThanhPhanSanPham], [HuongDanSuDungSanPham], [XuatXu], [SoLuong]) VALUES (N'SP0065', N'Sữa Chống Nắng Cực Mạnh Sunplay Super Block Spf81 Pa++++ 70Gr', N'TH010', 139000, N'image\hinh65.jpg', N'Sản phẩm sữa chống nắng của Sunplay Super Block có chỉ số SPF81 PA+++ dùng dùng cho các hoạt động liên tục ngoài trời hoặc dưới nước như: đi biển, bơi lội, dã ngoại, du lịch, leo núi, thể thao', N'Chống nắng cực mạnh với SPF81, PA++++ giúp chống tia UVA/UVB tối đa, ngăn đen sạm, nám, lão hóa sớm, bảo vệ da không bị bỏng rát, cháy nắng trong nhiều giờ.
Màng chắn UV Shield thế hệ mới với kết cấu độc đáo phủ đều trên da, chống nắng hiệu quả; đồng thời mang lại cảm giác thoáng mịn, không gây khô da.', N'Vitamin C, E, Pro Vitamin B5, Hyaluronic Acid', N'CÁCH DÙNG

- Lắc kỹ trước khi dùng

- Thoa đều sản phẩm lên da trước khi ra nắng khoảng 20 phút

- Thoa lại sau khi tắm biển hoặc ra mồ hôi nhiều do vận động để có hiệu quả tốt hơn

Quy cách: Chai, 30Gr 

Bảo quản: Bảo quản nơi sạch sẽ, thoáng mát, tránh tiếp xúc trực tiếp với ánh nắng mặt trời', N'Xuất xứ: Japan', 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MaThuongHieu], [NguyenGia], [HinhAnh], [ThongTinSanPham], [CongDungSanPham], [ThanhPhanSanPham], [HuongDanSuDungSanPham], [XuatXu], [SoLuong]) VALUES (N'SP0066', N'Sữa Chống Nắng Hiệu Chỉnh Sắc Da Sunplay Skin Aqua Tone Up Uv Milk Lavender Spf50+ Pa++++50Gr', N'TH010', 149000, N'image\hinh66.jpg', N'Sữa chống nắng của Sunplay Skin Aqua Tone Up UV Milk với SPF50+ PA++++ giúp chống nắng hiệu quả với các thành phần chống nắng ưu việt, giúp bảo vệ da suốt nhiều giờ liền. ', N'Có thể dùng làm lớp lót trang điểm
Với kết cấu dạng sữa, mỏng nhẹ, sản phẩm thấm nhanh, không gây bết dính cho da và đặc biệt phù hợp với điều kiện khí hậu tại Việt Nam
Kiểm soát dầu và dưỡng sáng da với thành phần vitamin C và B3', N'Hyaluronic Acid, Vitamin C, Pearl Powder', N'CÁCH DÙNG – DIRECTION FOR USE 

- Thoa đều sản phẩm trước khi ra nắng

- Dùng hàng ngày để bảo vệ da tốt nhất

- Sử dụng kem chống nắng 20 phút trước khi ra nắng

- Sau khi ra mồ hôi nhiều, thoa lại để có hiệu quả tốt hơn

Quy cách: Tuýp, 50gr

Bảo quản: Nơi khô ráo thoáng mát. Tránh ánh nắng trực tiếp, nơi có nhiệt độ cao', N'Xuất xứ: Japan', 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MaThuongHieu], [NguyenGia], [HinhAnh], [ThongTinSanPham], [CongDungSanPham], [ThanhPhanSanPham], [HuongDanSuDungSanPham], [XuatXu], [SoLuong]) VALUES (N'SP0067', N'Sữa Chống Nắng Cho Bé Và Da Nhạy Cảm Sunplay Baby Mild SPF35/PA++ 30Gr', N'TH010', 82000, N'image\hinh67.jpg', N'Sunplay Baby Mild SPF35 PA++ là sữa chống nắng được đặc chế dành riêng cho da bé và da nhạy cảm, không chứa chất hấp thu tia, không hương liệu, không chất bảo quản, độ kích ứng thấp nên rất an toàn, dịu nhẹ cho da và đã được kiểm chứng theo tiêu chuẩn FDA', N'Chống nắng hiệu quả, giúp ngăn đen sạm, bảo vệ da không bị bỏng rát, cháy nắng trong nhiều giờ liền.

- Đặc chế dành riêng cho da bé và da nhạy cảm.

- Tuyệt đối an toàn, dịu nhẹ cho da.

- Tính kháng nước và mồ hôi cao, thấm nhanh, tạo cảm giác mịn màng.', N' Vitamin C, E, Pro Vitamin B5, Hyaluronic Acid
 ', N'CÁCH DÙNG – DIRECTION FOR USE 
 
- Lắc kỹ trước khi dùng
- Thoa đều sản phẩm lên da trước khi ra nắng khoảng 20-30 phút
- Nếu đã lau khô bằng khăn hoặc sau khi ra mồ hôi nhiều, thoa lại để có hiệu quả tốt hơn', N'Xuất xứ: Japan', 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MaThuongHieu], [NguyenGia], [HinhAnh], [ThongTinSanPham], [CongDungSanPham], [ThanhPhanSanPham], [HuongDanSuDungSanPham], [XuatXu], [SoLuong]) VALUES (N'SP0068', N'Tinh Chất Chống Nắng Hiệu Chỉnh Sắc Da Sunplay Skin Aqua Tone Up Uv Essence Mint Green 50Gr', N'TH010', 159000, N'image\hinh68.jpg', N'Tinh chất chống nắng của Sunplay Skin Aqua Tone Up UV Essence với SPF50+ PA++++ chống nắng hiệu quả với các thành phần chống nắng ưu việt, giúp bảo vệ da suốt nhiều giờ liền. ', N'Không chứa cồn, không chứa chất bảo quản
Phù hợp cho da dầu/hỗn hợp
Có thể dùng làm lớp lót trang điểm', N'Hyaluronic Acid, Vitamin C, Pearl Powder
 ', N'CÁCH DÙNG – DIRECTION FOR USE 
 
- Thoa đều sản phẩm trước khi ra nắng
- Dùng hàng ngày để bảo vệ da dưới tác động của tia UV hiệu quả
- Sử dụng kem chống nắng 20 phút trước khi ra nắng
- Sau khi ra mồ hôi nhiều, thoa lại để có hiệu quả tốt hơn', N'Xuất xứ: Japan', 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MaThuongHieu], [NguyenGia], [HinhAnh], [ThongTinSanPham], [CongDungSanPham], [ThanhPhanSanPham], [HuongDanSuDungSanPham], [XuatXu], [SoLuong]) VALUES (N'SP0069', N'Son Lì 3CE Blur Matte Lipstick #Rosiness 4G', N'TH011', 440000, N'image\hinh69.jpg', N'Son thỏi 3CE Blur Matte Lipstick chất son mềm mịn mang đến hiệu ứng mịn lì, mở ảo, che phủ khuyết điểm môi. Bền màu và lâu trôi.', N'Son bền màu và có độ bám màu tốt. Đánh lên môi nhẹ môi, mịn lì, thách thức lem trôi.

Không làm khô môi, không làm lộ vân môi.

Trang điểm tạo màu sắc cho môi', NULL, N'CÁCH DÙNG – DIRECTION FOR USE

Thoa nhẹ nhàng sản phẩm lên môi theo chiều từ trong lòng môi ra ngoài

Bảo quản:  

Đậy nắp kín sau khi sử dụng.

Tránh ánh nắng trực tiếp hoặc nhiệt độ cao.', N'Xuất xứ: Korea', 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MaThuongHieu], [NguyenGia], [HinhAnh], [ThongTinSanPham], [CongDungSanPham], [ThanhPhanSanPham], [HuongDanSuDungSanPham], [XuatXu], [SoLuong]) VALUES (N'SP0070', N'Son Kem 3Ce Blur Water Tint #Sepia Đỏ Gạch 4,6Gr', N'TH011', 340000, N'image\hinh70.jpg', N'Son kem Blur Water Tint là son kem lì của thương hiệu 3CE với kết cấu son mờ lì, ít lem, không trôi và dễ tán đều lên môi chỉ với một lần chạm. ', N'Làm đầy môi để tạo ra một làn môi mờ mịn, ngoài ra lớp stain màu cũng rất gần với màu son tint khi thể hiện đầy đủ và không bị lệch màu quá nhiều
Màu son được bổ sung công thức như một lớp kem lót nhẹ, vừa tạo ra được độ mềm mại cho chất son vừa tạo ra độ che phủ cao, giúp bạn dễ dàng giấu đi các khuyết điểm dễ thấy trên môi như: rãnh môi sâu, môi sẫm màu,…', NULL, N'CÁCH DÙNG – DIRECTION FOR USE

Bặm nhẹ môi vào khăn giấy để loại bỏ bớt phần son dưỡng thừa và tạo một lớp nền mềm mịn nhưng không quá trơn trượt để áp dụng son dễ hơn. Nhúng đầu cọ vào son và gạt nhẹ vào phần miệng/ lọ cây son để lấy được lượng son vừa đủ dùng. Chấm son vào lòng môi trên và dưới, sau đó tán đều chất son qua hai bên tái và phải bằng đầu cọ hoặc tay không để tạo hiệu ứng 3D hoàn hảo cho môi

Quy cách: Thỏi, 4,6Gr

Bảo quản: Bảo quản nơi khô ráo, thoáng mát, tránh ánh sáng trực tiếp
', N'Xuất xứ: Korea', 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MaThuongHieu], [NguyenGia], [HinhAnh], [ThongTinSanPham], [CongDungSanPham], [ThanhPhanSanPham], [HuongDanSuDungSanPham], [XuatXu], [SoLuong]) VALUES (N'SP0071', N'Son Thỏi Bóng 3Ce Glow #Under Pressure Màu Đỏ Ớt 3Gr', N'TH011', 240000, N'image\hinh71.jpg', N'Son kem lì Glow là sản phẩm son môi đến từ thương hiệu mỹ phẩm 3CE của Korea, chứa thành phần dưỡng môi cao cấp, không cần đến son dưỡng nhưng khả năng lên màu môi vẫn hiệu quả tạo đôi môi căng mọng dưỡng chất, hiệu ứng căng bóng và đàn hồi. ', N'Chứa các thành phần dưỡng ẩm làm mềm mịn môi và mang lại độ bóng tự nhiên cho đôi môi căng bóng và đàn hồi
Màu son tươi sáng giúp lớp trang điểm môi trong suốt và rực rỡ
Chứa dẫn xuất axit amin dưỡng ẩm môi, ngăn ngừa môi khô, bong tróc', NULL, N'CÁCH DÙNG – DIRECTION FOR USE

Thoa trực tiếp lên môi', N'Xuất xứ: Korea', 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MaThuongHieu], [NguyenGia], [HinhAnh], [ThongTinSanPham], [CongDungSanPham], [ThanhPhanSanPham], [HuongDanSuDungSanPham], [XuatXu], [SoLuong]) VALUES (N'SP0072', N'Son Kem Lì 3Ce Cloud Lip Tint #Needful Đỏ Gạch 4Gr', N'TH011', 340000, N'image\hinh72.jpg', N'Dòng son kem lì mịn nhẹ như mây Cloud Lip Tint đến từ thương hiệu 3CE, có chất son mềm mượt dễ tán, son set lì nhanh lên môi và giữ cho đôi môi luôn mịn màng, tạo cảm giác đôi môi mịn mượt, hoàn hảo nhẹ tựa như mây.', N'Son có kết cấu mướt mịn, khi lướt trên môi tạo cảm giác phủ đều mà không làm lộ nếp nhăn hay vân môi
Chất son mềm mượt không gây khô môi, son có dưỡng nhẹ nhưng không tạo cảm giác bết dính trên môi', NULL, N'CÁCH DÙNG – DIRECTION FOR USE

Thoa trực tiếp lên môi', N'Xuất xứ: Korea', 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MaThuongHieu], [NguyenGia], [HinhAnh], [ThongTinSanPham], [CongDungSanPham], [ThanhPhanSanPham], [HuongDanSuDungSanPham], [XuatXu], [SoLuong]) VALUES (N'SP0073', N'Son Kem 3Ce Blur Water Tint #Spot Player Đỏ Cherry 4,6Gr', N'TH011', 340000, N'image\hinh73.jpg', N'Dòng son kem lì mịn nhẹ như mây Cloud Lip Tint đến từ thương hiệu 3CE, có chất son mềm mượt dễ tán, son set lì nhanh lên môi và giữ cho đôi môi luôn mịn màng, tạo cảm giác đôi môi mịn mượt, hoàn hảo nhẹ tựa như mây.', N'Son có kết cấu mướt mịn, khi lướt trên môi tạo cảm giác phủ đều mà không làm lộ nếp nhăn hay vân môi
Chất son mềm mượt không gây khô môi, son có dưỡng nhẹ nhưng không tạo cảm giác bết dính trên môi', NULL, N'CÁCH DÙNG – DIRECTION FOR USE

Thoa trực tiếp lên môi', N'Xuất xứ: Korea', 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MaThuongHieu], [NguyenGia], [HinhAnh], [ThongTinSanPham], [CongDungSanPham], [ThanhPhanSanPham], [HuongDanSuDungSanPham], [XuatXu], [SoLuong]) VALUES (N'SP0074', N'Sữa Rửa Mặt Sáng Mịn Dưỡng Ẩm Biore 100Gr', N'TH012', 55000, N'image\hinh74.jpg', N'Sữa Rửa Mặt Sáng Mịn Dưỡng Ẩm Biore 100Gr
Sữa rửa mặt Bioré chăm sóc da thế hệ mới. Bí quyết sở hữu làn da mộc đẹp tự nhiên của phụ nữ Nhật', N'Công nghệ thanh lọc da SPT đột phá từ Nhật Bản nhẹ nhàng lấy sạch bụi bẩn, bã nhờn trên bề mặt da mà không làm mất đi độ ẩm tự nhiên của da
- Bọt kem cải tiến Dạng kem cực mềm mịn nhẹ nhàng chăm sóc làn da
- Công thức Chứa thành phần đất sét cùng với hạt siêu mịn giúp hấp thu bã nhờn hiệu quả', N'Serum giúp dưỡng da: Sarbitol và Glycerin', N'CÁCH DÙNG – DIRECTION FOR USE
 
- Cho sữa rửa mặt vào lòng bàn tay, hòa tan với nước để tạo bọt rồi massage nhẹ nhàng lên mặt, tránh vùng mắt
- Rửa lại thật sạch với nước
- Dùng 2 lần mỗi ngày', N'Xuất xứ: Việt Nam', 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MaThuongHieu], [NguyenGia], [HinhAnh], [ThongTinSanPham], [CongDungSanPham], [ThanhPhanSanPham], [HuongDanSuDungSanPham], [XuatXu], [SoLuong]) VALUES (N'SP0075', N'Khăn Giấy Tẩy Trang Giữ Ẩm Biore 10 Miếng', N'TH012', 29000, N'image\hinh75.jpg', N'Khăn Giấy Tẩy Trang Dưỡng Ẩm Biore Được nhập khẩu trực tiếp từ Nhật Bản, đây là nhãn hiệu sản phẩm tẩy trang chiếm thị phần số 1 Nhật Bản, Sản phẩm được làm 100% từ sợi bông tự nhiên chứa tinh chất dưỡng ẩm Rich Moisture giúp tẩy trang hiệu quả mà vẫn dịu', N'Sản phẩm được làm 100% từ sợi bông tự nhiên chứa tinh chất dưỡng ẩm Rich Moisture giúp tẩy trang hiệu quả mà vẫn dịu nhẹ, không làm khô da.
Giúp lỗ chân lông sạch thoáng khỏi cặn trang điểm và lớp mascara không trôi mà không cần rửa lại với nước hay sữa rửa mặt.', N'Water, Isododecane, Butylene Glycol, PPG-9 Diglyceryl Ether, Dicaprylyl Ether, Hydroxyethyl cellullose, Fragrance, Tocopherol và một số thành phần khác.', N'CÁCH DÙNG – DIRECTION FOR USE

Dùng tay giữ chặt miếng khăn giấy và nhẹ nhàng tẩy sạch lớp trang điểm.
Đắp miếng khăn giấy lên mắt khoảng 5 - 6 giây và lau nhẹ để tẩy trang vùng mắt.', N'Xuất xứ: Việt Nam', 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MaThuongHieu], [NguyenGia], [HinhAnh], [ThongTinSanPham], [CongDungSanPham], [ThanhPhanSanPham], [HuongDanSuDungSanPham], [XuatXu], [SoLuong]) VALUES (N'SP0076', N'Dầu Tẩy Trang Cho Mọi Loại Da Biore 150Ml', N'TH012', 172000, N'image\hinh76.jpg', N'Thương hiệu Biore là thương hiệu mỹ phẩm của Tập đoàn Kao, Nhật Bản, được thành lập vào năm 1887, kinh doanh trong các lĩnh vực: Chăm sóc sắc đẹp, chăm sóc sức khỏe con người, chăm sóc vải sợi và vệ sinh nhà cửa', N'Giúp làm sạch lớp trang điểm dày, mascara không trôi, ngay cả khi tay và mặt đang ướt.
Dễ rửa trôi chỉ bằng nước, không cần rửa lại bằng sữa rửa mặt.
Hạn chế hư tổn và khô da do rửa mặt nhiều.', NULL, N'CÁCH DÙNG – DIRECTION FOR USE

Cho một lượng vừa đủ vào lòng bàn tay hoặc bông tẩy trang. 
Massage nhẹ nhàng khắp mặt.
Rửa sạch mặt với nước.
Có thể dùng tẩy trang mắt.', N'Xuất xứ: Việt Nam', 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MaThuongHieu], [NguyenGia], [HinhAnh], [ThongTinSanPham], [CongDungSanPham], [ThanhPhanSanPham], [HuongDanSuDungSanPham], [XuatXu], [SoLuong]) VALUES (N'SP0077', N'Sữa Chống Nắng Sáng Mịn Kiềm Dầu Biore Perfect Face Milk 30Ml', N'TH012', 102000, N'image\hinh77.jpg', N'Sữa Chống Nắng Sáng Mịn Kiềm Dầu Biore Perfect Face Milk 30Ml với chỉ số chống nắng tối ưu, giúp bảo vệ da toàn diện khỏi sự tác động của tia UV.  Bioré Perfect Face Milk đặc chế dành riêng cho da dầu nhờn nằm trong top các sản phẩm chống nắng được yêu th', N'Chỉ số chống nắng tối ưu SPF50+/PA+++ 
- Dạng sữa dễ thấm với công nghệ bột phấn Sara Sara giúp cho da thêm mịn màng
- Sữa chống nắng có chức năng trang điểm 
- Da trắng mịn kiềm dầu 
- Không nhờn rít ', N'Cyclopentaslloxance, Zinc Oxide, Alcohol', N'CÁCH DÙNG – DIRECTION FOR USE
 
- Lắc kỹ, thoa nhẹ đều khắp mặt trước khi đi ra ngoài nắng 
- Thoa lại khi ra mồ hôi hoặc bơi lâu dưới nước
 ', N'Xuất xứ: Việt Nam', 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MaThuongHieu], [NguyenGia], [HinhAnh], [ThongTinSanPham], [CongDungSanPham], [ThanhPhanSanPham], [HuongDanSuDungSanPham], [XuatXu], [SoLuong]) VALUES (N'SP0078', N'Nước Dưỡng Bio Gold Rose Bio Essene 100Ml', N'TH013', 525000, N'image\hinh78.jpg', N'Nước Dưỡng Bio Gold Rose Bio Essene 100Ml', N'Chiết xuất vàng 24, tính chất hoa hồng, được hấp thụ nhanh chóng vào da, ngăn ngừa các gốc tự do gây hại
- Ngăn ngừa nếp nhăn và duy trì sự trẻ trung của da
- giúp phục hồi sự rạng rỡ của da, cải thiện độ đàn hồi và ngăn ngừa chảy xệ. Se lỗ chân lông, Cân bằng tối ưu độ ẩm và lớp dầu tự nhiên trên da, giúp da mềm mượt', NULL, N'CÁCH DÙNG – DIRECTION FOR USE
 
- Sử dụng 2 lần/Ngày, sau khi dùng sữa rửa mặt và nước cân bằng/hoa hồng
- Dùng 1 lượng vừa đủ, mát xa lên mặt theo chuyển động tròn cho đến khi hấp thu hoàn toàn', N'Xuất xứ: Malaysia', 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MaThuongHieu], [NguyenGia], [HinhAnh], [ThongTinSanPham], [CongDungSanPham], [ThanhPhanSanPham], [HuongDanSuDungSanPham], [XuatXu], [SoLuong]) VALUES (N'SP0079', N'Kem Dưỡng Birds Nest Bio Essence 50Gr', N'TH013', 377000, N'image\hinh79.jpg', N'Kem Dưỡng Bio-essence Dưỡng Da Săn Mịn Rạng Ngời 50g là dòng kem dưỡng đến từ thương hiệu mỹ phẩm BIO-ESSENCE của Singapore, chiết xuất collagen và tinh chất tổ yến hỗ trợ dưỡng ẩm và tăng cường bổ sung collagen giúp da trở nên sáng mịn, căng mướt, ngăn c', N'Với kết cấu kem mịn, không gây nhờn rít, tạo cảm giác tươi mát trong khi dưỡng ẩm
Chứa giàu collagen với các chiết xuất từ thành phần tự nhiên', NULL, N'CÁCH DÙNG – DIRECTION FOR USE

Sử dụng một lượng vừa đủ, mát xa lên mặt và cổ theo chuyển động tròn cho đến khi hấp thu hoàn toàn

Quy cách: Hũ, 50gr', N'Xuất xứ: Malaysia', 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MaThuongHieu], [NguyenGia], [HinhAnh], [ThongTinSanPham], [CongDungSanPham], [ThanhPhanSanPham], [HuongDanSuDungSanPham], [XuatXu], [SoLuong]) VALUES (N'SP0080', N'Tinh Chất Birds Nest Bio Essence 30Gr', N'TH013', 360000, N'image\hinh80.jpg', N'Tinh chất dưỡng da của thương hiệu Bio-essence chiết xuất Tổ Yến & Collagen 1000mg dưỡng da, mang lại vẻ căng mọng, tươi sáng cho làn da. Kết cấu sản phẩm mỏng nhẹ dễ đang thẩm thấu giúp gia hấp thu một cách nhanh chóng. Phù hợp với những làn da đang cần ', N'Bổ sung 1000mg Tinh chất Collagen: nuôi dưỡng làn da căng mịn, ẩm mượt​
Tinh chất Tổ Yến: dưỡng ẩm sâu, tăng cường độ đàn hồi hiệu quả
Peptide dưỡng trắng: đẩy lùi các sắc tố làm sạm da, dưỡng da trắng hồng rạng rỡ', NULL, N'CÁCH DÙNG

Sử dụng 1 lượng vừa đủ, mát xa trên mặt và cổ theo chuyển động tròn cho đến khi hấp thu hoàn toàn

Quy cách: Chai, 30Gr

Bảo quản:

- Bảo quản nơi khô ráo, thoáng mát.

- Tránh ánh nắng trực tiếp.

- Để xa tầm tay trẻ em, đóng nắp sau khi sử dụng sản phẩm', N'Xuất xứ: Malaysia', 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MaThuongHieu], [NguyenGia], [HinhAnh], [ThongTinSanPham], [CongDungSanPham], [ThanhPhanSanPham], [HuongDanSuDungSanPham], [XuatXu], [SoLuong]) VALUES (N'SP0081', N'Nước Tẩy Trang Micellar Water Bio Essence 400Ml', N'TH013', 298000, N'image\hinh81.jpg', N'Nước tẩy trang Bio-Water Micellar Water của thương hiệu Bio-essence làm sạch dễ dàng kết hợp tăng cường độ ẩm cho làn da, bảo vệ da khỏi những tác nhân có hại từ môi trường ô nhiễm, ngăn chặn sự tắc nghẽn lổ chân lông do hạt bụi siêu nhỏ, làm sạch và làm ', N'Loại bỏ hoàn toàn lớp trang điểm lâu trôi và tạp chất cùng bụi bẩn, ngay cả bụi siêu mịn PM2.5 chỉ trong một bước
Tác dụng 5 trong 1: tẩy trang, làm sạch, se lỗ chân lông, dịu da và dưỡng ẩm
Không dầu khoáng, không cồn, không chất bảo quản, không chất tạo mùi, không chất tạo màu', NULL, N'CÁCH DÙNG

- Thấm một lượng sản phẩm vừa đủ ra bông tẩy trang

- Nhẹ nhàng lau sạch lớp trang điểm, không cần rửa lại bằng nước

Quy cách: Chai, 400Ml

Bảo quản: Bảo quản nơi thoáng mát, tránh ánh sáng mặt trời trực tiếp', N'Xuất xứ: Malaysia', 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MaThuongHieu], [NguyenGia], [HinhAnh], [ThongTinSanPham], [CongDungSanPham], [ThanhPhanSanPham], [HuongDanSuDungSanPham], [XuatXu], [SoLuong]) VALUES (N'SP0082', N'Xịt Khoáng Cho Da Nhạy Cảm Bio Essence 300Ml', N'TH013', 412000, N'image\hinh82.jpg', N'Xịt khoáng  thương hiệu Bio-essence sẽ điều hòa lượng dầu cả ngày dài mà vẫn cấp ẩm, kết quả là da bạn trông căng mướt nhưng không hề nhờn bóng, lớp make-up xinh đẹp sẽ kéo dài mà không cần dặm lại. Nước Xịt Khoáng Bio-essence Miracle Bio Water có các hàm', N'Sở hữu khoáng vi lượng dồi dào với hàm lượng sodium chloride thấp, mang lại cho hiệu quả dưỡng ẩm cao, giúp làm mát, mang lại cảm giác mềm mịn cho làn da.
Làm dịu và mềm da, không gây kích ứng', NULL, N'CÁCH DÙNG

- Giữ chai xịt thẳng đứng song song với khuôn mặt 

- Chai xịt khoáng nên cách làn da trong khoảng từ 20 – 30 cm tùy điều kiện

- Không cần lắc, nhẹ nhàng nhấn nút xịt, giữ nó và di chuyển đầu xịt theo đường tròn bao quanh khuôn mặt. Thả nút xịt ra 

- Rửa sạch tay và vỗ nhẹ lên da trong khoàng 30 giây

- Giữ nước xịt trên da trong khoảng 3 phút rồi dùng khăn mềm hoặc bông gòn thấm và loại bỏ nước dư thừa còn xót lại', N'Xuất xứ: Malaysia', 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MaThuongHieu], [NguyenGia], [HinhAnh], [ThongTinSanPham], [CongDungSanPham], [ThanhPhanSanPham], [HuongDanSuDungSanPham], [XuatXu], [SoLuong]) VALUES (N'SP0083', N'Nước Hoa Hồng Dưỡng Da Giúp Tái Tạo Da Chiết Xuất Sữa Ong Chúa Renew Bio Essence 100Ml', N'TH013', 342000, N'image\hinh83.jpg', N'Nước Hoa Hồng Dưỡng Da Giúp Tái Tạo Da Chiết Xuất Sữa Ong Chúa Renew Bio-essence 100Ml', N'Giúp tăng cường khả năng thẩm thấu các dưỡng chất ở các bước chăm sóc da tiếp theo
- Giúp làm sạch sâu bụi bẩn và bã nhờn
- Dưỡng da chuyên sâu và cung cấp độ ẩm cần thiết Giúp Phục Hồi làn da tươi sáng và mềm mượt
- Se lỗ chân lông cho da mượt mà', N'Water, Propylene Glycol, Butylene Glycol, Glycerin, Olive Oil PEG-7 Esters', N'CÁCH DÙNG – DIRECTION FOR USE
 
- Sử dụng sau bước làm sạch da. Dùng một lượng vừa đủ, mát xa lên mặt và cổ theo chuyển động tròn cho đến khi sản phẩm được hấp thu hoàn toàn. Phù hợp cho mọi loại da', N'Xuất xứ: Malaysia', 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MaThuongHieu], [NguyenGia], [HinhAnh], [ThongTinSanPham], [CongDungSanPham], [ThanhPhanSanPham], [HuongDanSuDungSanPham], [XuatXu], [SoLuong]) VALUES (N'SP0084', N'Tinh Chất Bio-White Pro Whitening 30Ml', N'TH013', 690000, N'image\hinh84.jpg', N'Tinh Chất Bio-White Pro Whitening 30Ml', N'TINH CHẤT giúp dưỡng sáng SÁNG DA BIO WHITE PRO WHITENING SUPER SERUM', N'Bio-White Pro Whitening Super Serum là sự kết hợp hoàn hảo giữa công nghệ độc quyền Bio Energy Complex, Mela-D với 9 loại peptide, chiết xuất và cây Tanaka và đặc biệt là Alpha-arbutin chứa trong màng bọc siêu nhiều tất cả trong một chai serum với công dụng làm giúp làm sáng da, mờ đốm nâu hiệu quả, cho làn da nét tươi sáng rạng rỡ.', N' 
CÁCH DÙNG – DIRECTION FOR USE:
Sử dụng 2 lần một ngày sau khi làm sạch. 
Cho một lượng sản phẩm vừa đủ và thoa đều khắp mặt. 
Thoa thêm một lớp ở những vùng da cần làm giảm đồm nâu
 ', N'Xuất xứ: Malaysia', 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MaThuongHieu], [NguyenGia], [HinhAnh], [ThongTinSanPham], [CongDungSanPham], [ThanhPhanSanPham], [HuongDanSuDungSanPham], [XuatXu], [SoLuong]) VALUES (N'SP0085', N'HỘP QUÀ BOM SON MY LIPSTICK #802', N'TH014', 186000, N'image\hinh85.jpg', N'Hộp Quà Son Thỏi B.O.M My Lipstick #802 My Cherry Red Đỏ Cherry 3.5gr', N'Màu son chuẩn sắc với công nghệ COLOR PRINTING chuẩn màu từ lần đầu tiên lên môi, màu sắc tươi tắn, bám lâu trên môi. Chất son mềm mướt, mịn môi, không gây khô hay lộ vân môi. ', NULL, N'Dặm một ít phấn hoặc kem nền lên môi trước khi tô son để son lên màu chuẩn xác hơn. Có thể kết hợp cùng chì kẻ viền môi để tạo hiệu ứng môi đầy đặn và có chiều sâu hơn. 

- Tô một lớp mỏng son lên môi, dùng cọ hoặc ngón tay tán đều từ phần môi trong ra viền môi. Hoặc bạn có thể bặm môi nhẹ nhàng để màu son trông tự nhiên hơn. ', N'Xuất xứ: Korea', 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MaThuongHieu], [NguyenGia], [HinhAnh], [ThongTinSanPham], [CongDungSanPham], [ThanhPhanSanPham], [HuongDanSuDungSanPham], [XuatXu], [SoLuong]) VALUES (N'SP0086', N'Mascara Bom Wonderproof Volume & Curl #01 Deep Black 8G', N'TH014', 348000, N'image\hinh86.jpg', N'Mascara Wonderproof Volume đến từ thương hiệu BOM ứng dụng công nghệ với đầu cọ đặc biệt, làm dày mi 10 lần tạo đôi mắt cuốn hút đầy lôi cuốn với hàng mi cong và dày một cách hoàn hảo. ', N'Thiết kế thon dài với phần thân có màu trùng với màu sản phẩm bên trong cho bạn quan sát dễ dàng hơn. 

- Khả năng làm cong mi một cách tự nhiên với độ dày phong phú 

- Những sợi mi được uốn cong theo hình chữ C từ gốc tới đầu mi và được cố định một cách vượt trội. ', NULL, N'CÁCH DÙNG – DIRECTION FOR USE

Dùng đầu cọ lấy một lượng vừa đủ chuốt từ chân mi đến ngọn mi cho đôi mắt ấn tượng. ', N'Xuất xứ: Korea', 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MaThuongHieu], [NguyenGia], [HinhAnh], [ThongTinSanPham], [CongDungSanPham], [ThanhPhanSanPham], [HuongDanSuDungSanPham], [XuatXu], [SoLuong]) VALUES (N'SP0087', N'Son BOM My Lipstick Limited Edition #802 My Cherry Red', N'TH014', 209000, N'image\hinh87.jpg', N'Son BOM My Lipstick Limited Edition #802 My Cherry Red ', N'Màu son chuẩn sắc với công nghệ COLOR PRINTING lên môi ngay từ lần đầu tiên thoa, màu sắc tươi tắn, bám lâu trên môi. Chất son mềm, mượt mà, mịn môi, không gây khô môi hay lộ vân môi vì son có thành phần dưỡng chất giúp môi mịn như lụa.

Có lớp Gel silicone giúp tạo một lớp màn phim nước bên trong, dưỡng ẩm đôi môi và bảo vệ môi', NULL, N'CÁCH DÙNG – DIRECTION FOR USE

Nên tẩy tế bào chết cho môi trước khi sử dụng son.

Thoa trực tiếp lên môi. ', N'Xuất xứ: Korea', 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MaThuongHieu], [NguyenGia], [HinhAnh], [ThongTinSanPham], [CongDungSanPham], [ThanhPhanSanPham], [HuongDanSuDungSanPham], [XuatXu], [SoLuong]) VALUES (N'SP0088', N'Phấn Phủ Kiềm Dầu BOM Fixing Flex Powder Pact 7,5G', N'TH014', 368000, N'image\hinh88.jpg', NULL, N'Phấn Phủ Nén Kiềm Dầu Vượt Trội, Cho Làn Da Mịn Màng BOM Fixing Flex với chức năng kiềm dầu vượt trội, kiểm soát bã nhờn giúp lớp trang điểm luôn được khô thoáng. ', NULL, N'CÁCH DÙNG – DIRECTION FOR USE

Dùng cọ hoặc bông phấn lấy một lượng phấn vừa đủ, vỗ nhẹ để rơi bớt hạt phấn. 

Phủ lên vùng đổ dầu nhiều hoặc toàn bộ mặt. 

Phủ lên mắt và môi đẻ lớp trang điểm được lâu trôi hơn. ', N'Xuất xứ: Korea', 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MaThuongHieu], [NguyenGia], [HinhAnh], [ThongTinSanPham], [CongDungSanPham], [ThanhPhanSanPham], [HuongDanSuDungSanPham], [XuatXu], [SoLuong]) VALUES (N'SP0089', N'Tinh Chất Eight Tea Cicaming Serum Cấp Ẩm Và Giúp Phục Hồi Bom 38Ml', N'TH014', 398000, N'image\hinh89.jpg', N'Tinh Chất B.O.M Eight Tea Cicaming Từ 8 Loại Trà 38ml là dòng serum dưỡng da đến từ thương hiệu mỹ phẩm B.O.M của Korea, với chiết xuất từ 8 loại trà cung cấp độ ẩm, hỗ trợ Giúp Sạch Khuẩn, giúp giảm viêm, ngăn ngừa mụn. ', N'Tinh Chất Dưỡng Ẩm Dịu Nhẹ Chiết Xuất Từ 8 Loại Trà Bom Eight Tea Cicaming Serum có kết cấu hơi lỏng và mỏng nhẹ, mang đến trải nghiệm dễ chịu và thoáng mát cho làn da của người sử dụng. Tinh chất có khả năng thẩm thấu tốt, không để lại cảm giác nhờn dính mà thẩm thấu nhanh chóng và đưa dưỡng chất vào sâu bên trong biểu bì da', NULL, N'CÁCH DÙNG – DIRECTION FOR USE 

- Sử dụng sản phẩm sau bước làm sạch và cân bằng da
- Dùng 3-4 giọt thoa đều lên toàn mặt, sau đó kết hợp massage và vỗ nhẹ để tăng độ thẩm thấu cho sản phẩm

Quy cách: Chai,thể tích: 38Ml

Bảo quản: Nơi khô ráo, thoáng mát. Tránh ánh nắng trực tiếp, nơi có nhiệt độ cao hoặc ẩm ướt. Đậy nắp kín sau khi sử dụng', N'Xuất xứ: Korea', 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MaThuongHieu], [NguyenGia], [HinhAnh], [ThongTinSanPham], [CongDungSanPham], [ThanhPhanSanPham], [HuongDanSuDungSanPham], [XuatXu], [SoLuong]) VALUES (N'SP0090', N'Son Kem Lì BOM Matt Holic Tint #503 Cinnamon Beige Cam Nude Đất 8,5G', N'TH014', 349000, N'image\hinh90.jpg', NULL, N'Màu sắc trendy đa dạng, lên màu cực chuẩn. Đánh lòng môi hay full môi đều lên màu chuẩn sắc.

BST mới với 3 màu tông đất kết hợp với BST 3 màu trước đó (màu hồng tím, đỏ gạch, đỏ rượu) cho Khách hàng đa dạng sự lựa chọn và đa dạng sự phối màu với nhiều cách đánh son trendy và quyến rũ.', NULL, N'CÁCH DÙNG – DIRECTION FOR USE

Nên tẩy tế bào chết cho môi trước khi sử dụng son.

Thoa trực tiếp lên môi. ', N'Xuất xứ: Korea', 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MaThuongHieu], [NguyenGia], [HinhAnh], [ThongTinSanPham], [CongDungSanPham], [ThanhPhanSanPham], [HuongDanSuDungSanPham], [XuatXu], [SoLuong]) VALUES (N'SP0091', N'Kem Dưỡng Ẩm Dành Cho Da Khô Moisturising Cream Cerave 50Ml', N'TH015', 168000, N'image\hinh91.jpg', N'Kem Dưỡng Cerave Cho Da Khô Đến Rất Khô là sản phẩm kem dưỡng đến từ thương hiệu mỹ phẩm Cerave của Mỹ, với 3 ceramide tự nhiên và Axit Hyaluronic, những chất cần thiết trong việc hỗ trợ hàng rào bảo vệ da và duy trì độ ẩm. ', N'3 loại Ceramides (1, 3, 6-II) thiết yếu giúp khôi phục hàng rào độ ẩm da. 
Công nghệ MVE độc quyền khoá ẩm cho da suốt 24 giờ. ', NULL, N'CÁCH DÙNG:

Có thể sửa dụng nhiều lần mỗi khi cần cung cấp độ ẩm cho làn da

Quy cách: Tuýp, 50Ml

Bảo quản: Bảo quản nơi khô ráo, thoáng mát, tránh ánh sáng trực tiếp', N'Xuất xứ: United States', 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MaThuongHieu], [NguyenGia], [HinhAnh], [ThongTinSanPham], [CongDungSanPham], [ThanhPhanSanPham], [HuongDanSuDungSanPham], [XuatXu], [SoLuong]) VALUES (N'SP0092', N'Kem Dưỡng Ẩm Dành Cho Da Khô Moisturising Cream Cerave 454Gr', N'TH015', 459000, N'image\hinh92.jpg', N'Kem Dưỡng Cerave Cho Da Khô Đến Rất Khô là sản phẩm kem dưỡng đến từ thương hiệu mỹ phẩm Cerave của Mỹ, với 3 ceramide tự nhiên và Axit Hyaluronic, những chất cần thiết trong việc hỗ trợ hàng rào bảo vệ da và duy trì độ ẩm. ', N'4 loại Ceramides (1, 3, 6-II) thiết yếu giúp khôi phục hàng rào độ ẩm da. 
Công nghệ MVE độc quyền khoá ẩm cho da suốt 24 giờ. ', NULL, N'CÁCH DÙNG:

Có thể sửa dụng nhiều lần mỗi khi cần cung cấp độ ẩm cho làn da

Quy cách: Tuýp, 50Ml

Bảo quản: Bảo quản nơi khô ráo, thoáng mát, tránh ánh sáng trực tiếp', N'Xuất xứ: United States', 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MaThuongHieu], [NguyenGia], [HinhAnh], [ThongTinSanPham], [CongDungSanPham], [ThanhPhanSanPham], [HuongDanSuDungSanPham], [XuatXu], [SoLuong]) VALUES (N'SP0093', N'Sữa Dưỡng Thể Cerave Moisturising Lotion Dành Cho Da Thường Và Da Khô 473Ml', N'TH015', 490000, N'image\hinh93.jpg', N'Sữa Dưỡng Thể Cerave Moisturising Lotion Dành Cho Da Thường Và Da Khô 473Ml là sản phẩm dưỡng da toàn thân của Cerave với sự kết hợp của 3 ceramides thiết yếu và hyaluronic acid, kem dưỡng giúp duy trì độ ẩm và giúp phục hồi lớp hàng rào bảo vệ da. Sản ph', N'Dưỡng ẩm và giúp phục hồi hàng rào độ ẩm tự nhiên của da
Mỏng nhẹ và không gây nhờn trên da
Công nghệ MVE: liên tục giải phóng các hoạt chất cấp ẩm giúp da ẩm suốt ngày dài', NULL, N'CÁCH DÙNG

Sử dụng bất cứ khi nào cần cung cấp độ ẩm cho da', N'Xuất xứ: United States', 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MaThuongHieu], [NguyenGia], [HinhAnh], [ThongTinSanPham], [CongDungSanPham], [ThanhPhanSanPham], [HuongDanSuDungSanPham], [XuatXu], [SoLuong]) VALUES (N'SP0094', N'Sữa Rửa Mặt Tạo Bọt Cerave Foaming Cleanser Sạch Sâu Cho Da Thường Đến Da Dầu 236Ml', N'TH015', 299000, N'image\hinh94.jpg', N'Sữa Rửa Mặt Cerave Sạch Sâu là sản phẩm sữa rửa mặt đến từ thương hiệu mỹ phẩm Cerave của Mỹ, với sự kết hợp của ba Ceramides thiết yếu, Hyaluronic Acid sản phẩm giúp làm sạch và giữ ẩm cho làn da mà không ảnh hưởng đến hàng rào bảo vệ da mặt và cơ thể.', N'3 loại Ceramides (1, 3, 6-II) thiết yếu giúp khôi phục hàng rào độ ẩm da. 
Hyaluronic Acid giúp duy trì độ ẩm tự nhiên của da.
Niacinamide giúp làm dịu, nuôi dưỡng, củng cố hàng rào da.
Kết cấu dạng gel tạo bọt giúp làm sạch sâu, loại bỏ dầu thừa, thông thoáng lỗ chân lông nhưng vẫn duy trì độ ẩm tự nhiên của da.', NULL, N'CÁCH DÙNG – DIRECTION FOR USE

- Làm ẩm da với nước và cho một lượng sản phẩm vừa đủ ra lòng bàn tay
- Thoa sản phẩm lên mặt và nhẹ nhàng massage trong vòng 30 giây
- Nhẹ nhàng rửa sạch lại với nước', N'Xuất xứ: United States', 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MaThuongHieu], [NguyenGia], [HinhAnh], [ThongTinSanPham], [CongDungSanPham], [ThanhPhanSanPham], [HuongDanSuDungSanPham], [XuatXu], [SoLuong]) VALUES (N'SP0095', N'Sữa Rửa Mặt Cerave Cho Da Nhạy Cảm Giúp Làm Sạch & Tẩy Tế Bào Chết Dịu Nhẹ 236Ml', N'TH015', 288000, N'image\hinh95.jpg', N'SỮA RỬA MẶT CERAVE - SMOOTHING SA CLEANSER CHO DA NHẠY CẢM GIÚP LÀM SẠCH & TẨY TẾ BÀO CHẾT DỊU NHẸ', N'Loại da: Da thiếu ẩm, Da sần sùi, khô ráp, Da mụn ẩn, mụn đầu đen', NULL, N'CÁCH DÙNG – DIRECTION FOR USE

Làm ẩm da với nước và cho một lượng sản phẩm vừa đủ ra lòng bàn tay. 

Thoa sản phẩm lên mặt nhẹ nhàng massage trong vòng 30 giây. 

Rửa sạch lại với nước.', N'Xuất xứ: United States', 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MaThuongHieu], [NguyenGia], [HinhAnh], [ThongTinSanPham], [CongDungSanPham], [ThanhPhanSanPham], [HuongDanSuDungSanPham], [XuatXu], [SoLuong]) VALUES (N'SP0096', N'Sữa Rửa Mặt Dưỡng Ẩm, Làm Sạch Sâu Dành Cho Da Thường & Da Khô Cerave Hydrating Cleanser 236Ml', N'TH015', 288000, N'image\hinh96.jpg', N'Sữa Rửa Mặt Dưỡng Ẩm, Làm Sạch Sâu Dành Cho Da Thường & Da Khô Cerave Hydrating Cleanser 236Ml', N'Với độ pH chuẩn khoảng 5.5, sữa rửa mặt Cerave Hydrating Facial Cleanser không chỉ giúp làm sạch bụi bẩn, mồ hôi bám đọng trên da mặt', NULL, N'CÁCH DÙNG

- Làm ẩm da với nước và cho một lượng sản phẩm vừa đủ ra lòng bàn tay
- Thoa sản phẩm lên mặt và nhẹ nhàng massage trong vòng 30 giây
- Nhẹ nhàng rửa sạch lại với nước

Quy cách: Chai, 236Ml', N'Xuất xứ: United States', 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MaThuongHieu], [NguyenGia], [HinhAnh], [ThongTinSanPham], [CongDungSanPham], [ThanhPhanSanPham], [HuongDanSuDungSanPham], [XuatXu], [SoLuong]) VALUES (N'SP0097', N'Sữa Tắm Timber Old Spice 473Ml', N'TH016', 179000, N'image\hinh97.jpg', N'Sữa tắm nam của thương hiệu OLD SPICE hương Timber 473Ml nhập khẩu từ Mỹ nằm trong Bộ sưu tập Tươi mới (Fresher Collection), sữa tắm giúp làm sạch da, đem lại mùi thơm sảng khoái và tươi mới cho cả ngày dài.', N'Làm sạch cơ thể
Mùi hương kết hợp giữa gỗ đàn hương và bạc hà mang đến hương thơm sảng khoái, mát lạnh như đang tận hưởng không khí se lạnh mùa đông', NULL, N'CÁCH DÙNG – DIRECTION FOR USE

- Làm ướt cơ thể 

- Cho một lượng sữa tắm vừa phải vào bông hoặc khăn tắm và xoa nhẹ nhàng để tạo bọt

- Tắm lại bằng nước sạch

- Sử dụng thường xuyên để đạt hiệu quả tối ưu', N'Xuất xứ: United States', 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MaThuongHieu], [NguyenGia], [HinhAnh], [ThongTinSanPham], [CongDungSanPham], [ThanhPhanSanPham], [HuongDanSuDungSanPham], [XuatXu], [SoLuong]) VALUES (N'SP0098', N'Dầu Gội Xả Old Spice 2 In 1 Timber Hương Gỗ Đàn Hương 650Ml', N'TH016', 104000, N'image\hinh98.jpg', N'Sản phẩm Old Spice 2 In 1 Timber là sự kết hợp giữa dầu gội và dầu xả trong cùng một sản phẩm. Cùng với mùi hương từ gỗ Đàn Hương đặc trưng, thoang thoảng mùi của Quế, mang đến một mái tóc mềm mại cùng mùi hương sang trọng, tươi mát từ thiên nhiên. ', N'Sản xuất và nhập khẩu trực tiếp từ Mỹ.
Công thức mùi hương đặc chế cho nam giới cùng khả năng lưu giữ hương thơm suốt ngày dài.
Dầu Gội - Xả 2IN1 giúp làm sạch sâu và dưỡng tóc cho mái tóc chắc khỏe, bồng bềnh và dễ tạo kiểu.', NULL, N'CÁCH DÙNG - DIRECTION FOR USE:

- Bước 1: Làm ướt tóc

- Bước 2: Cho một lượng vừa phải dầu Gội – Xả OldSpices và xoa đều trong lòng bàn tay, thoa lên và massage tóc

- Bước 3: Xả sạch lại dầu gội trên tóc với nước

- Bước 4: Tận hưởng và tỏa sáng cùng mùi hương nam tính', N'Xuất xứ: United States', 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MaThuongHieu], [NguyenGia], [HinhAnh], [ThongTinSanPham], [CongDungSanPham], [ThanhPhanSanPham], [HuongDanSuDungSanPham], [XuatXu], [SoLuong]) VALUES (N'SP0099', N'Viên Uống Biotin DHC Hỗ Trợ Giảm Rụng Tóc 30 Viên', N'TH017', 125000, N'image\hinh99.jpg', N'Viên uống Biotin giúp mọc tóc của DHC là một loại thực phẩm chức năng giúp mọc tóc; làm đẹp da; ngăn rụng tóc do dị ứng, viêm da cơ địa; tăng cường thể lực', N'Mọc tóc, đẹp da, tăng cường thể lực, trị rụng tóc do dị ứng, viêm da cơ địa', N'Biotin: 500μg

- Phụ liệu: Cellulose, bột đường, hydroxymethylcellulose, calci stearate, silicon dioxide microparticles', N'CÁCH DÙNG: uống 1 viên/này, uống với nước hoặc nước ấm. Không nhai viên.

Bảo quản: Nơi khô ráo, thoáng mát, tránh ánh sáng mặt trời', N'Xuất xứ: Japan', 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MaThuongHieu], [NguyenGia], [HinhAnh], [ThongTinSanPham], [CongDungSanPham], [ThanhPhanSanPham], [HuongDanSuDungSanPham], [XuatXu], [SoLuong]) VALUES (N'SP0100', N'Viên Uống Dầu Dừa DHC Hỗ Trợ Giảm Cân 60 Viên', N'TH017', 510000, N'image\hinh100.jpg', N'Viên uống dầu dừa của DHC là một loại thực phẩm chức năng hỗ trợ giảm cân, giúp đốt cháy mỡ thừa; giảm hấp thụ chất béo; cơ thể thon gọn', N'Sản phẩm có thành phần chính là Forskohlii chiết xuất từ thảo dược (Coleus forskohlii), dầu dừa và BCAA. 
Chiết xuất Forskohlii có công dụng hỗ trợ giảm cân và đốt lượng mỡ thừa trong cơ thể, giúp duy trì vẻ đẹp thon gọn. ', NULL, N'CÁCH DÙNG

Uống 2 viên/ngày (uống với nước hoặc nước ấm)', N'Xuất xứ: Japan', 0)
GO
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MaThuongHieu], [NguyenGia], [HinhAnh], [ThongTinSanPham], [CongDungSanPham], [ThanhPhanSanPham], [HuongDanSuDungSanPham], [XuatXu], [SoLuong]) VALUES (N'SP0101', N'Cà Phê Đắk Lắk Làm Sạch Da Chết Cơ Thể Cocoon Dak Lak Coffee Body Polish 200Ml', N'TH004', 119000, N'image\hinh101.jpg', N'Cà Phê Đắk Lắk Làm Sạch Da Chết Cơ Thể thương hiệu Cocoon được làm từ những hạt cà phê Đắk Lắk xay nhuyễn giàu cafeine hòa quyện với bơ cacao Tiền Giang, giúp bạn loại bỏ lớp tế bào chết già cỗi và xỉn màu, đánh thức làn da tươi mới đầy năng lượng cùng cả', N'Làm sạch da chết toàn thân
Mang lại làn da mịn màng ngay sau lần đầu sử dụng
Giúp da sáng mịn, đều màu', NULL, N'Thoa một lượng sản phẩm lên da ướt. Mát-xa nhẹ nhàng từ cổ đến chân, sau đó tắm sạch lại với nước. Dùng 2-3 lần một tuần để đạt kết quả tốt nhất', N'Xuất xứ: Việt Nam', 0)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MaThuongHieu], [NguyenGia], [HinhAnh], [ThongTinSanPham], [CongDungSanPham], [ThanhPhanSanPham], [HuongDanSuDungSanPham], [XuatXu], [SoLuong]) VALUES (N'SP01232', N'e234234', N'TH003', 234233424, N'image/14081940_cong-doan-trang-banh-da-tho-ha.jpeg', N'huttytyghgg', N'gfdgfdfd', N'dfgfgdf', N'dfgdfgg', N'thhtyty', NULL)
GO
INSERT [dbo].[SanPham_DanhMuc] ([MaSanPham], [MaDanhMuc]) VALUES (N'SP0001', N'DM001')
INSERT [dbo].[SanPham_DanhMuc] ([MaSanPham], [MaDanhMuc]) VALUES (N'SP0002', N'DM001')
INSERT [dbo].[SanPham_DanhMuc] ([MaSanPham], [MaDanhMuc]) VALUES (N'SP0004', N'DM001')
INSERT [dbo].[SanPham_DanhMuc] ([MaSanPham], [MaDanhMuc]) VALUES (N'SP0005', N'DM001')
INSERT [dbo].[SanPham_DanhMuc] ([MaSanPham], [MaDanhMuc]) VALUES (N'SP0006', N'DM001')
INSERT [dbo].[SanPham_DanhMuc] ([MaSanPham], [MaDanhMuc]) VALUES (N'SP0007', N'DM001')
INSERT [dbo].[SanPham_DanhMuc] ([MaSanPham], [MaDanhMuc]) VALUES (N'SP0008', N'DM001')
INSERT [dbo].[SanPham_DanhMuc] ([MaSanPham], [MaDanhMuc]) VALUES (N'SP01232', N'DM001')
INSERT [dbo].[SanPham_DanhMuc] ([MaSanPham], [MaDanhMuc]) VALUES (N'SP0001', N'DM002')
INSERT [dbo].[SanPham_DanhMuc] ([MaSanPham], [MaDanhMuc]) VALUES (N'SP0004', N'DM002')
INSERT [dbo].[SanPham_DanhMuc] ([MaSanPham], [MaDanhMuc]) VALUES (N'SP0008', N'DM002')
INSERT [dbo].[SanPham_DanhMuc] ([MaSanPham], [MaDanhMuc]) VALUES (N'SP0011', N'DM002')
INSERT [dbo].[SanPham_DanhMuc] ([MaSanPham], [MaDanhMuc]) VALUES (N'SP0012', N'DM002')
INSERT [dbo].[SanPham_DanhMuc] ([MaSanPham], [MaDanhMuc]) VALUES (N'SP0013', N'DM002')
INSERT [dbo].[SanPham_DanhMuc] ([MaSanPham], [MaDanhMuc]) VALUES (N'SP0017', N'DM002')
INSERT [dbo].[SanPham_DanhMuc] ([MaSanPham], [MaDanhMuc]) VALUES (N'SP0021', N'DM002')
INSERT [dbo].[SanPham_DanhMuc] ([MaSanPham], [MaDanhMuc]) VALUES (N'SP0022', N'DM002')
INSERT [dbo].[SanPham_DanhMuc] ([MaSanPham], [MaDanhMuc]) VALUES (N'SP0023', N'DM002')
INSERT [dbo].[SanPham_DanhMuc] ([MaSanPham], [MaDanhMuc]) VALUES (N'SP0024', N'DM002')
INSERT [dbo].[SanPham_DanhMuc] ([MaSanPham], [MaDanhMuc]) VALUES (N'SP0025', N'DM002')
INSERT [dbo].[SanPham_DanhMuc] ([MaSanPham], [MaDanhMuc]) VALUES (N'SP0027', N'DM002')
INSERT [dbo].[SanPham_DanhMuc] ([MaSanPham], [MaDanhMuc]) VALUES (N'SP0029', N'DM002')
INSERT [dbo].[SanPham_DanhMuc] ([MaSanPham], [MaDanhMuc]) VALUES (N'SP0030', N'DM002')
INSERT [dbo].[SanPham_DanhMuc] ([MaSanPham], [MaDanhMuc]) VALUES (N'SP0031', N'DM002')
INSERT [dbo].[SanPham_DanhMuc] ([MaSanPham], [MaDanhMuc]) VALUES (N'SP0034', N'DM002')
INSERT [dbo].[SanPham_DanhMuc] ([MaSanPham], [MaDanhMuc]) VALUES (N'SP0035', N'DM002')
INSERT [dbo].[SanPham_DanhMuc] ([MaSanPham], [MaDanhMuc]) VALUES (N'SP0036', N'DM002')
INSERT [dbo].[SanPham_DanhMuc] ([MaSanPham], [MaDanhMuc]) VALUES (N'SP0037', N'DM002')
INSERT [dbo].[SanPham_DanhMuc] ([MaSanPham], [MaDanhMuc]) VALUES (N'SP0038', N'DM002')
INSERT [dbo].[SanPham_DanhMuc] ([MaSanPham], [MaDanhMuc]) VALUES (N'SP0039', N'DM002')
INSERT [dbo].[SanPham_DanhMuc] ([MaSanPham], [MaDanhMuc]) VALUES (N'SP0040', N'DM002')
INSERT [dbo].[SanPham_DanhMuc] ([MaSanPham], [MaDanhMuc]) VALUES (N'SP0041', N'DM002')
INSERT [dbo].[SanPham_DanhMuc] ([MaSanPham], [MaDanhMuc]) VALUES (N'SP0042', N'DM002')
INSERT [dbo].[SanPham_DanhMuc] ([MaSanPham], [MaDanhMuc]) VALUES (N'SP0043', N'DM002')
INSERT [dbo].[SanPham_DanhMuc] ([MaSanPham], [MaDanhMuc]) VALUES (N'SP0044', N'DM002')
INSERT [dbo].[SanPham_DanhMuc] ([MaSanPham], [MaDanhMuc]) VALUES (N'SP0045', N'DM002')
INSERT [dbo].[SanPham_DanhMuc] ([MaSanPham], [MaDanhMuc]) VALUES (N'SP0046', N'DM002')
INSERT [dbo].[SanPham_DanhMuc] ([MaSanPham], [MaDanhMuc]) VALUES (N'SP0047', N'DM002')
INSERT [dbo].[SanPham_DanhMuc] ([MaSanPham], [MaDanhMuc]) VALUES (N'SP0048', N'DM002')
INSERT [dbo].[SanPham_DanhMuc] ([MaSanPham], [MaDanhMuc]) VALUES (N'SP0049', N'DM002')
INSERT [dbo].[SanPham_DanhMuc] ([MaSanPham], [MaDanhMuc]) VALUES (N'SP0050', N'DM002')
INSERT [dbo].[SanPham_DanhMuc] ([MaSanPham], [MaDanhMuc]) VALUES (N'SP0051', N'DM002')
INSERT [dbo].[SanPham_DanhMuc] ([MaSanPham], [MaDanhMuc]) VALUES (N'SP0052', N'DM002')
INSERT [dbo].[SanPham_DanhMuc] ([MaSanPham], [MaDanhMuc]) VALUES (N'SP0053', N'DM002')
INSERT [dbo].[SanPham_DanhMuc] ([MaSanPham], [MaDanhMuc]) VALUES (N'SP0054', N'DM002')
INSERT [dbo].[SanPham_DanhMuc] ([MaSanPham], [MaDanhMuc]) VALUES (N'SP0056', N'DM002')
INSERT [dbo].[SanPham_DanhMuc] ([MaSanPham], [MaDanhMuc]) VALUES (N'SP0057', N'DM002')
INSERT [dbo].[SanPham_DanhMuc] ([MaSanPham], [MaDanhMuc]) VALUES (N'SP0058', N'DM002')
INSERT [dbo].[SanPham_DanhMuc] ([MaSanPham], [MaDanhMuc]) VALUES (N'SP0059', N'DM002')
INSERT [dbo].[SanPham_DanhMuc] ([MaSanPham], [MaDanhMuc]) VALUES (N'SP0060', N'DM002')
INSERT [dbo].[SanPham_DanhMuc] ([MaSanPham], [MaDanhMuc]) VALUES (N'SP0061', N'DM002')
INSERT [dbo].[SanPham_DanhMuc] ([MaSanPham], [MaDanhMuc]) VALUES (N'SP0062', N'DM002')
INSERT [dbo].[SanPham_DanhMuc] ([MaSanPham], [MaDanhMuc]) VALUES (N'SP0063', N'DM002')
INSERT [dbo].[SanPham_DanhMuc] ([MaSanPham], [MaDanhMuc]) VALUES (N'SP0064', N'DM002')
INSERT [dbo].[SanPham_DanhMuc] ([MaSanPham], [MaDanhMuc]) VALUES (N'SP0065', N'DM002')
INSERT [dbo].[SanPham_DanhMuc] ([MaSanPham], [MaDanhMuc]) VALUES (N'SP0066', N'DM002')
INSERT [dbo].[SanPham_DanhMuc] ([MaSanPham], [MaDanhMuc]) VALUES (N'SP0067', N'DM002')
INSERT [dbo].[SanPham_DanhMuc] ([MaSanPham], [MaDanhMuc]) VALUES (N'SP0074', N'DM002')
INSERT [dbo].[SanPham_DanhMuc] ([MaSanPham], [MaDanhMuc]) VALUES (N'SP0075', N'DM002')
INSERT [dbo].[SanPham_DanhMuc] ([MaSanPham], [MaDanhMuc]) VALUES (N'SP0076', N'DM002')
INSERT [dbo].[SanPham_DanhMuc] ([MaSanPham], [MaDanhMuc]) VALUES (N'SP0077', N'DM002')
INSERT [dbo].[SanPham_DanhMuc] ([MaSanPham], [MaDanhMuc]) VALUES (N'SP0078', N'DM002')
INSERT [dbo].[SanPham_DanhMuc] ([MaSanPham], [MaDanhMuc]) VALUES (N'SP0079', N'DM002')
INSERT [dbo].[SanPham_DanhMuc] ([MaSanPham], [MaDanhMuc]) VALUES (N'SP0080', N'DM002')
INSERT [dbo].[SanPham_DanhMuc] ([MaSanPham], [MaDanhMuc]) VALUES (N'SP0081', N'DM002')
INSERT [dbo].[SanPham_DanhMuc] ([MaSanPham], [MaDanhMuc]) VALUES (N'SP0082', N'DM002')
INSERT [dbo].[SanPham_DanhMuc] ([MaSanPham], [MaDanhMuc]) VALUES (N'SP0083', N'DM002')
INSERT [dbo].[SanPham_DanhMuc] ([MaSanPham], [MaDanhMuc]) VALUES (N'SP0084', N'DM002')
INSERT [dbo].[SanPham_DanhMuc] ([MaSanPham], [MaDanhMuc]) VALUES (N'SP0088', N'DM002')
INSERT [dbo].[SanPham_DanhMuc] ([MaSanPham], [MaDanhMuc]) VALUES (N'SP0089', N'DM002')
INSERT [dbo].[SanPham_DanhMuc] ([MaSanPham], [MaDanhMuc]) VALUES (N'SP0092', N'DM002')
INSERT [dbo].[SanPham_DanhMuc] ([MaSanPham], [MaDanhMuc]) VALUES (N'SP0094', N'DM002')
INSERT [dbo].[SanPham_DanhMuc] ([MaSanPham], [MaDanhMuc]) VALUES (N'SP0095', N'DM002')
INSERT [dbo].[SanPham_DanhMuc] ([MaSanPham], [MaDanhMuc]) VALUES (N'SP0096', N'DM002')
INSERT [dbo].[SanPham_DanhMuc] ([MaSanPham], [MaDanhMuc]) VALUES (N'SP01232', N'DM002')
INSERT [dbo].[SanPham_DanhMuc] ([MaSanPham], [MaDanhMuc]) VALUES (N'SP0002', N'DM003')
INSERT [dbo].[SanPham_DanhMuc] ([MaSanPham], [MaDanhMuc]) VALUES (N'SP0010', N'DM003')
INSERT [dbo].[SanPham_DanhMuc] ([MaSanPham], [MaDanhMuc]) VALUES (N'SP0015', N'DM003')
INSERT [dbo].[SanPham_DanhMuc] ([MaSanPham], [MaDanhMuc]) VALUES (N'SP0019', N'DM003')
INSERT [dbo].[SanPham_DanhMuc] ([MaSanPham], [MaDanhMuc]) VALUES (N'SP0020', N'DM003')
INSERT [dbo].[SanPham_DanhMuc] ([MaSanPham], [MaDanhMuc]) VALUES (N'SP0068', N'DM003')
INSERT [dbo].[SanPham_DanhMuc] ([MaSanPham], [MaDanhMuc]) VALUES (N'SP0069', N'DM003')
INSERT [dbo].[SanPham_DanhMuc] ([MaSanPham], [MaDanhMuc]) VALUES (N'SP0070', N'DM003')
INSERT [dbo].[SanPham_DanhMuc] ([MaSanPham], [MaDanhMuc]) VALUES (N'SP0071', N'DM003')
INSERT [dbo].[SanPham_DanhMuc] ([MaSanPham], [MaDanhMuc]) VALUES (N'SP0072', N'DM003')
INSERT [dbo].[SanPham_DanhMuc] ([MaSanPham], [MaDanhMuc]) VALUES (N'SP0073', N'DM003')
INSERT [dbo].[SanPham_DanhMuc] ([MaSanPham], [MaDanhMuc]) VALUES (N'SP0075', N'DM003')
INSERT [dbo].[SanPham_DanhMuc] ([MaSanPham], [MaDanhMuc]) VALUES (N'SP0085', N'DM003')
INSERT [dbo].[SanPham_DanhMuc] ([MaSanPham], [MaDanhMuc]) VALUES (N'SP0086', N'DM003')
INSERT [dbo].[SanPham_DanhMuc] ([MaSanPham], [MaDanhMuc]) VALUES (N'SP0087', N'DM003')
INSERT [dbo].[SanPham_DanhMuc] ([MaSanPham], [MaDanhMuc]) VALUES (N'SP0090', N'DM003')
INSERT [dbo].[SanPham_DanhMuc] ([MaSanPham], [MaDanhMuc]) VALUES (N'SP0091', N'DM003')
INSERT [dbo].[SanPham_DanhMuc] ([MaSanPham], [MaDanhMuc]) VALUES (N'SP01232', N'DM003')
INSERT [dbo].[SanPham_DanhMuc] ([MaSanPham], [MaDanhMuc]) VALUES (N'SP0003', N'DM004')
INSERT [dbo].[SanPham_DanhMuc] ([MaSanPham], [MaDanhMuc]) VALUES (N'SP0005', N'DM004')
INSERT [dbo].[SanPham_DanhMuc] ([MaSanPham], [MaDanhMuc]) VALUES (N'SP0007', N'DM004')
INSERT [dbo].[SanPham_DanhMuc] ([MaSanPham], [MaDanhMuc]) VALUES (N'SP0055', N'DM004')
INSERT [dbo].[SanPham_DanhMuc] ([MaSanPham], [MaDanhMuc]) VALUES (N'SP0093', N'DM004')
INSERT [dbo].[SanPham_DanhMuc] ([MaSanPham], [MaDanhMuc]) VALUES (N'SP0097', N'DM004')
INSERT [dbo].[SanPham_DanhMuc] ([MaSanPham], [MaDanhMuc]) VALUES (N'SP0101', N'DM004')
GO
INSERT [dbo].[SanPham_DanhMuc] ([MaSanPham], [MaDanhMuc]) VALUES (N'SP01232', N'DM004')
INSERT [dbo].[SanPham_DanhMuc] ([MaSanPham], [MaDanhMuc]) VALUES (N'SP0099', N'DM005')
INSERT [dbo].[SanPham_DanhMuc] ([MaSanPham], [MaDanhMuc]) VALUES (N'SP0100', N'DM005')
INSERT [dbo].[SanPham_DanhMuc] ([MaSanPham], [MaDanhMuc]) VALUES (N'SP01232', N'DM005')
INSERT [dbo].[SanPham_DanhMuc] ([MaSanPham], [MaDanhMuc]) VALUES (N'SP0006', N'DM006')
INSERT [dbo].[SanPham_DanhMuc] ([MaSanPham], [MaDanhMuc]) VALUES (N'SP0009', N'DM006')
INSERT [dbo].[SanPham_DanhMuc] ([MaSanPham], [MaDanhMuc]) VALUES (N'SP0014', N'DM006')
INSERT [dbo].[SanPham_DanhMuc] ([MaSanPham], [MaDanhMuc]) VALUES (N'SP0016', N'DM006')
INSERT [dbo].[SanPham_DanhMuc] ([MaSanPham], [MaDanhMuc]) VALUES (N'SP0018', N'DM006')
INSERT [dbo].[SanPham_DanhMuc] ([MaSanPham], [MaDanhMuc]) VALUES (N'SP0026', N'DM006')
INSERT [dbo].[SanPham_DanhMuc] ([MaSanPham], [MaDanhMuc]) VALUES (N'SP0028', N'DM006')
INSERT [dbo].[SanPham_DanhMuc] ([MaSanPham], [MaDanhMuc]) VALUES (N'SP0032', N'DM006')
INSERT [dbo].[SanPham_DanhMuc] ([MaSanPham], [MaDanhMuc]) VALUES (N'SP0033', N'DM006')
INSERT [dbo].[SanPham_DanhMuc] ([MaSanPham], [MaDanhMuc]) VALUES (N'SP0098', N'DM006')
INSERT [dbo].[SanPham_DanhMuc] ([MaSanPham], [MaDanhMuc]) VALUES (N'SP0099', N'DM006')
INSERT [dbo].[SanPham_DanhMuc] ([MaSanPham], [MaDanhMuc]) VALUES (N'SP0097', N'DM007')
INSERT [dbo].[SanPham_DanhMuc] ([MaSanPham], [MaDanhMuc]) VALUES (N'SP0003', N'DM008')
INSERT [dbo].[SanPham_DanhMuc] ([MaSanPham], [MaDanhMuc]) VALUES (N'SP0067', N'DM008')
INSERT [dbo].[SanPham_DanhMuc] ([MaSanPham], [MaDanhMuc]) VALUES (N'SP0098', N'DM008')
GO
INSERT [dbo].[TaiKhoan] ([MaKhachHang], [HoKH], [TenKH], [GioiTinh], [SoDienThoai], [Email], [NgaySinh], [MatKhau], [LoaiTaiKhoan], [TenDangNhap], [ID]) VALUES (N'ADMIN', NULL, NULL, NULL, NULL, NULL, NULL, N'123', 1, N'admin', NULL)
INSERT [dbo].[TaiKhoan] ([MaKhachHang], [HoKH], [TenKH], [GioiTinh], [SoDienThoai], [Email], [NgaySinh], [MatKhau], [LoaiTaiKhoan], [TenDangNhap], [ID]) VALUES (N'KH0001', N'Nguyen', N'Truong Thien Phuc', N'Nam', N'0909053500', N'phuc@gmail.com', N'18/04/2000', N'phuc123', NULL, NULL, NULL)
INSERT [dbo].[TaiKhoan] ([MaKhachHang], [HoKH], [TenKH], [GioiTinh], [SoDienThoai], [Email], [NgaySinh], [MatKhau], [LoaiTaiKhoan], [TenDangNhap], [ID]) VALUES (N'KH00012232', N'Nguyen', N'Truong Thien Phuc', N'Nam', N'0909053500', N'phuc@gmail.com', N'18/04/2000', N'phuc123', 0, N'Không có', NULL)
INSERT [dbo].[TaiKhoan] ([MaKhachHang], [HoKH], [TenKH], [GioiTinh], [SoDienThoai], [Email], [NgaySinh], [MatKhau], [LoaiTaiKhoan], [TenDangNhap], [ID]) VALUES (N'KH0002', N'Nguyen', N'Thi Thanh Thao', N'Nu', N'0386329897', N'thao@gmail.com', N'22/10/2003', N'thao123', NULL, NULL, NULL)
INSERT [dbo].[TaiKhoan] ([MaKhachHang], [HoKH], [TenKH], [GioiTinh], [SoDienThoai], [Email], [NgaySinh], [MatKhau], [LoaiTaiKhoan], [TenDangNhap], [ID]) VALUES (N'KH0003', N'Trần', N'Thị Khánh Linh', N'Nu', N'0933847322', N'linh@gmail.com', N'Jul 10 2004 12:00AM', N'linh123', NULL, NULL, NULL)
INSERT [dbo].[TaiKhoan] ([MaKhachHang], [HoKH], [TenKH], [GioiTinh], [SoDienThoai], [Email], [NgaySinh], [MatKhau], [LoaiTaiKhoan], [TenDangNhap], [ID]) VALUES (N'KH0004', N'Lê', N'Thị Anh Thư', N'Nu', N'0933847323', N'thu@gmail.com', N'Jul  7 2003 12:00AM', N'thu123', NULL, NULL, NULL)
INSERT [dbo].[TaiKhoan] ([MaKhachHang], [HoKH], [TenKH], [GioiTinh], [SoDienThoai], [Email], [NgaySinh], [MatKhau], [LoaiTaiKhoan], [TenDangNhap], [ID]) VALUES (N'KH0005', N'Tưởng', N'Xuân Khoa', N'Nam', N'0933847324', N'khoa@gmail.com', N'Aug 10 2004 12:00AM', N'khoa123', NULL, NULL, NULL)
INSERT [dbo].[TaiKhoan] ([MaKhachHang], [HoKH], [TenKH], [GioiTinh], [SoDienThoai], [Email], [NgaySinh], [MatKhau], [LoaiTaiKhoan], [TenDangNhap], [ID]) VALUES (N'KH0006', N'Mã', N'Dĩ Hào test', N'Nam', N'0933847325', N'hao@gmail.com', N'Aug  4 1980 12:00AM', N'hao123', 0, N'Không có', NULL)
INSERT [dbo].[TaiKhoan] ([MaKhachHang], [HoKH], [TenKH], [GioiTinh], [SoDienThoai], [Email], [NgaySinh], [MatKhau], [LoaiTaiKhoan], [TenDangNhap], [ID]) VALUES (N'KH0007', N'Hoàng', N'Thị Vân Anh', N'Nu', N'0933847326', N'vanh@gmail.com', N'Aug  3 2005 12:00AM', N'vanh123', NULL, NULL, NULL)
INSERT [dbo].[TaiKhoan] ([MaKhachHang], [HoKH], [TenKH], [GioiTinh], [SoDienThoai], [Email], [NgaySinh], [MatKhau], [LoaiTaiKhoan], [TenDangNhap], [ID]) VALUES (N'KH0008', N'Nguyễn', N'Thị Thiết', N'Nu', N'0933847327', N'thiet@gmail.com', N'Dec 10 2000 12:00AM', N'thiet123', NULL, NULL, NULL)
INSERT [dbo].[TaiKhoan] ([MaKhachHang], [HoKH], [TenKH], [GioiTinh], [SoDienThoai], [Email], [NgaySinh], [MatKhau], [LoaiTaiKhoan], [TenDangNhap], [ID]) VALUES (N'KH0009', N'Trương', N'Thiết Tâm', N'Nam', N'0933847328', N'tam@gmail.com', N'Nov 11 2001 12:00AM', N'tam123', NULL, NULL, NULL)
INSERT [dbo].[TaiKhoan] ([MaKhachHang], [HoKH], [TenKH], [GioiTinh], [SoDienThoai], [Email], [NgaySinh], [MatKhau], [LoaiTaiKhoan], [TenDangNhap], [ID]) VALUES (N'KH0010', N'Phạm', N'Ngọc Phú', N'Nam', N'0933847329', N'phu@gmail.com', N'Dec 11 1995 12:00AM', N'phu123', NULL, NULL, NULL)
INSERT [dbo].[TaiKhoan] ([MaKhachHang], [HoKH], [TenKH], [GioiTinh], [SoDienThoai], [Email], [NgaySinh], [MatKhau], [LoaiTaiKhoan], [TenDangNhap], [ID]) VALUES (N'KH0011', N'Đinh', N'Thị Trang', N'Nu', N'0933847330', N'trang@gmail.com', N'May 10 2013 12:00AM', N'trang123', NULL, NULL, NULL)
INSERT [dbo].[TaiKhoan] ([MaKhachHang], [HoKH], [TenKH], [GioiTinh], [SoDienThoai], [Email], [NgaySinh], [MatKhau], [LoaiTaiKhoan], [TenDangNhap], [ID]) VALUES (N'KH0012', N'Trương', N'Thị Phượng', N'Nu', N'0933847331', N'phuong@gmail.com', N'Dec  5 2009 12:00AM', N'phuong123', NULL, NULL, NULL)
INSERT [dbo].[TaiKhoan] ([MaKhachHang], [HoKH], [TenKH], [GioiTinh], [SoDienThoai], [Email], [NgaySinh], [MatKhau], [LoaiTaiKhoan], [TenDangNhap], [ID]) VALUES (N'KH0013', N'Võ', N'Thị Thu Thảo', N'Nu', N'0933847332', N'thuthao@gmail.com', N'Sep  6 2002 12:00AM', N'tthao123', NULL, NULL, NULL)
INSERT [dbo].[TaiKhoan] ([MaKhachHang], [HoKH], [TenKH], [GioiTinh], [SoDienThoai], [Email], [NgaySinh], [MatKhau], [LoaiTaiKhoan], [TenDangNhap], [ID]) VALUES (N'KH0014', N'Nguyễn', N'Duy Linh', N'Nam', N'0933847333', N'dlinh@gmail.com', N'Dec  8 2005 12:00AM', N'dlinh123', NULL, NULL, NULL)
INSERT [dbo].[TaiKhoan] ([MaKhachHang], [HoKH], [TenKH], [GioiTinh], [SoDienThoai], [Email], [NgaySinh], [MatKhau], [LoaiTaiKhoan], [TenDangNhap], [ID]) VALUES (N'KH0015', N'Phạm', N'Đức Quyền', N'Nam', N'0933847334', N'quyen@gmail.com', N'Feb 10 1999 12:00AM', N'quyen123', NULL, NULL, NULL)
INSERT [dbo].[TaiKhoan] ([MaKhachHang], [HoKH], [TenKH], [GioiTinh], [SoDienThoai], [Email], [NgaySinh], [MatKhau], [LoaiTaiKhoan], [TenDangNhap], [ID]) VALUES (N'KH02259716', NULL, NULL, NULL, NULL, N'daohuy1692003@gmail.com', NULL, N'123@', 0, N'huy', NULL)
GO
INSERT [dbo].[ThuongHieu] ([MaThuongHieu], [TenThuongHieu]) VALUES (N'huy', N'123123')
INSERT [dbo].[ThuongHieu] ([MaThuongHieu], [TenThuongHieu]) VALUES (N'TH001', N'GUARDIAN')
INSERT [dbo].[ThuongHieu] ([MaThuongHieu], [TenThuongHieu]) VALUES (N'TH002', N'VICHY')
INSERT [dbo].[ThuongHieu] ([MaThuongHieu], [TenThuongHieu]) VALUES (N'TH003', N'L''ORÉAL')
INSERT [dbo].[ThuongHieu] ([MaThuongHieu], [TenThuongHieu]) VALUES (N'TH004', N'COCOON')
INSERT [dbo].[ThuongHieu] ([MaThuongHieu], [TenThuongHieu]) VALUES (N'TH005', N'KLAIRS')
INSERT [dbo].[ThuongHieu] ([MaThuongHieu], [TenThuongHieu]) VALUES (N'TH006', N'ACNES')
INSERT [dbo].[ThuongHieu] ([MaThuongHieu], [TenThuongHieu]) VALUES (N'TH007', N'BIODERMA')
INSERT [dbo].[ThuongHieu] ([MaThuongHieu], [TenThuongHieu]) VALUES (N'TH008', N'OLAY')
INSERT [dbo].[ThuongHieu] ([MaThuongHieu], [TenThuongHieu]) VALUES (N'TH009', N'GARNIER')
INSERT [dbo].[ThuongHieu] ([MaThuongHieu], [TenThuongHieu]) VALUES (N'TH010', N'SUNPLAY')
INSERT [dbo].[ThuongHieu] ([MaThuongHieu], [TenThuongHieu]) VALUES (N'TH011', N'3CE')
INSERT [dbo].[ThuongHieu] ([MaThuongHieu], [TenThuongHieu]) VALUES (N'TH012', N'BIORÉ')
INSERT [dbo].[ThuongHieu] ([MaThuongHieu], [TenThuongHieu]) VALUES (N'TH013', N'BIO ESSENCE')
INSERT [dbo].[ThuongHieu] ([MaThuongHieu], [TenThuongHieu]) VALUES (N'TH014', N'BOM')
INSERT [dbo].[ThuongHieu] ([MaThuongHieu], [TenThuongHieu]) VALUES (N'TH015', N'CERAVE')
INSERT [dbo].[ThuongHieu] ([MaThuongHieu], [TenThuongHieu]) VALUES (N'TH016', N'OLD SPICE')
INSERT [dbo].[ThuongHieu] ([MaThuongHieu], [TenThuongHieu]) VALUES (N'TH017', N'DHC')
GO
ALTER TABLE [dbo].[SanPham] ADD  DEFAULT ((0)) FOR [SoLuong]
GO
ALTER TABLE [dbo].[TaiKhoan] ADD  DEFAULT ((0)) FOR [LoaiTaiKhoan]
GO
ALTER TABLE [dbo].[ChiTietDonHang]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietDonHang_ChiNhanh] FOREIGN KEY([MaChiNhanh])
REFERENCES [dbo].[ChiNhanh] ([MaChiNhanh])
GO
ALTER TABLE [dbo].[ChiTietDonHang] CHECK CONSTRAINT [FK_ChiTietDonHang_ChiNhanh]
GO
ALTER TABLE [dbo].[ChiTietDonHang]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietDonHang_DonHang] FOREIGN KEY([MaDH])
REFERENCES [dbo].[DonHang] ([MaDH])
GO
ALTER TABLE [dbo].[ChiTietDonHang] CHECK CONSTRAINT [FK_ChiTietDonHang_DonHang]
GO
ALTER TABLE [dbo].[ChiTietDonHang]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietDonHang_SanPham] FOREIGN KEY([MaSanPham])
REFERENCES [dbo].[SanPham] ([MaSanPham])
GO
ALTER TABLE [dbo].[ChiTietDonHang] CHECK CONSTRAINT [FK_ChiTietDonHang_SanPham]
GO
ALTER TABLE [dbo].[ChiTietDonHangNhap]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietDonHangNhap_ChiNhanh] FOREIGN KEY([MaChiNhanh])
REFERENCES [dbo].[ChiNhanh] ([MaChiNhanh])
GO
ALTER TABLE [dbo].[ChiTietDonHangNhap] CHECK CONSTRAINT [FK_ChiTietDonHangNhap_ChiNhanh]
GO
ALTER TABLE [dbo].[ChiTietDonHangNhap]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietDonHangNhap_DonNhapHang] FOREIGN KEY([MaDN])
REFERENCES [dbo].[DonNhapHang] ([MaDN])
GO
ALTER TABLE [dbo].[ChiTietDonHangNhap] CHECK CONSTRAINT [FK_ChiTietDonHangNhap_DonNhapHang]
GO
ALTER TABLE [dbo].[ChiTietDonHangNhap]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietDonHangNhap_SanPham] FOREIGN KEY([MaSP])
REFERENCES [dbo].[SanPham] ([MaSanPham])
GO
ALTER TABLE [dbo].[ChiTietDonHangNhap] CHECK CONSTRAINT [FK_ChiTietDonHangNhap_SanPham]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_ThuongHien] FOREIGN KEY([MaThuongHieu])
REFERENCES [dbo].[ThuongHieu] ([MaThuongHieu])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SanPham_ThuongHien]
GO
ALTER TABLE [dbo].[SanPham_DanhMuc]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_DanhMuc_DanhMuc] FOREIGN KEY([MaDanhMuc])
REFERENCES [dbo].[DanhMuc] ([MaDanhMuc])
GO
ALTER TABLE [dbo].[SanPham_DanhMuc] CHECK CONSTRAINT [FK_SanPham_DanhMuc_DanhMuc]
GO
ALTER TABLE [dbo].[SanPham_DanhMuc]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_DanhMuc_SanPham] FOREIGN KEY([MaSanPham])
REFERENCES [dbo].[SanPham] ([MaSanPham])
GO
ALTER TABLE [dbo].[SanPham_DanhMuc] CHECK CONSTRAINT [FK_SanPham_DanhMuc_SanPham]
GO
USE [master]
GO
ALTER DATABASE [THNN] SET  READ_WRITE 
GO
