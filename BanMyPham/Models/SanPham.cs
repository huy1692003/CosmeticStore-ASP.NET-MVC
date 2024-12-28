using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace BanMyPham.Models
{
    [Table("SanPham")]
    public class SanPham
    {
        [Key]
        [StringLength(10)]
        public string? MaSanPham { get; set; }

        [StringLength(255)]
        public string? TenSanPham { get; set; }

        [StringLength(10)]
        public string? MaThuongHieu { get; set; }

        public double? NguyenGia { get; set; }

        public string? HinhAnh { get; set; }

        public int? SoLuong {  get; set; }
        public string? ThongTinSanPham { get; set; }

        public string? CongDungSanPham { get; set; }

        public string? ThanhPhanSanPham { get; set; }

        public string? HuongDanSuDungSanPham { get; set; }

        [StringLength(50)]
        public string? XuatXu { get; set; }
        [NotMapped]
        public List<string>? listDanhMuc {  get; set; }
    }
}
