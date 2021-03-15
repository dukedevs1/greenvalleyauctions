using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;

namespace GreenValleyAuctionsSystem
{
    public partial class ContactUs : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {

            string serviceType = HttpUtility.HtmlEncode(ddlServiceType.Text);
            string inquiry = HttpUtility.HtmlEncode(txtInquiryInfo.Text);
            DateTime currentDate = DateTime.Now;

            if (serviceType != "")
            {

                System.Data.SqlClient.SqlCommand addInquiry = new System.Data.SqlClient.SqlCommand();
                SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab4"].ConnectionString);


            }

        }
    }
}

