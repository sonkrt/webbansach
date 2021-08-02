<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterPage.master" AutoEventWireup="true" CodeFile="PageDangKy.aspx.cs" Inherits="Page_PageDangKy" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../CSS/StyleSheetPageDangKy.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
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
    <div id="divDangKy">
        <center>
    <table style="width: 520px; margin: 0px auto; margin-top: 5px; font-size: 16px; border: 1px solid #ccc; box-shadow: -10px 10px 10px #d7d7d7;">
            <tr>
                <td colspan="2">
                    <h1 style="text-align: center; margin-bottom: 0px">Đăng ký</h1>
                </td>
            </tr>
            <tr>
                <td colspan="2" style="text-align: center">
                    <asp:Image ID="imageSachDong2" runat="server" ImageUrl="~/Image/sachDong2.gif" Width="80px" quality="hight" />
                </td>
            </tr>
            <tr>
                <td class="tdDK">Tên đăng nhập</td>
                <td>
                    <asp:TextBox CssClass="tdrDK" ID="txtTenDNDangKy" runat="server" ValidationGroup="DKTKM"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtTenDNDangKy" ErrorMessage="Trống!" ValidationGroup="DKTKM" ForeColor="Red">Null !</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="tdDK">Mật khẩu</td>
                <td>
                    <asp:TextBox CssClass="tdrDK" ID="txtMatKhauDangKy" runat="server" TextMode="Password" ValidationGroup="DKTKM"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="tdDK">Nhập lại mật khẩu</td>
                <td>
                    <asp:TextBox CssClass="tdrDK" ID="txtNhapLaiMkDangKy" runat="server" TextMode="Password" ValidationGroup="DKTKM"></asp:TextBox>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtMatKhauDangKy" ControlToValidate="txtNhapLaiMkDangKy" ErrorMessage="Not match!" ValidationGroup="DKTKM" ForeColor="Red">Not match!</asp:CompareValidator>
                </td>
            </tr>
            <tr>
                <td class="tdDK">Họ và Tên</td>
                <td>
                    <asp:TextBox CssClass="tdrDK" ID="txtHoTenDangKy" runat="server" ValidationGroup="DKTKM"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtHoTenDangKy" ErrorMessage="Null !" ValidationGroup="DKTKM" ForeColor="Red">Null !</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="tdDK">Số điện thoại</td>
                <td>
                    <asp:TextBox CssClass="tdrDK" ID="txtSoDTDangKy" runat="server" ValidationGroup="DKTKM"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtSoDTDangKy" ErrorMessage="Null !" ValidationGroup="DKTKM" ForeColor="Red">Null !</asp:RequiredFieldValidator>
                </td>
            </tr>
                    <tr>
                <td class="tdDK">Địa chỉ</td>
                <td>
                    <asp:TextBox CssClass="tdrDK" ID="txtDiaChi" runat="server" ValidationGroup="DKTKM"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="tdDK">Email</td>
                <td>
                    <asp:TextBox CssClass="tdrDK" ID="txtEmailDangKy" runat="server" ValidationGroup="DKTKM"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmailDangKy" ErrorMessage="Invalid!" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="DKTKM" ForeColor="Red">Invalid!</asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <asp:Button CssClass="btDNDK" ID="tbDangKy" runat="server" Text="Đăng ký" ValidationGroup="DKTKM" OnClick="tbDangKy_Click" />
                </td>
            </tr>
            <tr>
                <td colspan="2" style="height: 25px;text-align:center"> <asp:Label ID="lbThongBaoDK" runat="server" Text=""></asp:Label></td>
            </tr>
        </table>
        </center>
    </div>
</asp:Content>

