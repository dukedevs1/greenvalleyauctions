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
    public partial class InitialContactExistingCustomer : System.Web.UI.Page
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

                //string custAddressQuery = "SELECT address from CUSTOMER " +
                //    "WHERE (firstName + ' ' + lastName) = " + ddlCustomers.SelectedValue.ToString() + ";";

                ////Connect to database
                //SqlConnection sqlConnect = new SqlConnection("server=localhost; Database=Lab4;Trusted_Connection=Yes;");

                ////create sql comand and send query
                //SqlCommand sqlCommand = new SqlCommand();
                //sqlCommand.Connection = sqlConnect;
                //sqlCommand.CommandType = CommandType.Text;
                //sqlCommand.CommandText = custAddressQuery;

                //sqlConnect.Open();
                ////SqlDataReader queryResult = sqlCommand.ExecuteReader();
                //string customerAddress = (string)sqlCommand.ExecuteScalar();

                ////auto populating textbox with customer's address
                //txtbxCurrentStreet.Text = customerAddress;

                ////queryResult.Close();
                //sqlConnect.Close();
            }
            else
            {
                Table3.Visible = false;
            }
        }
    }
}


