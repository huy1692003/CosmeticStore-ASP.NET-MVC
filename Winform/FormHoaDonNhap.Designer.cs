namespace Winform
{
    partial class FormHoaDonNhap
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle5 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle6 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle7 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle8 = new System.Windows.Forms.DataGridViewCellStyle();
            this.button1 = new System.Windows.Forms.Button();
            this.panel2 = new System.Windows.Forms.Panel();
            this.txtTimKiem = new System.Windows.Forms.TextBox();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.dtgrvHienThiListALLDH = new System.Windows.Forms.DataGridView();
            this.MaDN = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.quequanNV = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.TenNV = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.sdtNV = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.btnXuatExcel = new CustomButton.VBButton();
            this.btnXemchitiet = new CustomButton.VBButton();
            this.btnTimkiem = new CustomButton.VBButton();
            this.panel2.SuspendLayout();
            this.groupBox1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dtgrvHienThiListALLDH)).BeginInit();
            this.SuspendLayout();
            // 
            // button1
            // 
            this.button1.Location = new System.Drawing.Point(1202, 8);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(93, 49);
            this.button1.TabIndex = 13;
            this.button1.Text = "Refesh";
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.button1_Click);
            // 
            // panel2
            // 
            this.panel2.Controls.Add(this.btnXuatExcel);
            this.panel2.Controls.Add(this.button1);
            this.panel2.Controls.Add(this.btnXemchitiet);
            this.panel2.Controls.Add(this.btnTimkiem);
            this.panel2.Controls.Add(this.txtTimKiem);
            this.panel2.Dock = System.Windows.Forms.DockStyle.Top;
            this.panel2.Location = new System.Drawing.Point(0, 0);
            this.panel2.Name = "panel2";
            this.panel2.Size = new System.Drawing.Size(1318, 63);
            this.panel2.TabIndex = 15;
            // 
            // txtTimKiem
            // 
            this.txtTimKiem.BackColor = System.Drawing.SystemColors.ButtonHighlight;
            this.txtTimKiem.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(163)));
            this.txtTimKiem.ForeColor = System.Drawing.Color.Gray;
            this.txtTimKiem.Location = new System.Drawing.Point(0, 14);
            this.txtTimKiem.Margin = new System.Windows.Forms.Padding(3, 15, 3, 3);
            this.txtTimKiem.Multiline = true;
            this.txtTimKiem.Name = "txtTimKiem";
            this.txtTimKiem.Size = new System.Drawing.Size(519, 38);
            this.txtTimKiem.TabIndex = 9;
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.dtgrvHienThiListALLDH);
            this.groupBox1.Location = new System.Drawing.Point(0, 69);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(1318, 735);
            this.groupBox1.TabIndex = 13;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Danh sách các hóa đơn tại cửa hàng";
            // 
            // dtgrvHienThiListALLDH
            // 
            this.dtgrvHienThiListALLDH.AllowUserToResizeColumns = false;
            this.dtgrvHienThiListALLDH.AllowUserToResizeRows = false;
            this.dtgrvHienThiListALLDH.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.dtgrvHienThiListALLDH.BackgroundColor = System.Drawing.SystemColors.ButtonFace;
            this.dtgrvHienThiListALLDH.BorderStyle = System.Windows.Forms.BorderStyle.None;
            this.dtgrvHienThiListALLDH.CellBorderStyle = System.Windows.Forms.DataGridViewCellBorderStyle.None;
            this.dtgrvHienThiListALLDH.ClipboardCopyMode = System.Windows.Forms.DataGridViewClipboardCopyMode.Disable;
            this.dtgrvHienThiListALLDH.ColumnHeadersBorderStyle = System.Windows.Forms.DataGridViewHeaderBorderStyle.None;
            dataGridViewCellStyle5.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            dataGridViewCellStyle5.BackColor = System.Drawing.Color.SlateBlue;
            dataGridViewCellStyle5.Font = new System.Drawing.Font("Microsoft Sans Serif", 8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(163)));
            dataGridViewCellStyle5.ForeColor = System.Drawing.SystemColors.HighlightText;
            dataGridViewCellStyle5.SelectionBackColor = System.Drawing.Color.SlateBlue;
            dataGridViewCellStyle5.SelectionForeColor = System.Drawing.SystemColors.HighlightText;
            dataGridViewCellStyle5.WrapMode = System.Windows.Forms.DataGridViewTriState.True;
            this.dtgrvHienThiListALLDH.ColumnHeadersDefaultCellStyle = dataGridViewCellStyle5;
            this.dtgrvHienThiListALLDH.ColumnHeadersHeight = 33;
            this.dtgrvHienThiListALLDH.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.DisableResizing;
            this.dtgrvHienThiListALLDH.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.MaDN,
            this.quequanNV,
            this.TenNV,
            this.sdtNV});
            dataGridViewCellStyle6.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            dataGridViewCellStyle6.BackColor = System.Drawing.SystemColors.ButtonHighlight;
            dataGridViewCellStyle6.Font = new System.Drawing.Font("Microsoft Sans Serif", 8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(163)));
            dataGridViewCellStyle6.ForeColor = System.Drawing.SystemColors.MenuText;
            dataGridViewCellStyle6.SelectionBackColor = System.Drawing.SystemColors.ButtonHighlight;
            dataGridViewCellStyle6.SelectionForeColor = System.Drawing.SystemColors.Desktop;
            dataGridViewCellStyle6.WrapMode = System.Windows.Forms.DataGridViewTriState.False;
            this.dtgrvHienThiListALLDH.DefaultCellStyle = dataGridViewCellStyle6;
            this.dtgrvHienThiListALLDH.Dock = System.Windows.Forms.DockStyle.Fill;
            this.dtgrvHienThiListALLDH.EnableHeadersVisualStyles = false;
            this.dtgrvHienThiListALLDH.GridColor = System.Drawing.SystemColors.MenuHighlight;
            this.dtgrvHienThiListALLDH.Location = new System.Drawing.Point(3, 22);
            this.dtgrvHienThiListALLDH.Name = "dtgrvHienThiListALLDH";
            this.dtgrvHienThiListALLDH.ReadOnly = true;
            dataGridViewCellStyle7.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft;
            dataGridViewCellStyle7.BackColor = System.Drawing.SystemColors.Control;
            dataGridViewCellStyle7.Font = new System.Drawing.Font("Microsoft Sans Serif", 8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(163)));
            dataGridViewCellStyle7.ForeColor = System.Drawing.SystemColors.WindowText;
            dataGridViewCellStyle7.SelectionBackColor = System.Drawing.SystemColors.HighlightText;
            dataGridViewCellStyle7.SelectionForeColor = System.Drawing.SystemColors.HighlightText;
            dataGridViewCellStyle7.WrapMode = System.Windows.Forms.DataGridViewTriState.True;
            this.dtgrvHienThiListALLDH.RowHeadersDefaultCellStyle = dataGridViewCellStyle7;
            this.dtgrvHienThiListALLDH.RowHeadersVisible = false;
            this.dtgrvHienThiListALLDH.RowHeadersWidth = 62;
            dataGridViewCellStyle8.ForeColor = System.Drawing.Color.Black;
            dataGridViewCellStyle8.SelectionBackColor = System.Drawing.Color.FromArgb(((int)(((byte)(192)))), ((int)(((byte)(192)))), ((int)(((byte)(255)))));
            dataGridViewCellStyle8.SelectionForeColor = System.Drawing.Color.Black;
            this.dtgrvHienThiListALLDH.RowsDefaultCellStyle = dataGridViewCellStyle8;
            this.dtgrvHienThiListALLDH.RowTemplate.Height = 28;
            this.dtgrvHienThiListALLDH.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dtgrvHienThiListALLDH.Size = new System.Drawing.Size(1312, 710);
            this.dtgrvHienThiListALLDH.TabIndex = 1;
            this.dtgrvHienThiListALLDH.CellClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dtgrvHienThiListALLDH_CellClick);
            // 
            // MaDN
            // 
            this.MaDN.DataPropertyName = "MaDN";
            this.MaDN.FillWeight = 58.27938F;
            this.MaDN.HeaderText = "Mã Đơn Nhập";
            this.MaDN.MinimumWidth = 8;
            this.MaDN.Name = "MaDN";
            this.MaDN.ReadOnly = true;
            // 
            // quequanNV
            // 
            this.quequanNV.DataPropertyName = "NgayNhap";
            this.quequanNV.FillWeight = 128.657F;
            this.quequanNV.HeaderText = "Ngày Nhập";
            this.quequanNV.MinimumWidth = 8;
            this.quequanNV.Name = "quequanNV";
            this.quequanNV.ReadOnly = true;
            // 
            // TenNV
            // 
            this.TenNV.DataPropertyName = "SoLuongNhap";
            this.TenNV.FillWeight = 143.8535F;
            this.TenNV.HeaderText = "Số sản phẩm nhập";
            this.TenNV.MinimumWidth = 8;
            this.TenNV.Name = "TenNV";
            this.TenNV.ReadOnly = true;
            // 
            // sdtNV
            // 
            this.sdtNV.DataPropertyName = "TongTienNhap";
            this.sdtNV.FillWeight = 95.76552F;
            this.sdtNV.HeaderText = "Tổng tiền nhập";
            this.sdtNV.MinimumWidth = 8;
            this.sdtNV.Name = "sdtNV";
            this.sdtNV.ReadOnly = true;
            // 
            // btnXuatExcel
            // 
            this.btnXuatExcel.BackColor = System.Drawing.Color.MediumSlateBlue;
            this.btnXuatExcel.BackgroundColor = System.Drawing.Color.MediumSlateBlue;
            this.btnXuatExcel.BorderColor = System.Drawing.Color.PaleVioletRed;
            this.btnXuatExcel.BorderRadius = 20;
            this.btnXuatExcel.BorderSize = 0;
            this.btnXuatExcel.FlatAppearance.BorderSize = 0;
            this.btnXuatExcel.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnXuatExcel.ForeColor = System.Drawing.Color.White;
            this.btnXuatExcel.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnXuatExcel.Location = new System.Drawing.Point(844, 11);
            this.btnXuatExcel.Name = "btnXuatExcel";
            this.btnXuatExcel.Padding = new System.Windows.Forms.Padding(10, 0, 0, 0);
            this.btnXuatExcel.Size = new System.Drawing.Size(338, 43);
            this.btnXuatExcel.TabIndex = 14;
            this.btnXuatExcel.Text = "Xuất ALL Ra Excel ";
            this.btnXuatExcel.TextColor = System.Drawing.Color.White;
            this.btnXuatExcel.UseVisualStyleBackColor = false;
            this.btnXuatExcel.Click += new System.EventHandler(this.btnXuatExcel_Click);
            // 
            // btnXemchitiet
            // 
            this.btnXemchitiet.BackColor = System.Drawing.Color.MediumSlateBlue;
            this.btnXemchitiet.BackgroundColor = System.Drawing.Color.MediumSlateBlue;
            this.btnXemchitiet.BorderColor = System.Drawing.Color.PaleVioletRed;
            this.btnXemchitiet.BorderRadius = 20;
            this.btnXemchitiet.BorderSize = 0;
            this.btnXemchitiet.FlatAppearance.BorderSize = 0;
            this.btnXemchitiet.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnXemchitiet.ForeColor = System.Drawing.Color.White;
            this.btnXemchitiet.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnXemchitiet.Location = new System.Drawing.Point(525, 10);
            this.btnXemchitiet.Name = "btnXemchitiet";
            this.btnXemchitiet.Padding = new System.Windows.Forms.Padding(10, 0, 0, 0);
            this.btnXemchitiet.Size = new System.Drawing.Size(296, 44);
            this.btnXemchitiet.TabIndex = 11;
            this.btnXemchitiet.Text = "Xem Chi Tiết Đơn Hàng";
            this.btnXemchitiet.TextColor = System.Drawing.Color.White;
            this.btnXemchitiet.UseVisualStyleBackColor = false;
            this.btnXemchitiet.Visible = false;
            this.btnXemchitiet.Click += new System.EventHandler(this.btnXemchitiet_Click);
            // 
            // btnTimkiem
            // 
            this.btnTimkiem.BackColor = System.Drawing.Color.White;
            this.btnTimkiem.BackgroundColor = System.Drawing.Color.White;
            this.btnTimkiem.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch;
            this.btnTimkiem.BorderColor = System.Drawing.SystemColors.ActiveCaptionText;
            this.btnTimkiem.BorderRadius = 0;
            this.btnTimkiem.BorderSize = 2;
            this.btnTimkiem.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnTimkiem.FlatAppearance.BorderSize = 0;
            this.btnTimkiem.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnTimkiem.ForeColor = System.Drawing.Color.Black;
            this.btnTimkiem.Location = new System.Drawing.Point(395, 17);
            this.btnTimkiem.Margin = new System.Windows.Forms.Padding(3, 15, 3, 3);
            this.btnTimkiem.Name = "btnTimkiem";
            this.btnTimkiem.Size = new System.Drawing.Size(108, 31);
            this.btnTimkiem.TabIndex = 10;
            this.btnTimkiem.Text = "Tìm kiếm";
            this.btnTimkiem.TextColor = System.Drawing.Color.Black;
            this.btnTimkiem.UseVisualStyleBackColor = false;
            this.btnTimkiem.Click += new System.EventHandler(this.btnTimkiem_Click);
            // 
            // FormHoaDonNhap
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(9F, 20F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1318, 735);
            this.Controls.Add(this.panel2);
            this.Controls.Add(this.groupBox1);
            this.Name = "FormHoaDonNhap";
            this.Text = "FormHoaDonNhap";
            this.Load += new System.EventHandler(this.FormHoaDonNhap_Load);
            this.panel2.ResumeLayout(false);
            this.panel2.PerformLayout();
            this.groupBox1.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.dtgrvHienThiListALLDH)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Button button1;
        private CustomButton.VBButton btnTimkiem;
        private System.Windows.Forms.Panel panel2;
        private CustomButton.VBButton btnXemchitiet;
        private System.Windows.Forms.TextBox txtTimKiem;
        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.DataGridView dtgrvHienThiListALLDH;
        private CustomButton.VBButton btnXuatExcel;
        private System.Windows.Forms.DataGridViewTextBoxColumn MaDN;
        private System.Windows.Forms.DataGridViewTextBoxColumn quequanNV;
        private System.Windows.Forms.DataGridViewTextBoxColumn TenNV;
        private System.Windows.Forms.DataGridViewTextBoxColumn sdtNV;
    }
}