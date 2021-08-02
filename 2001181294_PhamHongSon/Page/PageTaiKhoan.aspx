<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterPage.master" AutoEventWireup="true" CodeFile="PageTaiKhoan.aspx.cs" Inherits="Page_PageTaiKhoan" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        * {
            font-size:16px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <center>
        <h4>Thông tin tài khoản</h4>
    <asp:FormView ID="FormView1" runat="server" CellPadding="4" ForeColor="#333333">
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <ItemTemplate>
            <table class="auto-style1">
                <tr>
                    <td>Tên đăng nhập</td>
                    <td>
                        <asp:Label ID="Label1" runat="server" Width="200px" Text='<%# Eval("TENDN") %>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>Mật khẩu</td>
                    <td>
                        <asp:TextBox ID="TextBox1" runat="server" Width="250px" TextMode="Password" Text='<%# Eval("MATKHAU") %>'></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Họ tên</td>
                    <td>
                        <asp:TextBox ID="TextBox2" runat="server" Width="250px" Text='<%# Eval("HOTEN") %>'></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Email</td>
                    <td>
                        <asp:TextBox ID="TextBox3" runat="server" Width="250px" Text='<%# Eval("EMAIL") %>'></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Số điện thoại</td>
                    <td>
                        <asp:TextBox ID="TextBox4" runat="server" Width="250px" Text='<%# Eval("SODT") %>'></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Địa chỉ</td>
                    <td>
                        <asp:TextBox ID="TextBox5" runat="server" Width="250px" Text='<%# Eval("DIACHI") %>'></asp:TextBox>
                    </td>
                </tr>
            </table>
        </ItemTemplate>
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />

    </asp:FormView>
<asp:Button ID="btChinhSuaTT" runat="server" Text="Chỉnh sửa thông tin" OnClick="btChinhSuaTT_Click"></asp:Button>
        </center>
</asp:Content>

