<%@ Page Title="" Language="C#" MasterPageFile="~/CustomerFacingMaster.Master" AutoEventWireup="true" CodeBehind="Events.aspx.cs" Inherits="GreenValleyAuctionsSystem.Events" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Table ID="tblEvents" runat="server" HorizontalAlign="Center">
        <asp:TableRow HorizontalAlign="Center">
            <asp:TableCell>
                <asp:Label ID="lblHeader" runat="server" Text="Upcoming Events" Font-Bold="true" Font-Size="X-Large"></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:GridView 
                    ID="gvAuctionEvent" 
                    DataSourceID="srcAuctionEvent"
                    runat="server"></asp:GridView>
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>

    <asp:SqlDataSource ID="srcAuctionEvent" ConnectionString="<%$ ConnectionStrings:Lab4 %>" runat="server" SelectCommand="SELECT auctionTitle as 'Auction Title', auctionDate as 'Auction Date' FROM AUCTIONEVENT"></asp:SqlDataSource>


</asp:Content>



