using Microsoft.AspNetCore.Mvc;

namespace BanMyPham.Areas.Admin.Controllers
{
    public class TaiKhoanManagerController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
