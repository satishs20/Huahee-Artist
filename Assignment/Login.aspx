<%@ Page Language="C#" MasterPageFile="~/zhe_xue/HeaderAndFooter.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Web_app_practical_1.Practical_1_testing" %>

<%@ Register src="UserControl/Time.ascx" tagname="Time" tagprefix="usercontrol" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="chin_sze/Login.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>

            <usercontrol:Time ID="Time1" runat="server" />

        <h1 class="center">Login</h1>
        <table class="center">
            <tr>
                <td class="auto-style3">
                    <br />
                    Username :</td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <strong>
                        <asp:TextBox ID="login_name" runat="server" Width="370px"></asp:TextBox>
                    </strong>
                </td>
            </tr>
            <tr>
                <td class="error">
                    <asp:Literal ID="login_name_errormessage" runat="server"></asp:Literal>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <br />
                    Password :</td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <asp:TextBox ID="login_password" TextMode="Password" runat="server" Width="370px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="error">
                    <asp:Literal ID="login_password_errormessage" runat="server"></asp:Literal>
                </td>
            </tr>
            <tr>
                <td class="error">
                    <br />
                    <asp:Literal ID="login_errormessage" runat="server"></asp:Literal>
                </td>
            </tr>
            <tr>
                <td class="center">
                    <asp:Button ID="login_loginButton" runat="server" OnClick="login_button_Click" Text="Login" Font-Size="XX-Large" />
                </td>
            </tr>
            <tr>
                <td class="center">
                    <asp:HyperLink ID="login_hyperLink" runat="server" NavigateUrl="~/Sign Up.aspx" Font-Size="Medium">Sign Up</asp:HyperLink>
                </td>
            </tr>
        </table>
        <br />
    </div>
</asp:Content>
