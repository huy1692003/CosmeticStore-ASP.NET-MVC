using BanMyPham.DataBase;
using BanMyPham.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace BanMyPham.Areas.Admin.Controllers
{
    [Area("Admin")]
    public class CTKMManagementController : Controller
    {
        private readonly AppDBcontext dbcontext;
        public CTKMManagementController(AppDBcontext dBcontext)
        {
            this.dbcontext = dBcontext;
        }

        public ActionResult Index()
        {
            var ctkm = dbcontext.CTKMs.ToList();
            return View(ctkm);
        }

        public ActionResult Create()
        {
            return View("CreateOrEdit");
        }

        [HttpPost]
        public ActionResult Create(CTKM ctkm)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    if(dbcontext.CTKMs.Any(s=>s.MaCTKM==ctkm.MaCTKM))
                    {
                        TempData["ErrorMessage"] = "Mã chương trình khuyến mãi đã tồn tại!";
                        return View("CreateOrEdit",ctkm);
                    }
                    dbcontext.CTKMs.Add(ctkm);
                    dbcontext.SaveChanges();
                    TempData["SuccessMessage"] = "Thêm chương trình khuyến mãi thành công!";
                    return RedirectToAction(nameof(Index));
                }
                return View("CreateOrEdit", ctkm);
            }
            catch
            {
                TempData["ErrorMessage"] = "Có lỗi xảy ra khi thêm chương trình khuyến mãi!";
                return View("CreateOrEdit", ctkm);
            }
        }

        [HttpGet]
        public ActionResult Edit(string id)
        {
            CTKM? ctkm = dbcontext.CTKMs.FirstOrDefault(s=>s.MaCTKM==id);
            
            if (ctkm == null)
            {
                TempData["ErrorMessage"] = "Không tìm thấy chương trình khuyến mãi!";
                return NotFound();
            }
            return View("CreateOrEdit", ctkm);
        }

        [HttpPost]
        public ActionResult Edit(string id, CTKM ctkm)
        {
            try
            {
                if (id != ctkm.MaCTKM)
                {
                    TempData["ErrorMessage"] = "Mã chương trình khuyến mãi không hợp lệ!";
                    return RedirectToAction(nameof(Index));
                }

                if (ModelState.IsValid)
                {
                    dbcontext.CTKMs.Update(ctkm);
                    dbcontext.SaveChanges();
                    TempData["SuccessMessage"] = "Cập nhật chương trình khuyến mãi thành công!";
                    return RedirectToAction(nameof(Index));
                }
                return View("CreateOrEdit", ctkm);
            }
            catch
            {
                TempData["ErrorMessage"] = "Có lỗi xảy ra khi cập nhật chương trình khuyến mãi!";
                return View("CreateOrEdit", ctkm);
            }
        }

        public ActionResult Delete(string id)
        {
            var ctkm = dbcontext.CTKMs.Find(id);
            if (ctkm == null)
            {
                TempData["ErrorMessage"] = "Không tìm thấy chương trình khuyến mãi để xóa!";
                return NotFound();
            }

            try
            {
                dbcontext.CTKMs.Remove(ctkm);
                dbcontext.SaveChanges();
                TempData["SuccessMessage"] = "Xóa chương trình khuyến mãi thành công!";
                return RedirectToAction(nameof(Index));
            }
            catch
            {
                TempData["ErrorMessage"] = "Có lỗi xảy ra khi xóa chương trình khuyến mãi! Có thể chương trình khuyến mãi đang là khóa ngoại của bảng khác!";
                return RedirectToAction(nameof(Index));
            }
        }
    }
}
