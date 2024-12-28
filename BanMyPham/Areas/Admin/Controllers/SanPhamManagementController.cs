using BanMyPham.DataBase;
using BanMyPham.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace BanMyPham.Areas.Admin.Controllers
{
    [Area("Admin")]
    public class SanPhamManagementController : Controller
    {
        private readonly AppDBcontext dbcontext;
        private readonly IWebHostEnvironment _environment;

        public SanPhamManagementController(AppDBcontext dBcontext, IWebHostEnvironment environment)
        {
            this.dbcontext = dBcontext;
            _environment = environment;
        }

        public ActionResult Index(int pageNumber = 1, int pageSize = 10)
        {
            // Lấy tất cả sản phẩm
            var sanPhamList = dbcontext.SanPhams.AsQueryable();

            // Tính toán tổng số sản phẩm
            var totalItems = sanPhamList.Count();

            // Phân trang
            var productsOnPage = sanPhamList
                .Skip((pageNumber - 1) * pageSize)  // Bỏ qua các sản phẩm ở các trang trước đó
                .Take(pageSize)                     // Lấy số lượng sản phẩm theo trang
                .ToList();

            // Tạo thông tin phân trang
            var totalPages = (int)Math.Ceiling((double)totalItems / pageSize);

            // Truyền thông tin vào View
            ViewBag.DanhMuc = dbcontext.DanhMucs.ToList();
            ViewBag.ThuongHieu = dbcontext.ThuongHieus.ToList();
            ViewBag.CurrentPage = pageNumber;
            ViewBag.TotalPages = totalPages;
            ViewBag.PageSize = pageSize;

            return View(productsOnPage);
        }

        public ActionResult Create()
        {
            ViewBag.DanhMuc = dbcontext.DanhMucs.ToList();
            ViewBag.ThuongHieu = dbcontext.ThuongHieus.ToList();
            return View("CreateOrEdit");
        }

        [HttpPost]
        public ActionResult Create(SanPham sanPham, string[] DanhMucIds, IFormFile HinhAnh)
        {
            try
            {
               
                    // Kiểm tra xem sản phẩm đã tồn tại chưa
                    if (dbcontext.SanPhams.Any(s => s.MaSanPham == sanPham.MaSanPham))
                    {
                        TempData["ErrorMessage"] = "Mã sản phẩm đã tồn tại!";
                        return View("CreateOrEdit", sanPham);
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

                        sanPham.HinhAnh = "image/" + uniqueFileName;
                    }
                    sanPham.SoLuong = 0;

                    // Thêm sản phẩm mới vào cơ sở dữ liệu
                    dbcontext.SanPhams.Add(sanPham);
                    dbcontext.SaveChanges();

                    // Thêm danh mục cho sản phẩm nếu có
                    if (DanhMucIds != null && DanhMucIds.Length > 0)
                    {
                        foreach (var danhMucId in DanhMucIds)
                        {
                            var sanPham_DanhMuc = new SanPham_DanhMuc
                            {
                                MaSanPham = sanPham.MaSanPham,
                                MaDanhMuc = danhMucId
                            };
                            dbcontext.SanPham_DanhMucs.Add(sanPham_DanhMuc);
                        }
                        dbcontext.SaveChanges();
                    }

                    TempData["SuccessMessage"] = "Thêm sản phẩm thành công!";
                    return RedirectToAction(nameof(Index));
                
            }
            catch (Exception ex)
            {
                TempData["ErrorMessage"] = "Có lỗi xảy ra khi thêm sản phẩm: " + ex.Message;
                return View("CreateOrEdit", sanPham);
            }
        }

        [HttpGet]
        public ActionResult Edit(string id)
        {
            SanPham? sanPham = dbcontext.SanPhams.FirstOrDefault(s=>s.MaSanPham==id);
            
            if (sanPham == null)
            {
                TempData["ErrorMessage"] = "Không tìm thấy sản phẩm!";
                return NotFound();
            }

            // Lấy danh sách danh mục của sản phẩm
            var danhMucIds = dbcontext.SanPham_DanhMucs
                .Where(sd => sd.MaSanPham == id)
                .Select(sd => sd.MaDanhMuc)
                .ToList();
            sanPham.listDanhMuc = danhMucIds;

            ViewBag.DanhMuc = dbcontext.DanhMucs.ToList();
            ViewBag.ThuongHieu = dbcontext.ThuongHieus.ToList();
            return View("CreateOrEdit", sanPham);
        }

        [HttpPost]
        public ActionResult Edit(string id, SanPham sanPham, string[] DanhMucIds, IFormFile HinhAnh)
        {
            try
            {
                // Kiểm tra nếu mã sản phẩm không khớp với id
                if (id != sanPham.MaSanPham)
                {
                    TempData["ErrorMessage"] = "Mã sản phẩm không hợp lệ!";
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

                        sanPham.HinhAnh = "image/" + uniqueFileName;
                    }

                    // Cập nhật thông tin sản phẩm
                    dbcontext.SanPhams.Update(sanPham);

                    // Xóa tất cả danh mục cũ của sản phẩm
                    var oldDanhMucs = dbcontext.SanPham_DanhMucs.Where(sd => sd.MaSanPham == id);
                    dbcontext.SanPham_DanhMucs.RemoveRange(oldDanhMucs);

                    // Thêm danh mục mới cho sản phẩm
                    if (DanhMucIds != null)
                    {
                        foreach (var danhMucId in DanhMucIds)
                        {
                            var sanPham_DanhMuc = new SanPham_DanhMuc
                            {
                                MaSanPham = sanPham.MaSanPham,
                                MaDanhMuc = danhMucId
                            };
                            dbcontext.SanPham_DanhMucs.Add(sanPham_DanhMuc);
                        }
                    }

                    dbcontext.SaveChanges();
                    TempData["SuccessMessage"] = "Cập nhật sản phẩm thành công!";
                    return RedirectToAction(nameof(Index));
                }
                return RedirectToAction(nameof(Index));
            }
            catch
            {
                TempData["ErrorMessage"] = "Có lỗi xảy ra khi cập nhật sản phẩm!";
                return RedirectToAction(nameof(Index));
            }
        }

        public ActionResult Delete(string id)
        {
            var sanPham = dbcontext.SanPhams.Find(id);
            if (sanPham == null)
            {
                TempData["ErrorMessage"] = "Không tìm thấy sản phẩm để xóa!";
                return NotFound();
            }

            try
            {
                // Xóa ảnh sản phẩm nếu tồn tại
                if (!string.IsNullOrEmpty(sanPham.HinhAnh))
                {
                    var imagePath = Path.Combine(_environment.WebRootPath, sanPham.HinhAnh);
                    if (System.IO.File.Exists(imagePath))
                    {
                        System.IO.File.Delete(imagePath);
                    }
                }

                // Xóa tất cả danh mục của sản phẩm trước
                var sanPham_DanhMucs = dbcontext.SanPham_DanhMucs.Where(sd => sd.MaSanPham == id);
                dbcontext.SanPham_DanhMucs.RemoveRange(sanPham_DanhMucs);

                // Sau đó xóa sản phẩm
                dbcontext.SanPhams.Remove(sanPham);
                dbcontext.SaveChanges();
                
                TempData["SuccessMessage"] = "Xóa sản phẩm thành công!";
                return RedirectToAction(nameof(Index));
            }
            catch
            {
                TempData["ErrorMessage"] = "Có lỗi xảy ra khi xóa sản phẩm! Có thể sản phẩm đang là khóa ngoại của bảng khác!";
                return RedirectToAction(nameof(Index));
            }
        }
    }
}
