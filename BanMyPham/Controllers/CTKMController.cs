using BanMyPham.DataBase;
using Microsoft.AspNetCore.Mvc;

namespace BanMyPham.Controllers
{
    public class CTKMController : Controller
    {
        private readonly AppDBcontext appDBcontext;
        public CTKMController(AppDBcontext db)
        {
            this.appDBcontext = db;
        }
        public IActionResult Index()
        {
            var ctkm = appDBcontext.CTKMs.ToList();
            return View(ctkm);
        }

        // Đổi route rõ ràng hơn
        [HttpGet]
        public IActionResult KiemTraKM(string code)
        {
            // Kiểm tra đầu vào
            if (string.IsNullOrEmpty(code))
            {
                return BadRequest("Mã khuyến mãi không được để trống.");
            }

            // Tìm mã khuyến mãi hợp lệ
            var voucher = appDBcontext.CTKMs.FirstOrDefault(s =>
                s.MaCTKM == code &&
                s.NgayBatDau <= DateTime.Now &&
                s.NgayKetThuc >= DateTime.Now);

            // Nếu không tìm thấy voucher hợp lệ
            if (voucher == null)
            {
                return NotFound("Mã khuyến mãi không hợp lệ hoặc đã hết hạn.");
            }

            // Trả về voucher nếu tìm thấy
            return Ok(voucher);
        }
    }
}
