<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterPage.master" AutoEventWireup="true" CodeFile="PageSanPham.aspx.cs" Inherits="Page_PageSanPham" %>
<%@ MasterType VirtualPath="~/MasterPage/MasterPage.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../CSS/StyleSheetPageHomeLogined.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


    <div id="gioHang">
            <ul>
                <li>
                    <asp:HyperLink ID="tabDangNhap" runat="server" NavigateUrl="~/Page/PageDangNhap.aspx"><i class="fa fa-sign-out" style="font-size:21px"></i> Đăng xuất</asp:HyperLink></li>
                <li>
                    <asp:HyperLink ID="tabDangKy" runat="server" NavigateUrl="~/Page/PageTaiKhoan.aspx"><i class="fa fa-user-circle-o" style="font-size:21px"></i> Tài khoản</asp:HyperLink></li>
                <li>
                    <asp:HyperLink ID="tabGioHang" runat="server" NavigateUrl="~/Page/PageGioHang.aspx"><i class="fa fa-shopping-cart" style="font-size:22px"></i> Giỏ hàng</asp:HyperLink></li>
                <li>
                    <div style="line-height:40px;font-size:14px">
                    <span>Tìm theo giá : Từ </span>
                    <asp:TextBox ID="txtLow" Width="92px" runat="server" ValidationGroup="TTG"></asp:TextBox>
                    <span>Đến </span>
                    <asp:TextBox ID="txtHeight" Width="92px" runat="server" ValidationGroup="TTG"></asp:TextBox>
                    <asp:Button ID="btTimTheoGia" runat="server" Text="Tìm" ValidationGroup="TTG" OnClick="btTimTheoGia_Click" />
                        </div>
                </li>
            </ul>

        </div>
    <div>
        <asp:DataList ID="DataListLoaiSP" runat="server" RepeatColumns="4" RepeatDirection="Horizontal" OnItemCommand="DataListLoaiSP_ItemCommand">
            <ItemTemplate>
                <table class="tdSP" cellspacing="0" cellpadding="5">
                    <tr>
                        <td  colspan="2">
                            <asp:Image ID="Image1"  runat="server" Width="150px" quality = "hight" ImageUrl='<%# Eval("DUONGDAN") %>' />
                        </td>

                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:Label ID="Label1" runat="server" Font-Bold="true" Text='<%# Eval("TENSACH") %>'></asp:Label>

                        </td>

                    </tr>
                    <tr>
                        <td colspan="2">
                            <span style="color:red;font-weight:bold">Giá : </span>
                            <asp:Label ID="Label2" runat="server" Font-Bold="true" Text='<%# Eval("GIA") %>'></asp:Label>
                        </td>

                    </tr>
                    <tr>
                        <td >
                            <asp:Button ID="Button1" runat="server" Text="Thêm sách" CommandArgument='<%# Eval("MASACH") %>' CommandName="chonmua" OnClick="Button1_Click"/>
                        </td>
                        <td>
                            <asp:Button ID="Button2" runat="server" Text="Chi tiết" PostBackUrl='<%# "~/Page/PageChiTietSanPham.aspx?masach="+Eval("MASACH") %>'  /></td>
                    </tr>
                </table>
            </ItemTemplate>
        </asp:DataList>
        </div>
</asp:Content>

