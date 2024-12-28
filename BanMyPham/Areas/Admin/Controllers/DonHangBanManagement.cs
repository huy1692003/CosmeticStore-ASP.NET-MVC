using BanMyPham.DataBase;
using Microsoft.AspNetCore.Mvc;

namespace BanMyPham.Areas.Admin.Controllers
{
    [Area("Admin")]
    public class DonHangBanManagement : Controller
    {
        private readonly AppDBcontext dbcontext;
        public DonHangBanManagement(AppDBcontext db)
        {
            this.dbcontext = db;    
        }
        public ActionResult Index(int pageNumber = 1, int pageSize = 10, string searchTerm = "", string nameSearch = "", string addressSearch = "", DateTime? startDate = null, DateTime? endDate = null)
        {
            // Lấy tất cả hóa đơn bán
            var hoaDonList = dbcontext.DonHangs.AsQueryable();

            // Tìm kiếm theo mã hóa đơn
            if (!string.IsNullOrEmpty(searchTerm))
            {
                hoaDonList = hoaDonList.Where(d => d.MaDH.Contains(searchTerm));
            }

            // Tìm kiếm theo tên người nhận
            if (!string.IsNullOrEmpty(nameSearch))
            {
                hoaDonList = hoaDonList.Where(d => d.TenNguoiNhan.Contains(nameSearch));
            }

            // Tìm kiếm theo địa chỉ
            if (!string.IsNullOrEmpty(addressSearch))
            {
                hoaDonList = hoaDonList.Where(d => d.DiaChiChiTiet.Contains(addressSearch));
            }

            // Tìm kiếm theo ngày bắt đầu và kết thúc
            if (startDate.HasValue)
            {
                hoaDonList = hoaDonList.Where(d => d.NgayDH >= startDate);
            }
            if (endDate.HasValue)
            {
                hoaDonList = hoaDonList.Where(d => d.NgayDH <= endDate);
            }

            // Tính toán tổng số hóa đơn
            var totalItems = hoaDonList.Count();

            // Phân trang
            var ordersOnPage = hoaDonList
                .OrderByDescending(hd => hd.NgayDH) // Sắp xếp giảm dần theo ngày lập
                .Skip((pageNumber - 1) * pageSize)  // Bỏ qua các hóa đơn ở các trang trước
                .Take(pageSize)                     // Lấy số lượng hóa đơn theo trang
                .ToList();

            // Tạo thông tin phân trang
            var totalPages = (int)Math.Ceiling((double)totalItems / pageSize);

            // Truyền thông tin vào View
            ViewBag.CurrentPage = pageNumber;
            ViewBag.TotalPages = totalPages;
            ViewBag.PageSize = pageSize;

            // Truyền các tham số tìm kiếm để giữ lại trên giao diện
            ViewBag.SearchTerm = searchTerm;
            ViewBag.NameSearch = nameSearch;
            ViewBag.AddressSearch = addressSearch;
            ViewBag.StartDate = startDate;
            ViewBag.EndDate = endDate;

            return View(ordersOnPage);
        }


        [HttpGet]
        public ActionResult Detail(string id)
        {
            ViewBag.ThongTinDonHang = dbcontext.DonHangs.FirstOrDefault(s=>s.MaDH==id);
            var dsSanPham = (from ctdh in dbcontext.ChiTietDonHangs
                             join dh in dbcontext.DonHangs
                             on ctdh.MaDH equals dh.MaDH
                             join sp in dbcontext.SanPhams
                             on ctdh.MaSanPham equals sp.MaSanPham
                             where dh.MaDH==id
                             select new
                             {
                                 masp = sp.MaSanPham,
                                 tensp = sp.TenSanPham,
                                 anhsp = sp.HinhAnh,
                                 giasp = sp.NguyenGia,
                                 soluong = ctdh.SoLuongSanPham,
                                 tongtien = ctdh.TongTien
                             }).ToList();
            return View(dsSanPham);
        }

    }
}
