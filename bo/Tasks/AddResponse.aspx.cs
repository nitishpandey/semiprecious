using System;
using System.Collections;
using System.Configuration;
using System.Data.Odbc;

using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Data.Odbc;
using System.Web.Configuration;

public partial class Task_AddResponse : System.Web.UI.Page
{
    //Global define connectiostring
    string connectionstring = WebConfigurationManager.ConnectionStrings["OdbcConnectionString"].ConnectionString;
   
    string date ;
    string InitiatedBy ;
    string ActionBy ;
    string Status;
    string Name,modifypdc,strpdc,infotostatus;
    int taskid=0;
    
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
            Response.Redirect("/tm-tm/login.cfm");
        }
        
         Name = Session["Name"].ToString();
         if (HttpContext.Current.Request["taskid"]== null)
 		    ;
         taskid =int.Parse( Request.QueryString["taskid"]);
         setup_task_params();
        // check status
         if ((Status == "Complete") || (Status == "complete"))
         {
             TxtAddResponse.Enabled = false;
             BtnSubmitresponse.Enabled = false;
         }
        //CHECK STATUS THAT IS CLOSED
         if ((Status == "Close") || (Status == "close"))
         {
            /** disable addresponse **/
             TxtAddResponse.Enabled = false;
             BtnSubmitresponse.Enabled = false;

             /*disable change status*/
             DrplAcknowlege.Enabled = false;
             BtnAcknowledgement.Enabled = false;

             //disable modify status
             txtmodifypdc.Enabled = false;
             Btnmodifypdc.Enabled = false;
         
         }

        //check infoto status
         if (InitiatedBy.ToLower()  != Name.ToLower())
         {
   
             txtmodifypdc.Enabled = false;
             Btnmodifypdc.Enabled = false;
         }
        // for addresponse
         LblAddresponseTby.Text = InitiatedBy;
         LblAddresponseTby.Visible = false;
        // LblAddResponse.Visible = false; 
         Lblresponsetdtoi.Text = Convert.ToString(date);
       
        // current datetime
         DateTime dt = DateTime.Now;
         Lbltime.Text = String.Format("{0:yyyy/M/d HH:mm:ss}", dt);
        //

        // gridview
         
             grd();
         


         if (!Page.IsPostBack)
         {
               if (InitiatedBy.ToLower()  != Name.ToLower())  
			   //(ActionBy.ToLower() == Name.ToLower()))
               {
                    grdcommentsMe();
                    txtmodifypdc.Text =String.Format("{0:yyyy/M/d }", strpdc); 
                    txtmodifypdc.Enabled = false;
                    Btnmodifypdc.Enabled = false;
                // txtmodifypdc.Visible = false;
                   if (Status == "active")
                    {
                     ArrayList objarr = new ArrayList();
                     objarr.Add("Ack");
                     objarr.Add("Complete");
                     DrplAcknowlege.DataSource = objarr;
                     DrplAcknowlege.DataBind();
					 DrplAcknowlege.Enabled = true;
                       BtnAcknowledgement.Enabled = true;

		            }
                   if ((Status == "Ack") || (Status == "ack"))
                    {
                     ArrayList objarr = new ArrayList();
                     objarr.Add("Complete");
                     DrplAcknowlege.DataSource = objarr;
                     DrplAcknowlege.DataBind();
					 DrplAcknowlege.Enabled = true;
                                   BtnAcknowledgement.Enabled = true;
        }
                 if ((Status == "Complete")||(Status=="complete"))
                 {
                     return;
                 }

             }

               else 
             {
                    grdcommentsMe();
                    txtmodifypdc.Text = String.Format("{0:yyyy/M/d}",  strpdc); 
                   if (Status.ToLower() == "complete" || (Status.ToLower() == "ack"))
                     {
                     ArrayList objarr = new ArrayList();
                     objarr.Add("Close");
                        DrplAcknowlege.DataSource = objarr;
                     DrplAcknowlege.DataBind();
					 DrplAcknowlege.Enabled = true;
                     BtnAcknowledgement.Enabled = true;

	                }

                   else if (Status.ToLower() == "active")
                     {
                     ArrayList objarr = new ArrayList();
                     objarr.Add("Close");
                     objarr.Add("Abort");
                     DrplAcknowlege.DataSource = objarr;
                     DrplAcknowlege.DataBind();
					 DrplAcknowlege.Enabled = true;
                     BtnAcknowledgement.Enabled = true;
                    }
                
             }
           
            if (Status.ToLower() == "close" || Status.ToLower() == "abort")
             {
                               BtnSubmitresponse.Enabled = false;
							   
             }


         }
        
    }
    protected void BtnSubmitresponse_Click(object sender, EventArgs e)
    {
        if (TxtAddResponse.Text != "")
        {
            if (Name != null)
            {
                OdbcConnection connection = new OdbcConnection(connectionstring);
                OdbcCommand cmd = new OdbcCommand();
                cmd.CommandText = "INSERT INTO ntaskresponse(taskid,Comments,added,addedby) VALUES(?,?,?,?)";
                cmd.CommandType = CommandType.Text;
                cmd.Connection = connection;
                // Parameters Pass
                cmd.Parameters.Add("@taskid", OdbcType.Int,11).Value =taskid;
                cmd.Parameters.Add("@Comments", OdbcType.VarChar, 255).Value = TxtAddResponse.Text.Trim();
                cmd.Parameters.Add("@added", OdbcType.DateTime).Value = String.Format("{0:yyyy/M/d HH:mm:ss}", Lbltime.Text);
                cmd.Parameters.Add("@addedby", OdbcType.VarChar, 12).Value = Name.ToLower();
             
                try
                {
                    connection.Open();
                    int result = cmd.ExecuteNonQuery();
                    if (result > 0)
                    {
                       // Alert.Show(" successfully respond ");

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
                    connection.Close();
                }

                TxtAddResponse.Text = "";
                grdcommentsMe();
            }

            else
            {
                if (InitiatedBy != null)
                {

                    OdbcConnection connection = new OdbcConnection(connectionstring);
                    OdbcCommand cmd = new OdbcCommand();
                    cmd.CommandText = "INSERT INTO ntaskresponse(taskid,Comments,added,addedby) VALUES(?,?,?,?)";
                    cmd.CommandType = CommandType.Text;
                    cmd.Connection = connection;
                    // Parameters Pass

                    cmd.Parameters.Add("@taskid", OdbcType.Int, 11).Value = taskid;
                    cmd.Parameters.Add("@Comments", OdbcType.VarChar, 255).Value = TxtAddResponse.Text.Trim();
                    cmd.Parameters.Add("@added", OdbcType.DateTime).Value = String.Format("{0:yyyy/M/d HH:mm:ss}", Lbltime.Text);
                    cmd.Parameters.Add("@addedby", OdbcType.VarChar, 12).Value = InitiatedBy.ToLower();
                   
                    try
                    {
                        connection.Open();
                        int result = cmd.ExecuteNonQuery();
                        if (result > 0)
                        {
                           // Alert.Show(" successfully respond ");

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
                        connection.Close();
                    }

                    TxtAddResponse.Text = "";
                    grdcommentsMe();
                }
            }
        }
    }
    protected void BtnAcknowledgement_Click(object sender, EventArgs e)
    {
        if (DrplAcknowlege.SelectedItem.Text != "Select Status")
        {
            OdbcConnection connection = new OdbcConnection(connectionstring);
            OdbcCommand cmd = new OdbcCommand();
            cmd.CommandText = "UPDATE ntask SET status = ? WHERE  taskid=?";
            cmd.CommandType = CommandType.Text;
            cmd.Connection = connection;

            //Parameters Passed
            cmd.Parameters.Add("@status", OdbcType.VarChar, 9).Value = DrplAcknowlege.SelectedItem.Text;
            cmd.Parameters.Add("@taskid",OdbcType.Int,11).Value=taskid;

            try
            {
                connection.Open();
                int result = cmd.ExecuteNonQuery();
                if (result > 0)
                {
                    //Alert.Show(" Successfully updated ");
                    if (DrplAcknowlege.SelectedItem.Text == "Complete")
                    {
                        EmailToInitiateby etib = new EmailToInitiateby();
                        etib.Email(taskid);
                    }
                    if (DrplAcknowlege.SelectedItem.Text == "Close")
                    {
                        ///** disable addresponse **/
                        //TxtAddResponse.Enabled = false;
                        BtnSubmitresponse.Enabled = false;

                        /*disable change status*/
                        //DrplAcknowlege.Enabled = false;
                        //BtnAcknowledgement.Enabled = false;

                        //disable modify status
                        txtmodifypdc.Enabled = false;
                        Btnmodifypdc.Enabled = false;
                    }
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
                connection.Close();
            }
            grd();
            
        }
    }

   
    protected void Btnmodifypdc_Click(object sender, EventArgs e)
    {
        if (txtmodifypdc.Text != "")
        {
            modifypdc = txtmodifypdc.Text.Trim();
            // OdbcConnection con = new OdbcConnection(connectionstring);
            OdbcConnection con = new OdbcConnection(connectionstring);
            OdbcCommand cmd = new OdbcCommand();
            cmd.Connection = con;
            cmd.CommandText = "update ntask set pdc=? where tby=? and taskid=?";
            cmd.CommandType = CommandType.Text;

            cmd.Parameters.AddWithValue("@pdc", Convert.ToDateTime(String.Format("{0:yyyy/M/d }", txtmodifypdc.Text.Trim())));
            cmd.Parameters.AddWithValue("@tby", InitiatedBy.ToLower());
            cmd.Parameters.AddWithValue("@taskid", taskid);


            try
            {
                con.Open();
                cmd.ExecuteNonQuery();

            }
            catch (OdbcException ee)
            {
                Alert.Show("error in updateion");
            }
            finally
            {
                con.Close();
            }

            GrdVAddResponse.DataBind();
            insertpdc( modifypdc);
        }
    }
    public void insertpdc(string mdpdc)
    {

        OdbcConnection connection = new OdbcConnection(connectionstring);
        OdbcCommand cmd = new OdbcCommand();
        cmd.CommandText = "insert into ntaskpdc(taskid,pdc,added) values(?,?,?)";

        cmd.CommandType = CommandType.Text;
        cmd.Connection = connection;

        //Parameters Passed
        cmd.Parameters.Add("@taskid", OdbcType.Int,11).Value = taskid;
        cmd.Parameters.Add("@pdc", OdbcType.DateTime).Value =Convert.ToDateTime(mdpdc);
        cmd.Parameters.Add("@added", OdbcType.DateTime).Value =Convert.ToDateTime(Lbltime.Text);

        try
        {
            connection.Open();
            int result = cmd.ExecuteNonQuery();
            if (result > 0)
            {
                //Alert.Show(" Successfully Modify PDC ");
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
            connection.Close();
        }
        //for update pdc
        grd();

    }


    public void grd()
    {
        OdbcConnection connection = new OdbcConnection(connectionstring);
        OdbcCommand cmd = new OdbcCommand();
    	 cmd.CommandText = "select * from ntask where  (ntask.taskid=?)";
                cmd.CommandType = CommandType.Text;
                cmd.Connection = connection;
                cmd.Parameters.AddWithValue("@taskid", taskid);
        OdbcDataAdapter ada = new OdbcDataAdapter(cmd);
        DataTable dt = new DataTable();
        ada.Fill(dt);
        GrdVAddResponse.DataSource = dt;
        GrdVAddResponse.DataBind();
		return;
   }

 public void grdcommentsMe()
    {
        OdbcConnection connection = new OdbcConnection(connectionstring);
        OdbcCommand cmd = new OdbcCommand();

        cmd.CommandText = "SELECT added,Comments,addedby FROM ntaskresponse where ntaskresponse.taskid=?";
        cmd.CommandType = CommandType.Text;
        cmd.Connection = connection;
        
        cmd.Parameters.AddWithValue("@taskid", taskid);
        
        OdbcDataAdapter ada = new OdbcDataAdapter(cmd);
        DataTable dt5 = new DataTable();
        ada.Fill(dt5);
        DataView dav = dt5.DefaultView;
        dav.Sort = "added DESC";
        GrdComments.DataSource = dav;
        GrdComments.DataBind();


    }

	  private void setup_task_params()
    {
        OdbcConnection connection = new OdbcConnection(connectionstring);
        OdbcCommand cmd = new OdbcCommand();

        cmd.CommandText = "SELECT * FROM ntask where taskid=?";
        cmd.CommandType = CommandType.Text;
    	 cmd.Parameters.AddWithValue("@taskid", taskid);
        cmd.Connection = connection;
        OdbcDataReader reader;
        connection.Open();
       
       
        reader = cmd.ExecuteReader();
         if (reader.HasRows)
		 {  			
		 InitiatedBy =  (string)reader["tby"];
         ActionBy = (string)reader["action"];
         Status=(string)reader["status"];
         strpdc = reader["pdc"].ToString();
       //  infotostatus = (string)reader["infoto"];
    	   infotostatus = "" ;
		 }
		 else
		 {
		 Alert.Show("hi");
		       Response.Redirect("/tm-tm/login.cfm?ee="+reader.ToString());
		 }
		 connection.Close();
		 return;


    }

    protected void GrdComments_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
       GrdComments.PageIndex=e.NewPageIndex;
       GrdComments.DataBind();
    }
}
