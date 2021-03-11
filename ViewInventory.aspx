<%@ Page Title="" Language="C#" MasterPageFile="~/EmployeeFacingMaster.Master" AutoEventWireup="true" CodeBehind="ViewInventory.aspx.cs" Inherits="GreenValleyAuctionsSystem.ViewInventory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Table ID="Table1" runat="server">
        <asp:TableRow>
            <asp:TableCell>
                <asp:TextBox ID="txtbxSearch" runat="server"></asp:TextBox>
            </asp:TableCell>
            <asp:TableCell>
                <asp:Button ID="btnSearch" runat="server" Text="Search" AccessKey="" />
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>

    <asp:GridView ID="grdvwInventoryTable"
        runat="server"
        DataSourceID="datasrcInventoryTable"
        AllowSorting="true"
        AllowPaging="true"
        AutoGenerateColumns="false"
        AutoGenerateEditButton="true"
        DataKeyNames="inventoryID"
        GridLines="Horizontal" EmptyDataText="No items in inventory matching that name"
        AlternatingRowStyle-BackColor="LightGray" CellPadding="5" HeaderStyle-HorizontalAlign="Left" HeaderStyle-BackColor="#266141"
        HeaderStyle-ForeColor="White">
        <Columns>
            <asp:BoundField ReadOnly="true" HeaderText="inventoryID"
                DataField="inventoryID" SortExpression="inventoryID" Visible="false" />
            <asp:BoundField HeaderText="Item Description"
                DataField="inventoryDescription" SortExpression="inventoryDescription" />
            <asp:BoundField HeaderText="Item Cost"
                DataField="inventoryCost" SortExpression="inventoryCost" />
             <asp:TemplateField HeaderText="Original Owner" ItemStyle-Width="200px">
                <ItemTemplate>
                    <asp:Label ID="lblCustName" runat="server" Text=' <%#Eval("firstName") + " " + Eval("lastName")%>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>

    <asp:SqlDataSource
        ID="datasrcInventoryTable"
        runat="server"
        ConnectionString="<%$ ConnectionStrings:Lab4 %>"
        SelectCommand="SELECT INVENTORY.inventoryID, INVENTORY.inventoryDescription, INVENTORY.inventoryCost, 
        CUSTOMER.firstName, CUSTOMER.lastName FROM INVENTORY INNER JOIN CUSTOMER ON INVENTORY.customerID=CUSTOMER.customerID;"
        UpdateCommand ="Update INVENTORY SET inventoryDescription = @inventoryDescription, inventoryCost = @inventoryCost WHERE inventoryID= @inventoryID"
        FilterExpression="inventoryDescription LIKE '%{0}%'">
        <FilterParameters>
            <asp:ControlParameter ControlID="txtbxSearch" Name="inventoryDescription"
                PropertyName="Text" Type="String" ConvertEmptyStringToNull="false" />
        </FilterParameters>
    </asp:SqlDataSource>
</asp:Content>
