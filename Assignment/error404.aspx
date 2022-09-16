<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="error404.aspx.cs" Inherits="Assignment.error404" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>error 404</title>
    <style type="text/css">
        .auto-style1 {
            position: relative;
            float: left;
            left: 200px;
            top: 37px;
            width: 724px;
            height: 147px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
       <div>
            <div>
                <%--<p>404 Page</p>--%>
                <h1><span style=" font-size: 100px; text-align:center">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Ooops!</span></h1>
                <div style="padding-left: 20px; padding-top: 15px; " class="auto-style1">
                    <span style="color: #797979; font-size: 45px;">We can't seem to find the page you are looking for.</span><br />
                   <br />

                </div>
                <div> </div>
            </div>
        </div>
        <p>
            <asp:Image ID="errorPic" runat="server" Height="439px" Width="520px" />
        </p>
    </form>
  
</body>
</html>
