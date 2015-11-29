using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;


public partial class MOO_Menu : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       string s = "http://"+ HttpContext.Current.Request.Url.Host ;
        try
        {
            cfsession.setsession();

            if (Session["Name"].ToString() == string.Empty)
            {
               
                Response.Redirect("/tm-tm/login.cfm?u=" + s);
            }

            if (Session["admin"].Equals("0"))
            {
                Response.Redirect("/tm-tm/login.cfm?t=0");
            }
            if (Session["role"].ToString()==string.Empty)
            {
                Response.Redirect("/tm-tm/login.cfm?p=0");
            }
            else
            {
                string role = Session["role"].ToString();
                if (role == "superadmin")
                {
                    HyplnkReceivedModlist.Visible = true;
                    HyplnkCustomerModlist.Visible = true;
                    HyplnkPendinglist.Visible     = true;
                    hypladdsupplieritems.Enabled = true;
                    HyperLink3.Visible = true;
					Hyplnknew.Visible = false;
					HyplnkWIP.Visible = false;
					HyplnkShipped.Visible = false;
                }
                if (role == "supplier")
                {
                    HyplnkReceivedModlist.Visible = false;
                    HyplnkCustomerModlist.Visible = false;
                    HyplnkPendinglist.Visible     = false;
                    HyperLink3.Visible = false;

                    hypladdsupplieritems.Visible = false;
                    hypladdsupplieritems.Enabled = false;
                }
            }

        }
        catch (Exception ee)
        {
            Response.Redirect(String.Concat("/tm-tm/login.cfm?e=",ee.StackTrace));
        }
    }
}
