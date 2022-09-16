<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="userDetailsControl.ascx.cs" Inherits="Assignment.userDetailsControl" %>
<table class="auto-style1">
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
    </table>