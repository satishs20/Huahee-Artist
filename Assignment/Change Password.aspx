<%@ Page Language="C#" MasterPageFile="~/zhe_xue/HeaderAndFooter.Master" AutoEventWireup="true" CodeBehind="Change Password.aspx.cs" Inherits="Web_app_practical_1.Change_Password" %>




<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="chin_sze/ChangePassword.css" rel="stylesheet" />

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <h1 class="center">Change Passowrd</h1>
        <table class="center">
            <tr>
                <td class="auto-style3">
                    <br />
                    Old Password :</td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <asp:TextBox ID="changePassword_oldPassword" Width="370px" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="error">
                    <asp:Literal ID="changePassword_oldPassword_errormessage" runat="server"></asp:Literal>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <br />
                    New Password :</td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <asp:TextBox ID="changePassword_newPassword" Width="370px" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="error">
                    <asp:Literal ID="changePassword_newPassword_errormessage" runat="server"></asp:Literal>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <br />
                    Confirm New Password :</td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <asp:TextBox ID="changePassword_confirmNewPassword" Width="370px" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="error">
                    <asp:Literal ID="changePassword_confirmNewPassword_errormessage" runat="server"></asp:Literal>
                </td>
            </tr>
            <tr>
                <td class="error">
                    <br />
                    <asp:Literal ID="changePassword_errormessage" runat="server"></asp:Literal>
                </td>
            </tr>
            <tr>
                <td class="center">
                    <asp:Button ID="changePassword_confirmButton" runat="server" Text="Confirm" Font-Size="XX-Large" OnClick="changePassword_confirmButton_Click" />
                </td>
            </tr>
            <tr>
                <td class="center">
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/User Profile.aspx">Go Back</asp:HyperLink>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
