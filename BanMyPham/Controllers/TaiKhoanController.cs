using System.Text.RegularExpressions;
using BanMyPham.DataBase;
using BanMyPham.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace BanMyPham.Controllers
{
    public class TaiKhoanController : Controller
    {
        private readonly AppDBcontext dbcontext;
        public TaiKhoanController(AppDBcontext db)
        {
            this.dbcontext = db;
        }
        [HttpGet]
        public IActionResult DangNhap()
        {
            return View("DangNhap");
        }

        [HttpGet]
        public IActionResult DangKy()
        {
            return View("DangKy");
        }


        [HttpPost]
        public IActionResult DangNhapPost(string username, string password)
        {
            var taikhoan = dbcontext.TaiKhoans.FirstOrDefault(s => s.TenDangNhap == username && s.MatKhau == password);

            if (taikhoan == null)
            {
                // Nếu không tìm thấy tài khoản, trả về lỗi
                return Json(new { success = false, message = "Tên đăng nhập hoặc mật khẩu không đúng." });
            }
            else
            {
                // Kiểm tra loại tài khoản
                if (taikhoan.LoaiTaiKhoan == 1)
                {
                    // Redirect đến trang quản trị Admin
                    return Json(new { success = true, redirectUrl = Url.Action("Index", "ThongKe", new { area = "Admin" }) });
                }
                else
                {
                    // Nếu thành công, trả về trang chủ
                    TempData["SuccessMessage"] = "Đăng nhập thành công!";
                    return Json(new
                    {
                        success = true,
                        redirectUrl = Url.Action("Index", "Home"),
                        email = taikhoan.Email,
                        role = taikhoan.LoaiTaiKhoan
                        // Bạn có thể gửi thêm thông tin email nếu cần
                    });
                }
            }
        }
        // POST: Xử lý đăng ký
        [HttpPost]
        public IActionResult DangKyPost([FromForm] string Username, [FromForm] string MatKhau,
                                     [FromForm] string ConfirmPassword, [FromForm] string Email)
        {
            // Kiểm tra nếu mật khẩu và xác nhận mật khẩu không khớp
            if (MatKhau != ConfirmPassword)
            {
                return Json(new { success = false, message = "Mật khẩu và mật khẩu xác nhận phải trùng khớp." });
            }

            // Kiểm tra mật khẩu có ít nhất một ký tự đặc biệt
            var specialCharRegex = new Regex(@"[!@#$%^&*(),.?""{}|<>]");
            if (!specialCharRegex.IsMatch(MatKhau))
            {
                return Json(new { success = false, message = "Mật khẩu phải chứa ít nhất một ký tự đặc biệt." });
            }

            try
            {
                Random random = new Random();
                string randomNumbers = string.Concat(Enumerable.Range(0, 8).Select(_ => random.Next(0, 10).ToString()));
                if (dbcontext.TaiKhoans.Any(s => s.TenDangNhap == Username))
                {
                    return Json(new { success = false, message = "Đăng ký thất bại, tên tài khoản này đã có người sử dụng" });
                }

                // Tạo đối tượng TaiKhoan mới
                var TaiKhoanPayload = new TaiKhoan
                {
                    MaKhachHang = "KH" + randomNumbers,
                    TenDangNhap = Username,
                    MatKhau = MatKhau,
                    Email = Email,
                    LoaiTaiKhoan = 0 // Loại tài khoản mặc định (0 có thể thay đổi nếu cần)
                };

                // Thêm mới khách hàng vào cơ sở dữ liệu
                dbcontext.TaiKhoans.Add(TaiKhoanPayload);
                dbcontext.SaveChanges(); // Lưu thay đổi vào cơ sở dữ liệu

                return Json(new { success = true, message = "Đăng ký thành công! Hãy đăng ngay thôi" });
            }
            catch (Exception ex)
            {
                // Log chi tiết exception nếu cần
                return Json(new { success = false, message = "Đăng ký thất bại, hãy thử lại với tên tài khoản khác." });
            }
        }

    }
}
