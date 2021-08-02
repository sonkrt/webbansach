using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class Page_PageHome : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            String conStr = "Data source = localhost;Initial Catalog = QL_BAN_SACH;Integrated Security = true";
            using (SqlConnection con = new SqlConnection(conStr))
            {
                String cmdStr = "SELECT * FROM SACH";
                SqlCommand cmd = new SqlCommand(cmdStr, con);
                con.Open();
                DataListTatCaSP.DataSource = cmd.ExecuteReader();
                DataListTatCaSP.DataBind();
                con.Close();
            }
        }
    }
}