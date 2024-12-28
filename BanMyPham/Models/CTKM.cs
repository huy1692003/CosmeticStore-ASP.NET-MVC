using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace BanMyPham.Models
{
    [Table("CTKM")]
    public class CTKM
    {
        [Key]
        public string MaCTKM { get; set; }
        public string TenCTKM { get; set; }
        public DateTime? NgayBatDau { get; set; }
        public DateTime NgayKetThuc { get; set; }
        public double Discount { get; set; }
    }
}
