<%@ Page Language="C#"  MasterPageFile="~/zhe_xue/HeaderAndFooter.Master" AutoEventWireup="true" CodeBehind="personalStock.aspx.cs" Inherits="Assignment.personalStock" %>

<%@ Register Src="~/DataList.ascx" TagPrefix="uc1" TagName="DataList" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="personalStock.css" rel="stylesheet" />
    <title>Artist Stock</title>
    
    
   
    <style type="text/css">
        .auto-style1 {
            width: 100%;
            background-color: #993399;
            background-size: cover;
        }
        .auto-style2 {
            margin-bottom: 17px;
            background-color: #FFFFFF;
            margin-top: 38px;
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

         <br /> 
        <h1 class="auto-style3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Huahee Inventory Page</h1>
    <br />
        <div style="margin-left:140px"  >        
            <asp:Button ID="btnAdd" runat="server" Text="Add New Artwork" OnClick="Button1_Click" Height="39px" Width="215px"     /> &nbsp;&nbsp; &nbsp; &nbsp;&nbsp;
            
            </div>
   
    <uc1:DataList runat="server" id="DataList" />

        
     
</asp:Content>