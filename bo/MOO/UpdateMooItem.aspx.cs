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
    string cartid, itemid;
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
        SqlConnection strcon = new SqlConnection(WebConnectionStrig);
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = strcon;
        cmd.CommandText = "select cartid,itemid from buyingrecord where cartid=@cartid and itemid=@itemid";
        cmd.CommandType = CommandType.Text;
        cmd.Parameters.AddWithValue("@cartid",TxtCartID.Text.Trim());
        cmd.Parameters.AddWithValue("@itemid",TxtItemId.Text.Trim());
        SqlDataReader reader;
        try
        {
            cmd.Connection.Open();
            reader = cmd.ExecuteReader();
            if (reader.HasRows)
            {
                while (reader.Read())
                {
                     cartid = (string)reader["cartid"];
                     itemid = (string)reader["itemid"];
                }
            }
            else
            {
                LblUpdateError.Text = "Cart ID : " + TxtCartID.Text.Trim() + " " + "Item ID :" + TxtItemId.Text.Trim() + "are not exist.Please try again .";
            }
            if ((cartid!= "") & ( itemid != ""))
            {
                Response.Redirect("AddMooItem.aspx?cartid="+cartid +"&itemid="+itemid+"&suppliercode="+Drplsuppliercode.SelectedItem.Text);
            }
        }
        catch(SqlException ex)
        {
            LblUpdateError.Text=ex.Message;
        }
        catch(Exception ex)
        {
            LblUpdateError.Text = ex.Message;
        }
        finally
        {
         cmd.Connection.Close();
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
