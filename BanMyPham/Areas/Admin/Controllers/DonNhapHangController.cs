using BanMyPham.DataBase;
using BanMyPham.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Text.Json;

namespace BanMyPham.Areas.Admin.Controllers
{
    [Area("Admin")]
    public class DonNhapHangController : Controller
    {
        private readonly AppDBcontext dbcontext;
        public DonNhapHangController(AppDBcontext dBcontext)
        {
            this.dbcontext = dBcontext;
        }

        // Xem danh sách đơn nhập hàng
        public ActionResult Index()
        {
            var donNhapHang = dbcontext.DonNhapHangs
                .OrderByDescending(d => d.NgayNhap)
                .Select(d => new
                {
                    MaDN = d.MaDN,
                    NgayNhap = d.NgayNhap,
                    TongTienNhap = dbcontext.ChiTietDonHangNhaps
                        .Where(c => c.MaDN == d.MaDN)
                        .Sum(c => c.TongTien),
                    SoSanPhamNhap = dbcontext.ChiTietDonHangNhaps
                        .Where(c => c.MaDN == d.MaDN)
                        .Sum(c => c.SoLuong)
                })
                .ToList()
                .Select(d => new DonNhapHangViewModel
                {
                    MaDN = d.MaDN,
                    NgayNhap = d.NgayNhap,
                    TongTienNhap = d.TongTienNhap,
                    SoSanPhamNhap = d.SoSanPhamNhap
                });

            return View(donNhapHang);
        }

        // Form tạo đơn nhập hàng mới
        public ActionResult Create()
        {
            ViewBag.ChiNhanh = dbcontext.ChiNhanhs.ToList();
            ViewBag.ThuongHieu = dbcontext.ThuongHieus.ToList();
            ViewBag.SanPham = dbcontext.SanPhams.ToList();
            return View();
        }



        // Xử lý tạo đơn nhập hàng
        [HttpPost]
        public JsonResult Create([FromForm] string maDN, [FromForm] DateTime ngayNhap, [FromForm] string newProducts, [FromForm] string existingProducts)
        {
            try
            {
                var newProductsTMP = string.IsNullOrWhiteSpace(newProducts)
                     ? new List<NewProduct>()
                     : JsonSerializer.Deserialize<List<NewProduct>>(newProducts);

                var existingProductsTMP = string.IsNullOrWhiteSpace(existingProducts)
                    ? new List<ExistingProduct>()
                    : JsonSerializer.Deserialize<List<ExistingProduct>>(existingProducts);
                // Kiểm tra mã đơn nhập đã tồn tại
                if (dbcontext.DonNhapHangs.Any(d => d.MaDN == maDN))
                {
                    return Json(new { success = false, message = "Mã đơn nhập đã tồn tại!" });
                }

                // Tạo đơn nhập hàng mới
                var donNhapHang = new DonNhapHang
                {
                    MaDN = maDN,
                    NgayNhap = ngayNhap
                };
                dbcontext.DonNhapHangs.Add(donNhapHang);
                bool checkAdd = dbcontext.SaveChanges() > 0;
                if (checkAdd)
                {
                    // Xử lý sản phẩm mới
                    if (newProducts != null)
                    {
                        foreach (var item in newProductsTMP)
                        {
                            // Thêm sản phẩm mới
                            var sanPham = new SanPham
                            {
                                MaSanPham = item.MaSanPham,
                                TenSanPham = item.TenSanPham,
                                MaThuongHieu = item.MaThuongHieu,
                                NguyenGia = item.NguyenGia,
                                SoLuong = item.SoLuong,
                                ThongTinSanPham = item.ThongTinSanPham,
                                CongDungSanPham = item.CongDungSanPham,
                                ThanhPhanSanPham = item.ThanhPhanSanPham,
                                HuongDanSuDungSanPham = item.HuongDanSuDungSanPham,
                                XuatXu = item.XuatXu
                            };
                            dbcontext.SanPhams.Add(sanPham);
                            bool checkAddSP = dbcontext.SaveChanges() > 0;
                            if (checkAdd)
                            {
                                // Thêm chi tiết đơn nhập
                                var chiTiet = new ChiTietDonHangNhap
                                {
                                    MaDN = maDN,
                                    MaSP = item.MaSanPham,
                                    SoLuong = item.SoLuong,
                                    TongTien = item.SoLuong * item.GiaNhap,
                                    MaChiNhanh = item.MaChiNhanh,
                                    LoaiSP = 1 // Sản phẩm mới
                                };
                                dbcontext.ChiTietDonHangNhaps.Add(chiTiet);
                            }
                        }
                    }

                    // Xử lý sản phẩm có sẵn
                    if (existingProducts != null)
                    {
                        foreach (var item in existingProductsTMP)
                        {
                            // Cập nhật số lượng sản phẩm
                            var sanPham = dbcontext.SanPhams.Find(item.MaSP);
                            if (sanPham != null)
                            {
                                sanPham.SoLuong = sanPham.SoLuong ?? 0;
                                sanPham.SoLuong += item.SoLuong;
                                dbcontext.SanPhams.Update(sanPham);
                            }

                            // Thêm chi tiết đơn nhập
                            var chiTiet = new ChiTietDonHangNhap
                            {
                                MaDN = maDN,
                                MaSP = item.MaSP,
                                SoLuong = item.SoLuong,
                                TongTien = item.SoLuong * item.GiaNhap,
                                MaChiNhanh = item.MaChiNhanh,
                                LoaiSP = 0 // Sản phẩm cũ
                            };
                            dbcontext.ChiTietDonHangNhaps.Add(chiTiet);
                        }
                    }

                    dbcontext.SaveChanges();
                    return Json(new { success = true });
                }
                else
                {
                    return Json(new { success = false, message = "Thêm thất bại hãy thử lại các dữ liệu" });
                }
            }
            catch (Exception ex)
            {
                return Json(new { success = false, message = ex.Message });
            }
        }

