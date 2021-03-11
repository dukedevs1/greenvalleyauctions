<%@ Page Title="" Language="C#" MasterPageFile="~/EmployeeFacingMaster.Master" AutoEventWireup="true" CodeBehind="StatusBar.aspx.cs" Inherits="GreenValleyAuctionsSystem.StatusBar" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Table ID="Table1" runat="server">
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblStatusBar" runat="server" Text="Status Bar: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
            <asp:DropDownList ID="ddlStatus"
                runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlStatus_SelectedIndexChanged">
                <asp:ListItem Enabled="true" Text="Select Status" Value="-1"></asp:ListItem>
                <asp:ListItem Text="New Request Submitted" Value="1"></asp:ListItem>
                <asp:ListItem Text="Request Confirmed" Value="2"></asp:ListItem> 
                <asp:ListItem Text="Service In Progress" Value="3"></asp:ListItem>
                <asp:ListItem Text="Service Completed" Value="4"></asp:ListItem> 
                <asp:ListItem Text="Waiting for Payment" Value="5"></asp:ListItem>
                <asp:ListItem Text="Payment Approved" Value="6"></asp:ListItem> 
                <asp:ListItem Text="Waiting for Customer Review" Value="7"></asp:ListItem>
                <asp:ListItem Text="Review Complete" Value="8"></asp:ListItem> 
            </asp:DropDownList>
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>
    <asp:Table ID="Table2" runat="server">
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblNewReqSubmitted" runat="server" Text="New Request Submitted"  BorderStyle="Solid" BackColor="LightGray" Width="100px" HorizontalAlign="Center" ></asp:Label>
            </asp:TableCell>
            <asp:TableCell >
                <asp:Label ID="lblConfirmed" runat="server" Text="Request Confirmed" BorderStyle="Solid" BackColor="LightGray" Width="100px" HorizontalAlign="Center"></asp:Label >
            </asp:TableCell>
            <asp:TableCell>
                <asp:Label ID="lblInProgress" runat="server" Text="Service In Progress"  BorderStyle="Solid" BackColor="LightGray" Width="100px" HorizontalAlign="Center"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:Label ID="lblComplete" runat="server" Text="Service Completed"  BorderStyle="Solid" BackColor="LightGray" Width="100px" HorizontalAlign="Center"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:Label ID="lblAwaitingPayment" runat="server" Text="Waiting for Payment"  BorderStyle="Solid" BackColor="LightGray" Width="100px" HorizontalAlign="Center"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:Label ID="lblPaymentApproved" runat="server" Text="Payment Approved"  BorderStyle="Solid" BackColor="LightGray" Width="100px" HorizontalAlign="Center"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:Label ID="lblAwaitingReview" runat="server" Text="Waiting for Review"  BorderStyle="Solid" BackColor="LightGray" Width="100px" HorizontalAlign="Center"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:Label ID="lblReviewComplete" runat="server" Text="Review Complete"  BorderStyle="Solid" BackColor="LightGray" Width="100px" HorizontalAlign="Center"></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>

    <asp:Table ID="Table3" runat="server">
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblTest" runat="server" Text=""></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:Panel ID="Panel1" runat="server" ></asp:Panel>
            </asp:TableCell>

        </asp:TableRow>
    </asp:Table>
</asp:Content>
