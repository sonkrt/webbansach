using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
public partial class Page_PageTaiKhoan : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string tenDN = Session["tenDN"].ToString();
            String conStr = "Data source = localhost;Initial Catalog = QL_BAN_SACH;Integrated Security = true";
            using (SqlConnection con = new SqlConnection(conStr))
            {
                String cmdStr = "SELECT * FROM TAIKHOAN WHERE TENDN='"+tenDN+"'";
                SqlCommand cmd = new SqlCommand(cmdStr, con);
                con.Open();
                FormView1.DataSource = cmd.ExecuteReader();
                FormView1.DataBind();
                con.Close();
            }
        }
    }
    protected void btChinhSuaTT_Click(object sender, EventArgs e)
    {
        //UPDATE TAIKHOAN SET MATKHAU = '',HOTEN = N'',EMAIL ='',SODT='',DIACHI=N'' WHERE TENDN=''
        string maKhau = ((TextBox)FormView1.FindControl("TextBox1")).Text;
        string hoTen = ((TextBox)FormView1.FindControl("TextBox2")).Text;
        string email = ((TextBox)FormView1.FindControl("TextBox3")).Text;
        string soDT = ((TextBox)FormView1.FindControl("TextBox4")).Text;
        string diaChi = ((TextBox)FormView1.FindControl("TextBox5")).Text;
        String conStr = "Data source = localhost;Initial Catalog = QL_BAN_SACH;Integrated Security = true";
        SqlConnection con = new SqlConnection(conStr);
        string tenDN = Session["tenDN"].ToString();
        con.Open();
        string cmdStr = "UPDATE TAIKHOAN SET MATKHAU = '"+maKhau+"',HOTEN = N'"+hoTen+"',EMAIL ='"+email+"',SODT='"+soDT+"',DIACHI=N'"+soDT+"' WHERE TENDN='"+tenDN+"'";
        SqlCommand cmd = new SqlCommand(cmdStr, con);
        int n = cmd.ExecuteNonQuery();
        if (n == 1)
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('Chỉnh sửa thông tin thành công!')</script>");
        }
    }
}