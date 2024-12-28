using BanMyPham.DataBase;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;

namespace BanMyPham.ActionFilter
{
    public class GetDanhMucApp : ActionFilterAttribute
    {
        private readonly AppDBcontext db;

        public GetDanhMucApp(AppDBcontext appD)
        {
            this.db = appD;
        }

        public override void OnActionExecuting(ActionExecutingContext context)
        {
            // Lấy danh mục từ database
            var danhmucs = db.DanhMucs.ToList();

            // Lưu danh mục vào HttpContext.Items để truy cập từ bất kỳ view nào
            context.HttpContext.Items["DanhMucs"] = danhmucs;

            base.OnActionExecuting(context);
        }
    }
}
