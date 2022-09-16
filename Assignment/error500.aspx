<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="error500.aspx.cs" Inherits="Assignment.error500" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <title>error 404</title>
    <style type="text/css">
        .auto-style1 {
            position: relative;
            float: left;
            left: 450px;
            top: -3px;
            width: 724px;
            height: 147px;
        }
        .auto-style2 {
            margin-left: 0px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
       <div>
            <div>
                <%--<p>500 Page</p>--%>
                <br /><br /><br /><br />
                <div style="padding-left: 20px; padding-top: 15px; " class="auto-style1">
                    <span style="color: #797979; font-size: 45px; text-align:center">&nbsp;&nbsp;&nbsp;&nbsp; Something went wrong&nbsp;</span>
                    <br />
<span style="color: #797979; font-size: 20px; text-align:center">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Please try again later</span><br />
                   <br />
                     <asp:Image ID="errorPic" runat="server" Height="424px" Width="545px" CssClass="auto-style2" />
                </div>
                <div> </div>
            </div>
        </div>
        <p>
           
        </p>
    </form>
    </body>
</html>
