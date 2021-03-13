<%@ Page Title="" Language="C#" MasterPageFile="~/EmployeeFacingMaster.Master" AutoEventWireup="true" CodeBehind="ServiceDetails.aspx.cs" Inherits="GreenValleyAuctionsSystem.ServiceDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <style>
        .buttons {
            padding:10px;
            width: 220px;
            height: 40px;
            position: relative;
            background: red;
        }
        .buttons:after {
            content: "";
            position: absolute;
            left: 0;
            bottom: 0;
            width: 0;
            height: 0;
            border-left: 20px solid white;
            border-top: 20px solid transparent;
            border-bottom: 20px solid transparent;
        }
        .buttons:before {
            content: "";
            position: absolute;
            right: -20px;
            bottom: 0;
            width: 0;
            height: 0;
            border-left: 20px solid red;
            border-top: 20px solid transparent;
            border-bottom: 20px solid transparent;
        }
            
        
        #tbleStatusBar {
            border-collapse: collapse;
        }
          #line {
            margin:15px;
            margin-left:15px;
            margin-right: 15px;
            border-bottom: 3px solid #266141;
            width: 95%;
           }
          #lblTitle {
            font-size: 50px;
            padding: 20px;
        }
    </style>
            <asp:Label ID="lblTitle" runat="server" Text=""></asp:Label>
            <asp:Table CellSpacing="7"  ID="tbleAuctionPickUpForm" runat="server">
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblAuctionPickUp" runat="server"  font-size="Large" Text="Customer Information: " Font-Bold="true"></asp:Label>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblFirstName" runat="server" Text=""></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                          <asp:Label ID="lblLastName" runat="server" Text=""></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                          <asp:Label ID="lblEmail" runat="server" Text=""></asp:Label>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                          <asp:Label ID="lblPhone" runat="server" Text=""></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                          <asp:Label ID="lblAddress" runat="server" Text=""></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                          <asp:Label ID="lblInitalContact" runat="server" Text=""></asp:Label>               
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>
        <div id="line">
        </div>
    <asp:Table ID="tbleStatusBar" runat="server" CellSpacing="0" CellPadding="0">
        <asp:TableRow >
            <asp:TableCell>
                <asp:Button ID="btnNewReqSubmitted" runat="server" Text="New Request Submitted" BorderStyle="Solid"  HorizontalAlign="Center" CssClass="buttons"  OnClick="btnNewReqSubmitted_Click"/>
            </asp:TableCell>
            <asp:TableCell >
                <asp:Button ID="btnConfirmed" runat="server" Text="Request Confirmed" BorderStyle="Solid"   HorizontalAlign="Center" CssClass="buttons" OnClick="btnConfirmed_Click" />
            </asp:TableCell>
            <asp:TableCell>
                <asp:Button ID="btnInProgress" runat="server" Text="Service In Progress"  BorderStyle="Solid" HorizontalAlign="Center" CssClass="buttons" OnClick="btnInProgress_Click"/>
            </asp:TableCell>
            <asp:TableCell>
                <asp:Button ID="btnComplete" runat="server" Text="Service Completed"  BorderStyle="Solid" HorizontalAlign="Center" CssClass="buttons" OnClick="btnComplete_Click"/>
            </asp:TableCell>
            <asp:TableCell>
                <asp:Button ID="btnAwaitingPayment" runat="server" Text="Waiting for Payment"  BorderStyle="Solid"  HorizontalAlign="Center" CssClass="buttons" OnClick="btnAwaitingPayment_Click"/>
            </asp:TableCell>
            <asp:TableCell>
                <asp:Button ID="btnPaymentApproved" runat="server" Text="Payment Approved"  BorderStyle="Solid"  HorizontalAlign="Center" CssClass="buttons" OnClick="btnPaymentApproved_Click"/>
            </asp:TableCell>
            <asp:TableCell>
                <asp:Button ID="btnAwaitingReview" runat="server" Text="Waiting for Review"  BorderStyle="Solid"   HorizontalAlign="Center" CssClass="buttons" OnClick="btnAwaitingReview_Click"/>
            </asp:TableCell>
            <asp:TableCell>
                <asp:Button ID="btnReviewComplete" runat="server" Text="Review Complete"  BorderStyle="Solid"  HorizontalAlign="Center" CssClass="buttons" OnClick="btnReviewComplete_Click"/>
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>

    <asp:Table ID="initalContact" runat="server">
        <asp:TableRow>
            <asp:TableCell>
                <asp:Button ID="btnInitalForm" runat="server" Text="View Inital Contact Form" OnClick="btnInitalForm_Click" Visible="false" />
            </asp:TableCell>
            <asp:TableCell>
                <asp:Panel ID="Panel1" runat="server" ></asp:Panel>
            </asp:TableCell>

        </asp:TableRow>
    </asp:Table>
         <asp:Table ID="tbleInventory" runat="server">
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblInventory" runat="server" Text="Items"></asp:Label>
                    </asp:TableCell>
                    </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:ListBox runat="server" ID="lbInventory" Width="100%"></asp:ListBox>
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>



</asp:Content>
