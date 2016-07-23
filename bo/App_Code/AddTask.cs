using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Data.Odbc;
using System.Web.Configuration;
using System.IO;
using System.Collections;

/// <summary>
/// Summary description for AddTask
/// </summary>
public class AddTask
{
    
    string connectionstring = WebConfigurationManager.ConnectionStrings["OdbcConnectionString"].ConnectionString;
    DateTime globalcurrenttime;
    DateTime dt = DateTime.Now;
    string dttime = String.Format("{0:yyyy/M/d HH:mm:ss}", DateTime.Now);
    string status = "active";
    string initiatedby;
    public spmresult Task(string subject, string mainsubject, string action, string tby, DateTime pdcdate, string details, System.Collections.Generic.List<string> info)
    {
        string t;
        if (!IsNumeric(mainsubject))
        { 
		 if(mainsubject.IndexOf('@') > 0)
			    t = "cust_issue";
			else
		         t = "";
        }
       else
            t = "cart_issue";
        return Task(subject, mainsubject, action, tby, pdcdate, details, info, t);
     
    }
    public spmresult Task(string subject, string mainsubject, string action, string tby, DateTime pdcdate, string details, System.Collections.Generic.List<string> info,string tasktype)
    {
        spmresult spmr;
        int taskid = 0;
        initiatedby = tby;
        
        globalcurrenttime = pdcdate;
        OdbcCommand cmd = new OdbcCommand();
        OdbcConnection con = new OdbcConnection(connectionstring);

        DateTime dt1 = DateTime.Now;
        //DateTime dt = DateTime.Now.ToShortDateString;

        //string curdate = String.Format("{0:yyyy/M/d }", dt);

      
       
        con.Open();
       
                cmd.Connection = con;
                cmd.CommandText = "INSERT INTO ntask(tdtoi,subject,mainsubject,action,tby,status,pdc,task_type,detail) VALUES(?,?,?,?,?,?,?,?,?)";
                cmd.CommandType = CommandType.Text;

                // Parameters Pass
                cmd.Parameters.Add("@tdtoi", OdbcType.DateTime).Value = dttime;
                cmd.Parameters.Add("@subject", OdbcType.VarChar, 50).Value = subject;
                cmd.Parameters.Add("@mainsubject", OdbcType.VarChar, 30).Value = mainsubject; 
                cmd.Parameters.Add("@action", OdbcType.VarChar, 22).Value = action;
                cmd.Parameters.Add("@tby", OdbcType.VarChar, 22).Value = tby;
                cmd.Parameters.Add("@status", OdbcType.VarChar, 9).Value = status;
                cmd.Parameters.Add("@pdc", OdbcType.DateTime).Value = String.Format("{0:yyyy/M/d }", pdcdate);
                cmd.Parameters.Add("@task_type", OdbcType.VarChar, 20).Value = tasktype;
                cmd.Parameters.Add("@detail", OdbcType.VarChar, 500).Value = details;


         

            try
            {
                // cmd.Connection.Open();
                int result = cmd.ExecuteNonQuery();
                if (result > 0)
                {
                   spmr=new spmresult(1, " Successfully inserted ");
                   
                   // return spmr;
                    //Alert.Show(" Successfully inserted ");
                }
                else
                {
                    spmr = new spmresult(0, " Error in insert of task... ");
                    return spmr;
                }
                // cmd.Connection.Close();

                // open connectiion for taskid

                cmd.Connection = con;
                cmd.CommandText = "select taskid from ntask where tdtoi='" + dttime + "' and tby='" + tby + "'";
                cmd.CommandType = CommandType.Text;
                //cmd.Connection.Open();
                OdbcDataReader reader;
                reader = cmd.ExecuteReader();
                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        taskid = (int)reader["taskid"];

                    }

                }
                reader.Close();
                // cmd.Connection.Close();

                 //check listbox 

              //  System.Collections.Generic.List<string> selectionList = new System.Collections.Generic.List<string>();
                for (int i = 0; i < info.Count;i++ )
                {
                        string information= info[i];                   
                        OdbcCommand cmd1 = new OdbcCommand();
                        cmd1.Connection = con;
                        cmd1.CommandText = "insert into ntaskinfo(infoto,taskid) values(?,?)";
                        cmd1.Parameters.Add("@infoto", information);
                        cmd1.Parameters.Add("@taskid", taskid);
                        cmd1.CommandType = CommandType.Text;
                        int j = cmd1.ExecuteNonQuery();
                  
                }

            }

            catch (OdbcException ee)
            {
                string errormessage ="Info Add Method Error :"+ ee.Message;
                spmr = new spmresult(0, errormessage);
               // return spmr;
            }
            catch (Exception ee)
            {
                string errormessage = "Info Adding Method Error :" + ee.Message;
                spmr = new spmresult(0, errormessage);
                return spmr;
            }
            finally
            {
                con.Close();
            }


              spmr =  inserttopdc(taskid);
			  if (spmr.success > 0)
			     {
            	CentraliseEmail cem = new CentraliseEmail();
				string toemailid = User_.getEmailId(action);
				if (toemailid.Length > 0)
				{
				DateTime dt =  Convert.ToDateTime(DateTime.Now);
                string ems = "Task " + mainsubject;
				cem.AddEmail(toemailid,ems, true,dt, subject);
                }
               }
        return spmr;
    }
    public spmresult inserttopdc(int PdcID)
    {
        spmresult spmr;
        OdbcConnection connection = new OdbcConnection(connectionstring);
        OdbcCommand cmd1 = new OdbcCommand();
        cmd1.Connection = connection;
        cmd1.CommandText = "INSERT INTO ntaskpdc(taskid,pdc,added) VALUES (?,?,?)";
        cmd1.CommandType = CommandType.Text;

        // Parameters Pass
        cmd1.Parameters.Add("@taskid", OdbcType.Int, 11).Value = PdcID;
        cmd1.Parameters.Add("@pdc", OdbcType.DateTime).Value = String.Format("{0:yyyy/M/d }", dttime);
        cmd1.Parameters.Add("@added", OdbcType.DateTime).Value = globalcurrenttime;
        cmd1.Parameters.Add("@addedby", OdbcType.VarChar, 50).Value = initiatedby;

        try
        {
            cmd1.Connection.Open();
            int result = cmd1.ExecuteNonQuery();
            if (result > 0)
            {
                //Alert.Show(" Successfully updated ");
                spmr = new spmresult(1, " Successfully inserted ");

               // return spmr;
            }
            else
            {
                spmr = new spmresult(0, " Failed at PDC Insert");

                return spmr;
            }
        }
        catch (OdbcException ee)
        {
            string errormessage = "Task Method Error :" + ee.Message;
            spmr = new spmresult(0, errormessage);
            return spmr;
        }
        catch (Exception ee)
        {
            string errormessage = "Task Method Error :" + ee.Message;
            spmr = new spmresult(0, errormessage);
            return spmr;
        }
        finally
        {
            cmd1.Connection.Close();
        }
        return spmr;

    }
    public static bool IsNumeric(string strVal)
    {
        try
        {
            int u = int.Parse(strVal);
        }
        catch (Exception nint)
        {
            return false;
        }
        return true;
        //return Regex.IsMatch(strVal, "^\\d+?$");

    }      
}
