﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Winform.Repository
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class THNNEntities : DbContext
    {
        public THNNEntities()
            : base("name=THNNEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<CTKM> CTKM { get; set; }
        public virtual DbSet<ChiNhanh> ChiNhanh { get; set; }
        public virtual DbSet<ChiTietDonHangNhap> ChiTietDonHangNhap { get; set; }
        public virtual DbSet<DanhMuc> DanhMuc { get; set; }
        public virtual DbSet<DonHang> DonHang { get; set; }
        public virtual DbSet<DonNhapHang> DonNhapHang { get; set; }
        public virtual DbSet<SanPham> SanPham { get; set; }
        public virtual DbSet<sysdiagrams> sysdiagrams { get; set; }
        public virtual DbSet<TaiKhoan> TaiKhoan { get; set; }
        public virtual DbSet<ThuongHieu> ThuongHieu { get; set; }
        public virtual DbSet<ChiTietDonHang> ChiTietDonHang { get; set; }
    }
}
