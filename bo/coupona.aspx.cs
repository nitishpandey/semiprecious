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

public partial class coupona : System.Web.UI.Page
{
    string ConnectionStrig = WebConfigurationManager.ConnectionStrings["SqlConnectionString"].ConnectionString;
    string couponcrtime;
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

        DateTime dt = DateTime.Now;
        couponcrtime = String.Format("{0:yyyy/M/d HH:mm:ss}", dt);
    }
    protected void BtnSave_Click(object sender, EventArgs e)
    {
       
        SqlConnection con = new SqlConnection(ConnectionStrig);
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "insert into certificatecode(CouponCode,ValueUSD,Dateissued) values(@CouponCode,@ValueUSD,@Dateissued)";
        cmd.CommandType = CommandType.Text;
        
        /* Passing parameters for L
         * ot Information*/
        cmd.Parameters.AddWithValue("@CouponCode", TxtCouponCode.Text.Trim());
        cmd.Parameters.AddWithValue("@ValueUSD", TxtCouponValue.Text.Trim());
        cmd.Parameters.AddWithValue("@Dateissued",couponcrtime);
      //  cmd.Parameters.AddWithValue("@DateUsed", "");
        

        try
        {
           
            cmd.Connection.Open();
            int result = cmd.ExecuteNonQuery();
            if (result > 0)
            {
                string message = "Successfully inserted.";
                LblErrorMessage.Text = message;
            }

        }
        catch (SqlException ex)
        {
            string message = "Sql Error :" + ex.Message;
            LblErrorMessage.Text = message;
        }
        finally
        {
            cmd.Connection.Close();
            GridView1.DataBind();
        }
    }
    protected void BtnReset_Click(object sender, EventArgs e)
    {
        TxtCouponCode.Text = "";
        TxtCouponValue.Text = "";
    }
}
