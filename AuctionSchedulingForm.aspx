<%@ Page Title="" Language="C#" MasterPageFile="~/EmployeeFacingMaster.Master" AutoEventWireup="true" CodeBehind="AuctionSchedulingForm.aspx.cs" Inherits="GreenValleyAuctionsSystem.AuctionSchedulingForm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

            <asp:Label ID="lblTitle" runat="server" Text="Auction Scheduling Form"></asp:Label>
            <section id="section">
           <asp:TableRow ID="search">
            <asp:TableCell>
                <asp:TextBox ID="txtbxSearch" runat="server"></asp:TextBox>
            </asp:TableCell>
            <asp:TableCell>
                <asp:Button ID="btnSearch" runat="server" Text="Search Customer" OnClick="btnSearch_Click" CausesValidation="false"/>
                <br />
            </asp:TableCell>
        </asp:TableRow>
        <br />
    <asp:GridView 
        ID="grdvwAuctionTable"
        runat="server"
        DataSourceID="datasrcServiceTable"
        AllowSorting="true"
        AllowPaging="true"
        AutoGenerateColumns="false"
        AutoGenerateEditButton="true"
        DataKeyNames="serviceID"
        GridLines="Horizontal"
        EmptyDataText="No services in database associated with that customer."
        AlternatingRowStyle-BackColor="LightGray" CellPadding="5" HeaderStyle-HorizontalAlign="Left" HeaderStyle-BackColor="#266141"
        HeaderStyle-ForeColor="White"
        CausesValidation="false">
        <Columns>
            <asp:BoundField HeaderText="CustomerID" DataField="customerID" SortExpression="customerID" ItemStyle-Width="150px" Visible="false" ReadOnly="true"/>
            <asp:BoundField HeaderText="First Name" DataField="firstName" SortExpression="firstName" ItemStyle-Width="150px" />
            <asp:BoundField HeaderText="Last Name" DataField="lastName" SortExpression="lastName" ItemStyle-Width="150px" />
            <asp:BoundField HeaderText="ServiceID" DataField="serviceID" SortExpression="serviceID" ItemStyle-Width="150px" Visible="false" ReadOnly="true"/>
            <asp:BoundField HeaderText="Type of Service" DataField="serviceName" SortExpression="serviceName" ItemStyle-Width="200px" ReadOnly="true"/>
            <asp:BoundField HeaderText="Date/Time" DataField="timeDate" SortExpression="timeDate" ItemStyle-Width="200px" />
            <asp:BoundField HeaderText="Current Status" DataField="ticketStatus" SortExpression="ticketStatus" ItemStyle-Width="200px" />
          
        </Columns>
    </asp:GridView>

        <br />
        <asp:Label ID="lblInventory" runat="server" Text="" Font-Bold="true" Font-Size="20px"></asp:Label>
           <asp:GridView
            runat="server"
            CssClass="gridSpacing"
            ID="viewInventory"
            DataKeyNames ="Inventory Description">  
        </asp:GridView>    
         </section>
        <br />
                <fieldset class="new" id="fieldset2">
            <asp:Table ID="NewAuctionTable" runat="server">
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label 
                            ID="lblNew" 
                            runat="server" 
                            Text="Add a New Auction Service Ticket"
                            Font="bold"></asp:Label>
                    </asp:TableCell>
                     <asp:TableCell>
                         <asp:Button ID="BtnPopulate"
                             runat="server"
                             Text="Populate" 
                             OnClick="BtnPopulate_Click" 
                             CausesValidation="false" />
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                </asp:TableRow>
                 <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label
                            ID="lblStatus" 
                            runat="server"
                            Text="Customer Status: "></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label
                            ID="lblNewTicket" 
                            runat="server"
                            Text="New Ticket"></asp:Label>
                    </asp:TableCell>
                </asp:TableRow>
                 <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label 
                            ID="lblCustID" 
                            runat="server"
                            Text="Customer Name: "></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:DropDownList 
                            ID="ddlCustomer" 
                            runat="server"
                            DataSourceID="dataSourceCustList"
                            DataTextField= "customerName"
                            DataValueField="customerID"
                             AutoPostBack="true"></asp:DropDownList>
                    </asp:TableCell>
                        <asp:TableCell>
                        <asp:Label
                            ID="Label1" 
                            runat="server"
                            Text="Note Title: "></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox 
                            ID="txtTitle" 
                            runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator 
                            ID="RFVTitle" 
                            runat="server" 
                            ErrorMessage="RequiredFieldValidator" 
                            ControlToValidate="txtTitle"
                            SetFocusOnError="true" 
                            Text="* Required Field" 
                            ForeColor="Red"></asp:RequiredFieldValidator>
                    </asp:TableCell>
                </asp:TableRow>
                  <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label 
                            ID="lblEmpID" 
                            runat="server" 
                            Text="Employee: "></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:DropDownList 
                            ID="ddlEmpList" 
                            runat="server"
                            DataSourceID="dataSourceEmployeeList"
                            DataTextField= "Employee"
                            DataValueField="employeeID"
                             AutoPostBack="true"></asp:DropDownList>
                    </asp:TableCell>
                         <asp:TableCell>
                        <asp:Label
                            ID="lblNote" 
                            runat="server"
                            Text="Note Details: "></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox 
                            ID="txtNote" 
                            runat="server"
                            TextMode="MultiLine"
                            ></asp:TextBox>
                        <asp:RequiredFieldValidator 
                            ID="RFVNote" 
                            runat="server" 
                            ErrorMessage="RequiredFieldValidator" 
                            ControlToValidate="txtNote"
                            SetFocusOnError="true" 
                            Text="* Required Field" 
                            ForeColor="Red"></asp:RequiredFieldValidator>
                    </asp:TableCell>
                </asp:TableRow>
                  <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label 
                            ID="lblDate"
                            runat="server" 
                            Text="Date of Auction: "></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox 
                            ID="txtDate" 
                            runat="server" 
                            TextMode="Date"></asp:TextBox>
                            <asp:RequiredFieldValidator 
                                ID="RequiredFieldValidator12"
                                runat="server" 
                                ErrorMessage="RequiredFieldValidator" 
                                ControlToValidate="txtDate"
                                SetFocusOnError="true" 
                                Text="* Required Field" 
                                ForeColor="Red"></asp:RequiredFieldValidator>
                    </asp:TableCell>
                        <asp:TableCell>
                        <asp:Label 
                            ID="lblTruck" 
                            runat="server" 
                            Text="Truck Accessibility: "></asp:Label>
                    </asp:TableCell>
                     <asp:TableCell>
                      <asp:TextBox 
                            ID="txtTruck" 
                            runat="server" ></asp:TextBox>
                            <asp:RequiredFieldValidator 
                                ID="RFVComp"
                                runat="server"
                                ErrorMessage="RequiredFieldValidator" 
                                ControlToValidate="txtTruck" 
                                SetFocusOnError="true"
                                Text="* Required Field" 
                                ForeColor="Red"></asp:RequiredFieldValidator>
                    </asp:TableCell>
                </asp:TableRow>
                  <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label 
                            ID="lblTime"
                            runat="server" 
                            Text="Time of Auction: "
                            TextMode="Date"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox 
                            ID="txtTime" 
                            runat="server" ></asp:TextBox>
                            <asp:RequiredFieldValidator 
                                ID="RequiredFieldValidator13"
                                runat="server" 
                                ErrorMessage="RequiredFieldValidator" 
                                ControlToValidate="txtDate"
                                SetFocusOnError="true" 
                                Text="* Required Field" 
                                ForeColor="Red"></asp:RequiredFieldValidator>
                         <asp:RegularExpressionValidator 
                               ID="REVTime" 
                               runat="server" 
                               ControlToValidate="txtTime" 
                               ErrorMessage="Must be in hh:mm:ss AM/PM format!" 
                               ForeColor="Red"
                               ValidationExpression="^(([0]?[1-9])|([1][0-2])):(([0-5][0-9])|([1-9])):([0-5][0-9]) [AP][M]$" ></asp:RegularExpressionValidator>
                    </asp:TableCell>
                         <asp:TableCell>
                        <asp:Label 
                            ID="lblSupplies" 
                            runat="server" 
                            Text="Supplies Needed:"></asp:Label>
                    </asp:TableCell>
                     <asp:TableCell>
                      <asp:TextBox 
                            ID="txtSupplies" 
                            runat="server"
                          TextMode="MultiLine"></asp:TextBox>
                            <asp:RequiredFieldValidator 
                                ID="RequiredFieldValidator1"
                                runat="server"
                                ErrorMessage="RequiredFieldValidator" 
                                ControlToValidate="txtSupplies" 
                                SetFocusOnError="true"
                                Text="* Required Field" 
                                ForeColor="Red"></asp:RequiredFieldValidator>
                    </asp:TableCell>
                </asp:TableRow>
                    <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label 
                            ID="lblComp" 
                            runat="server" 
                            Text="Service Completion Date: "></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox 
                            ID="txtComp" 
                            runat="server" ></asp:TextBox>
                            <asp:RequiredFieldValidator 
                                ID="RequiredFieldValidator7"
                                runat="server"
                                ErrorMessage="RequiredFieldValidator" 
                                ControlToValidate="txtComp" 
                                SetFocusOnError="true"
                                Text="* Required Field" 
                                ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:CompareValidator 
                            ID="CVComp" 
                            ControlToValidate="txtComp" 
                            Text="Must be in YYYY-MM-DD format!"
                            runat="server" 
                            Operator="DataTypeCheck"
                            Type="Date" 
                            ErrorMessage="CompareValidator" 
                            ForeColor="Red"></asp:CompareValidator>
                    </asp:TableCell>
                         <asp:TableCell>
                        <asp:Label 
                            ID="lblBoxNum" 
                            runat="server" 
                            Text="Number of Boxes:"></asp:Label>
                    </asp:TableCell>
                     <asp:TableCell>
                      <asp:TextBox 
                            ID="txtBoxes" 
                            runat="server" ></asp:TextBox>
                            <asp:RequiredFieldValidator 
                                ID="RequiredFieldValidator2"
                                runat="server"
                                ErrorMessage="RequiredFieldValidator" 
                                ControlToValidate="txtBoxes" 
                                SetFocusOnError="true"
                                Text="* Required Field" 
                                ForeColor="Red"></asp:RequiredFieldValidator>
                    </asp:TableCell>
                </asp:TableRow>
                  <asp:TableRow>
                        <asp:TableCell>
                        <asp:Label 
                            ID="lblBoxType" 
                            runat="server" 
                            Text="Box Type:"></asp:Label>
                    </asp:TableCell>
                     <asp:TableCell>
                      <asp:TextBox 
                            ID="txtBoxType" 
                            runat="server" ></asp:TextBox>
                            <asp:RequiredFieldValidator 
                                ID="RequiredFieldValidator3"
                                runat="server"
                                ErrorMessage="RequiredFieldValidator" 
                                ControlToValidate="txtBoxType" 
                                SetFocusOnError="true"
                                Text="* Required Field" 
                                ForeColor="Red"></asp:RequiredFieldValidator>
                    </asp:TableCell>
                       <asp:TableCell>
                        <asp:Label 
                            ID="lblTrucks" 
                            runat="server" 
                            Text="Number of Trucks: "></asp:Label>
                    </asp:TableCell>
                     <asp:TableCell>
                      <asp:TextBox 
                            ID="txtTrucks" 
                            runat="server" ></asp:TextBox>
                            <asp:RequiredFieldValidator 
                                ID="RequiredFieldValidator5"
                                runat="server"
                                ErrorMessage="RequiredFieldValidator" 
                                ControlToValidate="txtTrucks" 
                                SetFocusOnError="true"
                                Text="* Required Field" 
                                ForeColor="Red"></asp:RequiredFieldValidator>
                    </asp:TableCell>
                     </asp:TableRow>
                   <asp:TableRow>
                          <asp:TableCell>
                        <asp:Label 
                            ID="lblCrew" 
                            runat="server" 
                            Text="Crew Members:"></asp:Label>
                    </asp:TableCell>
                     <asp:TableCell>
                      <asp:TextBox 
                            ID="txtCrew" 
                            runat="server"
                           TextMode="MultiLine"></asp:TextBox>
                            <asp:RequiredFieldValidator 
                                ID="RequiredFieldValidator4"
                                runat="server"
                                ErrorMessage="RequiredFieldValidator" 
                                ControlToValidate="txtCrew" 
                                SetFocusOnError="true"
                                Text="* Required Field" 
                                ForeColor="Red"></asp:RequiredFieldValidator>
                    </asp:TableCell>
                     </asp:TableRow>
                  <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label 
                            ID="lblAddress"
                            runat="server" 
                            Text="Pickup Street Address: "></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox 
                            ID="txtAddress" 
                            runat="server" ></asp:TextBox>
                            <asp:RequiredFieldValidator
                                ID="RVAddress"
                                runat="server" 
                                ErrorMessage="RequiredFieldValidator" 
                                ControlToValidate="txtAddress" 
                                SetFocusOnError="true"
                                Text="* Required Field" 
                                ForeColor="Red"></asp:RequiredFieldValidator>
                    </asp:TableCell>
                          <asp:TableCell>
                        <asp:Label 
                            ID="lblCity"
                            runat="server" 
                            Text="Pickup City: "></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox 
                            ID="txtCity" 
                            runat="server" ></asp:TextBox>
                            <asp:RequiredFieldValidator
                                ID="RequiredFieldValidator8"
                                runat="server" 
                                ErrorMessage="RequiredFieldValidator" 
                                ControlToValidate="txtCity" 
                                SetFocusOnError="true"
                                Text="* Required Field" 
                                ForeColor="Red"></asp:RequiredFieldValidator>
                    </asp:TableCell>
                </asp:TableRow>
                 <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label 
                            ID="lblState"
                            runat="server" 
                            Text="Pickup State: "></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox 
                            ID="txtState" 
                            runat="server" ></asp:TextBox>
                            <asp:RequiredFieldValidator
                                ID="RequiredFieldValidator9"
                                runat="server" 
                                ErrorMessage="RequiredFieldValidator" 
                                ControlToValidate="txtState" 
                                SetFocusOnError="true"
                                Text="* Required Field" 
                                ForeColor="Red"></asp:RequiredFieldValidator>
                    </asp:TableCell>
                          <asp:TableCell>
                        <asp:Label 
                            ID="lblZipCode"
                            runat="server" 
                            Text="Pickup ZipCode: "></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox 
                            ID="txtZipCode" 
                            runat="server" ></asp:TextBox>
                            <asp:RequiredFieldValidator
                                ID="RequiredFieldValidator10"
                                runat="server" 
                                ErrorMessage="RequiredFieldValidator" 
                                ControlToValidate="txtZipCode" 
                                SetFocusOnError="true"
                                Text="* Required Field" 
                                ForeColor="Red"></asp:RequiredFieldValidator>
                    </asp:TableCell>
                </asp:TableRow>
                   <asp:TableRow>
                          <asp:TableCell>
                        <asp:Label 
                            ID="lblTrucksAssigned" 
                            runat="server" 
                            Text="Trucks Assigned:"></asp:Label>
                    </asp:TableCell>
                     <asp:TableCell>
                      <asp:TextBox 
                            ID="txtTrucksAssigned" 
                            runat="server" ></asp:TextBox>
                            <asp:RequiredFieldValidator 
                                ID="RequiredFieldValidator6"
                                runat="server"
                                ErrorMessage="RequiredFieldValidator" 
                                ControlToValidate="txtTrucksAssigned" 
                                SetFocusOnError="true"
                                Text="* Required Field" 
                                ForeColor="Red"></asp:RequiredFieldValidator>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label 
                            ID="lblVehicle" 
                            runat="server"
                            Text="Vehicle: "></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:DropDownList 
                            ID="ddlVehicle" 
                            runat="server"
                            DataSourceID="dataSourceVehicleList"
                            DataTextField= "Vehicle"
                            DataValueField="equipmentID"
                            AutoPostBack="true"></asp:DropDownList>
                    </asp:TableCell>
                    </asp:TableRow>
                    </asp:Table>
                    <fieldset id="inventory">
                            <asp:Label 
                            ID="lblInv2" 
                            runat="server"
                            Text="Continuously Add Inventory As Needed."
                            Font="bold"></asp:Label>
                        <br />
                        <br />
                        <asp:Label ID="lblAddItem" runat="server" Text="Add Inventory: "></asp:Label>
                        <br />
                        <asp:TextBox ID="txtAddItem" runat="server"></asp:TextBox>
                        <br />
                        <asp:Label ID="lblInvCost" runat="server" Text="Inventory Cost: "></asp:Label>
                        <br />
                        <asp:TextBox ID="txtInvCost" runat="server"></asp:TextBox>
                        <br />
                        <br />
                        <asp:Button 
                            ID="BtnAddInv" 
                            runat="server" 
                            Text="Add" 
                            OnClick="BtnAddInv_Click" />
          
                </fieldset>
                        <asp:Button
                            ID="BtnSave" 
                            runat="server" 
                            Text="Save" 
                            OnClick="BtnSave_Click"/>
                  
                        <asp:Button
                            ID="BtnClear" 
                            runat="server"
                            Text="Clear" 
                            OnClick="BtnClear_Click"/>
                    <br />
                          <asp:Label
                            ID="lblNotify"
                            runat="server" 
                            ForeColor="Green"></asp:Label>
                
                    </fieldset>
                    <asp:Table runat="server" ID="moreInvTable">
                        <asp:TableRow>
                            <asp:TableCell>
                        <asp:Label 
                            runat="server" 
                            Text="Items"></asp:Label> 
                                &nbsp
                                &nbsp
                                &nbsp
                                &nbsp
                                <asp:Label 
                                    runat="server"
                                    Text="Cost"
                                    ID="lblItemCost"
                                    ></asp:Label>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell>
                                <asp:ListBox
                                    ID="lbInventory" 
                                    runat="server"></asp:ListBox>
                            </asp:TableCell>
                        </asp:TableRow>
                    </asp:Table>
   


             <asp:SqlDataSource
        ID="datasrcServiceTable"
        runat="server"
        ConnectionString="<%$ ConnectionStrings:Lab4 %>"
        SelectCommand="SELECT dbo.CUSTOMER.customerID, dbo.CUSTOMER.firstName, dbo.CUSTOMER.lastName, dbo.SERVICE.serviceID, dbo.SERVICE.serviceName, dbo.SERVICE.timeDate, dbo.WORKFLOW.ticketStatus
                      FROM dbo.CUSTOMER, dbo.SERVICE, dbo.WORKFLOW, dbo.SERVICETICKET
                      WHERE dbo.CUSTOMER.customerID = dbo.SERVICETICKET.customerID AND dbo.SERVICETICKET.serviceID = dbo.SERVICE.serviceID
                      AND dbo.SERVICE.serviceID = dbo.WORKFLOW.serviceID AND dbo.SERVICE.serviceName LIKE '%Auction'"
        UpdateCommand=" UPDATE CUSTOMER SET firstName = @firstName, lastName = @lastName WHERE customerID = @customerID
                        UPDATE SERVICE SET timeDate = @timeDate WHERE serviceID = @serviceID
                        UPDATE WORKFLOW SET ticketStatus = @ticketStatus WHERE serviceID = @serviceID"
 
        FilterExpression="firstName LIKE '%{0}%' OR lastName LIKE '%{0}%'">
        <FilterParameters>
            <asp:ControlParameter ControlID="txtbxSearch" Name="CustomerName"
                PropertyName="Text" Type="String" ConvertEmptyStringToNull="false"/>
        </FilterParameters>

    </asp:SqlDataSource>
                <asp:SqlDataSource
             runat="server"
             ID="dataSourceCustList"
             ConnectionString="<%$ ConnectionStrings:Lab4 %>"
             SelectCommand="select [customerID], [firstName] + ' ' + [lastName]  AS CustomerName from dbo.CUSTOMER"></asp:SqlDataSource>
     <asp:SqlDataSource
             runat="server"
             ID="dataSourceVehicleList"
             ConnectionString="<%$ ConnectionStrings:Lab4 %>"
             SelectCommand="select [equipmentID], [description]  AS Vehicle from dbo.EQUIPMENT"></asp:SqlDataSource>
    <asp:SqlDataSource
             runat="server"
             ID="dataSourceEmployeeList"
             ConnectionString="<%$ ConnectionStrings:Lab4 %>"
             SelectCommand="select [employeeID], [firstName] + ' ' + [lastName] AS Employee from dbo.EMPLOYEE"></asp:SqlDataSource>
    <asp:SqlDataSource
             runat="server"
             ID="calendarDates"
             ConnectionString="<%$ ConnectionStrings:Lab4 %>"
             SelectCommand="select dbo.SERVICE.timeDate from dbo.SERVICE where dbo.SERVICE.serviceName = 'Auction'"></asp:SqlDataSource>




</asp:Content>
