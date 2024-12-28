using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace BanMyPham.Models
{
    [Table("DonNhapHang")]
    public class DonNhapHang
    {
        [Key]
        [StringLength(20)]
        public string MaDN { get; set; }

        public DateTime NgayNhap { get; set; }
    }
}
