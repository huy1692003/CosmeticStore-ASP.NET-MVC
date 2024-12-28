using System.Web;
using BanMyPham.DataBase;
using BanMyPham.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Newtonsoft.Json;

namespace BanMyPham.Controllers
{
    public class GioHangController : Controller
    {
        private readonly AppDBcontext appDBcontext;
        public GioHangController(AppDBcontext appDBcontext)
        {
            this.appDBcontext = appDBcontext;
        }
        public IActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public IActionResult CreateDonhang(string thongtinDH, string listSP)
        {
            try
            {
                // Giải mã chuỗi thongtinDH
                var thongtinDonHang = HttpUtility.UrlDecode(thongtinDH);

                // Chuyển thongtinDonHang thành đối tượng DonHang
                var donHang = JsonConvert.DeserializeObject<DonHang>(thongtinDonHang);

                // Kiểm tra nếu donHang là null
                if (donHang == null)
                {
                    return BadRequest("Thông tin đơn hàng không hợp lệ.");
                }

                // Giải mã chuỗi listSP thành danh sách ChiTietDonHang
                var chiTietDonHangList = JsonConvert.DeserializeObject<List<ChiTietDonHang>>(listSP);

                // Kiểm tra nếu chiTietDonHangList là null hoặc không có dữ liệu
                if (chiTietDonHangList == null || !chiTietDonHangList.Any())
                {
                    return BadRequest("Danh sách chi tiết đơn hàng không hợp lệ.");
                }

                // Tính tổng tiền của đơn hàng từ chi tiết đơn hàng
                donHang.TongTien = chiTietDonHangList.Sum(s => s.TongTien);
                donHang.NgayDH = DateTime.Now;
                donHang.GiaGiam = 0;
                // Kiểm tra nếu mã chương trình khuyến mãi (MaCTKM) có giá trị
                if (donHang.MaCTKM != null)
                {
                    // Lấy tỷ lệ giảm giá từ bảng CTKM
                    var ctkm = appDBcontext.CTKMs.FirstOrDefault(s => s.MaCTKM == donHang.MaCTKM);
                    if (ctkm != null)
                    {
                        double giagiam = ctkm.Discount;

                        // Tính giá giảm và cập nhật vào donHang.GiaGiam
                        donHang.GiaGiam = (double)(donHang.TongTien * (giagiam / 100));
                    }
                    else
                    {
                        // Trường hợp không tìm thấy mã giảm giá, có thể đặt giá giảm là 0
                        donHang.GiaGiam = 0;
                    }
                }
              
                donHang.MaDH = "DH" + DateTime.Now.ToString("yyyyMMddHHmmss");
                // Thêm đơn hàng vào cơ sở dữ liệu
                var createdDonHang = appDBcontext.DonHangs.Add(donHang);
                if (appDBcontext.SaveChanges() > 0)
                {
                    foreach (var chiTiet in chiTietDonHangList)
                    {
                        // Gán mã đơn hàng cho chi tiết đơn hàng
                        chiTiet.MaDH = createdDonHang.Entity.MaDH;

                        // Kiểm tra nếu chi tiết đơn hàng đã có trong DbContext
                        var existingChiTiet = appDBcontext.ChangeTracker.Entries<ChiTietDonHang>()
                                                           .FirstOrDefault(e => e.Entity.MaDH == chiTiet.MaDH);


                        // Nếu chi tiết đơn hàng đã tồn tại trong DbContext, tách nó ra khỏi DbContext
                        if (existingChiTiet != null)
                        {
                            existingChiTiet.State = EntityState.Detached;
                        }

                        var sanpham = appDBcontext.SanPhams.FirstOrDefault(s => s.MaSanPham == chiTiet.MaSanPham);
                        if(sanpham.SoLuong!=null)
                        {

                        sanpham.SoLuong -= chiTiet.SoLuongSanPham;
                        }    
                        // Thêm mới chi tiết đơn hàng vào DbContext
                        appDBcontext.ChiTietDonHangs.Add(chiTiet);
                    }
                }

                // Lưu thay đổi vào cơ sở dữ liệu
                appDBcontext.SaveChanges();

                return Ok(new { Message = "Đơn hàng đã được tạo thành công!", DonHangId = createdDonHang.Entity.MaDH });
            }
            catch (Exception ex)
            {
                // Xử lý lỗi
                return StatusCode(500, new { Message = "Đã xảy ra lỗi khi tạo đơn hàng.", Error = ex.Message });
            }
        }

        [HttpGet]
        public IActionResult MuaHangThanhCong(string id)
        {
            ViewBag.MaDH = id;
            var donhang=appDBcontext.DonHangs.FirstOrDefault(s=>s.MaDH == id);
            return View(donhang);
        }       
        [HttpGet]
        public IActionResult MuaHangThanhCong_COD(string id)
        {
            ViewBag.MaDH = id;
            var donhang=appDBcontext.DonHangs.FirstOrDefault(s=>s.MaDH == id);
            return View(donhang);
        }
    }
}

