using BanMyPham.DataBase;
using BanMyPham.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace BanMyPham.Areas.Admin.Controllers
{
    [Area("Admin")]
    public class ChiNhanhManagementController : Controller
    {
        private readonly AppDBcontext dbcontext;
        private readonly IWebHostEnvironment _environment;

        public ChiNhanhManagementController(AppDBcontext dBcontext, IWebHostEnvironment environment)
        {
            this.dbcontext = dBcontext;
            _environment = environment;
        }

        public ActionResult Index()
        {
            var chiNhanh = dbcontext.ChiNhanhs.ToList();
            return View(chiNhanh);
        }

        public ActionResult Create()
        {
            return View("CreateOrEdit");
        }

        [HttpPost]
        public ActionResult Create(ChiNhanh chiNhanh , IFormFile HinhAnh)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    if(dbcontext.ChiNhanhs.Any(s=>s.MaChiNhanh==chiNhanh.MaChiNhanh))
                    {
                        TempData["ErrorMessage"] = "Mã chi nhánh đã tồn tại!";
                        return View("CreateOrEdit",chiNhanh);
                    }
                    // Xử lý upload hình ảnh
                    if (HinhAnh != null && HinhAnh.Length > 0)
                    {
                        string fileName = Path.GetFileName(HinhAnh.FileName);
                        string uniqueFileName = DateTime.Now.ToString("ddHHmmss") + "_" + fileName;
                        string imagePath = Path.Combine("wwwroot", "image", uniqueFileName);
                        string fullPath = Path.Combine(_environment.WebRootPath, "image", uniqueFileName);

                        Directory.CreateDirectory(Path.GetDirectoryName(fullPath));
                        using (var stream = new FileStream(fullPath, FileMode.Create))
                        {
                            HinhAnh.CopyTo(stream);
                        }

                        chiNhanh.HinhAnh = "image/" + uniqueFileName;
                    }
                    dbcontext.ChiNhanhs.Add(chiNhanh);
                    dbcontext.SaveChanges();
                    TempData["SuccessMessage"] = "Thêm chi nhánh thành công!";
                    return RedirectToAction(nameof(Index));
                }
                return View("CreateOrEdit", chiNhanh);
            }
            catch
            {
                TempData["ErrorMessage"] = "Có lỗi xảy ra khi thêm chi nhánh!";
                return View("CreateOrEdit", chiNhanh);
            }
        }

        [HttpGet]
        public ActionResult Edit(string id)
        {
            ChiNhanh? chiNhanh = dbcontext.ChiNhanhs.FirstOrDefault(s=>s.MaChiNhanh==id);
            
            if (chiNhanh == null)
            {
                TempData["ErrorMessage"] = "Không tìm thấy chi nhánh!";
                return NotFound();
            }
            return View("CreateOrEdit", chiNhanh);
        }

        [HttpPost]
        public ActionResult Edit(string id, ChiNhanh chiNhanh , IFormFile HinhAnh)
        {
            try
            {
                if (id != chiNhanh.MaChiNhanh)
                {
                    TempData["ErrorMessage"] = "Mã chi nhánh không hợp lệ!";
                    return RedirectToAction(nameof(Index));
                }

                if (ModelState.IsValid)
                {
                    // Xử lý upload hình ảnh mới nếu có
                    if (HinhAnh != null && HinhAnh.Length > 0)
                    {
                        // Xóa ảnh cũ nếu tồn tại
                        var oldProduct = dbcontext.SanPhams.AsNoTracking().FirstOrDefault(s => s.MaSanPham == id);
                        if (oldProduct != null && !string.IsNullOrEmpty(oldProduct.HinhAnh))
                        {
                            var oldImagePath = Path.Combine(_environment.WebRootPath, oldProduct.HinhAnh);
                            if (System.IO.File.Exists(oldImagePath))
                            {
                                System.IO.File.Delete(oldImagePath);
                            }
                        }

                        // Lưu ảnh mới
                        string fileName = Path.GetFileName(HinhAnh.FileName);
                        string uniqueFileName = DateTime.Now.ToString("ddHHmmss") + "_" + fileName;
                        string imagePath = Path.Combine("wwwroot", "image", uniqueFileName);
                        string fullPath = Path.Combine(_environment.WebRootPath, "image", uniqueFileName);

                        Directory.CreateDirectory(Path.GetDirectoryName(fullPath));
                        using (var stream = new FileStream(fullPath, FileMode.Create))
                        {
                            HinhAnh.CopyTo(stream);
                        }

                        chiNhanh.HinhAnh = "image/" + uniqueFileName;
                    }
                    dbcontext.ChiNhanhs.Update(chiNhanh);
                    dbcontext.SaveChanges();
                    TempData["SuccessMessage"] = "Cập nhật chi nhánh thành công!";
                    return RedirectToAction(nameof(Index));
                }
                return View("CreateOrEdit", chiNhanh);
            }
            catch
            {
                TempData["ErrorMessage"] = "Có lỗi xảy ra khi cập nhật chi nhánh!";
                return View("CreateOrEdit", chiNhanh);
            }
        }

        public ActionResult Delete(string id)
        {
            var chiNhanh = dbcontext.ChiNhanhs.Find(id);
            if (chiNhanh == null)
            {
                TempData["ErrorMessage"] = "Không tìm thấy chi nhánh để xóa!";
                return NotFound();
            }

            try
            {
                dbcontext.ChiNhanhs.Remove(chiNhanh);
                dbcontext.SaveChanges();
                TempData["SuccessMessage"] = "Xóa chi nhánh thành công!";
                return RedirectToAction(nameof(Index));
            }
            catch
            {
                TempData["ErrorMessage"] = "Có lỗi xảy ra khi xóa chi nhánh ! Có thể chi nhánh đang là khóa ngoại của bảng khác!";
                return RedirectToAction(nameof(Index));
            }
        }
    }
}
