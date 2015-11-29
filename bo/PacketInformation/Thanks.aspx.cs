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

public partial class PacketInformation_Thanks : System.Web.UI.Page
{
    string WebConnectionStrig = WebConfigurationManager.ConnectionStrings["SqlConnectionString"].ConnectionString;
    string Quantity = string.Empty;
    string Cost;
    string Weight;
    string newitemid;
    
    int lotid;
    string TotalAddedQuantity;
    string TotalAddedValue;
    string TotalAddedWeighted;
    string totalvalue;
    string totalquantity;
    string totalweight;
    protected void Page_Load(object sender, EventArgs e)
    {   
        if (Request.QueryString["itemid"] != "")
       {
          newitemid = (Request.QueryString["itemid"]);
          LblItemID.Text = newitemid;
        SqlConnection con = new SqlConnection(WebConnectionStrig);
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "select quantity,cost,weight from ItemInfo where newitem=@newitem";
        cmd.CommandType = CommandType.Text;
        cmd.Parameters.AddWithValue("@newitem", Convert.ToInt32(newitemid));
       
        SqlDataReader red;
        try
        {
            cmd.Connection.Open();
            red = cmd.ExecuteReader();
            if (red.HasRows)
            {
                while (red.Read())
                {
                   Quantity=  red["quantity"].ToString();
                   Cost = red["cost"].ToString();
                   Weight = red["weight"].ToString();
                   
                }
                LblQunatity.Text = Quantity;
                lblCost.Text = Cost;
                Lblcurrentweight.Text =Weight;

                HyplkView.Text = "VIEW";
                HyplkView.NavigateUrl = "http://www.semiprecious.in/detail.cfm?newitem=" + newitemid;
                HyplnkEdit.Text = "EDIT";
                HyplnkEdit.NavigateUrl = "http://www.semiprecious.in/admintools/edititem.cfm?newitem=" + newitemid;
            }
            red.Close();
        }
           catch(SqlException ee)
           {
           string sqlmesssage="Error :"+ ee.Message;
           LblError.Text = sqlmesssage;
           }
           catch(Exception ee)
            {
            string Exceptionmessage = "Error :" + ee.Message;
            LblError.Text = Exceptionmessage;
            }
           finally
        {
         cmd.Connection.Close();
        }
        
        }
       
        else
       {
          LblError.Text = "Item ID. = " + newitemid + "is not found.";
           
       
       }


        if (Request.QueryString["Lotid"] != "")
        {
            lotid = Convert.ToInt32(Request.QueryString["Lotid"]);
            selectpublicId(lotid);
        }
    }

    public void selectpublicId(int lotID)
    {
       

      SqlConnection con = new SqlConnection(WebConnectionStrig);
      SqlCommand cmd = new SqlCommand();
      cmd.Connection = con;
      cmd.CommandText = "select TOTALVALUE,TOTALQUANTITY,totalweight,TOTALADDEDUANTITY,TOTALADDEDVALUE,TOTALADDEDWEIGHT from lotinfo where lotid=@lotid";
      cmd.CommandType = CommandType.Text;
      cmd.Parameters.AddWithValue("@lotid", lotID);
      SqlDataReader reder;
       try
         {
                cmd.Connection.Open();
                reder = cmd.ExecuteReader();
                if (reder.HasRows)
                {
                    while (reder.Read())
                    {
                        totalvalue = reder["TOTALVALUE"].ToString();
                        totalquantity = reder["TOTALQUANTITY"].ToString();
                        totalweight=reder["totalweight"].ToString();
                        TotalAddedQuantity = reder["TOTALADDEDUANTITY"].ToString();
                        TotalAddedValue = reder["TOTALADDEDVALUE"].ToString();
                        TotalAddedWeighted = reder["TOTALADDEDWEIGHT"].ToString();
                    }
                    Lblremainintquantity.Text = Convert.ToString(int.Parse(totalquantity) - int.Parse(TotalAddedQuantity));
                    lblremainingCost.Text = Convert.ToString(int.Parse(totalvalue) - int.Parse(TotalAddedValue));
                    Lblremainingweight.Text = Convert.ToString(float.Parse(totalweight) - float.Parse(TotalAddedWeighted));

                }
                reder.Close();
            }
            catch (SqlException ee)
            {
                string sqlmesssage = "Error :" + ee.Message;
                LblError.Text = sqlmesssage;
            }
            catch (Exception ee)
            {
                string Exceptionmessage = "Error :" + ee.Message;
                LblError.Text = Exceptionmessage;
            }
            finally
            {
                cmd.Connection.Close();
            }

    }
}
