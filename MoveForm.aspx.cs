using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Drawing;
using System.Collections.Specialized;
using System.Text;

namespace GreenValleyAuctionsSystem
{
    public partial class MoveForm : System.Web.UI.Page
    {
        //private int numOfRows = 1; //current num of rows for Rooms table (set to 1 so it shows up on initial load

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                SetInitialRow();
            }
            //moreRoomsTable.Visible = false;
            ////Generate Rows for Rooms table
            //if (!Page.IsPostBack)
            //{
            //    GenerateTable(numOfRows);
            //}
        }

        protected void ddlCustomers_SelectedIndexChanged(object sender, EventArgs e)
        {
            //Populate moving and destination address labels based off of name selected
            String strQuery = "SELECT MOVINGSERVICE.originStreetAddress, MOVINGSERVICE.originCity, MOVINGSERVICE.originState, " +
                "MOVINGSERVICE.originZipcode, MOVINGSERVICE.destinationStreetAddress, MOVINGSERVICE.destinationCity, MOVINGSERVICE.destinationState, " +
                "MOVINGSERVICE.destinationZipcode FROM SERVICETICKET " +
                "INNER JOIN CUSTOMER on CUSTOMER.customerID = SERVICETICKET.customerID " +
                "INNER JOIN SERVICE on SERVICE.serviceID = SERVICETICKET.serviceID " +
                "INNER JOIN MOVINGSERVICE on MOVINGSERVICE.serviceID = SERVICE.serviceID " +
               "WHERE CUSTOMER.lastName = @lastName";

            SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab4"].ConnectionString);
            SqlCommand cmd = new SqlCommand();
            cmd.Parameters.AddWithValue("@lastName", ddlCustomers.SelectedItem.Text);
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = strQuery;
            cmd.Connection = sqlConnect;
            try
            {
                sqlConnect.Open();
                SqlDataReader sdr = cmd.ExecuteReader();
                while (sdr.Read())
                {
                    lbloriginStreetAddress.Text = sdr["originStreetAddress"].ToString();
                    lbloriginCity.Text = sdr["originCity"].ToString();
                    lbloriginState.Text = sdr["originState"].ToString();
                    lbloriginZipcode.Text = sdr["originZipcode"].ToString();

                    lbldestinationStreetAddress.Text = sdr["destinationStreetAddress"].ToString();
                    lbldestinationCity.Text = sdr["destinationCity"].ToString();
                    lbldestinationState.Text = sdr["destinationState"].ToString();
                    lbldestinationZipcode.Text = sdr["destinationZipcode"].ToString();
                    //lblDestination.Text = sdr["destinationStreetAddress"].ToString() + " " +
                    //    sdr["destinationCity"].ToString() + ", " +
                    //    sdr["destinationState"].ToString() + " " +
                    //    sdr["destinationZipcode"].ToString();
                }

            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                sqlConnect.Close();
                sqlConnect.Dispose();
            }

        }

        protected void cblLoadingConditions_SelectedIndexChanged(object sender, EventArgs e)
        {
            if(cblLoadingConditions.Items[3].Selected)
            {
                txtbxOtherCondition.Visible = true;
            }
        }

        protected void cblFloors_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cblFloors.Items[5].Selected)
            {
                txtbxOtherFloor.Visible = true;
            }
        }

        protected void cblOutdoor_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cblOutdoor.Items[2].Selected)
            {
                txtbxOtherOutdoor.Visible = true;
            }
        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {

        }

        //protected void btnAddRoom_Click(object sender, EventArgs e)
        //{
        //    numOfRows = Convert.ToInt32(ViewState["RowsCount"].ToString());
        //    GenerateTable(numOfRows);
        //}

        //private void SetPreviousData(int rowsCount, int colsCount)

        //{
        //    Table table = (Table)Page.FindControl("tblRooms2");
        //    if (table != null)
        //    {
        //        for (int i = 0; i < rowsCount; i++)
        //        {
        //            for (int j = 0; j < colsCount; j++)
        //            {

        //                //Extracting the Dynamic Controls from the Table
        //                TextBox tb = (TextBox)table.Rows[i].Cells[j].FindControl("TextBoxRow_" + i + "Col_" + j);

        //                //Use Request objects for getting the previous data of the dynamic textbox
        //                tb.Text = Request.Form["TextBoxRow_" + i + "Col_" + j];
        //            }
        //        }
        //    }
        //}



        //private void GenerateTable(int rowsCount)

        //{
        //    //Create the Table and Add it to the Page
        //    Table table = new Table();
        //    table.ID = "tblRooms2";
        //    Page.Form.Controls.Add(table);
        //    table.Attributes.Add("align", "center");

        //    //The number of Columns to be generated
        //    const int colsCount = 2;


        //    // Now iterate through the table and add your controls
        //    for (int i = 0; i < rowsCount; i++)
        //    {

        //        /////////////////////////////////////////////////////

        //        TableRow row1 = new TableRow();
        //        TableCell cell1 = new TableCell();
        //        Label lbl = new Label();
        //        lbl.Text = "Room Name: ";

        //        // Set a unique ID for each label added
        //        lbl.ID = "lbl_" + i;

        //        // Add the control to the TableCell
        //        cell1.Controls.Add(lbl);

        //        // Add the TableCell to the TableRow
        //        row1.Cells.Add(cell1);



        //        TableCell cell2 = new TableCell();
        //        TextBox txtbx = new TextBox();

        //        // Set a unique ID for each label added
        //        txtbx.ID = "txtbx_" + i;

        //        // Add the control to the TableCell
        //        cell2.Controls.Add(txtbx);

        //        // Add the TableCell to the TableRow
        //        row1.Cells.Add(cell2);


        //        // And finally, add the TableRow to the Table
        //        table.Rows.Add(row1);

        //        /////////////////////////////////////////////////////

        //        TableRow row2 = new TableRow();
        //        TableCell cell3 = new TableCell();
        //        Label lbl2 = new Label();
        //        lbl2.Text = "Floor Level: ";

        //        // Set a unique ID for each label added
        //        lbl2.ID = "lbl_" + i;

        //        // Add the control to the TableCell
        //        cell3.Controls.Add(lbl2);

        //        // Add the TableCell to the TableRow
        //        row2.Cells.Add(cell3);



        //        TableCell cell4 = new TableCell();
        //        TextBox txtbx2 = new TextBox();

        //        // Set a unique ID for each label added
        //        txtbx2.ID = "txtbx_" + i;

        //        // Add the control to the TableCell
        //        cell4.Controls.Add(txtbx2);

        //        // Add the TableCell to the TableRow
        //        row2.Cells.Add(cell4);


        //        // And finally, add the TableRow to the Table
        //        table.Rows.Add(row2);

        //        ///////////////////////////////////////////////////////

        //        TableRow row3 = new TableRow();
        //        TableCell cell5 = new TableCell();
        //        Label lbl3 = new Label();
        //        lbl3.Text = "Boxes (type/amount): ";

        //        // Set a unique ID for each label added
        //        lbl3.ID = "lbl_" + i;

        //        // Add the control to the TableCell
        //        cell5.Controls.Add(lbl3);

        //        // Add the TableCell to the TableRow
        //        row3.Cells.Add(cell5);



        //        TableCell cell6 = new TableCell();
        //        TextBox txtbx3 = new TextBox();

        //        // Set a unique ID for each label added
        //        txtbx3.ID = "txtbx_" + i;

        //        // Add the control to the TableCell
        //        cell6.Controls.Add(txtbx3);

        //        // Add the TableCell to the TableRow
        //        row3.Cells.Add(cell6);


        //        // And finally, add the TableRow to the Table
        //        table.Rows.Add(row3);

        //        /////////////////////////////////////////////////////

        //        TableRow row4 = new TableRow();
        //        TableCell cell7 = new TableCell();
        //        Label lbl4 = new Label();
        //        lbl4.Text = "Additional Notes: ";

        //        // Set a unique ID for each label added
        //        lbl4.ID = "lbl_" + i;

        //        // Add the control to the TableCell
        //        cell7.Controls.Add(lbl4);

        //        // Add the TableCell to the TableRow
        //        row4.Cells.Add(cell7);



        //        TableCell cell8 = new TableCell();
        //        TextBox txtbx4 = new TextBox();
        //        txtbx4.Attributes.Add("TextMode", "MultiLine");

        //        // Set a unique ID for each label added
        //        txtbx4.ID = "txtbx_" + i;

        //        // Add the control to the TableCell
        //        cell8.Controls.Add(txtbx4);

        //        // Add the TableCell to the TableRow
        //        row4.Cells.Add(cell8);


        //        // And finally, add the TableRow to the Table
        //        table.Rows.Add(row4);

        //        ////separator////
        //        TableRow row5 = new TableRow();
        //        TableCell cell9 = new TableCell();
        //        Label lbl5 = new Label();
        //        lbl5.Text = "-------------";
        //        lbl5.ID = "lbl_" + i;
        //        cell9.Controls.Add(lbl5);
        //        row5.Cells.Add(cell9);
        //        table.Rows.Add(row5);



        //    }


        //    //Set Previous Data on PostBacks
        //    SetPreviousData(rowsCount, colsCount);

        //    //Store the current Rows Count in ViewState
        //    rowsCount++;
        //    ViewState["RowsCount"] = rowsCount;
        //}

        protected void btnSave_Click(object sender, EventArgs e)
        {
            //get service ID (necessary for moving service) based on DDL of customers 
            String serviceID = "";

            String serviceIDQuery = "SELECT SERVICETICKET.serviceID FROM SERVICETICKET " +
                "INNER JOIN CUSTOMER on CUSTOMER.customerID = SERVICETICKET.customerID " +
                "INNER JOIN SERVICE on SERVICE.serviceID = SERVICETICKET.serviceID " +
                "INNER JOIN MOVINGSERVICE on MOVINGSERVICE.serviceID = SERVICE.serviceID " +
               "WHERE CUSTOMER.lastName = @lastName";


            SqlConnection sqlConnect1 = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab4"].ConnectionString);
            SqlCommand getServiceIDCommand = new SqlCommand();
            getServiceIDCommand.Parameters.AddWithValue("@lastName", ddlCustomers.SelectedItem.Text);
            getServiceIDCommand.CommandType = CommandType.Text;
            getServiceIDCommand.CommandText = serviceIDQuery;
            getServiceIDCommand.Connection = sqlConnect1;
            

            try
            {
                sqlConnect1.Open();
                SqlDataReader getServiceIDReader = getServiceIDCommand.ExecuteReader();
                while (getServiceIDReader.Read())
                {
                    serviceID = getServiceIDReader["serviceID"].ToString();
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                sqlConnect1.Close();
                sqlConnect1.Dispose();
            }


            //concatenate checked items into a string separated by commas
            string strLoadingConditions = txtbxOtherCondition.Text + " ,";
            for (int i = 0; i < cblLoadingConditions.Items.Count; i++)
            {
                if (cblLoadingConditions.Items[i].Selected)
                {
                    strLoadingConditions += cblLoadingConditions.Items[i].Text + ", ";
                }
            }
            string strFloors = txtbxOtherFloor.Text + " ,";
            for (int i = 0; i < cblFloors.Items.Count; i++)
            {
                if (cblFloors.Items[i].Selected)
                {
                    strFloors += cblFloors.Items[i].Text + ", ";
                }
            }
            string strOutdoor = txtbxOtherOutdoor.Text + " ,";
            for (int i = 0; i < cblOutdoor.Items.Count; i++)
            {
                if (cblOutdoor.Items[i].Selected)
                {
                    strOutdoor += cblOutdoor.Items[i].Text + ", ";
                }
            }


            string insertQuery = "INSERT INTO MOVINGSERVICE(originStreetAddress, originCity, originState, originZipcode, " +
                "destinationStreetAddress, destinationCity, destinationState, destinationZipcode, numOfFloors, distanceFromTruck, " +
                "drivewayAccessibility, loadingConditions, floors, outdoorSpaces, serviceID) " +
               "VALUES ( '" + lbloriginStreetAddress.Text + "','" + lbloriginCity.Text + "','" + lbloriginState.Text + "','" + lbloriginZipcode.Text + "','" +
               lbldestinationStreetAddress.Text + "','" + lbldestinationCity.Text + "','" + lbldestinationState.Text + "','" + lbldestinationZipcode.Text + "','" + 
               txtbxNumOfFloors.Text + "','" + txtbxDistance.Text + "','" + txtDriveway.Text + "','" + strLoadingConditions + "','" + strFloors + "','" + strOutdoor + "','" + serviceID + "')";

            SqlConnection sqlConnect2 = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab4"].ConnectionString);
            SqlCommand insertCommand = new SqlCommand();
            insertCommand.CommandType = CommandType.Text;
            insertCommand.CommandText = insertQuery;
            insertCommand.Connection = sqlConnect2;
            try
            {
                sqlConnect2.Open();
                SqlDataReader insertReader = insertCommand.ExecuteReader();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                sqlConnect2.Close();
                sqlConnect2.Dispose();
            }


        }

        protected void btnPopulate_Click(object sender, EventArgs e)
        {
            txtbxNumOfFloors.Text = "3";
            txtbxDistance.Text = "50 feet";
            txtDriveway.Text = "Pretty clear";
            cblFloors.Items[0].Selected = true;
            cblFloors.Items[1].Selected = true;
            cblFloors.Items[2].Selected = true;
            cblLoadingConditions.Items[1].Selected = true;
            cblLoadingConditions.Items[3].Selected = true;
            txtbxOtherCondition.Visible = true;
            txtbxOtherCondition.Text = "broken gate";
            cblOutdoor.Items[2].Selected = true;
            txtbxOtherOutdoor.Visible = true;
            txtbxOtherOutdoor.Text = "shed behind house";

        }

        //protected void BtnAddRoom_Click1(object sender, EventArgs e)
        //{
        //    moreRoomsTable.Visible = true;
        //    lbxRooms.Items.Add(txtRoomName.Text + " ......... " + txtFloorLevel.Text + " ......... " + txtbxBoxes.Text + " ......... " + txtbxNotes.Text);
        //}

       
        
        private void SetInitialRow()
        {

            DataTable dt = new DataTable();
            DataRow dr = null;

            dt.Columns.Add(new DataColumn("RowNumber", typeof(string)));
            dt.Columns.Add(new DataColumn("Names", typeof(string)));//for textbox values
            dt.Columns.Add(new DataColumn("Floor", typeof(string)));
            dt.Columns.Add(new DataColumn("Boxes", typeof(string)));  
            dt.Columns.Add(new DataColumn("Notes", typeof(string)));  

            dr = dt.NewRow();
            dr["RowNumber"] = 1;
            dr["Names"] = string.Empty;
            dr["Floor"] = string.Empty;
            dr["Boxes"] = string.Empty;
            dr["Notes"] = string.Empty;
            dt.Rows.Add(dr);

            //Store the DataTable in ViewState for future reference   
            ViewState["CurrentTable"] = dt;

            //Bind the Gridview   
            grdvwRooms.DataSource = dt;
            grdvwRooms.DataBind();
        }
        private void AddNewRowToGrid()
        {

            if (ViewState["CurrentTable"] != null)
            {

                DataTable dtCurrentTable = (DataTable)ViewState["CurrentTable"];
                DataRow drCurrentRow = null;

                if (dtCurrentTable.Rows.Count > 0)
                {
                    drCurrentRow = dtCurrentTable.NewRow();
                    drCurrentRow["RowNumber"] = dtCurrentTable.Rows.Count + 1;

                    //add new row to DataTable   
                    dtCurrentTable.Rows.Add(drCurrentRow);
                    //Store the current data to ViewState for future reference   

                    ViewState["CurrentTable"] = dtCurrentTable;


                    for (int i = 0; i < dtCurrentTable.Rows.Count - 1; i++)
                    {

                        //extract the TextBox values   

                        TextBox box1 = (TextBox)grdvwRooms.Rows[i].Cells[1].FindControl("txtbxRoom");
                        TextBox box2 = (TextBox)grdvwRooms.Rows[i].Cells[2].FindControl("txtbxFloorLevel");
                        TextBox box3 = (TextBox)grdvwRooms.Rows[i].Cells[3].FindControl("txtbxBoxes");
                        TextBox box4 = (TextBox)grdvwRooms.Rows[i].Cells[4].FindControl("txtbxNotes");

                        dtCurrentTable.Rows[i]["Names"] = box1.Text;
                        dtCurrentTable.Rows[i]["Floor"] = box2.Text;
                        dtCurrentTable.Rows[i]["Boxes"] = box3.Text;
                        dtCurrentTable.Rows[i]["Notes"] = box4.Text;

                    }

                    //Rebind the Grid with the current data to reflect changes   
                    grdvwRooms.DataSource = dtCurrentTable;
                    grdvwRooms.DataBind();
                }
            }
            else
            {
                Response.Write("ViewState is null");

            }
            //Set Previous Data on Postbacks   
            SetPreviousData();
        }

        private void SetPreviousData()
        {

            int rowIndex = 0;
            if (ViewState["CurrentTable"] != null)
            {

                DataTable dt = (DataTable)ViewState["CurrentTable"];
                if (dt.Rows.Count > 0)
                {

                    for (int i = 0; i < dt.Rows.Count; i++)
                    {

                        TextBox box1 = (TextBox)grdvwRooms.Rows[i].Cells[1].FindControl("txtbxRoom");
                        TextBox box2 = (TextBox)grdvwRooms.Rows[i].Cells[2].FindControl("txtbxFloorLevel");
                        TextBox box3 = (TextBox)grdvwRooms.Rows[i].Cells[3].FindControl("txtbxBoxes");
                        TextBox box4 = (TextBox)grdvwRooms.Rows[i].Cells[4].FindControl("txtbxNotes");


                        if (i < dt.Rows.Count - 1)
                        {

                            //Assign the value from DataTable to the TextBox   
                            box1.Text = dt.Rows[i]["Names"].ToString();
                            box2.Text = dt.Rows[i]["Floor"].ToString();
                            box3.Text = dt.Rows[i]["Boxes"].ToString();
                            box4.Text = dt.Rows[i]["Notes"].ToString();

                        }

                        rowIndex++;
                    }
                }
            }
        }
        protected void ButtonAdd_Click(object sender, EventArgs e)
        {
            AddNewRowToGrid();
        }

        protected void grdvwRooms_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                DataTable dt = (DataTable)ViewState["CurrentTable"];
                LinkButton lb = (LinkButton)e.Row.FindControl("btnRemove");
                if (lb != null)
                {
                    if (dt.Rows.Count > 1)
                    {
                        if (e.Row.RowIndex == dt.Rows.Count - 1)
                        {
                            lb.Visible = false;
                        }
                    }
                    else
                    {
                        lb.Visible = false;
                    }
                }
            }
        }

        protected void btnRemove_Click(object sender, EventArgs e)
        {
            LinkButton lb = (LinkButton)sender;
            GridViewRow gvRow = (GridViewRow)lb.NamingContainer;
            int rowID = gvRow.RowIndex;
            if (ViewState["CurrentTable"] != null)
            {

                DataTable dt = (DataTable)ViewState["CurrentTable"];
                if (dt.Rows.Count > 1)
                {
                    if (gvRow.RowIndex < dt.Rows.Count - 1)
                    {
                        //Remove the Selected Row data and reset row number  
                        dt.Rows.Remove(dt.Rows[rowID]);
                        ResetRowID(dt);
                    }
                }

                //Store the current data in ViewState for future reference  
                ViewState["CurrentTable"] = dt;

                //Re bind the GridView for the updated data  
                grdvwRooms.DataSource = dt;
                grdvwRooms.DataBind();
            }

            //Set Previous Data on Postbacks  
            SetPreviousData();
        }

        private void ResetRowID(DataTable dt)
        {
            int rowNumber = 1;
            if (dt.Rows.Count > 0)
            {
                foreach (DataRow row in dt.Rows)
                {
                    row[0] = rowNumber;
                    rowNumber++;
                }
            }
        }
        private void InsertRecords(StringCollection sc)
        {
            //    StringBuilder sb = new StringBuilder(string.Empty);
            //    string[] splitItems = null;
            //    const string sqlStatement = "INSERT INTO ROOMS (roomName, floorLevel, boxes, notes) VALUES";
            //    foreach (string item in sc)
            //    {
            //        if (item.Contains(","))
            //        {
            //            splitItems = item.Split(",".ToCharArray());
            //            sb.AppendFormat("{0}('{1}','{2}','{3}','{4}'); ", sqlStatement, splitItems[0], splitItems[1], splitItems[2], splitItems[3]);
            //        }
            //    }

            //    using (SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab4"].ConnectionString))
            //    {
            //        connection.Open();
            //        using (SqlCommand cmd = new SqlCommand(sb.ToString(), connection))
            //        {
            //            cmd.CommandType = CommandType.Text;
            //            cmd.ExecuteNonQuery();
            //        }
            //    }
            //    lblMessage.Text = "Records successfully saved!";
        }

        protected void BtnSave_Click(object sender, EventArgs e)
        {
            //int rowIndex = 0;
            //StringCollection sc = new StringCollection();
            //if (ViewState["CurrentTable"] != null)
            //{
            //    DataTable dtCurrentTable = (DataTable)ViewState["CurrentTable"];
            //    if (dtCurrentTable.Rows.Count > 0)
            //    {
            //        for (int i = 1; i <= dtCurrentTable.Rows.Count; i++)
            //        {
            //            //extract the TextBox values  
            //            TextBox box1 = (TextBox)grdvwRooms.Rows[rowIndex].Cells[1].FindControl("Names");
            //            TextBox box2 = (TextBox)grdvwRooms.Rows[rowIndex].Cells[2].FindControl("Floor");
            //            TextBox box3 = (TextBox)grdvwRooms.Rows[rowIndex].Cells[3].FindControl("Boxes");
            //            TextBox box4 = (TextBox)grdvwRooms.Rows[rowIndex].Cells[4].FindControl("Notes");

            //            //get the values from TextBox and DropDownList  
            //            //then add it to the collections with a comma "," as the delimited values  
            //            sc.Add(string.Format("{0},{1},{2},{3}", box1.Text, box2.Text, box3.Text, box4.Text));
            //            rowIndex++;
            //        }
            //        //Call the method for executing inserts  
            //        InsertRecords(sc);
            //    }
            //}
        }
    }


    
}