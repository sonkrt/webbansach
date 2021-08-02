using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Collections;

public partial class Page_PageSanPham : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            String ma = Request.QueryString["maloai"].ToString();
            String conStr = "Data source = localhost;Initial Catalog = QL_BAN_SACH;Integrated Security = true";
            using (SqlConnection con = new SqlConnection(conStr))
            {
                String cmdStr = "SELECT * FROM SACH WHERE MATHELOAI =" + ma;
                SqlCommand cmd = new SqlCommand(cmdStr, con);
                con.Open();
                DataListLoaiSP.DataSource = cmd.ExecuteReader();
                DataListLoaiSP.DataBind();
                con.Close();
            }
        }
    }
    protected void Page_Init(object sender, EventArgs e)
    {
        Master.buttonSearch.Click += buttonSearch_Click;
    }
    void buttonSearch_Click(object sender, ImageClickEventArgs e)
    {
        String conStr = "Data source = localhost;Initial Catalog = QL_BAN_SACH;Integrated Security = true";
        using (SqlConnection con = new SqlConnection(conStr))
        {
            String cmdStr = "SELECT * FROM SACH WHERE TENSACH LIKE '%' + @content + '%'";
            SqlCommand cmd = new SqlCommand(cmdStr, con);
            SqlParameter par = new SqlParameter("@content", Master.textBoxSearch.Text);
            cmd.Parameters.Add(par);
            con.Open();
            DataListLoaiSP.DataSource = cmd.ExecuteReader();
            DataListLoaiSP.DataBind();
            con.Close();
        }
    }

    protected void btTimTheoGia_Click(object sender, EventArgs e)
    {
        String ma = Request.QueryString["maloai"].ToString();
        if (txtLow.Text != "" && txtHeight.Text != "")
        {
            try
            {
                float l = float.Parse(txtLow.Text);
                float h = float.Parse(txtHeight.Text);

                if (l <= h)
                {
                    String conStr = "Data source = localhost;Initial Catalog = QL_BAN_SACH;Integrated Security = true";
                    using (SqlConnection con = new SqlConnection(conStr))
                    {
                        String cmdStr = "SELECT * FROM SACH WHERE MATHELOAI ="+ma+"AND GIA BETWEEN @LOW AND @HEIGHT";
                        SqlCommand cmd = new SqlCommand(cmdStr, con);
                        SqlParameter par1 = new SqlParameter("@LOW", txtLow.Text);
                        SqlParameter par2 = new SqlParameter("@HEIGHT", txtHeight.Text);
                        cmd.Parameters.Add(par1);
                        cmd.Parameters.Add(par2);
                        con.Open();
                        DataListLoaiSP.DataSource = cmd.ExecuteReader();
                        DataListLoaiSP.DataBind();
                        con.Close();
                    }
                }
            }
            catch
            {
            }
        }
    }
    protected void DataListLoaiSP_ItemCommand(object source, DataListCommandEventArgs e)
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
    protected void Button1_Click(object sender, EventArgs e)
    {
        Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('Đã thêm vào giỏ hàng!')</script>");
    }
}