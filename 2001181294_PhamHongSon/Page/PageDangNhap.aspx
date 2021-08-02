<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterPage.master" AutoEventWireup="true" CodeFile="PageDangNhap.aspx.cs" Inherits="Page_PageDangNhap" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../CSS/StyleSheetPageDangNhap.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="gioHang">
            <ul>
                <li>
                    <asp:HyperLink ID="tabDangNhap" runat="server" NavigateUrl="~/Page/PageDangNhap.aspx"><i class="fa fa-user-circle-o" style="font-size:21px"></i> Đăng nhập</asp:HyperLink></li>
                <li>
                    <asp:HyperLink ID="tabDangKy" runat="server" NavigateUrl="~/Page/PageDangKy.aspx"><i class="fa fa-user-plus" style="font-size:21px"></i> Đăng ký</asp:HyperLink></li>
                <li>
                    <asp:HyperLink ID="tabGioHang" runat="server"><i class="fa fa-shopping-cart" style="font-size:22px"></i> Giỏ hàng</asp:HyperLink></li>

            </ul>

        </div>
    <center>
    <table allign="center" style="text-align:center;margin:5px auto;border: 1px solid #ccc; box-shadow: -10px 10px 10px #d7d7d7;padding:30px;">
        <tr>
            <td colspan="2"><h1>Đăng nhập</h1></td>
        </tr>
        <tr>
            <td colspan="2">
            <asp:Image ID="imageSachDong2" runat="server" ImageUrl="~/Image/sachDong2.gif" Width="80px" quality="hight" /></td>
        </tr>
        <tr>
            <td>
                 <i class="fa fa-user-circle-o" id="user" style="font-size: 22px"></i>
            </td>
            <td>
                 <asp:TextBox CssClass="txtDK" ID="txtUserDangNhap" runat="server" TextMode="SingleLine" placeholder="Tên đăng nhập" ValidationGroup="DNTK"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                 <i class="fa fa-lock" id="password" style="font-size: 24px"></i>
            </td>
            <td>
                <asp:TextBox CssClass="txtPassword" ID="txtPassworDangNhap" runat="server" TextMode="Password" placeholder="Mật khẩu"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td></td>
            <td >
                <asp:Button CssClass="btDN" ID="btDangNhap" runat="server" Text="Đăng nhập" ValidationGroup="DNTK"  OnClick="btDangNhap_Click"/>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Label ID="lbThongBaoDangNhap" runat="server" Text=""></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:HyperLink ID="idQuenMatKhau" runat="server">Quên mật khẩu?</asp:HyperLink>
                <asp:HyperLink ID="idDangKy" runat="server" NavigateUrl="~/Page/PageDangKy.aspx">Đăng ký</asp:HyperLink>
            </td>
        </tr>
        
    </table>
        </center>
</asp:Content>

