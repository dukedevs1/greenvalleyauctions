<%@ Page Title="" Language="C#" MasterPageFile="~/GeneralMaster.Master" AutoEventWireup="true" CodeBehind="CustomerSignUp.aspx.cs" Inherits="GreenValleyAuctionsSystem.CustomerSignUp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <br />
    <br />
    <br />
       <br />
    <br />
    <br />

    <asp:Table ID="Table1" runat="server" HorizontalAlign="Center" BorderStyle="Solid" BorderColor="DarkOliveGreen">
        
        <asp:TableRow>
            <asp:TableCell HorizontalAlign="Center" ColumnSpan="2">
                <asp:Label ID="lblCustomerSignUp" runat="server" Text="Customer Sign Up" Font-Bold="true" ForeColor="DarkOliveGreen" Font-Size="Larger"></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell Width="200px">
                <asp:Label ID="lblFirstName" runat="server" Text="First Name:" ForeColor="DarkGreen"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtFirstName" runat="server" ForeColor="DimGray" Width="175px"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblLastName" runat="server" Text="Last Name:" ForeColor="DarkGreen"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtLastName" runat="server" ForeColor="DimGray" Width="175px"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblEmailAddress" runat="server" Text="Email Address:" ForeColor="DarkGreen"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtEmailAddress" runat="server" ForeColor="DimGray" Width="175px"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblPassword1" runat="server" Text="Password:" ForeColor="DarkGreen"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtPassword1" runat="server" ForeColor="DimGray" Width="175px" TextMode="Password"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblPassword2" runat="server" Text="Confirm Password:" ForeColor="DarkGreen"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtPassword2" runat="server" ForeColor="DimGray" Width="175px" TextMode="Password"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblPhoneNumber" runat="server" Text="Phone Number:" ForeColor="DarkGreen"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtPhoneNumber" runat="server" ForeColor="DimGray" Width="175px"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblAddress" runat="server" Text="Address:" ForeColor="DarkGreen"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtAddress" runat="server" ForeColor="DimGray" Width="175px"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblCity" runat="server" Text="City:" ForeColor="DarkGreen"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtCity" runat="server" ForeColor="DimGray" Width="175px"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblState" runat="server" Text="State:" ForeColor="DarkGreen"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtState" runat="server" ForeColor="DimGray" Width="175px"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblZipCode" runat="server" Text="Zip Code:" ForeColor="DarkGreen"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtZipCode" runat="server" ForeColor="DimGray" Width="175px"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell HorizontalAlign="Center" ColumnSpan="2">
                <asp:Button ID="btnSignUp" runat="server" Text="Sign Up" BackColor="DarkOliveGreen" ForeColor="White" Width="100px" OnClick="btnSignUp_Click" />
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell HorizontalAlign="Center" ColumnSpan="2">
                <asp:Label ID="lblStatus" runat="server" Text=""></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>
</asp:Content>


