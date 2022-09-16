<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/zhe_xue/HeaderAndFooter.Master" CodeBehind="User Profile.aspx.cs" Inherits="Web_app_practical_1.User_Profile" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="chin_sze/User%20Profile.css" rel="stylesheet" />
    <link href="User%20Profile.css" rel="stylesheet" />

    <script type="text/javascript">
        function UploadFile(fileUpload) {
            if (fileUpload.value != '') {
                document.getElementById("<%=btnUpload2.ClientID %>").click();
            }
        }
    </script>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="grid">
        <div class="sidebar">

            <asp:Image ID="userProfile_image" runat="server" Height="300px" Width="300px" ViewStateMode="Enabled" CssClass="auto-style1" />
            <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
            <br />
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;  

                <div class="col-md-3">
                    <asp:Label ID="lblCover" runat="server" Text="Cover Photo :"></asp:Label><br />
                    <asp:FileUpload ID="img01" runat="server" AllowMultiple="True" CssClass="form-control" Width="256px" ViewStateMode="Enabled" />
                    <br />
                    <asp:Button ID="btnUpload2" runat="server" Text="Upload" OnClick="Upload" Style="display: none" />
                </div>
        </div>

        <div class="content">

            <h1>User Prodile</h1>
            <br />

            <asp:Label ID="lblName" runat="server" Text="Username :"></asp:Label>&nbsp;
                 <br />
            <asp:TextBox ID="userProfile_username" runat="server" CssClass="textbox" Width="210px" ViewStateMode="Enabled" ReadOnly="True"></asp:TextBox>
            <br />

            <asp:Label ID="lblSize" runat="server" Text="Name :"></asp:Label>&nbsp;
                 <br />
            <asp:TextBox ID="userProfile_name" runat="server" CssClass="textbox"></asp:TextBox>
            <br />

            <asp:Label ID="Label7" runat="server" Text="Password :"></asp:Label>&nbsp;
                 <br />
            <asp:HyperLink ID="userProfile_changePasswordHyperlink" runat="server" NavigateUrl="~/Change Password.aspx">Change Password</asp:HyperLink>
            <br />
            <br />


            <asp:Label ID="lblPrice" runat="server" Text="Email :" CssClass="text"></asp:Label>&nbsp;
                 <span class="error">
                     <asp:RegularExpressionValidator ID="wrongEmailError0" runat="server" ControlToValidate="userProfile_email" Display="Dynamic" ErrorMessage="RegularExpressionValidator" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">Wrong email format</asp:RegularExpressionValidator>
                 </span>
            <br />
            <asp:TextBox ID="userProfile_email" runat="server" CssClass="textbox"></asp:TextBox>
            <br />

            <asp:Label ID="Label1" runat="server" Text="Phone Number :" CssClass="text"></asp:Label>&nbsp;
                 <span class="error">
                     <asp:RegularExpressionValidator ID="wrongPhoneFormatError" runat="server" ControlToValidate="userProfile_phoneNumber" Display="Dynamic" ErrorMessage="RegularExpressionValidator" ForeColor="Red" ValidationExpression="(01)[0-9]{8,9}$">Wrong phone number format</asp:RegularExpressionValidator>
                     <asp:Literal ID="userProfile_phonenumber_errormessage" runat="server"></asp:Literal></span>
            <br />
            <asp:TextBox ID="userProfile_phoneNumber" runat="server" CssClass="textbox"></asp:TextBox>
            <br />

            <asp:Label ID="lblDate" runat="server" Text="Date :"></asp:Label>&nbsp;
                 <br />
            <div style="position: relative; bottom: -10px;">
                <asp:TextBox ID="userProfile_date" runat="server" TextMode="Date"></asp:TextBox>
                <br />
                <br />

                <asp:Label ID="Label4" runat="server" Text="Address :"></asp:Label>&nbsp;
                 <br />
                <asp:TextBox ID="userProfile_address" runat="server" CssClass="textbox"></asp:TextBox>
                <br />

                <asp:Label ID="Label5" runat="server" Text="Postcode :" CssClass="text"></asp:Label>&nbsp;
                    <asp:RegularExpressionValidator ID="wrongPostcodeFormateError" runat="server" ControlToValidate="userProfile_postcode" Display="Dynamic" ErrorMessage="RegularExpressionValidator" ForeColor="Red" ValidationExpression="[0-9]{5}$">Wrong postcode format</asp:RegularExpressionValidator>
                <br />
                <asp:TextBox ID="userProfile_postcode" runat="server" CssClass="textbox"></asp:TextBox>
                <br />

                <asp:Label ID="Label6" runat="server" Text="State :" CssClass="text"></asp:Label>&nbsp;
                 <br />
                <asp:TextBox ID="userProfile_state" runat="server" CssClass="textbox"></asp:TextBox>
                <br />

                <asp:Label ID="Label2" runat="server" Text="Login as :" CssClass="text"></asp:Label>&nbsp;
                 <br />
                <asp:TextBox ID="userProfile_type" runat="server" CssClass="textbox" ReadOnly="True"></asp:TextBox>
                <br />

                <asp:Label ID="Label3" runat="server" Text="Gender :" CssClass="text"></asp:Label>&nbsp;
                 <br />
                <asp:RadioButtonList ID="userProfile_gender" runat="server" RepeatDirection="Horizontal" CellSpacing="10">
                    <asp:ListItem>Male</asp:ListItem>
                    <asp:ListItem>Female</asp:ListItem>
                    <asp:ListItem>Other</asp:ListItem>
                </asp:RadioButtonList>
                <br />

            </div>

            <br />
            <br />

            <asp:Button ID="artistProfile_saveButton" runat="server" Text="Save" CssClass="box" OnClick="artistProfile_saveButton_Click" Font-Size="XX-Large" />
            <br />
            <br />

            <asp:Button ID="artistProfile_logOutButton" runat="server" Text="Log Out" CssClass="box" Font-Size="Medium" OnClick="artistProfile_logOutButton_Click" />
            <br />
            <br />
        </div>
    </div>

</asp:Content>
