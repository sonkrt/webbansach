<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterPage.master" AutoEventWireup="true" CodeFile="PageChiTietSanPham.aspx.cs" Inherits="Page_PageChiTietSanPham" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../CSS/StyleSheetPageHomeLogined.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div id="gioHang">
            <ul>
                <li>
                    <asp:HyperLink ID="tabDangNhap" runat="server" NavigateUrl="~/Page/PageDangNhap.aspx"><i class="fa fa-sign-out" style="font-size:21px"></i> Đăng xuất</asp:HyperLink></li>
                <li>
                    <asp:HyperLink ID="tabDangKy" runat="server" NavigateUrl="~/Page/PageTaiKhoan.aspx" ><i class="fa fa-user-circle-o" style="font-size:21px"></i> Tài khoản</asp:HyperLink></li>
                <li>
                    <asp:HyperLink ID="tabGioHang" runat="server" NavigateUrl="~/Page/PageGioHang.aspx"><i class="fa fa-shopping-cart" style="font-size:22px"></i> Giỏ hàng</asp:HyperLink></li>

            </ul>

        </div>
    <div>





    <asp:DataList ID="DataListCTSP" runat="server" OnItemCommand="DataListCTSP_ItemCommand">
        <ItemTemplate>
            <table style="width:100%;text-align:center;font-size:14px">
               <tr>
                   <td>
                       <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("DUONGDAN") %>' />
                   </td>
                   <td rowspan="4" style="text-align:justify;padding-right:20px;padding-top:0px">
                       <p style="color:red;font-weight:bold">Mô tả sản phẩm :</p>
                       <asp:Label ID="Label3" runat="server" Text='<%# Eval("MOTA") %>'></asp:Label>
                   </td>
               </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label1" runat="server" Font-Bold="true" Text='<%# Eval("TENSACH") %>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <span style="color:red;font-weight:bold">Giá : </span>
                        <asp:Label ID="Label2" runat="server" Font-Bold="true" Text='<%# Eval("GIA")%>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Button ID="Button1" runat="server" Text="Thêm  vào giỏ hàng" CommandArgument='<%# Eval("MASACH") %>' CommandName="chonmua" />
                    </td>
                </tr>
                <tr>
                    <td></td>
                </tr>
            </table>
        </ItemTemplate>
    </asp:DataList>
        </div>
    </asp:Content>

