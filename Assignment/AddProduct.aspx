<%@ Page Language="C#" MasterPageFile="~/zhe_xue/HeaderAndFooter.Master" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeBehind="AddProduct.aspx.cs" Inherits="Assignment.WebForm1" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
    <title>Add Product</title>
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <link href="css/addProduct.css" rel="stylesheet" />
    
     <script type ="text/javascript">
         function UploadFile(fileUpload) {
             if (fileUpload.value != '') {
                 document.getElementById("<%=btnUpload2.ClientID %>").click();
                document.getElementById("<%=btnUpload.ClientID %>").click();
                document.getElementById("<%=btnUpload3.ClientID %>").click();
                document.getElementById("<%=btnUpload4.ClientID %>").click();
                document.getElementById("<%=btnUpload5.ClientID %>").click();
             }
         }

     </script>
   
       <script>
           function ChangeQ(ele, w) {
               var sign = ele.id.substring(15);
               if (w == "M") {

                                 
                   if (document.getElementById("<%=txtQuantity.ClientID %>").value > 0) {
                       document.getElementById("<%=txtQuantity.ClientID %>").value -= 1;
                   }
               }
               else if (w == "P") {
                   document.getElementById("<%=txtQuantity.ClientID %>" ).value = parseInt(document.getElementById("<%=txtQuantity.ClientID %>").value, 10) + 1;
               }
           }
       </script>
    
    <style type="text/css">
        .auto-style1 {
            margin-top: 0;
        }
        </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

   
        <div class ="grid">
   
            <div class="sidebar">

             &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  
                <asp:Image ID="pictureBox1" runat="server" Height="300px" Width="300px" ViewStateMode="Enabled" CssClass="auto-style1" />
                <br /> <br />
              &nbsp;&nbsp;&nbsp;&nbsp;  
                <asp:Image ID="pictureBox2" runat="server" Height="100px" Width="100px" ViewStateMode="Enabled" />
                <asp:Image ID="pictureBox3" runat="server" Height="100px" Width="100px" ViewStateMode="Enabled"/>
                <asp:Image ID="pictureBox4" runat="server" Height="100px" Width="100px" ViewStateMode="Enabled"/>
                 <asp:Image ID="pictureBox5" runat="server" Height="100px" Width="100px" ViewStateMode="Enabled" />
                 <asp:label id="Label1" runat="server"/>


                <br />
                <br />
                <div class="col-md-3">
                    <asp:Label ID="lblCover" runat="server" Text="Cover Photo*"></asp:Label>
                   <asp:FileUpload ID="img01" runat="server" AllowMultiple="True"  CssClass="form-control" Width="256px"  ViewStateMode="Enabled"/>
                    <asp:Button ID="btnUpload2" runat="server" Text="Upload" OnClick ="Upload" style="display: none" />
                    <asp:Label ID="upload" runat="server" Visible="false" Width="256px" ForeColor="Red" Text="Upload an image in cover photo"></asp:Label>
                        <br />

                 
   

                    <asp:Label ID="lblOpt" runat="server" Text="Optional"></asp:Label>
                    
                    <asp:FileUpload ID="img02" runat="server"  CssClass="form-control"  Width="256px" ViewStateMode="Enabled"></asp:FileUpload>
                    <asp:Button ID="btnUpload" runat="server" Text="Upload" OnClick="Upload" cssClass ="box"  style="display: none" />
                   
                    <asp:FileUpload ID="img03" runat="server"   CssClass="form-control"  Width="256px" ViewStateMode="Enabled"/>
                    <asp:Button ID="btnUpload3" runat="server" Text="Upload" OnClick="Upload" cssClass ="box"  style="display: none" />
                
                    <asp:FileUpload ID="img04" runat="server" CssClass="form-control" Width="256px" ViewStateMode="Enabled"/>
                   <asp:Button ID="btnUpload4" runat="server" Text="Upload" OnClick="Upload" cssClass ="box"  style="display: none" />
                 
                    <asp:FileUpload ID="img05" runat="server" CssClass="form-control"  Width="256px" ViewStateMode="Enabled"/>
                    <asp:Button ID="btnUpload5" runat="server" Text="Upload" OnClick="Upload" cssClass ="box"  style="display: none" />

                   

                  
                    <br />
                    
               </div>
            </div>
            
            <div class="content">
                
              
                         <asp:Label ID="lblName" runat="server"  Text="Name*"></asp:Label>&nbsp;
                 <br />
                <asp:TextBox ID="txtName" runat="server" CssClass="textbox" Width="210px" ViewStateMode="Enabled"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Name* column is empty" ControlToValidate="txtName" Display="Dynamic" ForeColor="Red" SetFocusOnError="True">Name* column is empty</asp:RequiredFieldValidator>
                <br />

                         <asp:Label ID="lblSize" runat="server"  Text="Size* e.g.(10 x 10)"></asp:Label>&nbsp;
                 <br />
                <asp:TextBox ID="txtSize" runat="server"  CssClass="textbox"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Size* column is empty" ControlToValidate="txtSize" Display="Dynamic" ForeColor="Red" SetFocusOnError="True">Size* column is empty</asp:RequiredFieldValidator>
                         <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtSize" Display="Dynamic" ErrorMessage="RegularExpressionValidator" ForeColor="Red" SetFocusOnError="True" ValidationExpression="\d+\s[x]\s\d+">Enter correct format</asp:RegularExpressionValidator>
                 <br />
                
                         <asp:Label ID="lblPrice" runat="server"  Text="Price* e.g.(20.00)" CssClass="text"></asp:Label>&nbsp;
                   
                 <br />
                <ItemTemplate>
                 <asp:Label ID="Label3" runat="server"  Text="RM " CssClass="text"></asp:Label>&nbsp;
                <asp:TextBox ID="txtPrice" runat="server"  CssClass="textbox"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Price* column is empty" ControlToValidate="txtPrice" Display="Dynamic" ForeColor="Red" SetFocusOnError="True">Price* column is empty</asp:RequiredFieldValidator>
                         <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtPrice" Display="Dynamic" ErrorMessage="RegularExpressionValidator" ForeColor="Red" SetFocusOnError="True" ValidationExpression="\d+(([.])(\d{2}))?">Enter correct format</asp:RegularExpressionValidator>
                </ItemTemplate>
                    <br />

                <asp:Label ID="lblQty" runat="server"  Text="Quantity*" CssClass="text"></asp:Label>&nbsp;
                 <br />

                <ItemTemplate>
                <asp:Button ID="btnM"  runat="server" Text="-" OnClientClick="ChangeQ(this,'M')" Width="38px" OnClick="btnM_Click"/>
                    
                            <asp:TextBox ID="txtQuantity" runat="server" Text="0" Width="100px"></asp:TextBox>
                             

                <asp:Button ID="btnP" runat="server" Text="+" Width="39px" OnClientClick="ChangeQ(this,'P')"/>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Quantity* column is empty" ControlToValidate="txtQuantity" Display="Dynamic" ForeColor="Red" SetFocusOnError="True" InitialValue="0">Quantity* column is empty</asp:RequiredFieldValidator>
                </ItemTemplate>

                <br />
                <div style = "position:relative; bottom:-10px;" >
                         <asp:Label ID="lblDate" runat="server"  Text="Date*"></asp:Label>&nbsp;
                    </div>
                 <br /> 
                 <div style = "position:relative; bottom:-2px;" >
                <asp:TextBox ID="txtDate" runat="server" TextMode="Date"></asp:TextBox>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Date* column is empty" ControlToValidate="txtDate" Display="Dynamic" ForeColor="Red" SetFocusOnError="True">Date* column is empty</asp:RequiredFieldValidator>
                 </div>

                
                <div style = "position:relative; bottom:-10px;" >
                
                         <asp:Label ID="lblCategory" runat="server"  Text="Category*"></asp:Label>&nbsp;
                    </div>
                 <br />
                  <asp:DropDownList ID="ddlCategory" runat="server" OnSelectedIndexChanged="ddlCategory_SelectedIndexChanged"></asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Category* column is empty" ControlToValidate="ddlCategory" Display="Dynamic" ForeColor="Red" SetFocusOnError="True">Category* column is empty</asp:RequiredFieldValidator>
                  
                <br />
                <div style = "position:relative; bottom:-10px;" >
                         <asp:Label ID="lblDescription" runat="server"  Text="Description(minimum 20 words)*" Top ="8px"></asp:Label>&nbsp;
                    </div>
                 <br />
                 <asp:TextBox ID="txtDesc" runat="server"  CssClass="textbox" TextMode="MultiLine" Rows ="5" Columns="60" ViewStateMode="Enabled"></asp:TextBox> <br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Description* column is empty" ControlToValidate="txtDesc" Display="Dynamic" ForeColor="Red" SetFocusOnError="True">Description* column is empty</asp:RequiredFieldValidator>
                         <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtDesc" Display="Dynamic" ErrorMessage="RegularExpressionValidator" ForeColor="Red" SetFocusOnError="True" ValidationExpression="^.{20,}$">Enter a minimum of 20 words</asp:RegularExpressionValidator>
                 <br /><br /><br />

                <asp:Button ID="btnAdd" runat="server" Text="Add Product" OnClick="btnAdd_Click" cssClass="box" />
                <asp:Label ID="lblMessage" runat="server" CssClass="text-success"></asp:Label>
                <asp:Label ID="Label2" runat="server" CssClass="text-success"></asp:Label>
            </div>
           

        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:conString %>" SelectCommand="SELECT * FROM [product]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:conString %>" SelectCommand="SELECT * FROM [tblImages]"></asp:SqlDataSource>
    </asp:Content>