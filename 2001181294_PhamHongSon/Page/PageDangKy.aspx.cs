using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class Page_PageDangKy : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void tbDangKy_Click(object sender, EventArgs e)
    {
        string tenDN = txtTenDNDangKy.Text;
        string matKhau = txtMatKhauDangKy.Text;
        string hoTen = txtHoTenDangKy.Text;
        string email = txtEmailDangKy.Text;
        string soDT = txtSoDTDangKy.Text;
        string diaChi = txtDiaChi.Text;
        String conStr = "Data source = localhost;Initial Catalog = QL_BAN_SACH;Integrated Security = true";
        using (SqlConnection con = new SqlConnection(conStr))
        {
            String cmdStr = "SELECT COUNT(*) FROM TAIKHOAN WHERE TENDN = '"+tenDN+"'";
            SqlCommand cmd = new SqlCommand(cmdStr, con);
            con.Open();
            int kt = (int)cmd.ExecuteScalar();
            if (kt == 1)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('Đã tồn tại tên đăng nhập này!')</script>");
            }
            else
            {
                cmdStr = "INSERT INTO TAIKHOAN VALUES('"+tenDN+"','"+matKhau+"',N'"+hoTen+"','"+email+"','"+soDT+"',N'"+diaChi+"',0)";
                SqlCommand cmd2 = new SqlCommand(cmdStr, con);
                int kq = cmd2.ExecuteNonQuery();
                if (kq == 1)
                {
                    txtTenDNDangKy.Text = "";
                    txtMatKhauDangKy.Text = "";
                    txtHoTenDangKy.Text = ""; 
                    txtEmailDangKy.Text = "";
                    txtSoDTDangKy.Text = "";
                    txtDiaChi.Text = "";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('Đăng ký thành công!')</script>");
                }
            }
            con.Close();
        }
    }
}
       
 