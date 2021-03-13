using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace GreenValleyAuctionsSystem
{
    public partial class ServiceDetails : System.Web.UI.Page
    {
        Color greenValley = System.Drawing.ColorTranslator.FromHtml("#266141");
        protected void Page_Load(object sender, EventArgs e)
        {
            changeColor();
            //connect to database
            SqlConnection sqlConnect = new SqlConnection("Server=Localhost;Database=Lab4;Trusted_Connection=Yes;");

            String sqlQuery = "SELECT CUSTOMER.firstName, CUSTOMER.lastName, CUSTOMER.emailAddress, CUSTOMER.phoneNumber, " +
                "CUSTOMER.streetAddress + ' ' + CUSTOMER.city + ', ' + CUSTOMER.state + ' ' + CUSTOMER.zipcode AS CustomerAddress, " +
                "phoneNumber, SERVICE.timeDate FROM dbo.CUSTOMER, dbo.SERVICE, dbo.SERVICETICKET";
            sqlQuery += " WHERE CUSTOMER.customerID = SERVICETICKET.customerID AND SERVICETICKET.serviceID = SERVICE.serviceID AND SERVICE.serviceID = '" + Session["serviceID"].ToString() + "'";


            //create sql command object and send query 
            SqlDataAdapter sqlAdapter = new SqlDataAdapter(sqlQuery, sqlConnect);
            SqlCommand sqlCommand = new SqlCommand();
            sqlCommand.Connection = sqlConnect;
            sqlCommand.CommandType = CommandType.Text;
            sqlCommand.CommandText = sqlQuery;

            sqlConnect.Open();
            //data set to hold the max id  
            DataSet customerDS = new DataSet();
            sqlAdapter.Fill(customerDS);

            String fName = customerDS.Tables[0].Rows[0][0].ToString();
            String lName = customerDS.Tables[0].Rows[0][1].ToString();
            String email = customerDS.Tables[0].Rows[0][2].ToString();
            String phone = customerDS.Tables[0].Rows[0][3].ToString();
            String address = customerDS.Tables[0].Rows[0][4].ToString();
            String[] contact = customerDS.Tables[0].Rows[0][5].ToString().Split(' ');
            String contactDate = contact[0];

            lblTitle.Text = Session["serviceType"] + " Ticket";
            lblFirstName.Text = "First Name: " + fName;
            lblLastName.Text = "Last Name: " + lName;
            lblEmail.Text = "Email: " + email;
            lblPhone.Text = "Phone Number: " + phone;
            lblAddress.Text = "Address: " + address;
            lblInitalContact.Text = "Initial Contact Date: " + contactDate;

            if (!IsPostBack)
            {
                inventoryLB();
            }

        }


        protected void btnNewReqSubmitted_Click(object sender, EventArgs e)
        {
            changeColor();
            btnNewReqSubmitted.BackColor = greenValley;
            btnInitalForm.Visible = true;
        }

        protected void btnConfirmed_Click(object sender, EventArgs e)
        {
            changeColor();
            btnNewReqSubmitted.BackColor = greenValley;
            btnConfirmed.BackColor = greenValley;
            btnInitalForm.Visible = false;

        }

        protected void btnInProgress_Click(object sender, EventArgs e)
        {
            changeColor();
            btnNewReqSubmitted.BackColor = greenValley;
            btnConfirmed.BackColor = greenValley;
            btnInProgress.BackColor = greenValley;
            btnInitalForm.Visible = false;
        }

        protected void btnComplete_Click(object sender, EventArgs e)
        {
            changeColor();
            btnNewReqSubmitted.BackColor = greenValley;
            btnConfirmed.BackColor = greenValley;
            btnInProgress.BackColor = greenValley;
            btnComplete.BackColor = greenValley;
            btnInitalForm.Visible = false;
        }

        protected void btnAwaitingPayment_Click(object sender, EventArgs e)
        {
            changeColor();
            btnNewReqSubmitted.BackColor = greenValley;
            btnConfirmed.BackColor = greenValley;
            btnInProgress.BackColor = greenValley;
            btnComplete.BackColor = greenValley;
            btnAwaitingPayment.BackColor = greenValley;
            btnInitalForm.Visible = false;
        }

        protected void btnPaymentApproved_Click(object sender, EventArgs e)
        {
            changeColor();
            btnNewReqSubmitted.BackColor = greenValley;
            btnConfirmed.BackColor = greenValley;
            btnInProgress.BackColor = greenValley;
            btnComplete.BackColor = greenValley;
            btnAwaitingPayment.BackColor = greenValley;
            btnPaymentApproved.BackColor = greenValley;
            btnInitalForm.Visible = false;
        }

        protected void btnAwaitingReview_Click(object sender, EventArgs e)
        {
            changeColor();
            btnNewReqSubmitted.BackColor = greenValley;
            btnConfirmed.BackColor = greenValley;
            btnInProgress.BackColor = greenValley;
            btnComplete.BackColor = greenValley;
            btnAwaitingPayment.BackColor = greenValley;
            btnPaymentApproved.BackColor = greenValley;
            btnAwaitingReview.BackColor = greenValley;
            btnInitalForm.Visible = false;
        }

        protected void btnReviewComplete_Click(object sender, EventArgs e)
        {
            changeColor();
            btnNewReqSubmitted.BackColor = greenValley;
            btnConfirmed.BackColor = greenValley;
            btnInProgress.BackColor = greenValley;
            btnComplete.BackColor = greenValley;
            btnAwaitingPayment.BackColor = greenValley;
            btnPaymentApproved.BackColor = greenValley;
            btnAwaitingReview.BackColor = greenValley;
            btnReviewComplete.BackColor = greenValley;
            btnInitalForm.Visible = false;
        }
        protected void changeColor()
        {
            Color col = System.Drawing.ColorTranslator.FromHtml("#fffa8c");

            btnNewReqSubmitted.BackColor = col;
            btnConfirmed.BackColor = col;
            btnInProgress.BackColor = col;
            btnComplete.BackColor = col;
            btnAwaitingPayment.BackColor = col;
            btnPaymentApproved.BackColor = col;
            btnAwaitingReview.BackColor = col;
            btnReviewComplete.BackColor = col;
        }

        protected void btnInitalForm_Click(object sender, EventArgs e)
        {
            Response.Redirect("AuctionPickUpForm.aspx");
        }

        protected void inventoryLB()
        {
            //connect to database
            SqlConnection sqlConnect = new SqlConnection("Server=Localhost;Database=Lab4;Trusted_Connection=Yes;");

            String sqlQuery = "select INVENTORY.inventoryDescription, INVENTORY.inventoryCost FROM dbo.Inventory, dbo.SERVICE, dbo.CUSTOMER, dbo.SERVICETICKET WHERE INVENTORY.customerID = CUSTOMER.customerID AND CUSTOMER.customerID = SERVICETICKET.customerID AND SERVICETICKET.serviceID = SERVICE.serviceID AND SERVICE.serviceID = '" + Session["serviceID"] + "'";


            //create sql command object and send query 
            SqlDataAdapter sqlAdapter = new SqlDataAdapter(sqlQuery, sqlConnect);
            SqlCommand sqlCommand = new SqlCommand();
            sqlCommand.Connection = sqlConnect;
            sqlCommand.CommandType = CommandType.Text;
            sqlCommand.CommandText = sqlQuery;

            sqlConnect.Open();
            //data set to hold the max id  
            DataSet inventoryDS = new DataSet();
            sqlAdapter.Fill(inventoryDS);


            if (inventoryDS != null)
            {
                foreach (DataRow dr in inventoryDS.Tables[0].Rows)
                {
                    string inventoryDesc = dr["inventoryDescription"].ToString();
                    string inventoryCost = dr["inventoryCost"].ToString();
                    lbInventory.Items.Add(inventoryDesc + ' ' + inventoryCost);
                }
            }
        }
    }
}



