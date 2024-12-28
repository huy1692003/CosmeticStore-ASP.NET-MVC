using BanMyPham.DataBase;
using Microsoft.AspNetCore.Mvc;

namespace BanMyPham.Controllers
{
    public class ChiTietSanPhamController : Controller
    {

        private readonly AppDBcontext _db;
        public ChiTietSanPhamController(AppDBcontext db)
        {
            this._db = db;
        }
        public IActionResult Index(string id)
        {
            var detail = _db.SanPhams.FirstOrDefault(s => s.MaSanPham == id);
            ViewBag.tenthuonghieu = _db.ThuongHieus.FirstOrDefault(s => s.MaThuongHieu == detail!.MaThuongHieu).TenThuongHieu;
            ViewBag.sanpham = _db.SanPhams.Where(s => s.MaThuongHieu == detail.MaThuongHieu).Take(8).ToList();
            return View(detail);
        }
    }
}
