<%@ Page Title="" Language="C#" MasterPageFile="~/EmployeeFacingMaster.Master" AutoEventWireup="true" CodeBehind="MoveForm.aspx.cs" Inherits="GreenValleyAuctionsSystem.MoveForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Table ID="tblHead" runat="server" HorizontalAlign="Center">
        <asp:TableRow>
            <asp:TableCell ColumnSpan="3" HorizontalAlign="Center">
                <asp:Label ID="lblHeader" runat="server" Text="Move Form"></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell HorizontalAlign="Left">
                <asp:Label ID="lblEnter" runat="server" Text="Enter the following information"></asp:Label>
            </asp:TableCell>
            <asp:TableCell></asp:TableCell>
            <asp:TableCell>
                <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" />
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>
    <asp:Table ID="Table1" runat="server" HorizontalAlign="Center">
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblName" runat="server" Text="Select a Customer:"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:DropDownList
                    ID="ddlCustomers"
                    runat="server"
                    DataSourceID="datasrcCustomers"
                    DataTextField="lastName"
                    OnSelectedIndexChanged="ddlCustomers_SelectedIndexChanged" AutoPostBack="true">
                </asp:DropDownList>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblOriginAddress" runat="server" Text="Origin Address: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:Label ID="lblOrigin" runat="server" Text=""></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblDestinationAddress" runat="server" Text="Destination Address: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:Label ID="lblDestination" runat="server" Text=""></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblNumOfFloors" runat="server" Text="Number of Floors: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtbxNumOfFloors" runat="server"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblDistance" runat="server" Text="Distance from Truck: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtbxDistance" runat="server"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblDriveway" runat="server" Text="Driveway Accessibility: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtDriveway" runat="server"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell VerticalAlign="Top">
                <asp:Label ID="lblLoadingConditions" runat="server" Text="Loading Conditions: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:CheckBoxList
                    ID="cblLoadingConditions"
                    runat="server" AutoPostBack="true"
                    OnSelectedIndexChanged="cblLoadingConditions_SelectedIndexChanged">
                    <asp:ListItem Text="Poor Access for Truck" />
                    <asp:ListItem Text="Narrow Gates" />
                    <asp:ListItem Text="Steep Driveway" />
                    <asp:ListItem Text="Other:" />
                </asp:CheckBoxList>
            </asp:TableCell>
            <asp:TableCell VerticalAlign="Bottom">
                <asp:TextBox ID="txtbxOtherCondition" runat="server" Visible="false" TextMode="MultiLine"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell VerticalAlign="Top">
                <asp:Label ID="lblFloors" runat="server" Text="Floors: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:CheckBoxList
                    ID="cblFloors"
                    runat="server" AutoPostBack="true"
                    OnSelectedIndexChanged="cblFloors_SelectedIndexChanged">
                    <asp:ListItem Text="Basement" />
                    <asp:ListItem Text="First floor" />
                    <asp:ListItem Text="Second floor" />
                    <asp:ListItem Text="Attic" />
                    <asp:ListItem Text="Garage" />
                    <asp:ListItem Text="Other:" />
                </asp:CheckBoxList>
            </asp:TableCell>
            <asp:TableCell VerticalAlign="Bottom">
                <asp:TextBox ID="txtbxOtherFloor" runat="server" Visible="false" TextMode="MultiLine"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell VerticalAlign="Top">
                <asp:Label ID="lblOutdoor" runat="server" Text="Outdoor Spaces: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:CheckBoxList
                    ID="cblOutdoor"
                    runat="server" AutoPostBack="true"
                    OnSelectedIndexChanged="cblOutdoor_SelectedIndexChanged">
                    <asp:ListItem Text="Out buildings" />
                    <asp:ListItem Text="Patio" />
                    <asp:ListItem Text="Other:" />
                </asp:CheckBoxList>
            </asp:TableCell>
            <asp:TableCell VerticalAlign="Bottom">
                <asp:TextBox ID="txtbxOtherOutdoor" runat="server" Visible="false" TextMode="MultiLine"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblUpload" runat="server" Text="Upload Photos: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:Button ID="btnUpload" runat="server" Text="Upload" OnClick="btnUpload_Click" />
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblRooms" runat="server" Text="Rooms "></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:Button ID="btnAddRoom" runat="server" Text="Add a Room" OnClick="btnAddRoom_Click" />
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>




    <%--<asp:Table ID="tblRooms" runat="server" HorizontalAlign="Center" Visible="false">
        
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblRoomName" runat="server" Text="Room Name: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtbxRoomName" runat="server"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblFloorLevel" runat="server" Text="Floor Level: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:DropDownList ID="ddlFloors"
                    runat="server">
                </asp:DropDownList>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblBoxes" runat="server" Text="Boxes (type/amount): "></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtbxBoxes" runat="server"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblAddtlNotes" runat="server" Text="Additional Notes: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtbxAddtlNotes" runat="server" TextMode="MultiLine"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>--%>

    <br />

    <asp:SqlDataSource 
        ID="datasrcCustomers" 
        runat="server" 
        ConnectionString="<%$ ConnectionStrings:Lab4 %>"
        SelectCommand="SELECT DISTINCT CUSTOMER.lastName,
        SERVICETICKET.serviceTicketID, SERVICE.serviceName, WORKFLOW.ticketStatus
        FROM SERVICETICKET 
        INNER JOIN CUSTOMER on CUSTOMER.customerID = SERVICETICKET.customerID
        INNER JOIN SERVICE on SERVICE.serviceID = SERVICETICKET.serviceID
        INNER JOIN WORKFLOW on	WORKFLOW.serviceID = SERVICE.serviceID
        WHERE WORKFLOW.ticketStatus = 'Active' AND SERVICE.serviceName = 'Moving'
        ORDER BY CUSTOMER.lastName ASC ;">

    </asp:SqlDataSource>

</asp:Content>
