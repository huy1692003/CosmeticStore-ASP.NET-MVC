using BanMyPham.DataBase;
using BanMyPham.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace BanMyPham.Controllers
{
    public class DanhMucSanPhamController : Controller
    {
        private readonly AppDBcontext _db;
        public DanhMucSanPhamController(AppDBcontext db)
        {
            this._db = db;
        }
        public IActionResult Index(string id, int page = 1, int pageSize = 9)
        {
            // Lấy tất cả các danh mục để hiển thị bên menu
            ViewBag.danhmuc = _db.DanhMucs.ToList();
            ViewBag.id = id;

            // Truy vấn danh sách sản phẩm theo danh mục và phân trang
            var sanphams = (from sp in _db.SanPhams
                            join spdm in _db.SanPham_DanhMucs on sp.MaSanPham equals spdm.MaSanPham
                            where spdm.MaDanhMuc == id
                            select sp)
                            .Distinct()
                            .Skip((page - 1) * pageSize)  // Bỏ qua số lượng sản phẩm của các trang trước đó
                            .Take(pageSize)               // Lấy số lượng sản phẩm cho trang hiện tại
                            .ToList();

            // Tính tổng số trang
            int totalProducts = _db.SanPhams
                                .Join(_db.SanPham_DanhMucs, sp => sp.MaSanPham, spdm => spdm.MaSanPham, (sp, spdm) => new { sp, spdm })
                                .Count(sp => sp.spdm.MaDanhMuc == id);

            int totalPages = (int)Math.Ceiling((double)totalProducts / pageSize);

            // Gửi các thông tin liên quan đến phân trang sang view
            ViewBag.TotalPages = totalPages;
            ViewBag.CurrentPage = page;
            ViewBag.PageSize = pageSize;

            return View(sanphams);
        }

        [HttpGet]
        public IActionResult TimKiemSP(string thongtin, int page = 1, int pageSize = 9, string danhmuc = "")
        {
            // Lấy tất cả các danh mục để hiển thị bên menu
            ViewBag.danhmuc = _db.DanhMucs.ToList();
            ViewBag.danhmucSelected = danhmuc; // Gửi danh mục đã chọn lên view
            ViewBag.thongtin = thongtin; // Gửi thông tin tìm kiếm

            // Truy vấn tìm kiếm sản phẩm theo thông tin và danh mục
            var sanphams = (from sp in _db.SanPhams
                            join spdm in _db.SanPham_DanhMucs on sp.MaSanPham equals spdm.MaSanPham
                            where (string.IsNullOrEmpty(danhmuc) || spdm.MaDanhMuc == danhmuc)  // Kiểm tra nếu danh mục có giá trị
                            && (sp.TenSanPham.Contains(thongtin) || sp.ThongTinSanPham.Contains(thongtin)) // Tìm theo tên sản phẩm hoặc mô tả
                            select sp)
                            .Distinct()
                            .Skip((page - 1) * pageSize)  // Bỏ qua số lượng sản phẩm của các trang trước đó
                            .Take(pageSize)               // Lấy số lượng sản phẩm cho trang hiện tại
                            .ToList();

            // Tính tổng số sản phẩm khớp với tìm kiếm
            int totalProducts = (from sp in _db.SanPhams
                                 join spdm in _db.SanPham_DanhMucs on sp.MaSanPham equals spdm.MaSanPham
                                 where (string.IsNullOrEmpty(danhmuc) || spdm.MaDanhMuc == danhmuc)
                                 && (sp.TenSanPham.Contains(thongtin) || sp.ThongTinSanPham.Contains(thongtin))
                                 select sp).Count();

            // Tính tổng số trang
            int totalPages = (int)Math.Ceiling((double)totalProducts / pageSize);

            // Gửi các thông tin liên quan đến phân trang sang view
            ViewBag.TotalPages = totalPages;
            ViewBag.CurrentPage = page;
            ViewBag.PageSize = pageSize;

            return View("~/Views/TimKiemSanPham/index.cshtml", sanphams);
        }

    }
}
