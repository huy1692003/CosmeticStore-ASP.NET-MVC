using BanMyPham.DataBase;
using BanMyPham.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace BanMyPham.Areas.Admin.Controllers
{
    [Area("Admin")]
    public class ThuongHieuManagementController : Controller
    {
        private readonly AppDBcontext dbcontext;
        public ThuongHieuManagementController(AppDBcontext dBcontext)
        {
            this.dbcontext = dBcontext;
        }

        public ActionResult Index()
        {
            var thuongHieu = dbcontext.ThuongHieus.ToList();
            return View(thuongHieu);
        }

        public ActionResult Create()
        {
            return View("CreateOrEdit");
        }

        [HttpPost]
        public ActionResult Create(ThuongHieu thuongHieu)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    if(dbcontext.ThuongHieus.Any(s=>s.MaThuongHieu==thuongHieu.MaThuongHieu))
                    {
                        TempData["ErrorMessage"] = "Mã thương hiệu đã tồn tại!";
                        return View("CreateOrEdit",thuongHieu);
                    }
                    dbcontext.ThuongHieus.Add(thuongHieu);
                    dbcontext.SaveChanges();
                    TempData["SuccessMessage"] = "Thêm thương hiệu thành công!";
                    return RedirectToAction(nameof(Index));
                }
                return View("CreateOrEdit", thuongHieu);
            }
            catch
            {
                TempData["ErrorMessage"] = "Có lỗi xảy ra khi thêm thương hiệu!";
                return View("CreateOrEdit", thuongHieu);
            }
        }

        [HttpGet]
        public ActionResult Edit(string id)
        {
            ThuongHieu? thuongHieu = dbcontext.ThuongHieus.FirstOrDefault(s=>s.MaThuongHieu==id);
            
            if (thuongHieu == null)
            {
                TempData["ErrorMessage"] = "Không tìm thấy thương hiệu!";
                return NotFound();
            }
            return View("CreateOrEdit", thuongHieu);
        }

        [HttpPost]
        public ActionResult Edit(string id, ThuongHieu thuongHieu)
        {
            try
            {
                if (id != thuongHieu.MaThuongHieu)
                {
                    TempData["ErrorMessage"] = "Mã thương hiệu không hợp lệ!";
                    return RedirectToAction(nameof(Index));
                }

                if (ModelState.IsValid)
                {
                    dbcontext.ThuongHieus.Update(thuongHieu);
                    dbcontext.SaveChanges();
                    TempData["SuccessMessage"] = "Cập nhật thương hiệu thành công!";
                    return RedirectToAction(nameof(Index));
                }
                return View("CreateOrEdit", thuongHieu);
            }
            catch
            {
                TempData["ErrorMessage"] = "Có lỗi xảy ra khi cập nhật thương hiệu!";
                return View("CreateOrEdit", thuongHieu);
            }
        }

        public ActionResult Delete(string id)
        {
            var thuongHieu = dbcontext.ThuongHieus.Find(id);
            if (thuongHieu == null)
            {
                TempData["ErrorMessage"] = "Không tìm thấy thương hiệu để xóa!";
                return NotFound();
            }

            try
            {
                dbcontext.ThuongHieus.Remove(thuongHieu);
                dbcontext.SaveChanges();
                TempData["SuccessMessage"] = "Xóa thương hiệu thành công!";
                return RedirectToAction(nameof(Index));
            }
            catch
            {
                TempData["ErrorMessage"] = "Có lỗi xảy ra khi xóa thương hiệu! Có thể thương hiệu đang là khóa ngoại của bảng khác!";
                return RedirectToAction(nameof(Index));
            }
        }
    }
}
