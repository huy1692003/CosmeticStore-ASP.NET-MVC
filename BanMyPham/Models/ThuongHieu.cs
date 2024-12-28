using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace BanMyPham.Models
{
    [Table("ThuongHieu")]
    public class ThuongHieu
    {
        [Key]
        public string MaThuongHieu { get; set; }
        public string? TenThuongHieu { get; set; }
    }
}

