using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace BanMyPham.Models
{
    [Table("ChiTietDonHang")]
    public class ChiTietDonHang
    {
        [Key]
        public string? MaDH { get; set; }
        public string? MaSanPham { get; set; }
        public int SoLuongSanPham { get; set; }
        public double TongTien { get; set; }
        public double GiaSP { get; set; }
   
        public string? MaChiNhanh { get; set; }
    }
}
