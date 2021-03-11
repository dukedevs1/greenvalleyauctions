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
using System.Windows.Input;
using System.Windows.Markup;
using System.Text;
using System.Configuration;

namespace GreenValleyAuctionsSystem
{
    public partial class EmployeeDashboard : System.Web.UI.Page
    { 
        protected void Page_Load(object sender, EventArgs e)
        {
             
        }

        protected void seenCheckBox_CheckedChanged(object sender, EventArgs e)
        {
            //String custID = "";
            //int i = 0;
            //foreach (GridViewRow row in grdVwServiceRequest.Rows)
            //{
            //    //find the checkbox
            //    CheckBox seenCheckBox = row.FindControl("seenCheckBox") as CheckBox;
            //    if (seenCheckBox != null && seenCheckBox.Checked)
            //    {
            //        //make the row not visible
            //        grdVwServiceRequest.Rows[row.RowIndex].Visible = false;
            //        String firstName = grdVwServiceRequest.Rows[i].Cells[1].Text;
            //        String lastName = grdVwServiceRequest.Rows[i].Cells[2].Text;
            //        custID = getCustID(firstName, lastName);
            //        String dbConnection = System.Configuration.ConfigurationManager.ConnectionStrings["Lab4"].ConnectionString;
            //        using (SqlConnection connection = new SqlConnection(dbConnection))

            //        using (SqlCommand command = connection.CreateCommand())

            //        {
            //            command.CommandText = "UPDATE dbo.SERVICEREQUEST SET requestSeen = @seen FROM dbo.SERVICEREQUEST " +
            //                "WHERE CUSTOMER.customerID = SERVICEREQUEST.customerID;"; 

            //            //command.CommandText = "UPDATE dbo.SERVICEREQUEST SET requestSeen = @seen FROM dbo.CUSTOMER, dbo.TicketHistory, " +
            //            //    "dbo.CustomerService WHERE Customer.customerID = CustomerService.customerID AND CustomerService.tktID = TicketHistory.tktID 
            //            //AND ServiceRequest.customerID = '" + custID + "' AND ServiceRequest.serviceType = 'Moving'";
            //            command.Parameters.AddWithValue("@seen", 1);

            //            connection.Open();

            //            command.ExecuteNonQuery();

            //            connection.Close();
            //            i++;
            //        }
               }
              
        //protected String getCustID(String firstName, String lastName)
        //{
        //    //string sqlQuery = "SELECT customerID FROM dbo.CUSTOMER WHERE CUSTOMER.firstName ='" + firstName + "' AND CUSTOMER.lastName = '" + lastName + "'";

        //    ////connect to database
        //    //SqlConnection sqlConnect = new SqlConnection("Server=Localhost;Database=Lab4;Trusted_Connection=Yes;");

        //    ////create sql command object and send query 
        //    //SqlDataAdapter sqlAdapter = new SqlDataAdapter(sqlQuery, sqlConnect);
        //    //SqlCommand sqlCommand = new SqlCommand();
        //    //sqlCommand.Connection = sqlConnect;
        //    //sqlCommand.CommandType = CommandType.Text;
        //    //sqlCommand.CommandText = sqlQuery;


        //    //sqlConnect.Open();
        //    ////data set to hold the max request id  
        //    //DataSet custDS = new DataSet();
        //    //sqlAdapter.Fill(custDS);


        //    //String custID = custDS.Tables[0].Rows[0][0].ToString(); //ERROR: no row at index 0
        //    //sqlConnect.Close();

        //    //return custID;
        //}


            protected void grdVwServiceRequest_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            DateTime currentDate = DateTime.Now;
            //DateTime threeDaysAhead = DateTime.Now.AddDays(3);

            if (e.Row.RowIndex >= 0)
            {
                DateTime daysBetween = (DateTime.Parse(e.Row.Cells[4].Text));
                DateTime refDate = daysBetween.AddDays(3);

                if (refDate < currentDate)
                {
                    e.Row.Cells[5].Font.Bold = true;
                    e.Row.Cells[5].ForeColor = Color.Red;

                }
                else if (DateTime.Parse(e.Row.Cells[4].Text) > currentDate)
                {
                    e.Row.Cells[5].Font.Italic = true;
                    e.Row.Cells[5].Text = "Future date";

                }
                else
                {
                    e.Row.Cells[5].Font.Bold = true;
                }

            }
        }

        protected void grdVwServiceRequest_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Respond")
            {
                //Determine the RowIndex of the Row whose Button was clicked.
                int rowIndex = Convert.ToInt32(e.CommandArgument);

                //Reference the GridView Row.
                GridViewRow row = grdVwServiceRequest.Rows[rowIndex];

                string customerName = (row.FindControl("lblCustName") as Label).Text;


                //Label lbl = row.FindControl("lblDaysSince") as Label;

                //sample email in field 
                lblEmail.Text = "Hello " + customerName + ", " +
                    "thank you for contacting Green Valley Moving and Auctions and for considering using our services. " +
                    "I am looking at the calendar to schedule. As soon as I’ve found a suitable date, I will have Laura contact you.";


            }
        }
    }
}