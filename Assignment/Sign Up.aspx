<%@ Page Language="C#" MasterPageFile="~/zhe_xue/HeaderAndFooter.Master" AutoEventWireup="true" CodeBehind="Sign Up.aspx.cs" Inherits="Web_app_practical_1.Sign_Up" %>

<%@ Register src="UserControl/Time.ascx" tagname="Time" tagprefix="usercontrol" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link href="chin_sze/SignUp.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>

            <usercontrol:Time ID="Time1" runat="server" />
        <h1 class="center">Sign Up</h1>

        <table class="center">
            <tr>
                <td colspan="2">
                    <br />
                    Username :</td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:TextBox ID="signup_name" runat="server" Width="370px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="error" colspan="2">
                    <asp:Literal ID="signup_name_errormessage" runat="server"></asp:Literal>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <br />
                    Phone Number (exp:0189758177):</td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:TextBox ID="signup_phone" runat="server" Width="370px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="error" colspan="2">
                    <asp:Literal ID="signup_phone_errormessage" runat="server"></asp:Literal>
                    <br />
                    <asp:RegularExpressionValidator ID="wrongPhoneFormatError" runat="server" ControlToValidate="signup_phone" Display="Dynamic" ErrorMessage="RegularExpressionValidator" ForeColor="Red" ValidationExpression="(01)[0-9]{8,9}$">Wrong phone number format</asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <br />
                    Email:</td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:TextBox ID="signup_email" runat="server" Width="370px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="error" colspan="2">
                    <asp:Literal ID="signup_email_errormessage" runat="server"></asp:Literal>
                    <br />
                    <asp:RegularExpressionValidator ID="wrongEmailError" runat="server" ControlToValidate="signup_email" Display="Dynamic" ErrorMessage="RegularExpressionValidator" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">Wrong email format</asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <br />
                    Password :</td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:TextBox ID="signup_password" runat="server" Width="370px" TextMode="Password"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="error" colspan="2">
                    <asp:Literal ID="signup_passowrd_errormessage" runat="server"></asp:Literal>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <br />
                    Confirm Password :</td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:TextBox ID="signup_confirmPassword" runat="server" Width="370px" TextMode="Password"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="error" colspan="2">
                    <asp:Literal ID="signup_confirmPassword_errormessage" runat="server"></asp:Literal>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">
                    <br />
                    Sign up as:</td>
                <td class="auto-style1">
                    <br />
                    <asp:RadioButtonList ID="signup_type" runat="server" RepeatDirection="Horizontal" CellSpacing="10">
                        <asp:ListItem>Customer</asp:ListItem>
                        <asp:ListItem>Artists</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
            <tr class="auto-style1">
                <td style="text-align: center; color: red" colspan="2">
                    <asp:Literal ID="signup_type_errormessage" runat="server"></asp:Literal>
                </td>
            </tr>
            <tr>
                <td class="error" colspan="2">
                    <br />
                    <asp:Literal ID="signup_errormessage" runat="server"></asp:Literal>
                </td>
            </tr>
            <tr>
                <td class="center" colspan="2">
                    <asp:Button ID="signup_signupButton" runat="server" OnClick="signup_button_Click" Text="Sign Up" Font-Size="XX-Large" />
                </td>
            </tr>
            <tr>
                <td class="center" colspan="2">
                    <asp:HyperLink ID="signup_hyperLink" runat="server" NavigateUrl="~/Login.aspx" Font-Size="Medium">Login</asp:HyperLink>
                </td>
            </tr>
        </table>
        <br />


    </div>

</asp:Content>
