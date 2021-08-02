<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PageDonHang.aspx.cs" Inherits="Page_PageDonHang" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <h3 style="text-align:center;color:red">Các đơn hàng đã đặt.</h3>
        <center>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="MAHD" DataSourceID="SqlDataSourceCTHD" CellPadding="3" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px">
            <Columns>
                <asp:BoundField DataField="MAHD" HeaderText="Mã hóa đơn" ReadOnly="True" SortExpression="MAHD" InsertVisible="False" />
                <asp:BoundField DataField="NGAYBAN" HeaderText="Ngày đặt" SortExpression="NGAYBAN" />
                <asp:BoundField DataField="TENDN" HeaderText="Tài khoản" SortExpression="TENDN" />
                <asp:BoundField DataField="THANHTIEN" HeaderText="Tổng Tiền" SortExpression="THANHTIEN" />
            </Columns>
            <FooterStyle BackColor="White" ForeColor="#000066" />
            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
            <RowStyle ForeColor="#000066" />
            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#007DBB" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#00547E" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourceDH" runat="server" ConnectionString="<%$ ConnectionStrings:QL_BAN_SACHConnectionString4 %>" SelectCommand="SELECT * FROM [CTHD]"></asp:SqlDataSource>
            <h3 style="text-align:center;color:red">Chi tiết đơn đặt hàng.</h3>
            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3">
                <Columns>
                    <asp:BoundField DataField="TENSACH" HeaderText="Tên sách" />
                    <asp:BoundField DataField="SL" HeaderText="Số lượng" />
                    <asp:BoundField DataField="HOTEN" HeaderText="Họ Tên KH" />
                    <asp:BoundField DataField="DIACHI" HeaderText="Địa chỉ" />
                    <asp:BoundField DataField="SODT" HeaderText="Số điện thoại" />
                </Columns>
                <FooterStyle BackColor="White" ForeColor="#000066" />
                <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                <RowStyle ForeColor="#000066" />
                <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#007DBB" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#00547E" />
            </asp:GridView>

        <br />
<asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Page/PageQuanLy.aspx">Quay lại trang quản lý</asp:HyperLink>
            </center>
        <asp:SqlDataSource ID="SqlDataSourceCTHD" runat="server" ConnectionString="<%$ ConnectionStrings:QL_BAN_SACHConnectionString5 %>" SelectCommand="SELECT * FROM [HOADON]"></asp:SqlDataSource>
    </div>
    </form>
</body>
</html>
