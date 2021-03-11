<%@ Page Title="" Language="C#" MasterPageFile="~/EmployeeFacingMaster.Master" AutoEventWireup="true" CodeBehind="EmployeeDashboard.aspx.cs" Inherits="GreenValleyAuctionsSystem.EmployeeDashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Table ID="tblWelcome" runat="server">
        <asp:TableRow HorizontalAlign="Center">
            <asp:TableCell HorizontalAlign="Center">
                <asp:Label ID="lblWelcometoDashboard" runat="server" Text="Welcome to the Employee Dashboard!" Font-Size="X-Large"></asp:Label>
                <br />
                <asp:Button ID="Button1" runat="server" Text="testButton" />
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblServiceRequests" runat="server" Text="New Service Requests:" Font-Bold="true" Font-Size="Large"></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>


    
    <asp:GridView ID="grdVwServiceRequest"
        runat="server"
        DataSourceID="datasrcServiceRequest"
        AllowSorting="true"
        AllowPaging="true"
        AutoGenerateColumns="false"
        DataKeyNames="requestID"
        GridLines="Horizontal" EmptyDataText="No Customer Service Requests Available"
        AlternatingRowStyle-BackColor="LightGray" CellPadding="5" HeaderStyle-HorizontalAlign="Left" HeaderStyle-BackColor="#266141"
        HeaderStyle-ForeColor="White"
        OnRowDataBound="grdVwServiceRequest_RowDataBound" OnRowCommand="grdVwServiceRequest_RowCommand">
        <Columns>
            <asp:BoundField ReadOnly="true" HeaderText="CustServiceRequestID"
                DataField="requestID" SortExpression="requestID" Visible="false" />
            <asp:TemplateField HeaderText="Customer Name" ItemStyle-Width="100px" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="left">
                <ItemTemplate>
                    <asp:Label ID="lblCustName" runat="server" Text=' <%#Eval("firstName") + " " + Eval("lastName")%>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField HeaderText="Service Type" DataField="serviceType" SortExpression="serviceType" ItemStyle-Width="150px" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" />
            <asp:BoundField HeaderText="Description" DataField="requestDescription" SortExpression="requestDescription" ItemStyle-Width="150px" ItemStyle-Wrap="true" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="left" />
            <asp:BoundField HeaderText="Date" DataField="timeDate" SortExpression="timeDate" ItemStyle-Width="150px" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" />
            <asp:TemplateField HeaderText="Days Since Request" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="100px">
                <ItemTemplate>
                    <asp:Label ID="lblDaysSince" runat="server" Text='<%#Eval("timebetween")%>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Seen?" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="100px">
                <ItemTemplate>
                    <asp:CheckBox
                        ID="seenCheckBox"
                        runat="server"
                        AutoPostBack="true"
                        OnCheckedChanged="seenCheckBox_CheckedChanged" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Send Response" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="100px">
                <ItemTemplate>
                    <asp:Button ID="btnResponse" runat="server" Text="Respond" CommandName="Respond" CommandArgument="<%# Container.DataItemIndex %>" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>

    <asp:Table ID="Table1" runat="server" >
        <asp:TableHeaderRow>
            <asp:TableCell>
                <br />
                <br />
                <asp:Label ID="lblSampleEmail" runat="server" Text="Sample Email Generated:" Font-Bold="true"></asp:Label>
            </asp:TableCell>
        </asp:TableHeaderRow>
        <asp:TableHeaderRow>
            <asp:TableCell Wrap="true" Width="200">
                <asp:Label ID="lblEmail" runat="server" Text="" Font-Italic="true"></asp:Label>
            </asp:TableCell>
        </asp:TableHeaderRow>
    </asp:Table>


    <asp:Table ID="Table2" runat="server">
        <asp:TableRow>
            <asp:TableCell >
                <br />
                <br />
                <br />
                <asp:Label ID="lblUpcomingAuctions" runat="server" Text="Upcoming Auctions:" Font-Bold="true" Font-Size="Larger"></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>

    <asp:GridView ID="grdvwUpcomingAuctions"
        runat="server"
        DataSourceID="datasrcUpcomingAuctions"
        AllowSorting="true"
        AllowPaging="true"
        AutoGenerateColumns="false"
        DataKeyNames="auctionEventID"
        GridLines="Horizontal" EmptyDataText="No Upcoming Auctions Available"
        AlternatingRowStyle-BackColor="LightGray" CellPadding="5" HeaderStyle-HorizontalAlign="Left" HeaderStyle-BackColor="#266141"
        HeaderStyle-ForeColor="White">
        <Columns>
            <asp:BoundField ReadOnly="true" HeaderText="auctionEventID"
                DataField="auctionEventID" SortExpression="auctionEventID" Visible="false" />
            <asp:BoundField HeaderText="Auction Title" DataField="auctionTitle" SortExpression="auctionTitle" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Left" ItemStyle-Width="150px" ItemStyle-Wrap="true" />
            <asp:BoundField HeaderText="Auction Date" DataField="auctionDate" SortExpression="auctionDate" />
        </Columns>

    </asp:GridView>

    <asp:SqlDataSource
        ID="datasrcServiceRequest"
        runat="server"
        ConnectionString="<%$ ConnectionStrings:Lab4 %>"
        SelectCommand="Select CUSTOMER.firstName, CUSTOMER.lastName, SERVICEREQUEST.requestID, SERVICEREQUEST.serviceType, 
        SERVICEREQUEST.timeDate, DATEDIFF(dd, SERVICEREQUEST.timeDate, GETDATE()) 
        AS 'timebetween', SERVICEREQUEST.requestDescription, SERVICEREQUEST.requestSeen FROM SERVICEREQUEST 
        inner join CUSTOMER on SERVICEREQUEST.customerID = CUSTOMER.customerID;"></asp:SqlDataSource>

    <asp:SqlDataSource
        ID="datasrcUpcomingAuctions"
        runat="server"
        ConnectionString="<%$ ConnectionStrings:Lab4 %>"
        SelectCommand="SELECT * FROM AUCTIONEVENT WHERE AUCTIONEVENT.auctionDate > GetDate()"></asp:SqlDataSource>
</asp:Content>
