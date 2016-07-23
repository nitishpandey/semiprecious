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

using System.Data.Odbc;
using System.Web.Configuration;
using System.Data.Odbc;
using System.Web.Configuration;

public partial class Task_TaskForMe : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
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

        }
        catch (Exception ee)
        {
            Response.Redirect("/tm-tm/login.cfm ");
        }
         
         GrdVTfMe();
       
    }



    public void GrdVTfMe()
    {

        string connectionstring = WebConfigurationManager.ConnectionStrings["OdbcConnectionString"].ConnectionString;
        OdbcConnection connection = new OdbcConnection(connectionstring);
        OdbcCommand cmd = new OdbcCommand();
		
		string status_filter = Request.QueryString["status"];
       if (String.Compare(status_filter,"complete")== 0)
	    cmd.CommandText = "select * from ntask where ( ntask.status='Complete' ) and (ntask.action=?) ";
		else if (String.Compare(status_filter,"close")== 0)
        cmd.CommandText = "select * from ntask where (ntask.status='Close' ) and (ntask.action=?) ";
		else
		cmd.CommandText = "select * from ntask where (ntask.status='active'  or ntask.status='Ack') and (ntask.action=?) ";
        cmd.CommandType = CommandType.Text;
        cmd.Connection = connection;
        cmd.Parameters.AddWithValue("@action", Session["Name"].ToString());
        OdbcDataAdapter ada = new OdbcDataAdapter(cmd);
        DataTable dt = new DataTable();
        ada.Fill(dt);
        DataView dv = dt.DefaultView;
        dv.Sort = "tdtoi DESC";
         g.setDS(dv);
//        g.GrdVTask.DataBind();
   
    }
}
  
    
