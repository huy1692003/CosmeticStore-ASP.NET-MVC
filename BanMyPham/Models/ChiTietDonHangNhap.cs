using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;

[Table("ChiTietDonHangNhap")]
public class ChiTietDonHangNhap
{
    [Key, Column(Order = 0)]
    public string MaDN { get; set; }

    [Key, Column(Order = 1)]
    public string MaSP { get; set; }

    public int SoLuong { get; set; }
    public double TongTien { get; set; }
    public string MaChiNhanh { get; set; }
    public int LoaiSP { get; set; }
}