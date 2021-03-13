using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace GreenValleyAuctionsSystem
{
    public partial class AuctionPickUpForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //connect to database
            SqlConnection sqlConnect = new SqlConnection("Server=Localhost;Database=Lab4;Trusted_Connection=Yes;");

            String sqlQuery = "SELECT CUSTOMER.firstName, CUSTOMER.lastName, CUSTOMER.emailAddress, CUSTOMER.phoneNumber, CUSTOMER.address, SERVICE.timeDate FROM dbo.CUSTOMER, dbo.SERVICE, dbo.SERVICETICKET";
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
        }

    }
}


