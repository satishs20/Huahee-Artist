<%@ Control Language="C#" AutoEventWireup="true"   CodeBehind="DataList.ascx.cs" Inherits="Assignment.DataList" %>
<pages enableEventValidation="false"/>
<style type="text/css">
    
        .auto-style2 {
            margin-bottom: 17px;
            background-color: #FFFFFF;
            margin-top: 38px;
        }
        * {
    margin: 0;
    padding: 0;
}

        .auto-style1 {
            width: 100%;
            background-color: #993399;
            background-size: cover;
        }
        .auto-style5 {
            text-align: center;
            background-color: #FFFFFF;
            Font-Size:22px;
        }
        .auto-style4 {
            background-color: #FFFFFF;
             padding: 5px;
        }
        .auto-style3 {
            text-align: left;
        }
                  
        </style>
 <link href="personalStock.css" rel="stylesheet" />
<h1 class="auto-style3">
   
   
      &nbsp &nbsp&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp<asp:Button ID="btnSearch" runat="server" Text="Refresh" OnClick="btnSearch_Click" Height="38px" Width="88px" /> </h1>
<div class ="grid">
         <div class="content">
            <asp:DataList ID="DataList1" runat="server" CssClass="auto-style2" DataKeyField="ProductId" DataSourceID="SqlDataSource1" OnItemCommand="DataList1_ItemCommand" RepeatColumns="5" RepeatDirection="Horizontal" OnSelectedIndexChanged="DataList1_SelectedIndexChanged" CellSpacing="50">
               
               

                <ItemTemplate>
                    <table class="auto-style1">
                       
                        
                        <tr>
                            <td class="auto-style5" >
                                <asp:Image ID="Image1" runat="server" Height="200px" ImageUrl='<%# Eval("CoverPhoto") %>' Width="200px" />
                            </td>
                        </tr>

                        <tr>
                            <td class="auto-style5">
                           
                                <asp:Label ID="Label2" runat="server"  Font-Bold="True" Font-Size="26px" Text='<%# Limit(Eval("Name"),13) %>' > ></asp:Label>
                            </td>
                        </tr>

                        <tr>
                            <td class="auto-style5">Price:<asp:Label ID="Label4" runat="server" Text='<%# Eval("Price") %>' ></asp:Label>
                            </td>
                        </tr>

                        <tr>
                            <td class="auto-style5">
                                <asp:Label ID="Label3" runat="server" Text='<%# Eval("Category") %>' Font-Size="20px"></asp:Label>
                            </td>
                        </tr>                        
                        <tr>
                            <td class="auto-style5">
                                <br />
                                <asp:Button ID="btnItemDetail" runat="server" CommandArgument='<%# Eval("ProductId") %>' CommandName="ViewDetails" CssClass="auto-style4" OnClick="btnItemDetail_Click" Text="View Detail" />
                                <br />
                                <br />
                            </td>
                        </tr>
                    </table>
                    <div class="auto-style3">
                        <br />
                    </div>

                </ItemTemplate>
            </asp:DataList>
    </div>
  </div>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:conString %>" SelectCommand="SELECT * FROM [product]"></asp:SqlDataSource>
<asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:conString %>" SelectCommand="SELECT * FROM [product] WHERE ([User_Username] = @User_Username)">
    <SelectParameters>
        <asp:CookieParameter CookieName="username" Name="User_Username" Type="String" />
    </SelectParameters>
</asp:SqlDataSource>

