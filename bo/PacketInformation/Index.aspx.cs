using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

public partial class PacketInformation_Index : System.Web.UI.Page
{
    string updateby;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.IsLocal)
        {
            updateby = "localuser";
        }
        else
        {
            try
            {
                cfsession.setsession();
                if (Session["Name"].ToString() == string.Empty)
                {
                    Response.Redirect("/tm-tm/login.cfm");
                }
                //check admin
                if (Session["admin"].Equals("0"))
                {
                    Response.Redirect("/tm-tm/login.cfm");
                }

                updateby = Session["Name"].ToString();
            }
            catch (Exception ee)
            {
                Response.Redirect("/tm-tm/login.cfm?error=" + ee.Message);
            }
        }
    }
}
