<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PageQuanLy.aspx.cs" Inherits="Page_PageQuanLy" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Page/PageDonHang.aspx">Xem đơn đặt hàng</asp:HyperLink>
        <h3 style="text-align:center;color:red">Quản lý sách</h3>
        <center>
    <asp:GridView ID="GridView1" Width="1000px" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="MASACH" DataSourceID="SqlDataSource1" ShowFooter="True" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4">
        <Columns>
            <asp:CommandField ShowSelectButton="True" ShowEditButton="true" ShowDeleteButton="true"/>
            <asp:TemplateField HeaderText="Mã sách" InsertVisible="False" SortExpression="MASACH">
                <EditItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("MASACH") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("MASACH") %>'></asp:Label>
                </ItemTemplate>
                <FooterTemplate>
                        <asp:LinkButton ID="btInsert" runat="server" OnClick="btInsert_Click">Insert</asp:LinkButton>
                    </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Tên sách" SortExpression="TENSACH">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("TENSACH") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("TENSACH") %>'></asp:Label>
                </ItemTemplate>
                <FooterTemplate>
                        <asp:TextBox ID="txtTenSach" runat="server"></asp:TextBox>
                    </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Mã thể loại" SortExpression="MATHELOAI">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("MATHELOAI") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("MATHELOAI") %>'></asp:Label>
                </ItemTemplate>
                <FooterTemplate>
                        <asp:TextBox ID="txtMaTheLoai" runat="server"></asp:TextBox>
                    </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Giá" SortExpression="GIA">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("GIA") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("GIA") %>'></asp:Label>
                </ItemTemplate>
                <FooterTemplate>
                        <asp:TextBox ID="txtGia" runat="server"></asp:TextBox>
                    </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Mô tả" SortExpression="MOTA">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("MOTA") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server"  Text='<%# Bind("MOTA") %>'></asp:Label>
                </ItemTemplate>
                <FooterTemplate>
                        <asp:TextBox ID="txtMoTa" runat="server"></asp:TextBox>
                    </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Ảnh" SortExpression="MASACH">
                <EditItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("MASACH") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Image ID="Image1" Width="150px" runat="server" ImageUrl='<%# Eval("DUONGDAN") %>' />
                </ItemTemplate>
                <FooterTemplate>
                    <asp:FileUpload ID="FileUploadAnh" runat="server" />
                    </FooterTemplate>
            </asp:TemplateField>
        </Columns>
        <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
        <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
        <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
        <RowStyle BackColor="White" ForeColor="#003399" />
        <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
        <SortedAscendingCellStyle BackColor="#EDF6F6" />
        <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
        <SortedDescendingCellStyle BackColor="#D6DFDF" />
        <SortedDescendingHeaderStyle BackColor="#002876" />
</asp:GridView>
            </center>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:QL_BAN_SACHConnectionString3 %>" SelectCommand="SELECT * FROM [SACH]"
    UpdateCommand="UPDATE SACH SET TENSACH=@TENSACH,MATHELOAI=@MATHELOAI,GIA=@GIA,MOTA=@MOTA,DUONGDAN=@DUONGDAN WHERE MASACH=@MASACH"
   InsertCommand= "INSERT INTO SACH(TENSACH,MATHELOAI,GIA,MOTA,DUONGDAN) VALUES(@TENSACH,@MATHELOAI,@GIA,@MOTA,@DUONGDAN)"
    DeleteCommand="DELETE FROM SACH WHERE MASACH = @MASACH">
    <DeleteParameters>
                <asp:Parameter Name="MASACH" Type="Int32"/>
            </DeleteParameters>

     <InsertParameters>
                <asp:Parameter Name="TENSACH" Type="String"/>
                <asp:Parameter Name="DUONGDAN" Type="String"/> 
                <asp:Parameter Name="GIA" Type="Double"/> 
                <asp:Parameter Name="MOTA" Type="String"/> 
                <asp:Parameter Name="MATHELOAI" Type="Int32"/> 
            </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="TENSACH" Type="String"/>
                <asp:Parameter Name="DUONGDAN" Type="String"/> 
                <asp:Parameter Name="GIA" Type="Double"/> 
                <asp:Parameter Name="MOTA" Type="String"/> 
                <asp:Parameter Name="MATHELOAI" Type="Int32"/> 
        <asp:Parameter Name="MASACH" Type="Int32"/>
    </UpdateParameters>
</asp:SqlDataSource>
            
    </div>
    </form>
</body>
</html>
