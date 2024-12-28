using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.IO;
using System.Windows.Forms;
using OfficeOpenXml;
using OfficeOpenXml.Style;
using System.Drawing;

namespace DoAn1_QuanLyPhanMemBanPKDT
{
  public class XuatExcel
    {
        public XuatExcel()
        {
            
        }

        public void ExportToExcel(DataGridView dataGridView,string TieuDeChinh, string[]TitleCollumn,string TenfileMacdinh)
        {
            // Kiểm tra xem DataGridView có dữ liệu hay không
            if (dataGridView == null || dataGridView.Rows.Count == 0)
            {
                MessageBox.Show("Không có dữ liệu để xuất ra Excel.");
                return;
            }

            try
            {
                // Tạo một đối tượng ExcelPackage
                // Tạo một đối tượng ExcelPackage
                using (var package = new ExcelPackage())
                {
                    // Tạo một sheet mới trong tệp tin Excel
                    var worksheet = package.Workbook.Worksheets.Add("Sheet1");

                    // Ghi dữ liệu từ DataGridView vào sheet
                    int rowIndex = 1;
                    int columnIndex = 3;

                    // Ghi tiêu đề căn từ cột C đến cột G
                    worksheet.Cells[rowIndex, columnIndex].Value = TieuDeChinh;
                    worksheet.Cells[rowIndex, columnIndex, rowIndex, columnIndex + dataGridView.ColumnCount-1].Merge = true;
                    worksheet.Cells[rowIndex, columnIndex, rowIndex, columnIndex + dataGridView.ColumnCount - 1].Style.Font.Size = 16;
                    worksheet.Cells[rowIndex, columnIndex, rowIndex, columnIndex + dataGridView.ColumnCount - 1].Style.Font.Bold = true;
                    worksheet.Cells[rowIndex, columnIndex, rowIndex, columnIndex + dataGridView.ColumnCount - 1].Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;

                    rowIndex += 2;

                    // Ghi tiêu đề cột
                    string[] columnHeaders = TitleCollumn;
                    for (int i = 0; i < columnHeaders.Length; i++)
                    {
                        worksheet.Cells[rowIndex, columnIndex + i].Value = columnHeaders[i];
                        worksheet.Cells[rowIndex, columnIndex + i].Style.Font.Bold = true;
                        worksheet.Cells[rowIndex, columnIndex + i].Style.Fill.PatternType = ExcelFillStyle.Solid;
                        worksheet.Cells[rowIndex, columnIndex + i].Style.Fill.BackgroundColor.SetColor(Color.Yellow);

                        worksheet.Cells[rowIndex, columnIndex + i].Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
                    }

                    rowIndex++;

                    // Ghi dữ liệu từ DataGridView vào sheet
                    for (int i = 0; i < dataGridView.Rows.Count; i++)
                    {
                        DataGridViewRow row = dataGridView.Rows[i];
                        for (int j = 0; j < dataGridView.Columns.Count; j++)
                        {
                            worksheet.Cells[rowIndex + i, columnIndex + j].Value = row.Cells[j].Value;
                            worksheet.Cells[rowIndex + i, columnIndex + j].Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
                        }
                    }

                    // Tự động điều chỉnh cột để vừa với nội dung
                    worksheet.Cells.AutoFitColumns();
                    var dataRange = worksheet.Cells[rowIndex - 1, columnIndex, rowIndex-1 + dataGridView.Rows.Count, columnIndex + dataGridView.Columns.Count - 1];

                      // Định dạng viền cho phạm vi
                        dataRange.Style.Border.Top.Style = ExcelBorderStyle.Thin;
                        dataRange.Style.Border.Bottom.Style = ExcelBorderStyle.Thin;
                        dataRange.Style.Border.Left.Style = ExcelBorderStyle.Thin;
                        dataRange.Style.Border.Right.Style = ExcelBorderStyle.Thin;



                    // Hiển thị hộp thoại lưu tệp tin và lấy đường dẫn từ người dùng
                    SaveFileDialog saveFileDialog = new SaveFileDialog();
                    saveFileDialog.Filter = "Excel Files|*.xlsx";
                    saveFileDialog.Title = "Lưu tệp tin Excel";
                  
                    saveFileDialog.FileName = TenfileMacdinh; // Đặt tên mặc định cho tệp tin

                    if (saveFileDialog.ShowDialog() == DialogResult.OK)
                    {
                        string filePath = saveFileDialog.FileName;

                        // Lưu tệp tin Excel
                        FileInfo excelFile = new FileInfo(filePath);
                        package.SaveAs(excelFile);

                        MessageBox.Show("Xuất Excel thành công!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    }
                    else
                    {
                        MessageBox.Show("Hủy lưu trữ tệp tin Excel.", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Lỗi khi xuất Excel: " + ex.Message);
            }
        }
    }
}
