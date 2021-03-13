<%@ Page Title="" Language="C#" MasterPageFile="~/EmployeeFacingMaster.Master" AutoEventWireup="true" CodeBehind="AuctionPickUpForm.aspx.cs" Inherits="GreenValleyAuctionsSystem.AuctionPickUpForm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <style>
        .greenBorder {
             border: 2px solid #266141;
             margin: 20px;
             padding: 10px;
        }
        #lblTitle {
            font-size: 50px;
            padding: 20px;
        }
        #possibleDates {
            width: 45%;
            float:left;
        }
        #line {
            margin:5px;
            margin-left:15px;
            border-bottom: 3px solid #266141;
            width: 50%;
        }
        #confirmedDates {
            width: 45%;
            float:right;
        }
    </style>
            <asp:Label ID="lblTitle" runat="server" Text="Auction Pick Up Form"></asp:Label>
            <asp:Table CellSpacing="7" ID="tbleAuctionPickUpForm" runat="server">
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

            <fieldset ID="possibleDates" class="greenBorder">
                <asp:Table ID="tble" runat="server" CellSpacing="7">
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label ID="lblPossibleDate" runat="server" Text="Possible Action Dates: " Font-Bold="true"></asp:Label>
                            <br />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label ID="lblBringIn" runat="server" Text="Bring in Date: "></asp:Label>                       
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="txtBringIn" runat="server" TextMode="Date"></asp:TextBox>
                            <br />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label ID="lblPickUp" runat="server" Text="Pick up Date: "></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="txtPickUp" runat="server" TextMode="Date"></asp:TextBox>
                            <br />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label ID="lblLookAt" runat="server" Text="Look at Date: "></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="txtLookAt" runat="server" TextMode="Date"></asp:TextBox>
                            <br />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label ID="lblAppraisal" runat="server" Text="Appraisal Date: "></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="txtAppraisal" runat="server" TextMode="Date"></asp:TextBox>
                            <br />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label ID="lblStorage" runat="server" Text="Storage Location: "></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="txtStorage" runat="server"></asp:TextBox>
                            <br />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Button ID="btnPossibleSubmit" runat="server" Text="Submit" />
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
            </fieldset>
             <fieldset ID="confirmedDates" class="greenBorder">
                <asp:Table ID="tbleConfirmed" runat="server" CellSpacing="7">
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label ID="lblConfirmedDate" runat="server" Text="Confirmed Action Dates: " Font-Bold="true"></asp:Label>
                            <br />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label ID="lblConfirmedBring" runat="server" Text="Bring in Date: "></asp:Label>                       
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="txtConfirmedBring" runat="server" TextMode="Date"></asp:TextBox>
                            <br />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label ID="lblConfirmedPick" runat="server" Text="Pick up Date: "></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox  ID="txtConfirmedPick" runat="server" TextMode="Date"></asp:TextBox>
                            <br />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label  ID="lblConfirmedLook" runat="server" Text="Look at Date: "></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox  ID="txtConfirmedLook" runat="server" TextMode="Date"></asp:TextBox>
                            <br />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label  ID="lblConfirmedAppraisal" runat="server" Text="Appraisal Date: "></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="txtConfirmedAppraisal" runat="server" TextMode="Date"></asp:TextBox>
                            <br />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label  ID="lblConfirmedStorage" runat="server" Text="Storage Location: "></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox  ID="txtConfirmedStorage" runat="server"></asp:TextBox>
                            <br />
                        </asp:TableCell>
                    </asp:TableRow>
                       <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label  ID="lblSalesDate" runat="server" Text="Sales Date: "></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="txtSalesDate" runat="server" TextMode="Date"></asp:TextBox>
                            <br />
                        </asp:TableCell>
                    </asp:TableRow>
                      <asp:TableRow>
                        <asp:TableCell>
                            <asp:Button ID="btnConfirmedSubmit" runat="server" Text="Submit" />
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
            </fieldset>




</asp:Content>
