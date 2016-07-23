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
using System.Collections.Generic;

public partial class Tasks_AddTask : System.Web.UI.Page
{
    string connectionstring = WebConfigurationManager.ConnectionStrings["OdbcConnectionString"].ConnectionString;
    
    DateTime dt2 = new DateTime();
    string status;
    string Addtask;
    string information;
    protected void Page_Load(object sender, EventArgs e)
    {
        // check if it is a remote invocation 
		
		if (Request.QueryString["method"] == "addTask")
		    {
			 int error = 0;
		     spmresult spmr = new spmresult(1,"now");
			 AddTask at = new AddTask(); //exists in app_code directory
			 System.Collections.Generic.List<string> selectionList = new System.Collections.Generic.List<string>();
			 selectionList.Add("");
			 spmr = at.Task(Request.QueryString["subject"],Request.QueryString["mainsubject"] ,Request.QueryString["action"], Request.QueryString["tby"], Convert.ToDateTime("07/07/2022"), Request.QueryString["details"], selectionList);
            
			 if (spmr.success == 0)
			    error = 1;            
			
			 Response.ContentType ="text/xml";
			 if (error == 1 )
				  Response.Write("<response><localmethod>addtask</localmethod><message>"+spmr.message+"<status>false</status></message></response>");
			 else
				 {
				  Response.Write("<response><localmethod>addtask</localmethod><message>"+Request.QueryString["action"]+"<status>true</status></message></response>");
	            }
				 Server.Transfer("blank.htm");

			return;
			}
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

        // Check cartid is available
        string cart_id=Request.QueryString["cartid"];
         if (cart_id!=null)
                {
                    Txtcartid.Text = cart_id;
                    Txtcartid.Enabled=false;
                }

        Addtask = Session["Name"].ToString();
         
        TxtInitiatedby.Text = Addtask;
        TxtInitiatedby.Enabled = false;
        DateTime dt = DateTime.Now;
        Lblcurrenttime.Text = String.Format("{0:yyyy/M/d HH:mm:ss}", dt);
        Lblcurrenttime.Visible = false;
        status = "active";
        ActionBy();
      //  listbox();

    }
    protected void BtnSubmit_Click(object sender, EventArgs e)
    {
		addTask();
 }
  
  public void addTask(){
     spmresult spmr = new spmresult(1,"now");
	 AddTask at = new AddTask();
     System.Collections.Generic.List<string> selectionList = new System.Collections.Generic.List<string>();

        if (DrplAction.SelectedItem.Text != "Action By") 
        {
           int taskid = 0;
           OdbcCommand cmd = new OdbcCommand();
           OdbcConnection con = new OdbcConnection(connectionstring);
	try {
			DateTime pdcdate;
            if (TxtDate.Text.Trim().Length == 0)
			    	pdcdate = Convert.ToDateTime("10/10/2100");
				else
					pdcdate = Convert.ToDateTime(TxtDate.Text.Trim());
            DateTime dt1 = DateTime.Now;
            //DateTime dt = DateTime.Now.ToShortDateString;

            //string curdate = String.Format("{0:yyyy/M/d }", dt);
            if ((pdcdate > dt1) || (pdcdate == dt1))
            {
                Lbldateerror.Text = string.Empty;
                string cartid = Txtcartid.Text.ToString();
                    foreach (ListItem itm in LstInfo.Items)
                    {
                        if (itm.Selected == true)
                        {
                            selectionList.Add(itm.Value);

                        }
                    }
				
               spmr = at.Task(TxtSubject.Text.Trim(), cartid,DrplAction.SelectedItem.Text.ToLower(), TxtInitiatedby.Text.Trim().ToLower(), Convert.ToDateTime(TxtDate.Text.Trim()), TxtTaskDetails.Text.Trim(), selectionList);
               if (spmr.success > 0)
			       {
					if ( int.TryParse(cartid, out taskid))
					    Response.Redirect("/itemsell.cfm?cartid="+taskid);
						else
	                    Response.Redirect("~/tasks");
					}
				else
					  Lbldateerror.Text  = spmr.success.ToString()+spmr.message;
            }
            else
            {
                Lbldateerror.Text = "EDC must be greater than today date or eaqual to today date";
            }

    	}
	catch(Exception de)
	{
	            Lbldateerror.Text = de.Message + "Please enter date in US Format MM/DD/YYYY" ;
	}

	    }
        else
        {
			// Response.Redirect("Thanks1.aspx");
			  Lbldateerror.Text = "Please select action by person";
//			 Alert.Show(" Successfully updated ");
            
        }
     }

    public void ActionBy()
    {
        OdbcConnection connection = new OdbcConnection(connectionstring);
        OdbcCommand cmd = new OdbcCommand();
        cmd.CommandText = "select lower(Apptt) as Apptt from users";
        cmd.CommandType = CommandType.Text;
        cmd.Connection = connection;
        OdbcDataAdapter ada = new OdbcDataAdapter(cmd);
        DataTable dt = new DataTable();
        ada.Fill(dt);
        DrplAction.DataTextField = "Apptt";
        DrplAction.DataSource = dt;
        DrplAction.DataBind();
		LstInfo.DataTextField = "Apptt";
        LstInfo.DataSource = dt;
       LstInfo.DataBind();

    }
   
    protected void BtnClear_Click(object sender, EventArgs e)
    {
        TxtSubject.Text = "";
        TxtTaskDetails.Text = "";
        DrplAction.SelectedItem.Text = "Action for";
        Lbldateerror.Text = string.Empty;
        TxtDate.Text = "";
    }

    public void inserttopdc(int PdcID)
    {

        OdbcConnection connection = new OdbcConnection(connectionstring);
        OdbcCommand cmd1 = new OdbcCommand();
        cmd1.Connection = connection;
        cmd1.CommandText = "INSERT INTO ntaskpdc(taskid,pdc,added) VALUES (?,?,?)"; // need to add added by here in the table and query
        cmd1.CommandType = CommandType.Text;

        // Parameters Pass
        cmd1.Parameters.Add("@taskid", OdbcType.Int, 11).Value = PdcID;
        cmd1.Parameters.Add("@pdc", OdbcType.DateTime).Value = String.Format("{0:yyyy/M/d }", TxtDate.Text.Trim());
        cmd1.Parameters.Add("@added", OdbcType.DateTime).Value = Lblcurrenttime.Text.Trim(); ;

        try
        {
            cmd1.Connection.Open();
            int result = cmd1.ExecuteNonQuery();
            if (result > 0)
            {
                //Alert.Show(" Successfully updated ");
            }
        }
        catch (OdbcException ee)
        {
            Alert.Show("ODBC Exception :" + ee);
        }
        catch (Exception ee)
        {
            Alert.Show("exception");
        }
        finally
        {
            cmd1.Connection.Close();
        }
    
    }

  }




