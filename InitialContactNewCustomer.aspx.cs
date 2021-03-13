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

namespace GreenValleyAuctionsSystem
{
    public partial class InitialContactNewCustomer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnExistingCustomer_Click(object sender, EventArgs e)
        {
            Response.Redirect("InitialContactExistingCustomer.aspx");

        }

        protected void btnNewCustomer_Click(object sender, EventArgs e)
        {
            Response.Redirect("InitialContactNewCustomer.aspx");
        }
        protected void btnAnotherItem_Click(object sender, EventArgs e)
        {

        }

        protected void cbxAuction_CheckedChanged(object sender, EventArgs e)
        {
            if (cbxAuction.Checked)
            {
                Table2.Visible = true;
            }
            else
            {
                Table2.Visible = false;
            }
        }

        protected void cbxMove_CheckedChanged(object sender, EventArgs e)
        {
            if (cbxMove.Checked)
            {
                Table3.Visible = true;
            }
            else
            {
                Table3.Visible = false;
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {

            string saveNewCustomer = "";
            saveNewCustomer = "INSERT INTO CUSTOMER(firstName, lastName, initialContact, discoveredFrom, emailAddress, streetAddress, city, state, zipcode, phoneNumber, phoneType) " +
                "VALUES('" + txtbxFName.Text + "', '" + txtbxLName.Text + "', '" + txtbxMethodOfContact.Text + "', '" + txtbxHowTheyHeard.Text + "', '" + txtbxEmail.Text + "', '" +
                txtbxCustomerStreet.Text + "', '" + txtbxCustomerCity.Text + "', '" +
                txtbxCustomerState.Text + "', '" + txtbxCustomerZipCode.Text + "', '" + txtbxPhoneNumber.Text + "', '" + ddlPhoneType.SelectedValue.ToString() + "')";

            //Define connection to database 
            SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab4"].ConnectionString);


            //create sql command object which will send the query
            SqlCommand sqlCommand = new SqlCommand();
            sqlCommand.Connection = sqlConnect;
            sqlCommand.CommandType = CommandType.Text;
            sqlCommand.CommandText = saveNewCustomer;


            //open connection
            sqlConnect.Open();

            //send query
            SqlDataReader queryResults = sqlCommand.ExecuteReader();
            //close connections
            queryResults.Close();
            sqlConnect.Close();
        }
    }
}

