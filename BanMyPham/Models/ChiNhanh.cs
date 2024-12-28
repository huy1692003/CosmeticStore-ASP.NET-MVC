using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace BanMyPham.Models
{
    [Table("ChiNhanh")]
    public class ChiNhanh
    {
        [Key]
        public string MaChiNhanh { get; set; }
        public string? TenChiNhanh { get; set; }
        public string? DiaChi { get; set; }
        public string? ThanhPho { get; set; }
        public string? QuanHuyen { get; set; }
        public string? SDT { get; set; }

        public string? HinhAnh { get; set; }
    }
}
