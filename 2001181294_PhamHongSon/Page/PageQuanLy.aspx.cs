using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Page_PageQuanLy : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    protected void btInsert_Click(object sender, EventArgs e)
    {
        SqlDataSource1.InsertParameters["TENSACH"].DefaultValue = ((TextBox)GridView1.FooterRow.FindControl("txtTenSach")).Text;
        string duongDan = "~/Image/" + ((FileUpload)GridView1.FooterRow.FindControl("FileUploadAnh")).FileName;
        ((FileUpload)GridView1.FooterRow.FindControl("FileUploadAnh")).SaveAs(Server.MapPath("~/Image/" + ((FileUpload)GridView1.FooterRow.FindControl("FileUploadAnh")).FileName));
        SqlDataSource1.InsertParameters["DuongDan"].DefaultValue = duongDan;
        SqlDataSource1.InsertParameters["GIA"].DefaultValue = ((TextBox)GridView1.FooterRow.FindControl("txtGia")).Text;
        SqlDataSource1.InsertParameters["MOTA"].DefaultValue = ((TextBox)GridView1.FooterRow.FindControl("txtMoTa")).Text;
        SqlDataSource1.InsertParameters["MATHELOAI"].DefaultValue = ((TextBox)GridView1.FooterRow.FindControl("txtMaTheLoai")).Text;

        SqlDataSource1.Insert();
    }
}