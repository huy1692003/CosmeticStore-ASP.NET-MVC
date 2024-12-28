using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Winform
{
    public partial class FormMenu : Form
    {
        public FormMenu()
        {
            InitializeComponent();
        }

        private void btnTrangchu_Click(object sender, EventArgs e)
        {

            ActiveColor(btnTaiKhoan);
            FormTaiKhoan a = new FormTaiKhoan();
            LoadForm(a);

        }
        private Form formNow;
        private void LoadForm(Form formnew)
        {
            if (formNow != null)
            {
                formNow.Close();
            }
            formNow = formnew;
            formnew.TopLevel = false;
            formnew.FormBorderStyle = FormBorderStyle.None;
            formnew.Dock = DockStyle.Fill;
            panelBody.Controls.Add(formnew);
            panelBody.Tag = formnew;
            formnew.BringToFront();
            formnew.Show();
        }
        private void FormMenu_Load(object sender, EventArgs e)
        {

            lblUserName.Text = FormLogin.GetDataUser.tentaikhoan;
            //Gettime


            ActiveColor(btnTaiKhoan);
            FormTaiKhoan a = new FormTaiKhoan();
            LoadForm(a);


        }



        private void btnLogout_Click(object sender, EventArgs e)
        {

            DialogResult result = MessageBox.Show("Bạn có chắc chắn muốn đăng xuất tài khoản không  ?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Warning);
            if (result == DialogResult.Yes)
            {
                this.Hide();
                FormLogin a = new FormLogin();
                a.ShowDialog();
            }
        }

        private void FormMenu_FormClosed(object sender, FormClosedEventArgs e)
        {
            Application.Exit();

            Application.Exit();
        }
        private Button ButtonNow;


        private void ActiveColor(Button ButtonNew)
        {
            if (ButtonNow != null)
            {
                ButtonNow.ForeColor = Color.White;
                ButtonNow = ButtonNew;
                ButtonNew.ForeColor = Color.Green;

            }
        }

        private void btnLogout_Click_1(object sender, EventArgs e)
        {
            DialogResult result = MessageBox.Show("Bạn có chắc chắn muốn đăng xuất tài khoản không  ?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Warning);
            if (result == DialogResult.Yes)
            {
                this.Hide();
                FormLogin a = new FormLogin();
                a.ShowDialog();
            }
        }

        private void FormMenu_FormClosed_1(object sender, FormClosedEventArgs e)
        {

            Application.Exit();
        }

        private void btnHoaDonNhap_Click(object sender, EventArgs e)
        {

            ActiveColor(btnHoaDonNhap);
            FormHoaDonNhap a = new FormHoaDonNhap();
            LoadForm(a);

        }
    }
}
