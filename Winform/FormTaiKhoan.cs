using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using Winform.Repository;

namespace Winform
{
    public partial class FormTaiKhoan : Form
    {

        public FormTaiKhoan()
        {
            InitializeComponent();
        }
        THNNEntities db = new THNNEntities();
        public class LoaiTaiKhoan1
        {
            public int Key { get; set; }
            public string Value { get; set; }
        }
        private void FormTaiKhoan_Load(object sender, EventArgs e)
        {
            // Tạo danh sách các đối tượng LoaiTaiKhoan1
                var loaiTaiKhoanList = new List<LoaiTaiKhoan1>()
        {
            new LoaiTaiKhoan1 { Key = 0, Value = "Khách hàng" },
            new LoaiTaiKhoan1 { Key = 1, Value = "Admin" }
        };

            // Gán nguồn dữ liệu cho ComboBox
            cbbLTK.DataSource = loaiTaiKhoanList;
            cbbLTK.DisplayMember = "Value";  // Hiển thị tên (Khách hàng, Admin)
            cbbLTK.ValueMember = "Key";     // Lưu giá trị Key (0, 1)

            // Chọn mặc định là "Khách hàng"
            cbbLTK.SelectedIndex = 0;
            LoadData();
        }
        public void LoadData()
        {
            var taiKhoans = db.TaiKhoan.Where(s => s.MaKhachHang != "ADMIN")
           .Select(t => new
           {
               MaKhachHang = string.IsNullOrEmpty(t.MaKhachHang) ? "Không có" : t.MaKhachHang,
               HoKH = string.IsNullOrEmpty(t.HoKH) ? "Không có" : t.HoKH,
               TenKH = string.IsNullOrEmpty(t.TenKH) ? "Không có" : t.TenKH,
               TenDangNhap = string.IsNullOrEmpty(t.TenDangNhap) ? "Không có" : t.TenDangNhap,
               MatKhau = string.IsNullOrEmpty(t.MatKhau) ? "Không có" : t.MatKhau,
               GioiTinh = string.IsNullOrEmpty(t.GioiTinh) ? "Không rõ" : t.GioiTinh,
               SoDienThoai = string.IsNullOrEmpty(t.SoDienThoai) ? "Không có" : t.SoDienThoai,
               Email = string.IsNullOrEmpty(t.Email) ? "Không có" : t.Email,
               NgaySinh = string.IsNullOrEmpty(t.NgaySinh) ? "Không rõ" : t.NgaySinh,
               LoaiTaiKhoan = t.LoaiTaiKhoan == 1 ? "Admin" : "Khách hàng"
           })
           .ToList();

            dtgrvHienThiListKH.DataSource = taiKhoans;
        }
        private void btnEdit_Click(object sender, EventArgs e)
        {
            try
            {
                var maKhachHang = txtMaKhachHang.Text;
                var taiKhoan = db.TaiKhoan.FirstOrDefault(t => t.MaKhachHang == maKhachHang);

                if (taiKhoan != null)
                {
                    taiKhoan.HoKH = txtHoKH.Text;
                    taiKhoan.TenKH = txtTenKH.Text;
                    taiKhoan.TenDangNhap = txtTenDangNhap.Text;
                    taiKhoan.GioiTinh = txtGioiTinh.Text;
                    taiKhoan.SoDienThoai = txtSDT.Text;
                    taiKhoan.Email = txtEmail.Text;
                    taiKhoan.NgaySinh = txtNgaySinh.Text;
                    taiKhoan.MatKhau = txtMatKhau.Text;
                    taiKhoan.LoaiTaiKhoan = (int)cbbLTK.SelectedValue; // Lấy giá trị từ ComboBox

                    db.SaveChanges();

                    MessageBox.Show("Sửa tài khoản thành công!");
                    LoadData();
                }
                else
                {
                    MessageBox.Show("Không tìm thấy tài khoản để sửa!");
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Lỗi: {ex.Message}");
            }
        }

        private void btnXoa_Click(object sender, EventArgs e)
        {
            try
            {
                var maKhachHang = txtMaKhachHang.Text;
                var taiKhoan = db.TaiKhoan.FirstOrDefault(t => t.MaKhachHang == maKhachHang);

                if (taiKhoan != null)
                {
                    db.TaiKhoan.Remove(taiKhoan);
                    db.SaveChanges();

                    MessageBox.Show("Xóa tài khoản thành công!");
                    LoadData();
                }
                else
                {
                    MessageBox.Show("Không tìm thấy tài khoản để xóa!");
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Lỗi: {ex.Message}");
            }
        }

        private void btnAdd_Click(object sender, EventArgs e)
        {
            try
            {
                var taiKhoan = new TaiKhoan
                {
                    MaKhachHang = txtMaKhachHang.Text,
                    HoKH = txtHoKH.Text,
                    TenKH = txtTenKH.Text,
                    TenDangNhap = txtTenDangNhap.Text,
                    GioiTinh = txtGioiTinh.Text,
                    SoDienThoai = txtSDT.Text,
                    Email = txtEmail.Text,
                    NgaySinh = txtNgaySinh.Text,
                    MatKhau = txtMatKhau.Text,
                    LoaiTaiKhoan = (int)cbbLTK.SelectedValue // Lấy giá trị từ ComboBox
                };

                db.TaiKhoan.Add(taiKhoan);
                db.SaveChanges();

                MessageBox.Show("Thêm tài khoản thành công!");
                LoadData();
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Lỗi: {ex.Message}");
            }
        }

        private void btnSearch_Click(object sender, EventArgs e)
        {
            try
            {
                // Lấy giá trị tìm kiếm từ txtTimKiem
                var searchKeyword = txtTimKiem.Text.Trim();

                // Truy vấn tìm kiếm với các điều kiện tìm kiếm trên nhiều trường
                var taiKhoans = db.TaiKhoan.Where(t =>
                    (string.IsNullOrEmpty(searchKeyword) ||
                    t.MaKhachHang.Contains(searchKeyword) ||
                    t.HoKH.Contains(searchKeyword) ||
                    t.TenKH.Contains(searchKeyword) ||
                    t.TenDangNhap.Contains(searchKeyword) ||
                    t.GioiTinh.Contains(searchKeyword) ||
                    t.SoDienThoai.Contains(searchKeyword) ||
                    t.Email.Contains(searchKeyword) ||
                    t.NgaySinh.Contains(searchKeyword))
                )
                .Select(t => new
                {
                    MaKhachHang = string.IsNullOrEmpty(t.MaKhachHang) ? "Không có" : t.MaKhachHang,
                    HoKH = string.IsNullOrEmpty(t.HoKH) ? "Không có" : t.HoKH,
                    TenKH = string.IsNullOrEmpty(t.TenKH) ? "Không có" : t.TenKH,
                    TenDangNhap = string.IsNullOrEmpty(t.TenDangNhap) ? "Không có" : t.TenDangNhap,
                    MatKhau = string.IsNullOrEmpty(t.MatKhau) ? "Không có" : t.MatKhau,
                    GioiTinh = string.IsNullOrEmpty(t.GioiTinh) ? "Không rõ" : t.GioiTinh,
                    SoDienThoai = string.IsNullOrEmpty(t.SoDienThoai) ? "Không có" : t.SoDienThoai,
                    Email = string.IsNullOrEmpty(t.Email) ? "Không có" : t.Email,
                    NgaySinh = string.IsNullOrEmpty(t.NgaySinh) ? "Không rõ" : t.NgaySinh,
                    LoaiTaiKhoan = t.LoaiTaiKhoan == 1 ? "Admin" : "Khách hàng"
                })
                .ToList();

                // Gán dữ liệu đã tìm kiếm vào DataGridView
                dtgrvHienThiListKH.DataSource = taiKhoans;
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Lỗi: {ex.Message}");
            }
        }

        private void dtgrvHienThiListKH_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.RowIndex >= 0)
            {
                var row = dtgrvHienThiListKH.Rows[e.RowIndex];

                // Gán dữ liệu từ dòng được chọn vào các điều khiển TextBox
                txtMaKhachHang.Text = row.Cells["MaKhachHang"].Value.ToString();
                txtHoKH.Text = row.Cells["HoKH"].Value.ToString();
                txtTenKH.Text = row.Cells["TenKH"].Value.ToString();
                txtTenDangNhap.Text = row.Cells["TenDangNhap"].Value.ToString();
                txtGioiTinh.Text = row.Cells["GioiTinh"].Value.ToString();
                txtSDT.Text = row.Cells["SoDienThoai"].Value.ToString();
                txtEmail.Text = row.Cells["Email"].Value.ToString();
                txtNgaySinh.Text = row.Cells["NgaySinh"].Value.ToString();
                txtMatKhau.Text = row.Cells["MatKhau"].Value.ToString();

                // Gán giá trị LoaiTaiKhoan vào ComboBox
                var loaiTaiKhoan = row.Cells["LoaiTaiKhoan"].Value.ToString();
                int selectedLoaiTaiKhoan = loaiTaiKhoan == "Admin" ? 1 : 0; // Nếu là "Admin" thì chọn 1, còn lại chọn 0

                // Gán giá trị LoaiTaiKhoan vào ComboBox
                cbbLTK.SelectedIndex = selectedLoaiTaiKhoan;
            }
        }
    }
}
