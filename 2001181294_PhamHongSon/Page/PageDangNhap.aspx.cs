using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class Page_PageDangNhap : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btDangNhap_Click(object sender, EventArgs e)
    {  
        string tenDN = txtUserDangNhap.Text;

        string matKhau = txtPassworDangNhap.Text;
        String conStr = "Data source = localhost;Initial Catalog = QL_BAN_SACH;Integrated Security = true";
        using (SqlConnection con = new SqlConnection(conStr))
        {
            String cmdStr = "SELECT COUNT(*) FROM TAIKHOAN WHERE TENDN = '"+tenDN+ "' AND MATKHAU = '"+matKhau+"' AND QUYEN = 0";
            SqlCommand cmd = new SqlCommand(cmdStr, con);
            con.Open();
            int kt = (int)cmd.ExecuteScalar();
            if (kt == 1)
            {
                Session["tenDN"] = tenDN;
                Response.Redirect("~/Page/PageHomeLogined.aspx");
            }
            else
            {
                cmdStr = "SELECT COUNT(*) FROM TAIKHOAN WHERE TENDN = '"+tenDN+"' AND MATKHAU = '"+matKhau+"' AND QUYEN = 1";
                cmd = new SqlCommand(cmdStr, con);
                int check = (int)cmd.ExecuteScalar();
                if (check == 1)
                {
                    Response.Redirect("~/Page/PageQuanLy.aspx");
                }
                else
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('Tên đăng nhập hoặc mật khẩu không chính xác!')</script>");
                }
            }
        }
    }
}