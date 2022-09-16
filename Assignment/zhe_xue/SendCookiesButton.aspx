<%@ Page Title="" Language="C#" MasterPageFile="~/HeaderAndFooter.Master" AutoEventWireup="true" CodeBehind="SendCookiesButton.aspx.cs" Inherits="HuaheeArtist_v3.SendCookiesButton" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" />
    <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="GoToViewDetails" />
    <asp:Button ID="Button3" runat="server" Text="Button" OnClick="Button3_Click" />
</asp:Content>
