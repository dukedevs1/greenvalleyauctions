using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GreenValleyAuctionsSystem
{
    public partial class CustomerFacingMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRequestService_Click(object sender, EventArgs e)
        {
            //Response.Redirect("RequestService.aspx");
        }

        protected void btnEvents_Click(object sender, EventArgs e)
        {
            //this page will be like an Outlook calendar with all upcoming events
            //Response.Redirect("Events.aspx");
        }

        protected void btnContactUs_Click(object sender, EventArgs e)
        {
            //This page will just have contact info in case any customers want to call and request service that way or if they want to inquire about services already requested
            //Response.Redirect("ContactUs.aspx");
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            //Session aware functionality needed-- label of "User successfully Logged out"
            //Response.Redirect("HomePage.aspx");
        }
    }
}