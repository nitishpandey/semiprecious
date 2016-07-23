using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.IO;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Data.Odbc;
using System.Web.Configuration;
public partial class property : System.Web.UI.Page
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
    
            if (Session["admin"].Equals("0"))
            {
             Response.Redirect("/tm-tm/login.cfm");
            }
            
        }
        catch (Exception ee)
        {
          Alert.Show(ee.Message);
         //  Response.Redirect("/tm-tm/login.cfm?");
        }
      

       
    }
    protected void BtnSubmit_Click(object sender, EventArgs e)
    {
    
       DateTime mindate,maxdate;
        try {
      
         mindate = Convert.ToDateTime(TxtStartDate.Text);
      }
       catch (Exception ex)
       {
         mindate = Convert.ToDateTime("01/01/1970") ;
       }
      
        try {
      maxdate =Convert.ToDateTime( TxtEnddate.Text);
      }
       catch (Exception ex)
       {
         maxdate =  Convert.ToDateTime("01/01/2020") ;
       }
       bool go = true;
       if ( TxtEnddate.Text != "" & TxtStartDate.Text != "" )
        {
        go = false;
        if (maxdate > mindate)
           go = true;
        } 
       
        if (go)
        {
            Lblmessage.Text = string.Empty;
            string connectionstring = WebConfigurationManager.ConnectionStrings["ODBCConnectionString"].ConnectionString;
            OdbcConnection con = new OdbcConnection(connectionstring);
            OdbcCommand cmd = new OdbcCommand();
            cmd.Connection = con;
            //date combinations
            if ((TxtStartDate.Text.Trim() == string.Empty) && (TxtEnddate.Text.Trim() == string.Empty))
            {
            cmd.CommandText = "insert into Properties(PName,PValue,createdby,pgroup) values('" + TxtPropertyName.Text.Trim() + "','" + TxtPropertyValue.Text.Trim() + "','" + Session["Name"].ToString() + "','" + TxtPgroup.Text.Trim()+ "')";
            }
            else if(TxtStartDate.Text.Trim()==string.Empty)
            {
            cmd.CommandText = "insert into Properties(PName,PValue,enddate,createdby,pgroup) values('" + TxtPropertyName.Text.Trim() + "','" + TxtPropertyValue.Text.Trim() + "','" + TxtEnddate.Text.Trim() + "','" + Session["Name"].ToString() + "','" + TxtPgroup.Text.Trim() + "')"; 
            }
            else if (TxtEnddate.Text.Trim() == string.Empty)
            {
                cmd.CommandText = "insert into Properties(PName,PValue,startdate,createdby,pgroup) values('" + TxtPropertyName.Text.Trim() + "','" + TxtPropertyValue.Text.Trim() + "','" + TxtStartDate.Text.Trim() + "','" + Session["Name"].ToString() + "','" + TxtPgroup.Text.Trim() + "')";
            }
            // Group combinations

            else if ((TxtPgroup.Text.Trim() == string.Empty) && (TxtStartDate.Text.Trim() == string.Empty))
            {
                cmd.CommandText = "insert into Properties(PName,PValue,enddate,createdby) values('" + TxtPropertyName.Text.Trim() + "','" + TxtPropertyValue.Text.Trim() + "','" + TxtEnddate.Text.Trim() + "','" + Session["Name"].ToString() + "')";
            }
            else if ((TxtPgroup.Text.Trim() == string.Empty) && (TxtEnddate.Text.Trim() == string.Empty))
            {
                cmd.CommandText = "insert into Properties(PName,PValue,startdate,createdby) values('" + TxtPropertyName.Text.Trim() + "','" + TxtPropertyValue.Text.Trim() + "','" + TxtStartDate.Text.Trim() + "','" + Session["Name"].ToString() + "')";
            }
            else if ((TxtPgroup.Text.Trim() == string.Empty) && (TxtStartDate.Text.Trim() == string.Empty) && (TxtEnddate.Text.Trim() == string.Empty))
            {
                cmd.CommandText = "insert into Properties(PName,PValue,createdby) values('" + TxtPropertyName.Text.Trim() + "','" + TxtPropertyValue.Text.Trim() + "','" + Session["Name"].ToString() + "')";
            }
            else if (TxtPgroup.Text.Trim() == string.Empty)
            {
                cmd.CommandText = "insert into Properties(PName,PValue,startdate,enddate,createdby) values('" + TxtPropertyName.Text.Trim() + "','" + TxtPropertyValue.Text.Trim() + "','" + TxtStartDate.Text.Trim() + "','" + TxtEnddate.Text.Trim() + "','" + Session["Name"].ToString() + "')";
            }
            else
            {
                cmd.CommandText = "insert into Properties(PName,PValue,startdate,enddate,createdby,pgroup) values('" + TxtPropertyName.Text.Trim() + "','" + TxtPropertyValue.Text.Trim() + "','" + TxtStartDate.Text.Trim() + "','" + TxtEnddate.Text.Trim() + "','" + Session["Name"].ToString() + "','" + TxtPgroup.Text.Trim() + "')";
            }
               
            cmd.CommandType = CommandType.Text;
           
            try
            {
                cmd.Connection.Open();
                int result = cmd.ExecuteNonQuery();
                if (result > 0)
                {
                    Label10.Text = " Success!";  
                }
                else
                {
                      Label10.Text ="Please do not repeat the Property Name.";
                }
            }
            catch (OdbcException ee)
            {
				  Label10.Text  = ee.Message;
  //              Alert.Show(message);
            }
            catch (Exception ee)
            {
                  Label10.Text  = ee.Message;
//                Alert.Show(message);
            }

            finally
            {
                cmd.Connection.Close();
            }

            GridView1.DataBind();
        }
        
       else
            Lblmessage.Text = " * End Date must be greater than Start Date.";
        
        }




    protected void Btnclear_Click(object sender, EventArgs e)
    {
        TxtPropertyName.Text = "";
        TxtPropertyValue.Text = "";
        TxtPgroup.Text = "";
        TxtStartDate.Text = "";
        TxtEnddate.Text = "";
        Lblmessage.Text = "";
    }
    
    
}

