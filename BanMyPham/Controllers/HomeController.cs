using System.Diagnostics;
using BanMyPham.ActionFilter;
using BanMyPham.DataBase;
using BanMyPham.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;

namespace BanMyPham.Controllers
{
    public class HomeController : Controller
    {
        private readonly AppDBcontext db;

        public HomeController(AppDBcontext db)
        {
            this.db = db;
        }


        public IActionResult Index()
        {
            var sanpham_uudai = db.SanPhams.Skip(1).Take(18).OrderBy(s=>s.NguyenGia).ToList();
            ViewBag.sanpham = sanpham_uudai; 
            var sanpham_new = db.SanPhams.Skip(1).Take(18).OrderByDescending(s=>s.NguyenGia).ToList();
            ViewBag.sanphamnew = sanpham_new;
            return View(sanpham_uudai);
        }

        [HttpGet]
        public IActionResult ChiNhanh()
        {
            var chiNhanh= db.ChiNhanhs.ToList();
            return View("~/Views/ChiNhanh/index.cshtml",chiNhanh);
        }


        [HttpGet]
        public IActionResult FAQ()
        {
            return View("CauHoiThuongGap");
        }


        [HttpGet]
        public IActionResult CTTKM()
        {
            return View("CauHoiThuongGap");
        }


        public IActionResult Privacy()
        {
            return View();
        }



        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
