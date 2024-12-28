using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using DoAn1_QuanLyPhanMemBanPKDT;
using Winform.Repository;

namespace Winform
{
    public partial class FormHoaDonNhap : Form
    {
        public FormHoaDonNhap()
        {
            InitializeComponent();
        }
        private THNNEntities db=new THNNEntities();
        private void FormHoaDonNhap_Load(object sender, EventArgs e)
        {
            LoadData();
        }
        public void LoadData()
        {
            // Truy vấn kết hợp bảng DonNhapHang và ChiTietDonHangNhap
            var query = from dn in db.DonNhapHang
                        join ctdh in db.ChiTietDonHangNhap on dn.MaDN equals ctdh.MaDN
                        group new { dn, ctdh } by new { dn.MaDN, dn.NgayNhap } into g
                        select new
                        {
                            MaDN = g.Key.MaDN,
                            NgayNhap = g.Key.NgayNhap,
                            TongTienNhap = g.Sum(x => x.ctdh.TongTien),  // Tổng tiền nhập chưa định dạng
                            SoLuongNhap = g.Sum(x => x.ctdh.SoLuong)    // Tổng số lượng nhập
                        };

            // Chuyển đổi kết quả truy vấn thành danh sách
            var resultList = query.ToList();

            // Định dạng lại tổng tiền nhập thành tiền tệ VND sau khi lấy dữ liệu
            var formattedResultList = resultList.Select(r => new
            {
                r.MaDN,
                r.NgayNhap,
                TongTienNhap = string.Format(new System.Globalization.CultureInfo("vi-VN"), "{0:C0}", r.TongTienNhap),  // Định dạng tiền tệ
                r.SoLuongNhap
            }).ToList();

            // Gán dữ liệu đã được định dạng cho DataGridView
            dtgrvHienThiListALLDH.DataSource = formattedResultList;
        }

        private void btnXemchitiet_Click(object sender, EventArgs e)
        {
            if (dtgrvHienThiListALLDH.SelectedRows.Count > 0)
            {
                string maDN = dtgrvHienThiListALLDH.SelectedRows[0].Cells["MaDN"].Value.ToString();

                // Mở form chi tiết đơn nhập hàng
                FormChiTietDonNhap formChiTiet = new FormChiTietDonNhap(maDN);
                formChiTiet.ShowDialog(); // Hiển thị form chi tiết
            }
            else
            {
                MessageBox.Show("Vui lòng chọn một đơn nhập hàng để xem chi tiết.", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
        }
        public class FormChiTietDonNhap : Form
        {
            private THNNEntities db = new THNNEntities();
            private string MaDN;
            
            private DataGridView dtgrvChiTiet;

            public FormChiTietDonNhap(string maDN)
            {
                this.MaDN = maDN;
                this.dtgrvChiTiet = new DataGridView { Dock = DockStyle.Fill };
                this.Controls.Add(dtgrvChiTiet);
                LoadChiTiet();
                this.Text = "Chi tiết hóa đơn nhập #" + maDN;
                this.Width = 600;

            }

            public void LoadChiTiet()
            {
                var query = from ctdh in db.ChiTietDonHangNhap
                            join sp in db.SanPham on ctdh.MaSP equals sp.MaSanPham
                            where ctdh.MaDN == MaDN
                            select new
                            {
                                MaSP = ctdh.MaSP,
                                TenSanPham = sp.TenSanPham,
                                SoLuong = ctdh.SoLuong,
                                TongTien = ctdh.TongTien,
                                LoaiSP = ctdh.LoaiSP == 1 ? "Mới" : "Cũ"
                            };

                // Gán dữ liệu cho DataGridView
                dtgrvChiTiet.DataSource = query.ToList();
            }
        }
        private void btnThemMoi_Click(object sender, EventArgs e)
        {

        }

        private void btnXuatExcel_Click(object sender, EventArgs e)
        {
            XuatExcel a = new XuatExcel();
            string[] listTitle = { "Mã HĐN", "Ngày Nhập", "Tổng tiền nhập", "Số lượng nhập" };
            a.ExportToExcel(dtgrvHienThiListALLDH, "Danh Sách Nhập hàng", listTitle, "DanhsachNhapHang");
        }

        private void dtgrvHienThiListALLDH_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            if (dtgrvHienThiListALLDH.SelectedRows.Count > 0)
            {
                btnXemchitiet.Visible = true;
            }
        }

        private void btnTimkiem_Click(object sender, EventArgs e)
        {
            string searchKeyword = txtTimKiem.Text.Trim(); // Lấy từ khóa tìm kiếm từ TextBox

            if (!string.IsNullOrEmpty(searchKeyword))
            {
                // Truy vấn tìm kiếm từ khóa trong Mã Đơn Nhập và Ngày Nhập
                var query = from dn in db.DonNhapHang
                            join ctdh in db.ChiTietDonHangNhap on dn.MaDN equals ctdh.MaDN
                            where dn.MaDN.Contains(searchKeyword) || dn.NgayNhap.ToString().Contains(searchKeyword)
                            group new { dn, ctdh } by new { dn.MaDN, dn.NgayNhap } into g
                            select new
                            {
                                MaDN = g.Key.MaDN,
                                NgayNhap = g.Key.NgayNhap,
                                TongTienNhap = g.Sum(x => x.ctdh.TongTien),  // Tổng tiền nhập chưa định dạng
                                SoLuongNhap = g.Sum(x => x.ctdh.SoLuong)    // Tổng số lượng nhập
                            };

                // Chuyển đổi kết quả truy vấn thành danh sách
                var resultList = query.ToList();

                // Định dạng lại tổng tiền nhập thành tiền tệ VND sau khi lấy dữ liệu
                var formattedResultList = resultList.Select(r => new
                {
                    r.MaDN,
                    r.NgayNhap,
                    TongTienNhap = string.Format(new System.Globalization.CultureInfo("vi-VN"), "{0:C0}", r.TongTienNhap),  // Định dạng tiền tệ
                    r.SoLuongNhap
                }).ToList();

                // Gán dữ liệu đã được định dạng cho DataGridView
                dtgrvHienThiListALLDH.DataSource = formattedResultList;
            }
            else
            {
                // Nếu không có từ khóa tìm kiếm, tải lại dữ liệu gốc
                LoadData();
            }
        }

        private void button1_Click(object sender, EventArgs e)
        {
            LoadData();
        }
    }
}
