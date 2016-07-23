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

public partial class Tasks_taskclosed : System.Web.UI.Page
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

        LblHeading.Text = " Task Closed by " + Session["Name"].ToString();
        
        TaskClosed();
    }

    public void TaskClosed() 
    {
        string connectionstring = WebConfigurationManager.ConnectionStrings["OdbcConnectionString"].ConnectionString;
        OdbcConnection connection = new OdbcConnection(connectionstring);
        OdbcCommand cmd = new OdbcCommand();
        cmd.CommandText = "select * from ntask where (ntask.status='Close') and (ntask.tby=?) ";
        cmd.CommandType = CommandType.Text;
        cmd.Connection = connection;
        cmd.Parameters.AddWithValue("@tby", Session["Name"].ToString());
        OdbcDataAdapter ada = new OdbcDataAdapter(cmd);
        DataTable dt = new DataTable();
        ada.Fill(dt);
        DataView dv = dt.DefaultView;
        dv.Sort = "tdtoi DESC";
        GrdVtaskclosed.DataSource = dv;
        GrdVtaskclosed.DataBind();
    
    
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GrdVtaskclosed.PageIndex = e.NewPageIndex;
        GrdVtaskclosed.DataBind();
    }
}
