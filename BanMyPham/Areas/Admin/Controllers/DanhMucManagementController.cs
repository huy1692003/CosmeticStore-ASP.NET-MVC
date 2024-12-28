using BanMyPham.DataBase;
using BanMyPham.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace BanMyPham.Areas.Admin.Controllers
{
    [Area("Admin")]
    public class DanhMucManagementController : Controller
    {
        private readonly AppDBcontext dbcontext;
        public DanhMucManagementController(AppDBcontext dBcontext)
        {
            this.dbcontext = dBcontext;
        }

        public ActionResult Index()
        {
            var danhMuc = dbcontext.DanhMucs.ToList();
            return View(danhMuc);
        }

        public ActionResult Create()
        {
            return View("CreateOrEdit");
        }

        [HttpPost]
        public ActionResult Create(DanhMuc danhMuc)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    if(dbcontext.DanhMucs.Any(s=>s.MaDanhMuc==danhMuc.MaDanhMuc))
                    {
                        TempData["ErrorMessage"] = "Mã danh mục đã tồn tại!";
                        return View("CreateOrEdit",danhMuc);
                    }


                    dbcontext.DanhMucs.Add(danhMuc);
                    dbcontext.SaveChanges();
                    TempData["SuccessMessage"] = "Thêm danh mục thành công!";
                    return RedirectToAction(nameof(Index));
                }
                return View("CreateOrEdit", danhMuc);
            }
            catch
            {
                TempData["ErrorMessage"] = "Có lỗi xảy ra khi thêm danh mục!";
                return View("CreateOrEdit", danhMuc);
            }
        }

        [HttpGet]
        public ActionResult Edit(string id)
        {
            DanhMuc? danhMuc = dbcontext.DanhMucs.FirstOrDefault(s=>s.MaDanhMuc==id);
            
            if (danhMuc == null)
            {
                TempData["ErrorMessage"] = "Không tìm thấy danh mục!";
                return NotFound();
            }
            return View("CreateOrEdit", danhMuc);
        }

        [HttpPost]
        public ActionResult Edit(string id, DanhMuc danhMuc)
        {
            try
            {
                if (id != danhMuc.MaDanhMuc)
                {
                    TempData["ErrorMessage"] = "Mã danh mục không hợp lệ!";
                    return RedirectToAction(nameof(Index));
                }

                if (ModelState.IsValid)
                {
                    dbcontext.DanhMucs.Update(danhMuc);
                    dbcontext.SaveChanges();
                    TempData["SuccessMessage"] = "Cập nhật danh mục thành công!";
                    return RedirectToAction(nameof(Index));
                }
                return View("CreateOrEdit", danhMuc);
            }
            catch
            {
                TempData["ErrorMessage"] = "Có lỗi xảy ra khi cập nhật danh mục!";
                return View("CreateOrEdit", danhMuc);
            }
        }

        public ActionResult Delete(string id)
        {
            var danhMuc = dbcontext.DanhMucs.Find(id);
            if (danhMuc == null)
            {
                TempData["ErrorMessage"] = "Không tìm thấy danh mục để xóa!";
                return NotFound();
            }

            try
            {
                dbcontext.DanhMucs.Remove(danhMuc);
                dbcontext.SaveChanges();
                TempData["SuccessMessage"] = "Xóa danh mục thành công!";
                return RedirectToAction(nameof(Index));
            }
            catch
            {
                TempData["ErrorMessage"] = "Có lỗi xảy ra khi xóa danh mục! Có thể danh mục đang là khóa ngoại của bảng khác!";
                return RedirectToAction(nameof(Index));
            }
        }
    }
}
