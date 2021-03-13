<%@ Page Title="" Language="C#" MasterPageFile="~/EmployeeFacingMaster.Master" AutoEventWireup="true" CodeBehind="EmployeeLogin.aspx.cs" Inherits="GreenValleyAuctionsSystem.EmployeeLogin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
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


</asp:Content>
