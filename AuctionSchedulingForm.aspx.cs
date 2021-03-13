using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GreenValleyAuctionsSystem
{
    public partial class AuctionSchedulingForm : System.Web.UI.Page
    {
        protected static Boolean buttonClicked = false;
        protected void Page_Load(object sender, EventArgs e)
        {
            moreInvTable.Visible = false;
        }


        protected void btnSearch_Click(object sender, EventArgs e)
        {

        }
        //method to populate sample data in text boxes
        protected void BtnPopulate_Click(object sender, EventArgs e)
        {
            txtComp.Text = "2021-02-02";
            txtAddress.Text = "200 South Main Street Harrisonburg, VA 22801";
            txtTitle.Text = "Need to call back";
            txtNote.Text = "Customer asked for more details regarding prices.";
            txtTruck.Text = "Very Accessible";
            txtTrucks.Text = "3";
            txtTrucksAssigned.Text = "GMC, 2015, 2011";
            txtSupplies.Text = "Dolly";
            txtBoxes.Text = "10";
            txtBoxType.Text = "Fragile";
            txtCrew.Text = "Ryan, Phil, and Karen";
            txtTime.Text = "7:00:00 AM";

        }
        //method to clear all data from text boxes
        protected void BtnClear_Click(object sender, EventArgs e)
        {
            txtComp.Text = "";
            txtAddress.Text = "";
            txtTitle.Text = "";
            txtNote.Text = "";
            txtTruck.Text = "";
            txtTrucks.Text = "";
            txtTrucksAssigned.Text = "";
            txtSupplies.Text = "";
            txtBoxes.Text = "";
            txtBoxType.Text = "";
            txtCrew.Text = "";
            txtTime.Text = "";
        }

        //method to display extra inventory elements 
        protected void BtnAddInv_Click(object sender, EventArgs e)
        {
            moreInvTable.Visible = true;
            lbInventory.Items.Add(txtAddItem.Text + " ......... $ " + txtInvCost.Text);
        }

        //method to insert all the user data into the database 
        protected void BtnSave_Click(object sender, EventArgs e)
        {
            String serviceTicketID = GenerateID("SELECT MAX(dbo.SERVICETICKET.serviceTicketID) FROM dbo.SERVICETICKET");
            String serviceID = GenerateID("SELECT MAX(dbo.SERVICE.serviceID) FROM dbo.SERVICE");
            String auctionServiceID = GenerateID("SELECT MAX(dbo.AUCTIONSERVICE.auctionServiceID) FROM dbo.AUCTIONSERVICE");
            String workflowID = GenerateID("SELECT MAX(dbo.WORKFLOW.workflowID) FROM dbo.WORKFLOW");
            String noteID = GenerateID("SELECT MAX(dbo.NOTE.noteID) FROM dbo.NOTE");
            String equipmentServiceTicketID = GenerateID("SELECT MAX(dbo.EQUIPMENTSERVICETICKET.equipmentServiceTicketID) FROM dbo.EQUIPMENTSERVICETICKET");
            DateTime timeDate = DateTime.Parse(HttpUtility.HtmlEncode(txtDate.Text + " " + txtTime.Text));
            String ticketChangeDate = " ";
            String equipmentID = ddlVehicle.SelectedValue;
            String truckAccessibility = HttpUtility.HtmlEncode(txtTruck.Text);
            String neededSupplies = HttpUtility.HtmlEncode(txtSupplies.Text);
            int numBoxes = int.Parse(HttpUtility.HtmlEncode(txtBoxes.Text));
            String boxType = HttpUtility.HtmlEncode(txtBoxType.Text);
            String crew = HttpUtility.HtmlEncode(txtCrew.Text);
            int numOfTrucks = int.Parse(HttpUtility.HtmlEncode(txtTrucks.Text));
            String trucksAssigned = HttpUtility.HtmlEncode(txtTrucksAssigned.Text);

            try
            {
                System.Data.SqlClient.SqlConnection sc = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab4"].ConnectionString.ToString());
                sc.Open();


                System.Data.SqlClient.SqlCommand addServ = new System.Data.SqlClient.SqlCommand();
                addServ.Connection = sc;
                // INSERT Service RECORD
                addServ.CommandText = "SET IDENTITY_INSERT dbo.SERVICE ON; " +
                    " INSERT INTO dbo.SERVICE (serviceID, serviceName, timeDate) VALUES(@serviceID, @serviceName, @timeDate)" +
                    " SET IDENTITY_INSERT dbo.SERVICE OFF;";
                addServ.Parameters.Add(new SqlParameter("@serviceID", serviceID));
                addServ.Parameters.Add(new SqlParameter("@serviceName", "Auction"));
                addServ.Parameters.Add(new SqlParameter("@timeDate", timeDate));
                addServ.ExecuteNonQuery();


                System.Data.SqlClient.SqlCommand servTkt = new System.Data.SqlClient.SqlCommand();
                servTkt.Connection = sc;
                // INSERT ServiceTicket RECORD
                servTkt.CommandText = "SET IDENTITY_INSERT dbo.SERVICETICKET ON; " +
                                      " INSERT INTO dbo.SERVICETICKET(serviceTicketID, timeDate, serviceTicketCompletionDate, customerID, serviceID) VALUES(@serviceTicketID, @timeDate, @serviceTicketCompletionDate, @customerID, @serviceID)" +
                                      " SET IDENTITY_INSERT dbo.SERVICETICKET OFF;";
                servTkt.Parameters.Add(new SqlParameter("@serviceTicketID", serviceTicketID));
                servTkt.Parameters.Add(new SqlParameter("@timeDate", timeDate));
                servTkt.Parameters.Add(new SqlParameter("@serviceTicketCompletionDate", HttpUtility.HtmlEncode(txtComp.Text)));
                servTkt.Parameters.Add(new SqlParameter("@customerID", ddlCustomer.SelectedValue));
                servTkt.Parameters.Add(new SqlParameter("@serviceID", serviceID));
                servTkt.ExecuteNonQuery();


                System.Data.SqlClient.SqlCommand addAucServ = new System.Data.SqlClient.SqlCommand();
                addAucServ.Connection = sc;
                // INSERT MovingService RECORD
                addAucServ.CommandText = "SET IDENTITY_INSERT dbo.AUCTIONSERVICE ON; " +
                    " INSERT INTO dbo.AUCTIONSERVICE (auctionServiceID, itemCost, itemSellCost, pickupAddress, truckAccessibility, neededSupplies, numBoxes, boxType, crew, numOfTrucks, trucksAssigned, serviceID) VALUES(@auctionServiceID, @itemCost, @itemSellCost, @pickupAddress,@truckAccessibility, @neededSupplies, @numBoxes, @boxType, @crew, @numOfTrucks, @trucksAssigned, @serviceID)" +
                     " SET IDENTITY_INSERT dbo.MOVINGSERVICE OFF;";
                addAucServ.Parameters.Add(new SqlParameter("@auctionServiceID", auctionServiceID));
                addAucServ.Parameters.Add(new SqlParameter("@itemCost", HttpUtility.HtmlEncode(txtInvCost.Text)));
                addAucServ.Parameters.Add(new SqlParameter("@itemSellCost", "0"));
                addAucServ.Parameters.Add(new SqlParameter("@pickupAddress", HttpUtility.HtmlEncode(txtAddress.Text)));
                addAucServ.Parameters.Add(new SqlParameter("@truckAccessibility", truckAccessibility));
                addAucServ.Parameters.Add(new SqlParameter("@neededSupplies", neededSupplies));
                addAucServ.Parameters.Add(new SqlParameter("@numBoxes", numBoxes));
                addAucServ.Parameters.Add(new SqlParameter("@boxType", boxType));
                addAucServ.Parameters.Add(new SqlParameter("@crew", crew));
                addAucServ.Parameters.Add(new SqlParameter("@numOfTrucks", numOfTrucks));
                addAucServ.Parameters.Add(new SqlParameter("@trucksAssigned", trucksAssigned));
                addAucServ.Parameters.Add(new SqlParameter("@serviceID", serviceID));
                addAucServ.ExecuteNonQuery();

                System.Data.SqlClient.SqlCommand addWorkflow = new System.Data.SqlClient.SqlCommand();
                addWorkflow.Connection = sc;
                // INSERT INTO Workflow TABLE
                addWorkflow.CommandText = "SET IDENTITY_INSERT dbo.WORKFLOW ON;" +
                    " INSERT INTO dbo.WORKFLOW (workflowID, ticketStatus, ticketChangeDate, employeeID, serviceID) VALUES(@workflowID, @ticketStatus, @ticketChangeDate, @employeeID, @serviceID)" +
                    " SET IDENTITY_INSERT dbo.WORKFLOW OFF;";
                addWorkflow.Parameters.Add(new SqlParameter("@workflowID", workflowID));
                addWorkflow.Parameters.Add(new SqlParameter("@ticketStatus", "New Ticket"));
                addWorkflow.Parameters.Add(new SqlParameter("@ticketChangeDate", ticketChangeDate));
                addWorkflow.Parameters.Add(new SqlParameter("@employeeID", ddlEmpList.SelectedValue));
                addWorkflow.Parameters.Add(new SqlParameter("@serviceID", serviceID));
                addWorkflow.ExecuteNonQuery();

                System.Data.SqlClient.SqlCommand addNote = new System.Data.SqlClient.SqlCommand();
                addNote.Connection = sc;
                // INSERT INTO Workflow TABLE
                addNote.CommandText = "SET IDENTITY_INSERT dbo.NOTE ON;" +
                    " INSERT INTO dbo.NOTE (noteID, noteTitle, noteBody, workflowID) VALUES(@noteID, @noteTitle, @noteBody, @workflowID)" +
                    " SET IDENTITY_INSERT dbo.NOTE OFF;";
                addNote.Parameters.Add(new SqlParameter("@noteID", noteID));
                addNote.Parameters.Add(new SqlParameter("@noteTitle", HttpUtility.HtmlEncode(txtTitle.Text)));
                addNote.Parameters.Add(new SqlParameter("@noteBody", HttpUtility.HtmlEncode(txtNote.Text)));
                addNote.Parameters.Add(new SqlParameter("@workflowID", workflowID));
                addNote.ExecuteNonQuery();

                System.Data.SqlClient.SqlCommand addEqipServ = new System.Data.SqlClient.SqlCommand();
                addEqipServ.Connection = sc;
                // INSERT Service RECORD
                addEqipServ.CommandText = "SET IDENTITY_INSERT dbo.EQUIPMENTSERVICETICKET ON;" +
                    " INSERT INTO dbo.EQUIPMENTSERVICETICKET (equipmentServiceTicketID, serviceTicketID, equipmentID) VALUES(@equipmentServiceTicketID, @serviceTicketID, @equipmentID)" +
                    " SET IDENTITY_INSERT dbo.EQUIPMENTSERVICETICKET OFF;";
                addEqipServ.Parameters.Add(new SqlParameter("@equipmentServiceTicketID", equipmentServiceTicketID));
                addEqipServ.Parameters.Add(new SqlParameter("@serviceTicketID", serviceTicketID));
                addEqipServ.Parameters.Add(new SqlParameter("@equipmentID", equipmentID));
                addEqipServ.ExecuteNonQuery();

                for (int i = 0; i < lbInventory.Items.Count; i++)
                {
                    if (lbInventory != null)
                    {
                        System.Data.SqlClient.SqlCommand addInv = new System.Data.SqlClient.SqlCommand();
                        addInv.Connection = sc;
                        // INSERT INTO Inventory
                        String[] item = lbInventory.Items[i].ToString().Split(' ');
                        String itemDesc = item[0];
                        String itemCost = item[3];
                        String inventoryID = GenerateID("SELECT MAX(dbo.INVENTORY.inventoryID) FROM dbo.INVENTORY");
                        addInv.CommandText = "SET IDENTITY_INSERT dbo.INVENTORY ON;" +
                            " INSERT INTO dbo.INVENTORY (inventoryID, inventoryDescription, inventoryCost, customerID) VALUES(@inventoryID, @inventoryDescription, @inventoryCost, @customerID)" +
                            " SET IDENTITY_INSERT dbo.INVENTORY OFF;";
                        addInv.Parameters.Add(new SqlParameter("@inventoryID", inventoryID));
                        addInv.Parameters.Add(new SqlParameter("@inventoryDescription", HttpUtility.HtmlEncode(itemDesc)));
                        addInv.Parameters.Add(new SqlParameter("@inventoryCost", HttpUtility.HtmlEncode(itemCost)));
                        addInv.Parameters.Add(new SqlParameter("@customerID", ddlCustomer.SelectedValue));
                        addInv.ExecuteNonQuery();

                    }
                }
                lblNotify.Text = "Auction Service Ticket and Inventory has been added!";
            }

            catch
            {
                lblNotify.Text = "Error - Please try again.";
            }
        }

        //generate id 
        protected String GenerateID(String sqlQuery)
        {
            //holds the max id 
            String maxID = "";

            //connect to database
            SqlConnection sqlConnect = new SqlConnection("Server=Localhost;Database=Lab4;Trusted_Connection=Yes;");

            //create sql command object and send query 
            SqlDataAdapter sqlAdapter = new SqlDataAdapter(sqlQuery, sqlConnect);
            SqlCommand sqlCommand = new SqlCommand();
            sqlCommand.Connection = sqlConnect;
            sqlCommand.CommandType = CommandType.Text;
            sqlCommand.CommandText = sqlQuery;

            sqlConnect.Open();
            //data set to hold the max id  
            DataSet maxDS = new DataSet();
            sqlAdapter.Fill(maxDS);

            //place the result into a string
            maxID = maxDS.Tables[0].Rows[0][0].ToString();

            int newIDNum = int.Parse(maxID);
            //increment the max id by 1
            newIDNum++;

            string newID = newIDNum.ToString();
            sqlConnect.Close();

            return newID;

        }
        protected void BtnView_Click(object sender, EventArgs e)
        {
            String custID = "";
            //if there are columns
            if (grdvwAuctionTable.Rows.Count > 0)
            {
                for (int i = 0; i < grdvwAuctionTable.Rows.Count; i++)
                {
                    //finding checkbox in GridView
                    CheckBox cbx = (CheckBox)grdvwAuctionTable.Rows[i].FindControl("viewInventoryCB");
                    //CheckBox not null
                    if (cbx != null)
                    {
                        //if CheckBox Checked
                        if (cbx.Checked)
                        {
                            //this is for example to get first column values of selected CheckBox
                            String firstName = grdvwAuctionTable.Rows[i].Cells[1].Text;
                            String lastName = grdvwAuctionTable.Rows[i].Cells[2].Text;
                            custID = getCustID(firstName, lastName);
                        }
                    }
                }
            }
            //query to retrieve all auction srvice data for all instances in the database
            String sqlQuery = "SELECT INVENTORY.inventoryDescription AS 'Inventory Description', format(INVENTORY.inventoryCost, 'C') AS 'Cost'";
            sqlQuery += " FROM dbo.INVENTORY, dbo.CUSTOMER, dbo.SERVICE, dbo.SERVICETICKET";
            sqlQuery += " WHERE SERVICE.serviceID = SERVICETICKET.serviceID AND SERVICETICKET.customerID = CUSTOMER.customerID AND CUSTOMER.customerID = INVENTORY.customerID AND Service.serviceName = 'Auction' AND Customer.customerID = '" + custID + "'";

            SqlConnection sqlConnect = new SqlConnection("Server=Localhost;Database=Lab4;Trusted_Connection=Yes;");

            SqlDataAdapter sqlAdapter = new SqlDataAdapter(sqlQuery, sqlConnect);

            sqlConnect.Open();
            DataTable dtGrid = new DataTable();
            sqlAdapter.Fill(dtGrid);

            //bind grid and data to display information
            lblInventory.Text = "Inventory: ";
            viewInventory.DataSource = dtGrid;
            viewInventory.DataBind();

            sqlConnect.Close();

        }
        protected String getCustID(String FName, String LName)
        {
            string sqlQuery = "SELECT customerID FROM dbo.CUSTOMER WHERE CUSTOMER.firstName ='" + FName + "' AND CUSTOMER.lastName = '" + LName + "'";

            //connect to database
            SqlConnection sqlConnect = new SqlConnection("Server=Localhost;Database=Lab4;Trusted_Connection=Yes;");

            //create sql command object and send query 
            SqlDataAdapter sqlAdapter = new SqlDataAdapter(sqlQuery, sqlConnect);
            SqlCommand sqlCommand = new SqlCommand();
            sqlCommand.Connection = sqlConnect;
            sqlCommand.CommandType = CommandType.Text;
            sqlCommand.CommandText = sqlQuery;


            sqlConnect.Open();
            //data set to hold id  
            DataSet custDS = new DataSet();
            sqlAdapter.Fill(custDS);

            String custID = custDS.Tables[0].Rows[0][0].ToString();
            sqlConnect.Close();

            //return the ID
            return custID;
        }
    }
}


