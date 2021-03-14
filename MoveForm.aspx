<%@ Page Title="" Language="C#" MasterPageFile="~/EmployeeFacingMaster.Master" AutoEventWireup="true" CodeBehind="MoveForm.aspx.cs" Inherits="GreenValleyAuctionsSystem.MoveForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Table ID="tblHead" runat="server">
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblHeader" runat="server" Text="Move Form" Font-Bold="true" Font-Size="Larger"></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell HorizontalAlign="Left">
                <asp:Label ID="lblEnter" runat="server" Text="Enter the following information"></asp:Label>
            </asp:TableCell>
            <asp:TableCell></asp:TableCell>
            <asp:TableCell>
                <asp:Button ID="btnSave" runat="server" Text="Save Move Form" OnClick="btnSave_Click" />
            </asp:TableCell>
            <asp:TableCell>
                <asp:Button ID="btnPopulate" runat="server" Text="Populate" OnClick="btnPopulate_Click" CausesValidation="false" />
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>
    <fieldset class="new" id="fieldset1">
        <asp:Table ID="Table1" runat="server">
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblName" runat="server" Text="Select customer with existing move ticket:"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:DropDownList
                        ID="ddlCustomers"
                        runat="server"
                        DataSourceID="datasrcCustomers"
                        DataTextField="lastName"
                        OnSelectedIndexChanged="ddlCustomers_SelectedIndexChanged" AutoPostBack="true" AppendDataBoundItems="true">
                        <asp:ListItem Selected="True" Text="--Select--" Value="--Select--"></asp:ListItem>
                    </asp:DropDownList>
                </asp:TableCell>

            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblOriginAddress" runat="server" Text="Origin Address: "></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="lbloriginStreetAddress" runat="server" Text=""></asp:Label>
                    <asp:Label ID="lblSpace1" runat="server" Text=" "></asp:Label>
                    <asp:Label ID="lbloriginCity" runat="server" Text=""></asp:Label>
                    <asp:Label ID="lblSpace2" runat="server" Text=" "></asp:Label>
                    <asp:Label ID="lbloriginState" runat="server" Text=""></asp:Label>
                    <asp:Label ID="lblSpace3" runat="server" Text=" "></asp:Label>
                    <asp:Label ID="lbloriginZipcode" runat="server" Text=""></asp:Label>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblDestinationAddress" runat="server" Text="Destination Address: "></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="lbldestinationStreetAddress" runat="server" Text=""></asp:Label>
                    <asp:Label ID="lblSpace4" runat="server" Text=" "></asp:Label>
                    <asp:Label ID="lbldestinationCity" runat="server" Text=""></asp:Label>
                    <asp:Label ID="lblSpace5" runat="server" Text=" "></asp:Label>
                    <asp:Label ID="lbldestinationState" runat="server" Text=""></asp:Label>
                    <asp:Label ID="lblSpace6" runat="server" Text=" "></asp:Label>
                    <asp:Label ID="lbldestinationZipcode" runat="server" Text=""></asp:Label>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblNumOfFloors" runat="server" Text="Number of Floors: "></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtbxNumOfFloors" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator
                        ID="RequiredFieldValidator1"
                        runat="server"
                        ErrorMessage="RequiredFieldValidator"
                        ControlToValidate="txtbxNumOfFloors"
                        SetFocusOnError="true"
                        Text="* Required Field"
                        ForeColor="Red"></asp:RequiredFieldValidator>
                </asp:TableCell>

            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblDistance" runat="server" Text="Distance from Truck: "></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtbxDistance" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator
                        ID="RequiredFieldValidator2"
                        runat="server"
                        ErrorMessage="RequiredFieldValidator"
                        ControlToValidate="txtbxDistance"
                        SetFocusOnError="true"
                        Text="* Required Field"
                        ForeColor="Red"></asp:RequiredFieldValidator>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblDriveway" runat="server" Text="Driveway Accessibility: "></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtDriveway" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator
                        ID="RequiredFieldValidator3"
                        runat="server"
                        ErrorMessage="RequiredFieldValidator"
                        ControlToValidate="txtDriveway"
                        SetFocusOnError="true"
                        Text="* Required Field"
                        ForeColor="Red"></asp:RequiredFieldValidator>
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
                <asp:TableCell VerticalAlign="Top">
                    <asp:Label ID="lblFloors" runat="server" Text="Floors: "></asp:Label>
                </asp:TableCell>
                <asp:TableCell RowSpan="2">
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
        </asp:Table>
    </fieldset>
    <fieldset>
        <asp:Table ID="Table2" runat="server">
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblUpload" runat="server" Text="Upload Photos: "></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Button ID="btnUpload" runat="server" Text="Upload" OnClick="btnUpload_Click" />
                </asp:TableCell>
            </asp:TableRow>
            <%-- <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblRooms" runat="server" Text="Rooms "></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:Button ID="btnAddRoom" runat="server" Text="Add a Room" OnClick="btnAddRoom_Click" />
            </asp:TableCell>
        </asp:TableRow>--%>
        </asp:Table>
    </fieldset>



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


    <fieldset id="rooms">
  <%--      <asp:Table ID="Table3" runat="server" HorizontalAlign="Left">
            <asp:TableRow>
                <asp:TableCell>



                    <asp:Label
                        ID="lblRooms"
                        runat="server"
                        Text="Continuously Add Rooms As Needed."
                        Font="bold"></asp:Label>
                    <br />
                    <br />
                    <asp:Label ID="lblRoomName" runat="server" Text="Room Name or Number: "></asp:Label>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:TextBox ID="txtRoomName" runat="server"></asp:TextBox>
                    <br />
                    <asp:Label ID="lblFloorLevel" runat="server" Text="Floor Level: "></asp:Label>
                    <br />
                    <asp:TextBox ID="txtFloorLevel" runat="server"></asp:TextBox>
                    <br />
                    <asp:Label ID="lblBoxes" runat="server" Text="Boxes Needed: "></asp:Label>
                    <br />
                    <asp:TextBox ID="txtbxBoxes" runat="server"></asp:TextBox>
                    <br />
                    <asp:Label ID="lblNotes" runat="server" Text="Additional Notes: "></asp:Label>
                    <br />
                    <asp:TextBox ID="txtbxNotes" runat="server" TextMode="MultiLine"></asp:TextBox>
                    <br />
                    <br />

                    <asp:Button
                        ID="BtnAddRoom"
                        runat="server"
                        Text="Add"
                        OnClick="BtnAddRoom_Click1" CausesValidation="false" />--%>

                    <%--        <asp:Button
            ID="Button1"
            runat="server"
            Text="Save"
            OnClick="BtnSave_Click" />

        <asp:Button
            ID="BtnClear"
            runat="server"
            Text="Clear"
            OnClick="BtnClear_Click" />
        <br />--%>
                    <%--<asp:Label
                        ID="lblNotify"
                        runat="server"
                        ForeColor="Green"></asp:Label>
                </asp:TableCell>
                </asp:TableRow>
        </asp:Table>--%>

  <%--      <asp:Table runat="server" ID="moreRoomsTable" HorizontalAlign="right">
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label
                        runat="server"
                        Text="Rooms"></asp:Label>
                                &nbsp
                                &nbsp
                                &nbsp
                                &nbsp
                                <asp:Label
                                    runat="server"
                                    Text="Floor Level"
                                    ID="lblFloorLevel2"></asp:Label>
                    &nbsp
                                &nbsp
                                &nbsp
                                &nbsp
                    <asp:Label
                                    runat="server"
                                    Text="Boxes"
                                    ID="lblBoxes2"></asp:Label>
                    &nbsp
                                &nbsp
                                &nbsp
                                &nbsp
                    <asp:Label
                                    runat="server"
                                    Text="Notes"
                                    ID="lblNotes2"></asp:Label>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:ListBox
                        ID="lbxRooms"
                        runat="server"></asp:ListBox>
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>
    </fieldset>--%>
        </fieldset>
    <fieldset>
        <asp:GridView ID="grdvwRooms" 
            runat="server" ShowFooter="true"
            AutoGenerateColumns="false" OnRowCreated="grdvwRooms_RowCreated">
    <Columns>  
        <asp:BoundField DataField="RowNumber" HeaderText="Room Number" />  
        <asp:TemplateField HeaderText="Room">  
            <ItemTemplate>  
                <asp:TextBox ID="txtbxRoom" runat="server"></asp:TextBox>  
            </ItemTemplate>  
        </asp:TemplateField>  
        <asp:TemplateField HeaderText="Floor Level">  
            <ItemTemplate>  
                <asp:TextBox ID="txtbxFloorLevel" runat="server"></asp:TextBox>  
            </ItemTemplate>  
        </asp:TemplateField>  
        <asp:TemplateField HeaderText="Boxes">  
            <ItemTemplate>  
                <asp:TextBox ID="txtbxBoxes" runat="server"></asp:TextBox>  
            </ItemTemplate>  
        </asp:TemplateField> 
        <asp:TemplateField  HeaderText="Additional Notes" HeaderStyle-Width="250px">  
            <ItemTemplate>  
                <asp:TextBox ID="txtbxNotes" runat="server" Width="250px" TextMode="MultiLine"></asp:TextBox>  
            </ItemTemplate>  
            <FooterStyle HorizontalAlign="Right" />  
            <FooterTemplate>  
                <asp:Button ID="ButtonAdd" runat="server"   
                                     Text="Add Another Room"   
                                     OnClick="ButtonAdd_Click" CausesValidation="false" />  
            </FooterTemplate>  
        </asp:TemplateField>  
        <asp:TemplateField>  
            <ItemTemplate>  
                <asp:LinkButton ID="btnRemove" runat="server" CausesValidation="false"  
                                         OnClick="btnRemove_Click">Remove</asp:LinkButton>  
            </ItemTemplate>  
        </asp:TemplateField>  
    </Columns>  
</asp:gridview>  
        <asp:Button ID="btnSaveRooms" runat="server" Text="Save Rooms" />
        <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
    </fieldset>

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
        ORDER BY CUSTOMER.lastName ASC ;"></asp:SqlDataSource>

    <asp:SqlDataSource  
        ID="datasrcRooms" 
        runat="server" 
        ConnectionString="<%$ ConnectionStrings:Lab4 %>"></asp:SqlDataSource>

</asp:Content>
