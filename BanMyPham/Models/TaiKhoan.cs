using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
namespace BanMyPham.Models
{
    [Table("TaiKhoan")]
    public class TaiKhoan
    {
        [Key]
        public string MaKhachHang { get; set; }
        public string? HoKH { get; set; }
        public string? TenKH { get; set; }
        public string? TenDangNhap { get; set; }
        public string? GioiTinh { get; set; }
        public string? SoDienThoai { get; set; }
        public string? Email { get; set; }
        public string? NgaySinh { get; set; }
        public string? MatKhau { get; set; }
        public int? LoaiTaiKhoan { get; set; }
        public int? ID { get; set; }


    }
}
