using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class MasterPage_MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        String conStr = "Data source = localhost;Initial Catalog = QL_BAN_SACH;Integrated Security = true";
        using (SqlConnection con = new SqlConnection(conStr))
        {
            String cmdStr = "SELECT * FROM THELOAI";
            SqlCommand cmd = new SqlCommand(cmdStr, con);
            con.Open();
            DataListTheLoaiSach.DataSource = cmd.ExecuteReader();
            DataListTheLoaiSach.DataBind();
            con.Close();
        }
    }
    public ImageButton buttonSearch
    {
        get
        {
            return this.btSearchSach;
        }
    }

    public TextBox textBoxSearch
    {
        get
        {
            return this.txtSearch;
        }
    }
}
