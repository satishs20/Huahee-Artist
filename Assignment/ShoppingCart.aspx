<%@ Page Title="" Language="C#"  MasterPageFile="~/zhe_xue/HeaderAndFooter.Master" AutoEventWireup="true" CodeBehind="ShoppingCart.aspx.cs" Inherits="HuaheeArtist_v3.ShoppingCart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label ID="title" runat="server" Text="Shopping Cart"></asp:Label>
    <br />
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="CartId" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged2" ShowFooter="True" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4">
        <Columns>
            <asp:CommandField SelectText="Modify" ShowSelectButton="True" />
            <asp:BoundField DataField="CartId" HeaderText="CartId" InsertVisible="False" ReadOnly="True" SortExpression="CartId" >
            </asp:BoundField>
            <asp:BoundField DataField="Pname" HeaderText="Pname" SortExpression="Pname" >
            </asp:BoundField>
            <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
            <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" >
            </asp:BoundField>
            <asp:CommandField ShowDeleteButton="True" />
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
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:conString %>" SelectCommand="SELECT [CartId], [Pname], [Quantity], [Price] FROM [cart] WHERE ([Cuser] = @Cuser)" DeleteCommand="DELETE FROM [cart] WHERE [CartId] = @CartId" InsertCommand="INSERT INTO [cart] ([Pname], [Quantity], [Price]) VALUES (@Pname, @Quantity, @Price)" OnSelecting="SqlDataSource1_Selecting" UpdateCommand="UPDATE [cart] SET [Pname] = @Pname, [Quantity] = @Quantity, [Price] = @Price WHERE [CartId] = @CartId">
        <DeleteParameters>
            <asp:Parameter Name="CartId" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Pname" Type="String" />
            <asp:Parameter Name="Quantity" Type="Int32" />
            <asp:Parameter Name="Price" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:CookieParameter CookieName="username" Name="Cuser" Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Pname" Type="String" />
            <asp:Parameter Name="Quantity" Type="Int32" />
            <asp:Parameter Name="Price" Type="String" />
            <asp:Parameter Name="CartId" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <br />
    <br />
    Total Amount : RM
    <asp:Label ID="totalAmountDidit" runat="server" Text="Label"></asp:Label>
    <br />
    <asp:Label ID="messagetotal" runat="server" Text="Label"></asp:Label>
    <br />
    <br />
    <asp:Label ID="message5" runat="server" Text="Your payment History "></asp:Label>
    <br />
    <asp:Button ID="history" runat="server" Text="Payment History" Height="54px" OnClick="history_Click" Width="183px" />
    <br />
    <br />
    <asp:Label ID="showmessage4" runat="server" Text="If you delete some product from your cart, you can click this button to refresh to get the new total amount."></asp:Label>
    <br />
    <asp:Button ID="refresh" runat="server" Text="Refresh Now" Height="52px" OnClick="refresh_Click" Width="153px" />
    <br/>
    <br />
    <asp:Label ID="showmessage5" runat="server" Text="If you want to start shopping cart items, you can click Check Out button to move to next step."></asp:Label>
    <br />
    <br />
    <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Check Out" Height="53px" Width="153px" />
</asp:Content>
