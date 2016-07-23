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

public partial class main : System.Web.UI.Page
{

    string connectionstring = WebConfigurationManager.ConnectionStrings["OdbcConnectionString"].ConnectionString;
    

    int taskbyme = 0;
    int taskforme = 0;
	int taskformeclo = 0;
	int taskformecomp = 0;
    int Pdctaskbyme = 0;
    int Pdctaskforme = 0;
    int completestatus = 0;
    int inforcount = 0;
    int diffcount = 0;
    int taskclose = 0;
    string currenttime;
    string name;
    string dthundred;
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            cfsession.setsession();
            
            //check admin
            if (Session["admin"].Equals("0"))
            {
                Response.Redirect("/tm-tm/login.cfm?from=main");
            }

                    }
        catch (Exception ee)
        {
            Response.Redirect("/tm-tm/login.cfm?error=" + ee.Message);
        }
        name = Session["Name"].ToString();
        //current tme
        DateTime dt = DateTime.Now;
        currenttime  = String.Format("{0:yyyy/M/d}", dt);


        //string name ="rpgoswami";
        gettaskforme(name);
        hyplnktaskforme.Text = "Open (Active or Ack) Tasks for You(" + Convert.ToString(taskforme) + ")";
        gettaskformecomp(name);
        hyplnktaskformecomp.Text = "Task Completed By You(" + Convert.ToString(taskformecomp) + ")";
        gettaskformeclo(name);
        hyplnktaskformeclo.Text = "Task Completed By You and Closed By Initiator (" + Convert.ToString(taskformeclo) + ")";
        
        gettaskbyme(name);
        HyplnkTaskbyme.Text = "Task Initiated By You With Status Open (" + Convert.ToString(taskbyme) + ")";
        hyplnkpdctaskforme.Visible = false;
        hyplnkpdctaskbyme.Visible = false;
        PDCTaskByMe(name);
        if (Pdctaskbyme != 0)
        {
            hyplnkpdctaskbyme.Text = " Your Tasks Delayed By Others(" + Convert.ToString(Pdctaskbyme) + ")" + " Please modify PDC";
            hyplnkpdctaskbyme.Visible = true;
        }
        
        PDCTaskForMe(name);
        if(Pdctaskforme!=0)
        {
        hyplnkpdctaskforme.Text = "Tasks You are Running Late On(" + Convert.ToString(Pdctaskforme) + ")"+ " Please Acknowledge to Initiated person to modify PDC";

        hyplnkpdctaskforme.Visible = true;
        }

        //complete task
        Hyplnkcompletetask.Visible = false;
         complete(name);
         if (completestatus != 0)
        {
            Hyplnkcompletetask.Text = "Complete task (" + completestatus + ")";
            Hyplnkcompletetask.Visible = true;
        }

         information(name);
         if (inforcount != 0)
         {
             HypInfo.Text = "Open For Your Info Tasks (" + inforcount + ")";
             HypInfo.Visible = true;
         }

        // closed task by (initiated by)
         TaskClosed(name);
         HyplClosedTask.Text="Tasks Initiated By You and Now Closed ("+taskclose+")";
            
            

        /* Delayed task which are more than 100 days */
         //String.Format("{0:yyyy/M/d HH:mm:ss}", dt);
         DateTime dtToday = DateTime.Today;
         string todate = Convert.ToString(dtToday);
         DateTime dtpast = DateTime.Today.AddDays(-100);
          dthundred = String.Format("{0:yyyy/M/d HH:mm:ss}", dtpast);
         TimeSpan difference = dtToday.Subtract(dtpast); //  dtpast.Subtract(dtToday);
         string DiffTime = Convert.ToString(difference);
		   if (Session["admin"].Equals("1"))
            {
			             HypAllCart.Visible = true;
            }
        
    }

    public void gettaskbyme(string Name)
    {
        int count = 0;
        OdbcConnection con = new OdbcConnection(connectionstring);
        OdbcCommand cmd = new OdbcCommand();
        cmd.Connection = con;
        cmd.CommandText = "SELECT count(status) as tfbm FROM ntask where (status='active' or status='ack')  and tby=?";
        cmd.CommandType = CommandType.Text;
        cmd.Parameters.AddWithValue("@tby",Name);
        OdbcDataReader reader;
        con.Open();
        reader = cmd.ExecuteReader();
        if (reader.HasRows)
        {
            while (reader.Read())
            {
                string status = reader["tfbm"].ToString();
                count = int.Parse(status);
            }
           
        }
        taskbyme =count;
        reader.Close();
        con.Close();
    
    }
	    public void gettaskforme(string Name)
    {
        int count = 0;
        OdbcConnection con = new OdbcConnection(connectionstring);
        OdbcCommand cmd = new OdbcCommand();
        cmd.Connection = con;
        cmd.CommandText = "SELECT count(status) as tfm FROM ntask where (status='active' or status = 'ack')  and action=?";
        cmd.CommandType = CommandType.Text;
        cmd.Parameters.AddWithValue("@action", Name);
        OdbcDataReader reader;
        con.Open();
        reader = cmd.ExecuteReader();
        if (reader.HasRows)
        {
            while (reader.Read())
            {
                string status = reader["tfm"].ToString();
                count = int.Parse(status);
                
            }

        }
        taskforme = count;
        
        reader.Close();
        con.Close();

    }
    public void gettaskformeclo(string Name)
    {
        int count = 0;
        OdbcConnection con = new OdbcConnection(connectionstring);
        OdbcCommand cmd = new OdbcCommand();
        cmd.Connection = con;
        cmd.CommandText = "SELECT count(status) as tfm FROM ntask where (status='close')  and action=?";
        cmd.CommandType = CommandType.Text;
        cmd.Parameters.AddWithValue("@action", Name);
        OdbcDataReader reader;
        con.Open();
        reader = cmd.ExecuteReader();
        if (reader.HasRows)
        {
            while (reader.Read())
            {
                string status = reader["tfm"].ToString();
                count = int.Parse(status);
                
            }

        }
        taskformeclo = count;
        
        reader.Close();
        con.Close();

    }

    public void gettaskformecomp(string Name)
    {
        int count = 0;
        OdbcConnection con = new OdbcConnection(connectionstring);
        OdbcCommand cmd = new OdbcCommand();
        cmd.Connection = con;
        cmd.CommandText = "SELECT count(status) as tfm FROM ntask where (status='complete')  and action=?";
        cmd.CommandType = CommandType.Text;
        cmd.Parameters.AddWithValue("@action", Name);
        OdbcDataReader reader;
        con.Open();
        reader = cmd.ExecuteReader();
        if (reader.HasRows)
        {
            while (reader.Read())
            {
                string status = reader["tfm"].ToString();
                count = int.Parse(status);
                
            }

        }
        taskformecomp = count;
        
        reader.Close();
        con.Close();

    }

    // Taskbyme pdc before the current date

    public void PDCTaskByMe(string Name)
    {
        int count = 0;
        OdbcConnection con = new OdbcConnection(connectionstring);
        OdbcCommand cmd = new OdbcCommand();
        cmd.Connection = con;
        cmd.CommandText = "SELECT count(status) as pdctm FROM ntask where (status='active' or status='ack' or status='complete')  and tby=? and pdc < '" + currenttime + "' ";
        cmd.CommandType = CommandType.Text;
        cmd.Parameters.AddWithValue("@tby", Name);
       
        OdbcDataReader reader;
        con.Open();
        reader = cmd.ExecuteReader();
        if (reader.HasRows)
        {
            while (reader.Read())
            {
                string status = reader["pdctm"].ToString();
                count = int.Parse(status);
            }
        }
        Pdctaskbyme = count;
        reader.Close();
        con.Close();

    }

    //This is for TASK FOR ME PDC

    public void PDCTaskForMe(string Name)
    {
        int count = 0;
        OdbcConnection con = new OdbcConnection(connectionstring);
        OdbcCommand cmd = new OdbcCommand();
        cmd.Connection = con;
        cmd.CommandText = "SELECT count(status) as pdct FROM ntask where (status='active' or status='ack' or status='complete')  and action=? and pdc < '" + currenttime + "' ";
        cmd.CommandType = CommandType.Text;
        cmd.Parameters.AddWithValue("@action", Name);
        OdbcDataReader reader;
        con.Open();
        reader = cmd.ExecuteReader();
        if (reader.HasRows)
        {
            while (reader.Read())
            {
                string status = reader["pdct"].ToString();
                count = int.Parse(status);
                
                
            }

        }
        Pdctaskforme = count;

        reader.Close();
        con.Close();

    }

    // This is for check task status=complete 

    public void complete(string completename)
    {
        int count = 0;
        OdbcConnection con = new OdbcConnection(connectionstring);
        OdbcCommand cmd = new OdbcCommand();
        cmd.Connection = con;
        cmd.CommandText = "SELECT count(status) as ct FROM ntask where (status='complete')  and action=?  ";
        cmd.CommandType = CommandType.Text;
        cmd.Parameters.AddWithValue("@action", completename);
        OdbcDataReader reader;
        con.Open();
        reader = cmd.ExecuteReader();
        if (reader.HasRows)
        {
            while (reader.Read())
            {
                string status = reader["ct"].ToString();
                count = int.Parse(status);
            }

        }
         completestatus = count;

        reader.Close();
        con.Close();
      
    }
    public void information(string Name)
    {
        int count = 0;
        OdbcConnection con = new OdbcConnection(connectionstring);
        OdbcCommand cmd = new OdbcCommand();
        cmd.Connection = con;
        cmd.CommandText = "select count(tby) as ct from ntaskinfo, ntask  where ntask.taskid = ntaskinfo.taskid and ntask.tby=?  ";
        cmd.CommandType = CommandType.Text;
        cmd.Parameters.AddWithValue("@tby", name);
        OdbcDataReader reader;
        con.Open();
        reader = cmd.ExecuteReader();
        if (reader.HasRows)
        {
            while (reader.Read())
            {
                 string sk = reader["ct"].ToString();
                count = int.Parse(sk);
            }

        }
        inforcount = count;
        reader.Close();
        con.Close();
    }

    /* for delete data which have more than 100 days*/

    public void todeletetask(string Name)
    {
        int count = 0;
        OdbcConnection con = new OdbcConnection(connectionstring);
        OdbcCommand cmd = new OdbcCommand();
        cmd.Connection = con;
        cmd.CommandText = "select count(status) as del from ntask  where tdtoi<=? ";
        cmd.CommandType = CommandType.Text;
        cmd.Parameters.AddWithValue("@tby", name);
        cmd.Parameters.AddWithValue("@tdtoi", dthundred);
        OdbcDataReader reader;
        con.Open();
        reader = cmd.ExecuteReader();
        if (reader.HasRows)
        {
            while (reader.Read())
            {
                string sk = reader["ct"].ToString();
                count = int.Parse(sk);
            }

        }
        diffcount = count;
        reader.Close();
        con.Close();
    }

    /* Task which is closed." Initiated By  "*/

    public void TaskClosed(string Name)
    {
      
        int count = 0;
        OdbcConnection con = new OdbcConnection(connectionstring);
        OdbcCommand cmd = new OdbcCommand();
        cmd.Connection = con;
        cmd.CommandText = "select count(tby) as ct from  ntask  where ntask.status='Close' and  ntask.tby=?  ";
        cmd.CommandType = CommandType.Text;
        cmd.Parameters.AddWithValue("@tby", name);
        OdbcDataReader reader;
        con.Open();
        reader = cmd.ExecuteReader();
        if (reader.HasRows)
        {
            while (reader.Read())
            {
                string cltask = reader["ct"].ToString();
                count = int.Parse(cltask);
            }

        }
        taskclose = count;
        reader.Close();
        con.Close();
    
    }
}  


