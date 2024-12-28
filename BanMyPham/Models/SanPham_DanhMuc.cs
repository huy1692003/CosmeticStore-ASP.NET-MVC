using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace BanMyPham.Models
{
    [Table("SanPham_DanhMuc")]
    public class SanPham_DanhMuc
    {
        [Key]
        public string? MaSanPham { get; set; }

        [Key]
        public string? MaDanhMuc { get; set; }
    }
}
