<%@ Page Title="" Language="C#" MasterPageFile="~/zhe_xue/HeaderAndFooter.Master" AutoEventWireup="true" CodeBehind="sendToEmail.aspx.cs" Inherits="Assignment.sendToEmail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label ID="messageSuccess" runat="server" Text="Congratulations! You have completed the delivery process, the system will send a receipt to your email, please sign for it."></asp:Label>
    <br />
    <asp:Label ID="message2" runat="server" Text="You also allow to check your payment history in your shopping cart page"></asp:Label>
    <br />
    <br />
    <asp:Label ID="Label2" runat="server" Text="You can click Back button to back to Main Page, Thank you"></asp:Label>
    <br />
    <asp:GridView ID="GridView1" runat="server">
    </asp:GridView>
    <br />
    <asp:Button ID="backButton" runat="server" OnClick="Button2_Click" Text="Back to Main Page" Height="46px" Width="163px" />
</asp:Content>
