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
public partial class Tasks_taskinfo : System.Web.UI.Page
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

        GrdVTinfo();
    }
   
   

    public void GrdVTinfo()
    {
        string connectionstring = WebConfigurationManager.ConnectionStrings["mysql"].ConnectionString;
        OdbcConnection connection = new OdbcConnection(connectionstring);
       try {
	    OdbcCommand cmd = new OdbcCommand();
        cmd.CommandText = "  SELECT concat('&doi=',cast(task.tdtoi AS CHAR),'&by=',task.tby) as taskid, subject as mainsubject, task.tdtoi, task.tby, status,action, pdc, taskdetails.detail , mainsubject as subject FROM task, taskdetails  WHERE task_type= 'cart_issue'  and task.tdtoi = taskdetails.tdtoi and task.tby = taskdetails.tby order by status";
        cmd.CommandType = CommandType.Text;
        cmd.Connection = connection;
//        cmd.Parameters.AddWithValue("@tby",Session["Name"].ToString());
        OdbcDataAdapter ada = new OdbcDataAdapter(cmd);
        DataTable dt = new DataTable();
        ada.Fill(dt);
        DataView dv = dt.DefaultView;
        dv.Sort = "tdtoi DESC";
		g.setDS(dv);
		//GrdVtaskinfo.DataSource = dv;
        //GrdVtaskinfo.DataBind();
        }
		 catch (Exception p)
		   {
		   _error.Text = p.Message + p.StackTrace;
		   Alert.Show("1");
		   }
    }
}
