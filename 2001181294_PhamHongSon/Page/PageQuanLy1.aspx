<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterPage.master" AutoEventWireup="true" CodeFile="PageQuanLy1.aspx.cs" Inherits="Page_PageQuanLy" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="MASACH" DataSourceID="SqlDataSource1" ShowFooter="True">
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
                    <asp:Label ID="Label5" runat="server"  Text='<%# Eval("MOTA").ToString().Substring(0,20) %>'></asp:Label>
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
                    <asp:Image ID="Image1" Width="50px" runat="server" ImageUrl='<%# Eval("DUONGDAN") %>' />
                </ItemTemplate>
                <FooterTemplate>
                    <asp:FileUpload ID="FileUploadAnh" runat="server" />
                    </FooterTemplate>
            </asp:TemplateField>
        </Columns>
</asp:GridView>
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
</asp:Content>

