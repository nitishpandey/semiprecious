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


public partial class Tasks_tasksearch : System.Web.UI.Page
{
    string SearchingName;
    string ActionBy;
    string InititedBy;
    string Info;
    int taskid = 0;
    string Status;
    string date;
    DateTime dt;
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
            Response.Redirect("/tm-tm/login.cfm?error=" + ee.Message);
        }
         SearchingName=Session["Name"].ToString();
        

    }
   

    protected void BtnSubmit_Click(object sender, EventArgs e)
    {
        taskid = int.Parse(txttaskid.Text.Trim());
        string connectionstring = WebConfigurationManager.ConnectionStrings["OdbcConnectionString"].ConnectionString;
        OdbcConnection con = new OdbcConnection(connectionstring);
        OdbcCommand cmd = new OdbcCommand();
        cmd.Connection = con;
        cmd.CommandText = "select action,tby,status,pdc,infoto from ntask,ntaskinfo where ntask.taskid=ntaskinfo.taskid and ntask.taskid=? ";
        cmd.CommandType = CommandType.Text;
        cmd.Parameters.AddWithValue("@taskid", taskid);
        OdbcDataReader reader;
        try
        {
            con.Open();
            reader = cmd.ExecuteReader();
            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    ActionBy = (string)reader["action"];
                    InititedBy = (string)reader["tby"];
                    Status = (string)reader["status"];
                    dt = (DateTime)reader["pdc"];
                    Info = (string)reader["infoto"];
                    date = String.Format("{0:yyyy/M/d}", dt);
                }
                if (ActionBy == SearchingName)
                {
                    Response.Redirect(string.Format("AddResponse.aspx?taskid={0}&action={1}&status={2}&pdc={3}&tby={4}", taskid, ActionBy, Status, date, InititedBy));
                }
                if (InititedBy == SearchingName)
                {
                    Response.Redirect(string.Format("AddResponse.aspx?taskid={0}&tby={1}&status={2}&pdc={3}", taskid, InititedBy, Status, date));
                }
                if (Info == SearchingName)
                {
                    Response.Redirect(string.Format("AddResponse.aspx?taskid={0}&status={1}&pdc={2}&tby={3}&infoto={4}", taskid, Status, date, InititedBy, Info));
                }
            }
         else 
            {
            reader.Close();
            cmd.CommandText = "select action,tby,status,pdc from ntask where  ntask.taskid=? ";
            cmd.CommandType = CommandType.Text;
            cmd.Parameters.AddWithValue("@taskid", taskid);
            reader = cmd.ExecuteReader();
            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    ActionBy = (string)reader["action"];
                    InititedBy = (string)reader["tby"];
                    Status = (string)reader["status"];
                    dt = (DateTime)reader["pdc"];
                    date= String.Format("{0:yyyy/M/d}", dt);
                }
                if (ActionBy == SearchingName)
                {
                    Response.Redirect(string.Format("AddResponse.aspx?taskid={0}&action={1}&status={2}&pdc={3}&tby={4}", taskid, ActionBy, Status,date, InititedBy));
                }
                if (InititedBy == SearchingName)
                {
                    Response.Redirect(string.Format("AddResponse.aspx?taskid={0}&tby={1}&status={2}&pdc={3}", taskid, InititedBy, Status, date));
                }
              
            }
            reader.Close();
            con.Close();
            lblName.Text = "Task Id is not found. Try again ";

            } 
        }
        catch(OdbcException ee)
        {
            lblName.Text = "No TaskID is found.";
        }
    }

   
}
