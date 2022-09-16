<%@ Page Title="" Language="C#" MasterPageFile="~/zhe_xue/HeaderAndFooter.Master" AutoEventWireup="true" CodeBehind="payWithBank.aspx.cs" Inherits="Assignment.payWithBank" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            height: 41px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label ID="messagepayment1" runat="server" Text="Welcome to the Payment Page!"></asp:Label>
&nbsp;<br />
    <br />
    <asp:Label ID="messagePayment2" runat="server" Text="Please enter your payment details"></asp:Label>
    <br />
    <asp:Label ID="Label5" runat="server" Text="Your total amount is  :  "></asp:Label>
    <asp:Label ID="showAmount" runat="server"></asp:Label>
    <br />
    <br />
    <br />
    <table>
        <tr>
            <td><asp:Label ID="messagepayment4" runat="server" Text="Please select your payment method"></asp:Label></td>
            <td>
                <asp:DropDownList ID="paymentChoose" runat="server">
                    <asp:ListItem>Visa</asp:ListItem>
                    <asp:ListItem>MasterCard</asp:ListItem>
                    <asp:ListItem>Paypal</asp:ListItem>
                </asp:DropDownList></td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please choose your payment method" ControlToValidate="paymentChoose" CssClass="error" Display="Dynamic"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td><asp:Label ID="cardNumberLabel" runat="server" Text="Card Number  :  "></asp:Label></td>
            <td><asp:TextBox ID="getcardNumber" runat="server" OnTextChanged="getcardNumber_TextChanged" Width="262px"></asp:TextBox></td>
            <td>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="getcardNumber" CssClass="error" Display="Dynamic" ErrorMessage="The card number should be 9 - 18digits" ValidationExpression="[0-9]{9,18}$"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style1"><asp:Label ID="ExpiredLabel" runat="server" Text="Expired on  :  "></asp:Label></td>
            <td class="auto-style1"><asp:DropDownList ID="getMonth" runat="server">
        <asp:ListItem>01</asp:ListItem>
        <asp:ListItem>02</asp:ListItem>
        <asp:ListItem>03</asp:ListItem>
        <asp:ListItem>04</asp:ListItem>
        <asp:ListItem>05</asp:ListItem>
        <asp:ListItem>06</asp:ListItem>
        <asp:ListItem>07</asp:ListItem>
        <asp:ListItem>08</asp:ListItem>
        <asp:ListItem>09</asp:ListItem>
        <asp:ListItem>10</asp:ListItem>
        <asp:ListItem>11</asp:ListItem>
        <asp:ListItem>12</asp:ListItem>
    </asp:DropDownList>/
            <asp:DropDownList ID="getYear" runat="server">
        <asp:ListItem>2010</asp:ListItem>
        <asp:ListItem>2011</asp:ListItem>
        <asp:ListItem>2012</asp:ListItem>
        <asp:ListItem>2013</asp:ListItem>
        <asp:ListItem>2014</asp:ListItem>
        <asp:ListItem>2015</asp:ListItem>
        <asp:ListItem>2016</asp:ListItem>
        <asp:ListItem>2017</asp:ListItem>
        <asp:ListItem>2018</asp:ListItem>
        <asp:ListItem>2019</asp:ListItem>
        <asp:ListItem>2020</asp:ListItem>
        <asp:ListItem>2021</asp:ListItem>
        <asp:ListItem>2022</asp:ListItem>
        <asp:ListItem>2023</asp:ListItem>
        <asp:ListItem>2024</asp:ListItem>
        <asp:ListItem>2025</asp:ListItem>
    </asp:DropDownList>
            </td>
            <td class="auto-style1">
                <asp:RequiredFieldValidator ID="validationMonth" runat="server" ControlToValidate="getMonth" CssClass="error" Display="Dynamic" ErrorMessage="Please select your Month"></asp:RequiredFieldValidator>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="getYear" CssClass="error" Display="Dynamic" ErrorMessage="Please select your Year"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td><asp:Label ID="Label4" runat="server" Text="CVC  :  "></asp:Label></td>
            <td><asp:TextBox ID="getCVC" runat="server" Width="177px"></asp:TextBox></td>
            <td>
                <asp:RegularExpressionValidator ID="validationCvc" runat="server" BorderStyle="None" ControlToValidate="getCVC" CssClass="error" Display="Dynamic" ErrorMessage="Please enter a correct cvc (e.g. 345)" ValidationExpression="[0-9]{3}"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="LabelEmail" runat="server" Text="Email  :  "></asp:Label></td>
            <td><asp:TextBox ID="getEmail" runat="server" Width="262px"></asp:TextBox></td>
            <td>
                <asp:RegularExpressionValidator ID="validationEmail" runat="server" ControlToValidate="getEmail" CssClass="error" Display="Dynamic" ErrorMessage="Please enter a correct email format (e.g. khaw@gmail.com)" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            </td>
        </tr>
    </table>
    <asp:Label ID="lastMessage" runat="server" Text="If you have checked that all forms are filled and confirmed that you can proceed to the next step, click &quot;Pay Now&quot; to complete the payment."></asp:Label>
    <br />
    <asp:Button ID="paybutton" runat="server" Height="46px" OnClick="paybutton_Click" Text="Pay Now" Width="121px" />
</asp:Content>
