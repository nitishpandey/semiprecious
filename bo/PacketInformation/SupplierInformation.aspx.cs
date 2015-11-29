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
using System.Data.SqlClient;
using System.Web.Configuration;

public partial class PacketInformation_SupplierInformation : System.Web.UI.Page
{
   string ConnectionStrig = WebConfigurationManager.ConnectionStrings["SqlConnectionString"].ConnectionString;
    //string ConnectionStrig = "server=localhost;Database=gemstones;uid=sqlprecious;pwd=precious";
    string currenttime;
    string updateby;
   

    protected void Page_Load(object sender, EventArgs e)
    {
        
        if (Request.IsLocal)
        {
             updateby = "localuser" ;
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

        if (!Page.IsPostBack)
        {
            AltSupplier();
        }
        
        DateTime dt = DateTime.Now;
        currenttime = String.Format("{0:yyyy/M/d HH:mm:ss}", dt);
    }
    protected void BtnSubmit_Click(object sender, EventArgs e)
    {
        InsertSupplier();
     
    }
    protected void BtnClear_Click(object sender, EventArgs e)
    {
        
        TxtSupplierCode.Text = string.Empty;
        TxtPhoneNo.Text = "";
        TxtMobileNo.Text = "";
        
        TxtComments.Text = "";
        TxtAddress.Text = "";
        LblError.Text = "";
    }

    public void AltSupplier()
    {
        SqlConnection con = new SqlConnection(ConnectionStrig);
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "select apptt from users where usertype='Supplier/Vendor'";
        cmd.CommandType = CommandType.Text;
        SqlDataAdapter ada = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        ada.Fill(dt);
        DrplSPL.DataTextField = "apptt";
        DrplSPL.DataValueField = "apptt";
        DrplSPL.DataSource = dt;
        DrplSPL.DataBind();
        // DrplSupplierName.Items.Insert(0, new ListItem("Select Supplier"));
    }

  
    public void InsertSupplier()
    {
        SqlConnection con = new SqlConnection(ConnectionStrig);
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "insert into supplierInfo([SUPPLIERCODE],[Address],PhoneNo,MobileNo,spldate,Comments,Backupsupplier,updatedby) values(@suppliercode,@Address,@PhoneNo,@MobileNo,@spldate,@Comments,@Backupsupplier,@updatedby)";
        cmd.CommandType = CommandType.Text;

        /* Passing parameters for Lot Information*/

        cmd.Parameters.AddWithValue("@suppliercode", TxtSupplierCode.Text.Trim());
        cmd.Parameters.AddWithValue("@Address", TxtAddress.Text.Trim());

        if ((TxtPhoneNo.Text != "") & (TxtMobileNo.Text != ""))
        {

            cmd.Parameters.AddWithValue("@PhoneNo", Convert.ToInt64(TxtPhoneNo.Text));
            cmd.Parameters.AddWithValue("@MobileNo", Convert.ToInt64(TxtMobileNo.Text));
        }
        else if (TxtPhoneNo.Text != "")
        {
            cmd.Parameters.AddWithValue("@PhoneNo", Convert.ToInt64(TxtPhoneNo.Text));
            cmd.Parameters.AddWithValue("@MobileNo", "");
        }
        else if (TxtMobileNo.Text != "")
        {
            cmd.Parameters.AddWithValue("@MobileNo", Convert.ToInt64(TxtMobileNo.Text));
            cmd.Parameters.AddWithValue("@PhoneNo", "");
        }
        else
        {

            cmd.Parameters.AddWithValue("@PhoneNo", "");
            cmd.Parameters.AddWithValue("@MobileNo", "");
        }

       
        cmd.Parameters.AddWithValue("@spldate", currenttime);

        if ((TxtComments.Text != ""))
        {
            cmd.Parameters.AddWithValue("@Comments", TxtComments.Text.Trim());
        }
        else
        {
            string comments = "";
            cmd.Parameters.AddWithValue("@Comments", comments);
        }
        if (DrplSPL.SelectedItem.Text != "Supplier Name")
        {
            cmd.Parameters.AddWithValue("@Backupsupplier", DrplSPL.SelectedItem.Text);
        }
        else
        {
            string alternatesupplier = "";
            cmd.Parameters.AddWithValue("@Backupsupplier", alternatesupplier);
        }
        cmd.Parameters.AddWithValue("@updatedby", updateby);
        try
        {
            cmd.Connection.Open();
            int result = cmd.ExecuteNonQuery();
            if (result > 0)
            {
                string message = "Successfully inserted.";
                LblError.Text = message.ToUpper();
            }


        }
        catch (SqlException ex)
        {
            string message = "Sql Error :" + ex.ToString();
            LblError.Text =TxtSupplierCode.Text.Trim()+ message.ToUpper();

        }
        finally
        {
            cmd.Connection.Close();
        }
    }
    public void EditSupplierInfo()
    { 
     SqlConnection con = new SqlConnection(ConnectionStrig);
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "update supplierInfo set Address=@Address,PhoneNo=@PhoneNo,MobileNo=@MobileNo,Comments=@Comments,updatedby=@updatedby where suppliercode=@suppliercode";
        cmd.CommandType = CommandType.Text;

        /* Passing parameters for Lot Information*/

        cmd.Parameters.AddWithValue("@suppliercode", TxtSupplierCode.Text.Trim());
        cmd.Parameters.AddWithValue("@Address", TxtAddress.Text.Trim());

        if ((TxtPhoneNo.Text != "") & (TxtMobileNo.Text != ""))
        {

            cmd.Parameters.AddWithValue("@PhoneNo", Convert.ToInt64(TxtPhoneNo.Text));
            cmd.Parameters.AddWithValue("@MobileNo", Convert.ToInt64(TxtMobileNo.Text));
        }
        else if (TxtPhoneNo.Text != "")
        {
            cmd.Parameters.AddWithValue("@PhoneNo", Convert.ToInt64(TxtPhoneNo.Text));
            cmd.Parameters.AddWithValue("@MobileNo", "");
        }
        else if (TxtMobileNo.Text != "")
        {
            cmd.Parameters.AddWithValue("@MobileNo", Convert.ToInt64(TxtMobileNo.Text));
            cmd.Parameters.AddWithValue("@PhoneNo", "");
        }
        else
        {

            cmd.Parameters.AddWithValue("@PhoneNo", "");
            cmd.Parameters.AddWithValue("@MobileNo", "");
        }

       
     

        if ((TxtComments.Text != ""))
        {
            cmd.Parameters.AddWithValue("@Comments", TxtComments.Text.Trim());
        }
        else
        {
            string comments = "";
            cmd.Parameters.AddWithValue("@Comments", comments);
        }
        if (DrplSPL.SelectedItem.Text != "Supplier Name")
        {
            cmd.Parameters.AddWithValue("@Backupsupplier", DrplSPL.SelectedItem.Text);
        }
        else
        {
            string alternatesupplier = "";
            cmd.Parameters.AddWithValue("@Backupsupplier", alternatesupplier);
        }
        cmd.Parameters.AddWithValue("@updatedby", updateby);
        try
        {
            cmd.Connection.Open();
            int result = cmd.ExecuteNonQuery();
            if (result > 0)
            {
                string message = "Successfully inserted.";
                LblError.Text = message.ToUpper();
            }


        }
        catch (SqlException ex)
        {
            string message = "Sql Error :" + ex.ToString();
            LblError.Text =TxtSupplierCode.Text.Trim()+ message.ToUpper();

        }
        finally
        {
            cmd.Connection.Close();
        }
    }

    //public void ReadSupplierInfo()
    //{ 
    //       SqlConnection con = new SqlConnection(ConnectionStrig);
    //       SqlCommand cmd = new SqlCommand();
    //       cmd.Connection = con;
    //       cmd.CommandText = " ";
    //       cmd.CommandType = CommandType.Text;
    //       cmd.Parameters.AddWithValue("@suppliercode",dsfs );
    //       SqlDataReader strreader;
    //       try
    //       {
    //           cmd.Connection.Open();
    //           strreader = cmd.ExecuteReader();
    //           if (strreader.HasRows)
    //           {

    //           }
    //           else
    //           {
    //               string strrows = "There is no such items";
    //           }
           
    //       }
    //       catch(Exception ex)
    //       {
    //           string errormessage = "Errors :" + ex.Message;
    //       }
    //   }
    
    }
    


