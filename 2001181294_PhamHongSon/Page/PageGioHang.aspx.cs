using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Collections;
using System.Data.SqlClient;


public partial class Page_PageGioHang : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            hienThi();
        }
    }
    private void hienThi()
    {
        GridView1.DataSource = Session["GioHang"];
        GridView1.DataBind();


        int soLuong = 0;
        ArrayList gioCu =(ArrayList)Session["GioHang"];
        for (int i = 0; i < gioCu.Count; i++)
        {
            GioHang hang = (GioHang)gioCu[i];
            soLuong = soLuong + hang.SoLuong;
        }

        if (GridView1.Rows.Count > 0)
        {
            GridView1.FooterRow.Cells[3].Text = "Tổng tiền : ";
            GridView1.FooterRow.Cells[4].Text = tongTien().ToString();
        }
    }

    int tongTien()
    {
        int tien = 0;
        ArrayList gioHang = (ArrayList)Session["GioHang"];
        for (int i = 0; i < gioHang.Count; i++)
        {
            GioHang gio = (GioHang)gioHang[i];
            tien = tien + gio.ThanhTien;
        }
        return tien;
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        ArrayList gioCu = (ArrayList)Session["GioHang"];
        GioHang hang = (GioHang)gioCu[e.RowIndex];
        gioCu.Remove(hang);
        Session["GioHang"] = gioCu;
        Session["SoTien"] = tongTien();
        hienThi();
        Response.Redirect(Request.RawUrl);
    }
    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;
        hienThi();
    }
    protected void GridView1_CancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;
        hienThi();
    }
    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        ArrayList gioCu = (ArrayList)Session["GioHang"];
        GioHang hang = (GioHang)gioCu[e.RowIndex];
        TextBox txtSL = (TextBox)GridView1.Rows[e.RowIndex].Cells[3].Controls[0];
        hang.SoLuong = int.Parse(txtSL.Text);
        Session["GioHang"] = gioCu;

        Session["SoTien"] = tongTien();
        GridView1.EditIndex = -1;
        hienThi();
    }
    protected void btDatHang_Click(object sender, EventArgs e)
    {
        String conStr = "Data source = localhost;Initial Catalog = QL_BAN_SACH;Integrated Security = true";
        SqlConnection con = new SqlConnection(conStr);
        string tenDN = Session["tenDN"].ToString();
        con.Open();
        string cmdStr = "INSERT INTO HOADON(NGAYBAN,TENDN,THANHTIEN) VALUES(GETDATE()," + "'" + tenDN + "'," + tongTien().ToString() + ")";
        SqlCommand cmd = new SqlCommand(cmdStr, con);
        cmd.ExecuteNonQuery();
        ArrayList gioCu = (ArrayList)Session["GioHang"];
        for (int i = 0; i < gioCu.Count; i++)
        {
            GioHang gh = (GioHang)gioCu[i];
            cmdStr = "INSERT INTO CTHD VALUES(1,'" + gh.Ms + "'" + "," + gh.SoLuong + ")";
            cmd = new SqlCommand(cmdStr, con);
            cmd.ExecuteNonQuery(); 
        }
        Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('Đặt hàng thành công!')</script>");
    }
    protected void btTiepTuc_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Page/PageHomeLogined.aspx");
    }
}