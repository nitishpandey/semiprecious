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

public partial class PacketInformation_UpdateBuyingRecord : System.Web.UI.Page
{
    string WebConnectionStrig = WebConfigurationManager.ConnectionStrings["SqlConnectionString"].ConnectionString;
    string updateby;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.IsLocal)
        {
            updateby = "localuser";
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
            SelectSupplierCode();
        }
       
    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        if (Drplsuppliercode.SelectedItem.Text != "Select Supplier Code")
        {
            SqlConnection strcon = new SqlConnection(WebConnectionStrig);
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = strcon;
            cmd.CommandText = "update buyingrecord set cartid=@cartid,itemid=@itemid,optionid=@optionid,makeondemandnote=@makeondemandnote,inventoryatsale=-1 where cartid=@cartid and itemid=@itemid and optionid=@optionid and qty > 0 ";
            cmd.CommandType = CommandType.Text;
            cmd.Parameters.AddWithValue("@cartid", TxtCartID.Text.Trim());
            cmd.Parameters.AddWithValue("@itemid", TxtItemId.Text.Trim());
            cmd.Parameters.AddWithValue("@optionid", TxtOptionID.Text.Trim());
            cmd.Parameters.AddWithValue("@makeondemandnote", Drplsuppliercode.SelectedItem.Text);

            try
            {
                cmd.Connection.Open();
                int result = cmd.ExecuteNonQuery();
                if (result > 0)
                {
                    LblUpdateError.Text = "Update Successfully";
                }
                else
                {
                    LblUpdateError.Text = "Updation is failed.";
                }

            }
            catch (SqlException ee)
            {
                LblUpdateError.Text = "Errors :" + ee.Message;
            }
            catch (Exception ex)
            {
                LblUpdateError.Text = "Errors :" + ex.Message;
            }
            finally
            {
                cmd.Connection.Close();
            }
        }
        else
        {   
           
            LblUpdateError.Text = "Please select supplier code.";
        
        }
    }
    public void SelectSupplierCode()
    {
        SqlConnection con = new SqlConnection(WebConnectionStrig);
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "select suppliercode from SupplierInfo ";
        cmd.CommandType = CommandType.Text;
        SqlDataAdapter ada = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        ada.Fill(dt);
        Drplsuppliercode.DataTextField = "suppliercode";
        Drplsuppliercode.DataValueField = "suppliercode";
        Drplsuppliercode.DataSource = dt;
        Drplsuppliercode.DataBind();
        Drplsuppliercode.Items.Insert(0, new ListItem("Select Supplier Code", ""));
    
    
    }
    protected void BtnReset_Click(object sender, EventArgs e)
    {
        TxtCartID.Text = "";
        TxtItemId.Text = "";
        TxtOptionID.Text = "";
       // Drplsuppliercode.SelectedItem.Text = "Select Supplier Code";
    }
}
