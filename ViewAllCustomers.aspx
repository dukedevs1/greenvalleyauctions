<%@ Page Title="" Language="C#" MasterPageFile="~/EmployeeFacingMaster.Master" AutoEventWireup="true" CodeBehind="ViewAllCustomers.aspx.cs" Inherits="GreenValleyAuctionsSystem.ViewAllCustomers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Table ID="Table1" runat="server">
        <asp:TableRow>
            <asp:TableCell>
                <asp:TextBox ID="txtbxSearch" runat="server"></asp:TextBox>
            </asp:TableCell>
            <asp:TableCell>
                <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" />
                <br />
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>
    <asp:Table ID="Table2" runat="server" HorizontalAlign="right">
        <asp:TableRow>
            <asp:TableCell>
                <asp:Button ID="btnAddNew" runat="server" Text="Add New Customer" OnClick="btnAddNew_Click" />
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>
    <br />
    <br />
    <asp:GridView ID="grdvwCustomerTable"
        runat="server"
        DataSourceID="datasrcCustomerTable"
        AllowSorting="true"
        AllowPaging="true"
        AutoGenerateColumns="false"
        AutoGenerateEditButton="true"
        AutoGenerateSelectButton="true" OnSelectedIndexChanged="grdvwCustomerTable_SelectedIndexChanged"
        DataKeyNames="customerID"
        GridLines="Horizontal"
        EmptyDataText="No customers in database matching that name."
        AlternatingRowStyle-BackColor="LightGray" CellPadding="5" HeaderStyle-HorizontalAlign="Left" HeaderStyle-BackColor="#266141"
        HeaderStyle-ForeColor="White">
        <Columns>
            <asp:BoundField ReadOnly="true" HeaderText="customerID" DataField="customerID" SortExpression="customerID" Visible="false" />
            <asp:BoundField HeaderText="First Name" DataField="firstName" SortExpression="firstName" ItemStyle-Width="150px" />
            <asp:BoundField HeaderText="Last Name" DataField="lastName" SortExpression="lastName" ItemStyle-Width="150px" />
            <asp:BoundField HeaderText="Email Address" DataField="emailAddress" SortExpression="emailAddress" ItemStyle-Width="200px" />
            <asp:BoundField HeaderText="Phone Number" DataField="phoneNumber" SortExpression="phoneNumber" ItemStyle-Width="200px" />
            <asp:BoundField HeaderText="Customer Address" DataField="address" SortExpression="address" ItemStyle-Width="200px" />
            <asp:BoundField HeaderText="Initial Method of Contact" DataField="initialContact" SortExpression="initialContact" ItemStyle-Width="200px" />
            <asp:BoundField HeaderText="How did you hear about us?" DataField="discoveredFrom" SortExpression="discoveredFrom" ItemStyle-Width="200px" />
        </Columns>
    </asp:GridView>

    <asp:SqlDataSource
        ID="datasrcCustomerTable"
        runat="server"
        ConnectionString="<%$ ConnectionStrings:Lab4 %>"
        SelectCommand="SELECT * FROM CUSTOMER"
        UpdateCommand=" UPDATE CUSTOMER SET firstName = @firstName, lastName = @lastName, emailAddress = @emailAddress,
        phoneNumber= @phoneNumber, address = @address, initialContact = @initialContact, discoveredFrom= @discoveredFrom WHERE customerID= @customerID"
        FilterExpression="firstName LIKE '%{0}%' OR lastName LIKE '%{0}%'">
        <FilterParameters>
            <asp:ControlParameter ControlID="txtbxSearch" Name="CustomerName"
                PropertyName="Text" Type="String" ConvertEmptyStringToNull="false" />
        </FilterParameters>
    </asp:SqlDataSource>




</asp:Content>
