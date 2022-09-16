<%@ Page Title="" Language="C#" MasterPageFile="~/zhe_xue/HeaderAndFooter.Master" AutoEventWireup="true" CodeBehind="checkout.aspx.cs" Inherits="Assignment.checkout" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 140px;
        }
        .auto-style3 {
            width: 510px;
        }
        .auto-style4 {
        width: 212px;
    }
        .auto-style5 {
            margin-left: 0px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label ID="Label1" runat="server" Text="Check Out "></asp:Label>
    <br />
    <br />

    <%--<table class="auto-style1">
        <tr>
            <td class="auto-style2">Name:</td>
            <td class="auto-style3">
                <asp:Label ID="nameShow" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Order Date:</td>
            <td class="auto-style3">
                <asp:Label ID="dateshow" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
    </table>--%>

    <asp:Label ID="Label4" runat="server" Text="The product you ready to check out"></asp:Label>
    <br />
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="CartId" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="CartId" HeaderText="CartId" InsertVisible="False" ReadOnly="True" SortExpression="CartId" />
            <asp:BoundField DataField="Pname" HeaderText="Pname" SortExpression="Pname" />
            <asp:BoundField DataField="Size" HeaderText="Size" SortExpression="Size" />
            <asp:BoundField DataField="Category" HeaderText="Category" SortExpression="Category" />
            <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
            <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
            <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" />
        </Columns>
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:conString %>" SelectCommand="SELECT * FROM [cart] WHERE ([Cuser] = @Cuser)">
        <SelectParameters>
            <asp:CookieParameter CookieName="username" Name="Cuser" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    Your Total Amount :
    <asp:Label ID="showTotal" runat="server" Text="Label"></asp:Label>
    <br />
    <asp:Label ID="Label5" runat="server" Text="If you require a check out order with differrent address and contact, please fill this  sheet"></asp:Label>
    <br />
    <br />
    <table class="auto-style1">
        <tr>
            <td class="auto-style4">Type Your Address</td>
            <td>
                <asp:TextBox ID="addressbox" runat="server" CssClass="auto-style5" Height="123px" Width="426px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style4">Mobile Number</td>
            <td>
                <asp:TextBox ID="contactbox" runat="server" Width="422px" Height="37px"></asp:TextBox>
            </td>
            <td><asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="contactbox" CssClass="error" ErrorMessage="Please enter a correct phone number (e.g. 01156775468)" Display="Dynamic" ValidationExpression="(01)[0-9]{8,9}$" SetFocusOnError="True"></asp:RegularExpressionValidator></td>
        </tr>
    </table>
    <br />
    <br />


    <asp:Button ID="Button1" runat="server" Text="Pay now" Height="54px" OnClick="Button1_Click" Width="129px" />
</asp:Content>
