<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmployeeLogin2.aspx.cs" Inherits="GreenValleyAuctionsSystem.EmployeeLogin2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

		<title>Log In- Green Valley Auctions</title>

		<!-- Bootstrap v5.0.0-beta1 -->
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous"/>
		<link href="css/custom.css" rel="stylesheet" type="text/css"/>
          <link href="styles.css" rel="stylesheet" type="text/css"/>
        <link rel="preconnect" href="https://fonts.gstatic.com"/>
        <link href="https://fonts.googleapis.com/css2?family=Crimson+Text&display=swap" rel="stylesheet"/>
</head>
<body>
    <form class="container form col-xs-4" id="form1" runat="server">
        <div>
           
    <asp:Table ID="tbleUserLogin" runat="server" CssClass="center" >
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label 
                            ID="lblLogin" 
                            runat="server" 
                            Text="Employee Login" Font-Bold="true"></asp:Label>                 
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                         <asp:Image ID="imgLoginIcon" runat ="server" ImageUrl="/GVAImages/GVALogo_Gold.jpg" Width="138px" Height="77px" />  
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:TextBox 
                            ID="txtUsername" 
                            runat="server"
                            Placeholder="Username" CssClass="txtBox"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:TextBox 
                            ID="txtUserPass" 
                            runat="server" 
                            TextMode="Password"
                            Placeholder="Password" CssClass="txtBox"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Button 
                            ID="btnSignIn" 
                            runat="server" 
                            Text="Login" 
                            OnClick="btnSignIn_Click" />
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label
                            ID="lblStatus" 
                            runat="server" 
                            Text="" Font-Size="12px"></asp:Label>
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>



        </div>
    </form>
        <script src="Scripts/jquery-3.5.1.min.js"></script>
    <script src="Scripts/popper.min.js"></script>
    <script src="Scripts/bootstrap.bundle.min.js"></script>
</body>
</html>
