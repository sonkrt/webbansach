using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class Page_PageDonHang : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            String conStr = "Data source = localhost;Initial Catalog = QL_BAN_SACH;Integrated Security = true";
            using (SqlConnection con = new SqlConnection(conStr))
            {
                String cmdStr = "SELECT TENSACH,SL,HOTEN,DIACHI,SODT FROM HOADON HD ,CTHD CT ,SACH S,TAIKHOAN TK WHERE HD.MAHD = CT.MAHD AND CT.MASACH = S.MASACH AND HD.TENDN = TK.TENDN";
                SqlCommand cmd = new SqlCommand(cmdStr, con);
                con.Open();
                GridView2.DataSource = cmd.ExecuteReader();
                GridView2.DataBind();
                con.Close();
            }
        }
    }
}