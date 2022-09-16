<%@ Page Title="" Language="C#" MasterPageFile="~/zhe_xue/HeaderAndFooter.Master"  AutoEventWireup="true" CodeBehind="wish.aspx.cs" Inherits="HuaheeArtist_v3.wish" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="WishId" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2" ForeColor="Black" GridLines="None">
        <AlternatingRowStyle BackColor="PaleGoldenrod" />
        <Columns>
            <asp:CommandField ShowDeleteButton="True" />
            <asp:ImageField DataImageUrlField="CoverPhoto" HeaderText="CoverPhoto">
            </asp:ImageField>
            <asp:BoundField DataField="Pname" HeaderText="Pname" SortExpression="Pname" />
            <asp:BoundField DataField="Category" HeaderText="Category" SortExpression="Category" />
            <asp:BoundField DataField="Size" HeaderText="Size" SortExpression="Size" />
            <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
            <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
            <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" />
        </Columns>
        <EmptyDataTemplate>
            <asp:Image ID="Image1" runat="server" Height="79px" ImageUrl='<%# Eval("CoverPhoto") %>' Width="107px" />
        </EmptyDataTemplate>
        <FooterStyle BackColor="Tan" />
        <HeaderStyle BackColor="Tan" Font-Bold="True" />
        <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
        <SortedAscendingCellStyle BackColor="#FAFAE7" />
        <SortedAscendingHeaderStyle BackColor="#DAC09E" />
        <SortedDescendingCellStyle BackColor="#E1DB9C" />
        <SortedDescendingHeaderStyle BackColor="#C2A47B" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:conString %>" SelectCommand="SELECT * FROM [wish]" DeleteCommand="DELETE FROM [wish] WHERE [WishId] = @WishId" InsertCommand="INSERT INTO [wish] ([Wuser], [Pname], [Size], [Price], [Description], [Category], [Date], [CoverPhoto], [Image1], [Image2], [Image3], [image4], [Quantity]) VALUES (@Wuser, @Pname, @Size, @Price, @Description, @Category, @Date, @CoverPhoto, @Image1, @Image2, @Image3, @image4, @Quantity)" UpdateCommand="UPDATE [wish] SET [Wuser] = @Wuser, [Pname] = @Pname, [Size] = @Size, [Price] = @Price, [Description] = @Description, [Category] = @Category, [Date] = @Date, [CoverPhoto] = @CoverPhoto, [Image1] = @Image1, [Image2] = @Image2, [Image3] = @Image3, [image4] = @image4, [Quantity] = @Quantity WHERE [WishId] = @WishId">
        <DeleteParameters>
            <asp:Parameter Name="WishId" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Wuser" Type="String" />
            <asp:Parameter Name="Pname" Type="String" />
            <asp:Parameter Name="Size" Type="String" />
            <asp:Parameter Name="Price" Type="String" />
            <asp:Parameter Name="Description" Type="String" />
            <asp:Parameter Name="Category" Type="String" />
            <asp:Parameter Name="Date" Type="String" />
            <asp:Parameter Name="CoverPhoto" Type="String" />
            <asp:Parameter Name="Image1" Type="String" />
            <asp:Parameter Name="Image2" Type="String" />
            <asp:Parameter Name="Image3" Type="String" />
            <asp:Parameter Name="image4" Type="String" />
            <asp:Parameter Name="Quantity" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Wuser" Type="String" />
            <asp:Parameter Name="Pname" Type="String" />
            <asp:Parameter Name="Size" Type="String" />
            <asp:Parameter Name="Price" Type="String" />
            <asp:Parameter Name="Description" Type="String" />
            <asp:Parameter Name="Category" Type="String" />
            <asp:Parameter Name="Date" Type="String" />
            <asp:Parameter Name="CoverPhoto" Type="String" />
            <asp:Parameter Name="Image1" Type="String" />
            <asp:Parameter Name="Image2" Type="String" />
            <asp:Parameter Name="Image3" Type="String" />
            <asp:Parameter Name="image4" Type="String" />
            <asp:Parameter Name="Quantity" Type="Int32" />
            <asp:Parameter Name="WishId" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
