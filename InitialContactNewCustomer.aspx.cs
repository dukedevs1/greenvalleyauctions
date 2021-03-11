using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

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
    }
}