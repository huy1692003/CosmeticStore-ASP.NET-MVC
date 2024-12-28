using BanMyPham.DataBase;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;

namespace BanMyPham.Areas.Admin.Controllers
{
    [Area("Admin")]
    public class ThongKeController : Controller
    {
        private readonly AppDBcontext dbcontext;
        public ThongKeController(AppDBcontext db)
        {
            this.dbcontext = db;
        }

        public IActionResult Index()
        {
            // Lấy tổng số lượng sản phẩm, chi nhánh, đơn hàng
            ViewBag.slSP = dbcontext.SanPhams.Count();
            ViewBag.slChiNhanh = dbcontext.ChiNhanhs.Count();
            ViewBag.slDonHang = dbcontext.DonHangs.Count();
            ViewBag.slDonHangNhap = dbcontext.DonNhapHangs.Count();

            // Thống kê tổng số sản phẩm nhập theo tháng
            var thongKeHDN = dbcontext.DonNhapHangs
               .GroupBy(d => d.NgayNhap.Month)
               .Select(g => new
               {
                   Thang = g.Key,
                   // Tính toán tổng số lượng sản phẩm nhập theo từng đơn nhập hàng
                   SoLuong = g.Select(d => dbcontext.ChiTietDonHangNhaps
                       .Where(c => c.MaDN == d.MaDN)
                       .Sum(c => c.SoLuong))
                       ,  // Tổng số lượng
                                // Tính toán tổng tiền nhập theo từng đơn nhập hàng
                   TongTien = g.Select(d => dbcontext.ChiTietDonHangNhaps
                       .Where(c => c.MaDN == d.MaDN)
                       .Sum(c => c.TongTien))
                      // Tổng tiền
               })
               .ToList();
            ViewBag.thongKeHDN = JsonConvert.SerializeObject(thongKeHDN);  // Chuyển đổi thành JSON

            // Thống kê đơn hàng bán
            var donHangBan = dbcontext.DonHangs
                .GroupBy(d => d.NgayDH.Value.Month)
                .Select(g => new
                {
                    Thang = g.Key,
                    TongTienBan = g.Sum(d => d.TongTien)
                })
                .ToList();
            ViewBag.donHangBan = JsonConvert.SerializeObject(donHangBan); // Chuyển đổi thành JSON

            // Chuyển dữ liệu sang JSON để truyền vào view
            return View();
        }
    }
}
