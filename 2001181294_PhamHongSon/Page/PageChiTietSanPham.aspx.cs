using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Collections;

public partial class Page_PageChiTietSanPham : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            String ma = Request.QueryString["masach"].ToString();
            String conStr = "Data source = localhost;Initial Catalog = QL_BAN_SACH;Integrated Security = true";
            using (SqlConnection con = new SqlConnection(conStr))
            {
                String cmdStr = "SELECT * FROM SACH WHERE MASACH =" + ma;
                SqlCommand cmd = new SqlCommand(cmdStr, con);
                con.Open();
                DataListCTSP.DataSource = cmd.ExecuteReader();
                DataListCTSP.DataBind();
                con.Close();
            }
        }
    }
    protected void DataListCTSP_ItemCommand(object source, DataListCommandEventArgs e)
    {
        
        if (e.CommandName == "chonmua")
        {
            ArrayList gioCu = (ArrayList)Session["GioHang"];
            Label gia = (Label)e.Item.FindControl("Label2");
            int dg = Convert.ToInt32(gia.Text);
            Session["SoTien"] = (int)Session["SoTien"] + dg;

            GioHang hangMoi = new GioHang();
            //hangMoi.Ms = int.Parse(DataListTatCaSP.DataKeys[e.Item.ItemIndex].ToString());
            hangMoi.Ms = int.Parse(e.CommandArgument.ToString());
            hangMoi.TenSach = ((Label)e.Item.FindControl("Label1")).Text;
            hangMoi.Gia = dg;
            hangMoi.SoLuong = 1;    
            int n = ktHangTonTai(hangMoi.Ms);
            if (n == -1)
            {
                gioCu.Add(hangMoi);
            }
            else
            {
                GioHang nhapHang = (GioHang)gioCu[n];
                nhapHang.SoLuong = nhapHang.SoLuong + 1;
                
            }
            Session["GioHang"] = gioCu;
            Response.Redirect(Request.RawUrl);
        }
    }
    public int ktHangTonTai(int ms)
    {
        ArrayList gioCu = (ArrayList)Session["GioHang"];
        for (int i = 0; i < gioCu.Count; i++)
        {
            GioHang gh = (GioHang)gioCu[i];
            if (gh.Ms == ms)
                return i;
        }
        return -1;
    }
   
}