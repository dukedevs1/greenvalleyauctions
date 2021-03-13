<%@ Page Title="" Language="C#" MasterPageFile="~/EmployeeFacingMaster.Master" AutoEventWireup="true" CodeBehind="MoveSchedulingScreen.aspx.cs" Inherits="GreenValleyAuctionsSystem.MoveSchedulingScreen" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       
            <asp:Label ID="lblTitle" runat="server" Text="Move Scheduling Screen"></asp:Label>
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
        DataKeyNames="serviceID"
        GridLines="Horizontal"
        EmptyDataText="No services in database associated with that customer."
        AlternatingRowStyle-BackColor="LightGray" CellPadding="5" HeaderStyle-HorizontalAlign="Left" HeaderStyle-BackColor="#266141"
        HeaderStyle-ForeColor="White">
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
            <asp:Table ID="NewMovingTable" runat="server">
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label 
                            ID="lblNew" 
                            runat="server" 
                            Text="Add a New Moving Service Ticket"
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
                            ID="lblOrigin"
                            runat="server" 
                            Text="Moving Origin: "></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox 
                            ID="txtOrigin" 
                            runat="server" ></asp:TextBox>
                            <asp:RequiredFieldValidator 
                                ID="RequiredFieldValidator11"
                                runat="server" 
                                ErrorMessage="RequiredFieldValidator" 
                                ControlToValidate="txtOrigin"
                                SetFocusOnError="true" 
                                Text="* Required Field" 
                                ForeColor="Red"></asp:RequiredFieldValidator>
                    </asp:TableCell>
                                <asp:TableCell>
                        <asp:Label 
                            ID="lblDestination"
                            runat="server" 
                            Text="Moving Destination: "></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox 
                            ID="txtDestination" 
                            runat="server" ></asp:TextBox>
                            <asp:RequiredFieldValidator 
                                ID="RequiredFieldValidator13"
                                runat="server" 
                                ErrorMessage="RequiredFieldValidator" 
                                ControlToValidate="txtDestination"
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
                            Text="Final Move Date: "></asp:Label>
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
                </asp:TableRow>
                  <asp:TableRow>
                         <asp:TableCell>
                        <asp:Label 
                            ID="lblPricing" 
                            runat="server" 
                            Text="Pricing Retreived From:"></asp:Label>
                    </asp:TableCell>
                       <asp:TableCell>
                <asp:DropDownList 
                            ID="ddlPricing" 
                            runat="server"
                             AutoPostBack="true">
                            <asp:ListItem Selected="True" Text="--Select--" Value="--Select--"></asp:ListItem>
                            <asp:ListItem Text="MLS Listing" Value="Moving" ></asp:ListItem>
                            <asp:ListItem Text="Look At" Value="Auction"></asp:ListItem> 
                            <asp:ListItem Text="Phone Conversation" Value="Auction"></asp:ListItem> 
                            <asp:ListItem Text="Email Conversation" Value="Auction"></asp:ListItem>
                         </asp:DropDownList>
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
                            ID="lblMenNum" 
                            runat="server" 
                            Text="Number of Men:"></asp:Label>
                    </asp:TableCell>
                     <asp:TableCell>
                      <asp:TextBox 
                            ID="txtMen" 
                            runat="server" ></asp:TextBox>
                            <asp:RequiredFieldValidator 
                                ID="RequiredFieldValidator2"
                                runat="server"
                                ErrorMessage="RequiredFieldValidator" 
                                ControlToValidate="txtMen" 
                                SetFocusOnError="true"
                                Text="* Required Field" 
                                ForeColor="Red"></asp:RequiredFieldValidator>
                    </asp:TableCell>
                </asp:TableRow>
                  <asp:TableRow>
                        <asp:TableCell>
                        <asp:Label 
                            ID="lblEstimate" 
                            runat="server" 
                            Text="Estimate/Contract Price:"></asp:Label>
                    </asp:TableCell>
                     <asp:TableCell>
                      <asp:TextBox 
                            ID="txtEstimate" 
                            runat="server" ></asp:TextBox>
                            <asp:RequiredFieldValidator 
                                ID="RequiredFieldValidator3"
                                runat="server"
                                ErrorMessage="RequiredFieldValidator" 
                                ControlToValidate="txtEstimate" 
                                SetFocusOnError="true"
                                Text="* Required Field" 
                                ForeColor="Red"></asp:RequiredFieldValidator>
                    </asp:TableCell>
                       <asp:TableCell>
                        <asp:Label 
                            ID="lblSupplyCost" 
                            runat="server" 
                            Text="Cost of Supplies: "></asp:Label>
                    </asp:TableCell>
                     <asp:TableCell>
                      <asp:TextBox 
                            ID="txtSupplyCost" 
                            runat="server" ></asp:TextBox>
                            <asp:RequiredFieldValidator 
                                ID="RequiredFieldValidator5"
                                runat="server"
                                ErrorMessage="RequiredFieldValidator" 
                                ControlToValidate="txtSupplyCost" 
                                SetFocusOnError="true"
                                Text="* Required Field" 
                                ForeColor="Red"></asp:RequiredFieldValidator>
                    </asp:TableCell>
                     </asp:TableRow>
                   <asp:TableRow>
                          <asp:TableCell>
                        <asp:Label 
                            ID="lblEstimatedHours" 
                            runat="server" 
                            Text="Estimated Hours:"></asp:Label>
                    </asp:TableCell>
                     <asp:TableCell>
                      <asp:TextBox 
                            ID="txtEstimatedHours" 
                            runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator 
                                ID="RequiredFieldValidator4"
                                runat="server"
                                ErrorMessage="RequiredFieldValidator" 
                                ControlToValidate="txtEstimatedHours" 
                                SetFocusOnError="true"
                                Text="* Required Field" 
                                ForeColor="Red"></asp:RequiredFieldValidator>
                    </asp:TableCell>
                     </asp:TableRow>
                  <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label 
                            ID="lblMileage"
                            runat="server" 
                            Text="Milage: "></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox 
                            ID="txtMiles" 
                            runat="server" ></asp:TextBox>
                            <asp:RequiredFieldValidator
                                ID="RVMiles"
                                runat="server" 
                                ErrorMessage="RequiredFieldValidator" 
                                ControlToValidate="txtMiles" 
                                SetFocusOnError="true"
                                Text="* Required Field" 
                                ForeColor="Red"></asp:RequiredFieldValidator>
                    </asp:TableCell>
                       <asp:TableCell>
                        <asp:Label 
                            ID="lblFinal"
                            runat="server" 
                            Text="Final/Actual Hours: "></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox 
                            ID="txtFinal" 
                            runat="server" ></asp:TextBox>
                            <asp:RequiredFieldValidator
                                ID="RequiredFieldValidator1"
                                runat="server" 
                                ErrorMessage="RequiredFieldValidator" 
                                ControlToValidate="txtFinal" 
                                SetFocusOnError="true"
                                Text="* Required Field" 
                                ForeColor="Red"></asp:RequiredFieldValidator>
                    </asp:TableCell>
                </asp:TableRow>
                   <asp:TableRow>
                          <asp:TableCell>
                        <asp:Label 
                            ID="lblFuel" 
                            runat="server" 
                            Text="Fuel Cost:"></asp:Label>
                    </asp:TableCell>
                     <asp:TableCell>
                      <asp:TextBox 
                            ID="txtFuel" 
                            runat="server" ></asp:TextBox>
                            <asp:RequiredFieldValidator 
                                ID="RequiredFieldValidator6"
                                runat="server"
                                ErrorMessage="RequiredFieldValidator" 
                                ControlToValidate="txtFuel" 
                                SetFocusOnError="true"
                                Text="* Required Field" 
                                ForeColor="Red"></asp:RequiredFieldValidator>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label 
                            ID="lblInsurance"
                            runat="server" 
                            Text="Insurance: "></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox 
                            ID="txtIns" 
                            runat="server" ></asp:TextBox>
                            <asp:RequiredFieldValidator
                                ID="RequiredFieldValidator8"
                                runat="server" 
                                ErrorMessage="RequiredFieldValidator" 
                                ControlToValidate="txtIns" 
                                SetFocusOnError="true"
                                Text="* Required Field" 
                                ForeColor="Red"></asp:RequiredFieldValidator>
                    </asp:TableCell>
                </asp:TableRow>
                  <asp:TableRow>
                          <asp:TableCell>
                        <asp:Label 
                            ID="lblPay" 
                            runat="server" 
                            Text="Pay Per Worker: ">
                        </asp:Label>
                    </asp:TableCell>
                     <asp:TableCell>
                      <asp:TextBox 
                            ID="txtPay" 
                            runat="server" 
                           TextMode="Multiline"></asp:TextBox>
                            <asp:RequiredFieldValidator 
                                ID="RequiredFieldValidator9"
                                runat="server"
                                ErrorMessage="RequiredFieldValidator" 
                                ControlToValidate="txtPay" 
                                SetFocusOnError="true"
                                Text="* Required Field" 
                                ForeColor="Red"></asp:RequiredFieldValidator>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label 
                            ID="lblFoodHotel"
                            runat="server" 
                            Text="Food and Hotel Costs: "></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox 
                            ID="txtFoodHotel" 
                            runat="server" ></asp:TextBox>
                            <asp:RequiredFieldValidator
                                ID="RequiredFieldValidator10"
                                runat="server" 
                                ErrorMessage="RequiredFieldValidator" 
                                ControlToValidate="txtFoodHotel" 
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
                      AND dbo.SERVICE.serviceID = dbo.WORKFLOW.serviceID AND dbo.SERVICE.serviceName LIKE '%Moving'"
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
             SelectCommand="select dbo.SERVICE.timeDate from dbo.SERVICE where dbo.SERVICE.serviceName = 'Moving'"></asp:SqlDataSource>
     


</asp:Content>
