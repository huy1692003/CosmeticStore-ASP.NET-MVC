using System;
using Microsoft.EntityFrameworkCore;
using BanMyPham.Models;

namespace BanMyPham.DataBase
{
    public class AppDBcontext : DbContext
    {
        public AppDBcontext()
        {
        }

        public AppDBcontext(DbContextOptions<AppDBcontext> options) : base(options) { }

        public DbSet<ChiNhanh> ChiNhanhs { get; set; }
        public DbSet<ChiTietDonHang> ChiTietDonHangs { get; set; }
        public DbSet<ChiTietDonHangNhap> ChiTietDonHangNhaps { get; set; }
        public DbSet<CTKM> CTKMs { get; set; }
        public DbSet<DanhMuc> DanhMucs { get; set; }
        public DbSet<DonHang> DonHangs { get; set; }
        public DbSet<DonNhapHang> DonNhapHangs { get; set; }
        public DbSet<SanPham_DanhMuc> SanPham_DanhMucs { get; set; }
        public DbSet<SanPham> SanPhams { get; set; }
        public DbSet<TaiKhoan> TaiKhoans { get; set; }
        public DbSet<ThuongHieu> ThuongHieus { get; set; }
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<ChiTietDonHangNhap>().HasNoKey();
            modelBuilder.Entity<ChiTietDonHangNhap>().HasNoKey();
            modelBuilder.Entity<SanPham_DanhMuc>()
      .HasKey(s => new { s.MaSanPham, s.MaDanhMuc }); // S
            modelBuilder.Entity<ChiTietDonHangNhap>()
       .HasKey(c => new { c.MaDN, c.MaSP });  // Khóa chính kết hợp từ hai cột
        }

    }

}
