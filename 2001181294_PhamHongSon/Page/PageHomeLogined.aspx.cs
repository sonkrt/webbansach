using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Collections;
public partial class Page_PageHomeLogined : System.Web.UI.Page
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
                DataListTatCaSP.DataSource = cmd.ExecuteReader();
                DataListTatCaSP.DataBind();
                con.Close();
            }
    }
    protected void btTimTheoGia_Click(object sender, EventArgs e)
    {
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
                        String cmdStr = "SELECT * FROM SACH WHERE GIA BETWEEN @LOW AND @HEIGHT";
                        SqlCommand cmd = new SqlCommand(cmdStr, con);
                        SqlParameter par1 = new SqlParameter("@LOW", txtLow.Text);
                        SqlParameter par2 = new SqlParameter("@HEIGHT", txtHeight.Text);
                        cmd.Parameters.Add(par1);
                        cmd.Parameters.Add(par2);
                        con.Open();
                        DataListTatCaSP.DataSource = cmd.ExecuteReader();
                        DataListTatCaSP.DataBind();
                        con.Close();
                    }
                }
            }
            catch
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('Nhập sai kiểu dữ liệu hoặc sai khoảng giá trị!')</script>");
                txtHeight.Text = "";
                txtLow.Text = "";
            }
        }
    }
    //protected void Button1_Click(object sender, EventArgs e)
    //{
    //    string tenDN = Session["tenDN"].ToString();
    //    string maSach = Eval("MASACH").ToString();
    //    string tenSach = Eval("TENSACH").ToString();
    //    string gia = Eval("GIA").ToString();
    //    string duongDan = Eval("DUONGDAN").ToString();
    //    //INSERT INTO GIOHANG(TENDN,MASACH,TENSACH,GIA,SL,DUONGDAN) VALUES('',,N'',,,'');
    //    String conStr = "Data source = localhost;Initial Catalog = QL_BAN_SACH;Integrated Security = true";
    //    using (SqlConnection con = new SqlConnection(conStr))
    //    {
    //        String cmdStr = "INSERT INTO GIOHANG(TENDN,MASACH,TENSACH,GIA,SL,DUONGDAN) VALUES('@TEN',@MA,N'@TENS',@GIA,1,'@DUONGDAN')";
    //        SqlCommand cmd = new SqlCommand(cmdStr, con);
    //        SqlParameter par1 = new SqlParameter("@TEN", tenDN);
    //        SqlParameter par2 = new SqlParameter("@MA", maSach);
    //        SqlParameter par3 = new SqlParameter("@TENS", tenSach);
    //        SqlParameter par4 = new SqlParameter("@GIA", gia);
    //        SqlParameter par5 = new SqlParameter("@DUONGDAN", duongDan);
    //        cmd.Parameters.Add(par1);
    //        cmd.Parameters.Add(par2);
    //        cmd.Parameters.Add(par3);
    //        cmd.Parameters.Add(par4);
    //        cmd.Parameters.Add(par5);
    //        con.Open();
    //        int n = cmd.ExecuteNonQuery();
    //        con.Close();
    //    }
    //}
    protected void DataListTatCaSP_ItemCommand(object source, DataListCommandEventArgs e)
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

