<%@ Page Title="" Language="C#" MasterPageFile="~/EmployeeFacingMaster.Master" AutoEventWireup="true" CodeBehind="EmployeeDashboard.aspx.cs" Inherits="GreenValleyAuctionsSystem.EmployeeDashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style type="text/css">
     .hidden
     {
         display:none;
     }
</style>
 


<asp:Table ID="table1" runat="server">
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblSearch" runat="server" Text="Search Customer: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtbxSearch" runat="server"></asp:TextBox>
            </asp:TableCell>
            <asp:TableCell>
                <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" />
                <br />
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>

    <br />
    <br />
    <asp:GridView ID="grdvwServiceTable"
        runat="server"
        DataSourceID="datasrcServiceTable"
        AllowSorting="true"
        AllowPaging="true"
        AutoGenerateColumns="false"
        OnRowCommand="grdvwServiceTable_RowCommand"
        DataKeyNames="customerID"
        GridLines="Horizontal"
        EmptyDataText="No services in database associated with that customer."
        AlternatingRowStyle-BackColor="LightGray" CellPadding="5" HeaderStyle-HorizontalAlign="Left" HeaderStyle-BackColor="#266141"
        HeaderStyle-ForeColor="White">
        <Columns>
            <asp:BoundField HeaderText="CustomerID" DataField="customerID" SortExpression="customerID" ItemStyle-Width="150px" HeaderStyle-CssClass="hidden" ReadOnly="true" ItemStyle-CssClass="hidden"/> 
            <asp:BoundField HeaderText="First Name" DataField="firstName" SortExpression="firstName" ItemStyle-Width="150px" />
            <asp:BoundField HeaderText="Last Name" DataField="lastName" SortExpression="lastName" ItemStyle-Width="150px" />
            <asp:BoundField HeaderText="ServiceID" DataField="serviceID" SortExpression="serviceID" ItemStyle-Width="150px" HeaderStyle-CssClass="hidden" ItemStyle-CssClass="hidden" ReadOnly="true"/>
            <asp:BoundField HeaderText="Type of Service" DataField="serviceName" SortExpression="serviceName" ItemStyle-Width="200px" ReadOnly="true"/>
            <asp:BoundField HeaderText="Date/Time" DataField="timeDate" SortExpression="timeDate" ItemStyle-Width="200px" />
            <asp:BoundField HeaderText="Current Status" DataField="ticketProgress" SortExpression="ticketProgress" ItemStyle-Width="200px" />
            <asp:ButtonField buttontype="Link" commandname="view" Text="view"/>
        </Columns>
    </asp:GridView>
    <br />
    <asp:Label ID="lblHelp" runat="server" Text=""></asp:Label>

    <asp:SqlDataSource
        ID="datasrcServiceTable"
        runat="server"
        ConnectionString="<%$ ConnectionStrings:Lab4 %>"
        SelectCommand="SELECT CUSTOMER.customerID,CUSTOMER.firstName, CUSTOMER.lastName,SERVICE.serviceID, SERVICE.serviceName, SERVICE.timeDate, WORKFLOW.ticketProgress FROM dbo.CUSTOMER, dbo.WORKFLOW, dbo.SERVICE, dbo.SERVICETICKET
                        WHERE CUSTOMER.customerID = SERVICETICKET.customerID AND SERVICETICKET.serviceID = SERVICE.serviceID AND dbo.SERVICE.serviceID = dbo.WORKFLOW.serviceID AND WORKFLOW.ticketStatus = 'Active' AND WORKFLOW.ticketChangeDate IN
                        (SELECT MAX(WORKFLOW.ticketChangeDate)
                        FROM dbo.WORKFLOW, dbo.SERVICE
                        WHERE WORKFLOW.serviceID = SERVICE.serviceID
                        GROUP BY SERVICE.serviceID)"
        FilterExpression="firstName LIKE '%{0}%' OR lastName LIKE '%{0}%'">
        <FilterParameters>
            <asp:ControlParameter ControlID="txtbxSearch" Name="CustomerName"
                PropertyName="Text" Type="String" ConvertEmptyStringToNull="false" />
        </FilterParameters>
    </asp:SqlDataSource>




    <%--<asp:Table ID="tblWelcome" runat="server">
        <asp:TableRow HorizontalAlign="Center">
            <asp:TableCell HorizontalAlign="Center">
                <asp:Label ID="lblWelcometoDashboard" runat="server" Text="Welcome to the Employee Dashboard!" Font-Size="X-Large"></asp:Label>
                <br />
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
            <asp:BoundField HeaderText="Date" DataField="requestTimeDate" SortExpression="requestTimeDate" ItemStyle-Width="150px" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" />
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


   <%-- <asp:Table ID="Table2" runat="server">
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

    </asp:GridView>--%>

<%--    <asp:SqlDataSource
        ID="datasrcServiceRequest"
        runat="server"
        ConnectionString="<%$ ConnectionStrings:Lab4 %>"
        SelectCommand="Select CUSTOMER.firstName, CUSTOMER.lastName, SERVICEREQUEST.requestID, SERVICEREQUEST.serviceType, 
        SERVICEREQUEST.requestTimeDate, DATEDIFF(dd, SERVICEREQUEST.requestTimeDate, GETDATE()) 
        AS 'timebetween', SERVICEREQUEST.requestDescription, SERVICEREQUEST.requestSeen FROM SERVICEREQUEST 
        inner join CUSTOMER on SERVICEREQUEST.customerID = CUSTOMER.customerID;"></asp:SqlDataSource>--%>

   <%-- <asp:SqlDataSource
        ID="datasrcUpcomingAuctions"
        runat="server"
        ConnectionString="<%$ ConnectionStrings:Lab4 %>"
        SelectCommand="SELECT * FROM AUCTIONEVENT WHERE AUCTIONEVENT.auctionDate > GetDate()"></asp:SqlDataSource>--%>--%>
</asp:Content>
