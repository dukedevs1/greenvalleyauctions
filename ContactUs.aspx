<%@ Page Title="" Language="C#" MasterPageFile="~/CustomerFacingMaster.Master" AutoEventWireup="true" CodeBehind="ContactUs.aspx.cs" Inherits="GreenValleyAuctionsSystem.ContactUs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:Table ID="tblContactUs" runat="server" HorizontalAlign="Center">
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblContactUs" runat="server" Text="Contact Us" Font-Size="X-Large"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:Label ID="lblInquiry" runat="server" Text="Inquiry" Font-Size="X-Large"></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblTelephone" runat="server" Text="Telephone: " Font-Bold="true" Font-Size="Larger"></asp:Label>
                <asp:Label ID="lblTelephoneNumber" runat="server" Text="(540) 434-4260"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:Label ID="lblServiceType" runat="server" Text="Service Type: " Font-Bold="true" Font-Size="Larger"></asp:Label>
                <asp:DropDownList ID="ddlServiceType" runat="server" Width="125px" Height="50px">
                    <asp:ListItem Text="" Value=""></asp:ListItem>
                    <asp:ListItem Text="Moving" Value="Moving"></asp:ListItem>
                    <asp:ListItem Text="Auction" Value="Auction"></asp:ListItem>
                </asp:DropDownList>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblEmail" runat="server" Text="Email: " Font-Bold="true" Font-Size="Larger"></asp:Label>
                <asp:Label ID="lblEmailAddress" runat="server" Text="info@greenvalleyauctions.com"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:Label ID="lblInquiryInfo" runat="server" Text="Inquiry Information: " Font-Bold="true" Font-Size="Larger"></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>

            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtInquiryInfo" runat="server" Width="250px" Height="25px"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblMailingShippingAddress" runat="server" Text="Mailing/Shipping Address" Font-Size="X-Large"></asp:Label>
            </asp:TableCell>
            <asp:TableCell HorizontalAlign="Center">
                <asp:Button ID="btnSubmit" runat="server" Text="Submit Inquiry" Width="150px" ForeColor="Wheat" BackColor="DarkGreen" OnClick="btnSubmit_Click" />
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblInfo" runat="server" Text="Green Valley Auctions & Moving, Inc." Font-Bold="true" Font-Size="Larger"></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblAdd" runat="server" Text="2259 Green Valley Lane"></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblAddTwo" runat="server" Text="Mt. Crawford, Virginia 22841"></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>

            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblHourOp" runat="server" Text="Hours of Operation" Font-Size="X-Large"></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblMonFri" runat="server" Text="Monday through Friday: " Font-Bold="true" Font-Size="Larger"></asp:Label>
                <asp:Label ID="lblAddInfo" runat="server" Text="8:00 a.m. to 4:30 p.m."></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblAddInfoTwo" runat="server" Text="(We are closed between 12:00 p.m. and 1:00 p.m. for lunch.)" Font-Italic="true"></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>

</asp:Content>


