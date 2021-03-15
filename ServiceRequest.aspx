<%@ Page Title="" Language="C#" MasterPageFile="~/CustomerFacingMaster.Master" AutoEventWireup="true" CodeBehind="ServiceRequest.aspx.cs" Inherits="GreenValleyAuctionsSystem.ServiceRequest" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <asp:Table ID="Table1" runat="server" HorizontalAlign="Center">
        <asp:TableRow>
            <asp:TableCell HorizontalAlign="Center" ColumnSpan="2">
                <asp:Label ID="lblServiceRequest" runat="server" Text="Service Request" Font-Bold="true" Font-Size="X-Large"></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblServiceType" runat="server" Text="Service Type: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:DropDownList ID="ddlServiceType" runat="server" AutoPostBack="true" Width="175px">
                    <asp:ListItem Text="Select a Service Type" Value=""></asp:ListItem>
                    <asp:ListItem Text="Moving" Value="Moving"></asp:ListItem>
                    <asp:ListItem Text="Auction" Value="Auction"></asp:ListItem>
                </asp:DropDownList>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblRequestDescription" runat="server" Text="Request Description: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtRequestDescription" runat="server" Width="175px" Height="100px"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell HorizontalAlign="Center" ColumnSpan="2">
                <asp:Button ID="btnSubmit" runat="server" Text="Submit Request" ForeColor="White" BackColor="DarkGreen" OnClick="btnSubmit_Click" />
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>
</asp:Content>


