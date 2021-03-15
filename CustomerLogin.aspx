<%@ Page Title="" Language="C#" MasterPageFile="~/GeneralMaster.Master" AutoEventWireup="true" CodeBehind="CustomerLogin.aspx.cs" Inherits="GreenValleyAuctionsSystem.CustomerLogin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <br />
    <br />
    <br />
       <br />
    <br />
    <br />
    <asp:Table ID="tblCustomerLogin" runat="server" HorizontalAlign="Center" BorderColor="DarkSeaGreen" BorderStyle="Solid">
        <asp:TableRow>
            <asp:TableCell HorizontalAlign="Center" ColumnSpan="2">
                <asp:Label ID="lblLogin" runat="server" Text="Customer Portal" Font-Size="X-Large" ForeColor="DarkSeaGreen"></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell HorizontalAlign="Center" ColumnSpan="2">
                <asp:Label ID="lblLoginTwo" runat="server" Text="Login" Font-Size="X-Large" ForeColor="DarkSeaGreen"></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblUsername" runat="server" Text="Username or Email: " Font-Size="Larger"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtUsername" runat="server" Width="125px" placeholder="Username"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblPassword" runat="server" Text="Password: " Font-Size="Larger"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtPassword" runat="server" Width="125px" TextMode="Password" placeholder="Password"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell HorizontalAlign="Center" ColumnSpan="2">
                <asp:Button ID="btnLogin" runat="server" Text="Login" ForeColor="White" BackColor="DarkGreen" Width="125px" OnClick="btnLogin_Click" />
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell ColumnSpan="2" HorizontalAlign="Center">
                <asp:Label ID="lblText" runat="server" Text="Don't have an account? " ForeColor="DarkGreen"></asp:Label>
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="CustomerSignUp.aspx" ForeColor="YellowGreen">Click here.</asp:HyperLink>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell HorizontalAlign="Center" ColumnSpan="2">
                <asp:Label ID="lblStatus" runat="server" Text=""></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>
</asp:Content>


