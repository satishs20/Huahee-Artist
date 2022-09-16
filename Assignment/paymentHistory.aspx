<%@ Page Title="" Language="C#" MasterPageFile="~/zhe_xue/HeaderAndFooter.Master" AutoEventWireup="true" CodeBehind="paymentHistory.aspx.cs" Inherits="Assignment.paymentHistory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label ID="Label1" runat="server" Text="Payment History"></asp:Label>
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" DataKeyNames="HistoryId" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="Vertical">
        <AlternatingRowStyle BackColor="#CCCCCC" />
        <Columns>
            <asp:BoundField DataField="HistoryId" HeaderText="HistoryId" InsertVisible="False" ReadOnly="True" SortExpression="HistoryId" />
            <asp:ImageField DataImageUrlField="CoverPhoto" HeaderText="CoverPhoto">
            </asp:ImageField>
            <asp:BoundField DataField="Pname" HeaderText="Pname" SortExpression="Pname" />
            <asp:BoundField DataField="Size" HeaderText="Size" SortExpression="Size" />
            <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
            <asp:BoundField DataField="Category" HeaderText="Category" SortExpression="Category" />
            <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" />
            <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
        </Columns>
        <FooterStyle BackColor="#CCCCCC" />
        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#808080" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#383838" />
    </asp:GridView>

    <br />
    <br />
    <br />
    <asp:Button ID="backToCart" runat="server" Text="Back" OnClick="backCart_Click" Height="51px" Width="109px" />
    <br />
    <br />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:conString %>" SelectCommand="SELECT [HistoryId], [Pname], [Size], [Price], [Category], [Date], [CoverPhoto], [Quantity] FROM [history] WHERE ([Cuser] = @Cuser)">
        <SelectParameters>
            <asp:CookieParameter CookieName="username" Name="Cuser" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
