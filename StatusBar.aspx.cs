using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;

namespace GreenValleyAuctionsSystem
{
    public partial class StatusBar : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void ddlStatus_SelectedIndexChanged(object sender, EventArgs e)
        {
            string selectedItem = ddlStatus.SelectedValue;
            int selectedInt = Int32.Parse(selectedItem);
            lblTest.Text = selectedItem;
            if (selectedInt == 1)
            {
                lblNewReqSubmitted.BackColor = Color.Red;
            }
            if (selectedInt == 2)
            {
                lblNewReqSubmitted.BackColor = Color.Red;
                lblConfirmed.BackColor = Color.Red;
            }
            if (selectedInt == 3)
            {
                lblNewReqSubmitted.BackColor = Color.Red;
                lblConfirmed.BackColor = Color.Red;
                lblInProgress.BackColor = Color.Red;
            }
            if (selectedInt == 4)
            {
                lblNewReqSubmitted.BackColor = Color.Red;
                lblConfirmed.BackColor = Color.Red;
                lblInProgress.BackColor = Color.Red;
                lblComplete.BackColor = Color.Red;
            }




        }
    }
}