        // Xem chi tiết đơn nhập hàng
        public ActionResult Detail(string id)
        {
            // Lấy thông tin đơn nhập
            var donNhap = dbcontext.DonNhapHangs.Find(id);
            if (donNhap == null)
            {
                TempData["ErrorMessage"] = "Không tìm thấy đơn nhập hàng!";
                return RedirectToAction(nameof(Index));
            }

            // Lấy chi tiết đơn nhập gồm sản phẩm mới và sản phẩm cũ
            var chiTiet = dbcontext.ChiTietDonHangNhaps
                .Where(c => c.MaDN == id)
                .Join(dbcontext.SanPhams,
                    c => c.MaSP,
                    s => s.MaSanPham,
                    (c, s) => new { ChiTiet = c, SanPham = s })
                .Select(x => new
                {
                    x.ChiTiet.MaSP,
                    x.ChiTiet.SoLuong,
                    x.ChiTiet.TongTien,
                    x.SanPham.TenSanPham,
                    x.SanPham.MaThuongHieu,
                    x.SanPham.XuatXu,
                    x.SanPham.ThongTinSanPham,
                    x.SanPham.CongDungSanPham,
                    x.SanPham.ThanhPhanSanPham,
                    x.SanPham.HuongDanSuDungSanPham,
                    LoaiSP = x.ChiTiet.LoaiSP == 1 ? "Mới" : "Cũ"
                })
                .ToList();

            // Tạo ViewBag chứa chi tiết đơn nhập
            ViewBag.ChiTiet = chiTiet;
            ViewBag.MaDN = donNhap.MaDN;
            ViewBag.NgayNhap = donNhap.NgayNhap;
            ViewBag.TongTienNhap = dbcontext.ChiTietDonHangNhaps
                .Where(c => c.MaDN == id)
                .Sum(c => c.TongTien);

            return View(donNhap);
        }

        // Hủy đơn nhập hàng
        public ActionResult Cancel(string id)
        {
            try
            {
                var donNhap = dbcontext.DonNhapHangs.Find(id);
                if (donNhap == null)
                {
                    TempData["ErrorMessage"] = "Không tìm thấy đơn nhập để xóa!";
                }

                // Lấy chi tiết đơn nhập
                var chiTiet = dbcontext.ChiTietDonHangNhaps.Where(c => c.MaDN == id).ToList();

                // Giảm số lượng sản phẩm
                foreach (var item in chiTiet)
                {
                    var sanPham = dbcontext.SanPhams.Find(item.MaSP);
                    if (sanPham != null && item.LoaiSP == 0)
                    {
                        sanPham.SoLuong -= item.SoLuong;
                        if (sanPham.SoLuong < 0) sanPham.SoLuong = 0;
                        dbcontext.SanPhams.Update(sanPham);
                    }
                    else if (item.LoaiSP == 1 && sanPham != null)
                    {
                        dbcontext.SanPhams.Remove(sanPham);

                    }
                }

                // Xóa chi tiết đơn nhập
                dbcontext.ChiTietDonHangNhaps.RemoveRange(chiTiet);
                // Xóa đơn nhập
                dbcontext.DonNhapHangs.Remove(donNhap);

                dbcontext.SaveChanges();
                TempData["SuccessMessage"] = "Hủy hóa đơn nhập thành công!";
                return RedirectToAction(nameof(Index));
            }
            catch (Exception ex)
            {
                TempData["ErrorMessage"] = "Có lỗi xảy ra khi hủy hóa đơn nhập! Có thể hóa đơn nhập đang là khóa ngoại của bảng khác!";
                return RedirectToAction(nameof(Index));
            }
        }

        // Class hỗ trợ binding dữ liệu
        public class NewProduct
        {
            public string MaSanPham { get; set; }
            public string TenSanPham { get; set; }
            public int SoLuong { get; set; }
            public double NguyenGia { get; set; }
            public double GiaNhap { get; set; }
            public string MaThuongHieu { get; set; }
            public string ThongTinSanPham { get; set; }
            public string CongDungSanPham { get; set; }
            public string ThanhPhanSanPham { get; set; }
            public string HuongDanSuDungSanPham { get; set; }
            public string XuatXu { get; set; }
            public string MaChiNhanh { get; set; }
        }

        public class ExistingProduct
        {
            public string MaSP { get; set; }
            public int SoLuong { get; set; }
            public double GiaNhap { get; set; }
            public string MaChiNhanh { get; set; }
        }

        public class DonNhapHangViewModel
        {
            public string MaDN { get; set; }
            public DateTime NgayNhap { get; set; }
            public double TongTienNhap { get; set; }
            public int SoSanPhamNhap { get; set; }
        }
    }
}
