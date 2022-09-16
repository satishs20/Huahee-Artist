<%@ Page Language="C#" MasterPageFile="~/zhe_xue/HeaderAndFooter.Master" AutoEventWireup="true" CodeBehind="Gallery.aspx.cs" Inherits="Assignment.Gallery"   %>

<%@ Register Src="~/DataList.ascx" TagPrefix="uc1" TagName="DataList" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Gallery</title>
    <link href="gallery.css" rel="stylesheet" />
    <style type="text/css">
        .auto-style1 {
            width: 100%;
            background-color: #993399;
            background-size: cover;
        }
        .auto-style2 {
            margin-bottom: 17px;
            background-color: #FFFFFF;
        }
        .auto-style3 {
            text-align: center;
        }
        .auto-style4 {
            background-color: #FFFFFF;
             padding: 5px;
        }
        .auto-style4:hover {
          background-color:gainsboro;
        }
        .auto-style5 {
            text-align: center;
            background-color: #FFFFFF;
            Font-Size:22px;
        }
       
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

         <h1 class="auto-style3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Huahee Gallery Page</h1>

    <uc1:DataList runat="server" id="DataList" />
        </asp:Content>