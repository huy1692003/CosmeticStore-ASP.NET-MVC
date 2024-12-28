using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace BanMyPham.Models
{
    [Table("DonHang")]
    public class DonHang
    {
        [Key]
        [StringLength(20)]
        public string? MaDH { get; set; }

        public DateTime? NgayDH { get; set; }

        [StringLength(255)]
        public string? PTTT { get; set; }

        [StringLength(255)]
        public string? TenNguoiNhan { get; set; }

        [StringLength(155)]
        public string? Email { get; set; }

        [StringLength(55)]
        public string? SoDienThoai { get; set; }

        [StringLength(555)]
        public string? DiaChiChiTiet { get; set; }

        public string? Tinh { get; set; }

        public string? Huyen { get; set; }

        public string? Phuong { get; set; }

        public double? TongTien { get; set; }

        [StringLength(50)]
        public string? MaCTKM { get; set; }

        public double? GiaGiam { get; set; }
    }
}