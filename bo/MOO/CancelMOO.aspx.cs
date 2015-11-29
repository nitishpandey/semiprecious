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
using System.Net.Mail;


public partial class PacketInformation_CancelOrder : System.Web.UI.Page
{
    string statusmessage = string.Empty;
    string WebConnectionStrig = WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
     string _cartid = Request.QueryString["cartid"];
     string _itemid = Request.QueryString["itemid"];
     string _optionid = Request.QueryString["optionid"];
     string _indate = Request.QueryString["INDATE"].ToString();
    
     int cart_id = int.Parse(_cartid);
     int item_it = int.Parse(_itemid);
     int option_id = Convert.ToInt32(_optionid);
     DateTime in_date = Convert.ToDateTime(_indate);


     /* Delayed task which are more than 30 hours */
     DateTime StartDate = new DateTime(2011, 01, 23);
     DateTime EndDate;

     TimeSpan Difference;
     EndDate = DateTime.Now;
     Difference = EndDate.Subtract(StartDate);
     int hours = (int)Difference.TotalHours;
     
     //string url = "http://localhost:1073/myproject/MOO/CancelMOO.aspx?CARTID=1211&ITEMID=5678&OPTIONID=7&INDATE=12/1/2011 12:00:00 AM";
     if (hours > 30)
    {
        statusmessage = "Sorry you cannot cancel orders.Its already late.";
        Response.Redirect("http://www.semiprecious.in/MOO/modlist.cfm?status=" + statusmessage);
    }
    else
    {
     SqlConnection con = new SqlConnection(WebConnectionStrig);
     SqlCommand cmd = new SqlCommand();
     cmd.Connection = con;
     cmd.CommandText = "UPDATE buyingrecord SET makeondemand ='-HAR' WHERE CARTID=@CARTID and ITEMID=@ITEMID and OPTIONID=@OPTIONID ";
     cmd.CommandType = CommandType.Text;
     cmd.Parameters.AddWithValue("@CARTID", _cartid);
     cmd.Parameters.AddWithValue("@ITEMID", _itemid);
     cmd.Parameters.AddWithValue("@OPTIONID", _optionid);
     
     try
     {
      cmd.Connection.Open();
      int result=cmd.ExecuteNonQuery();
         if(result > 0)
         {
          // For email to Admin about the status of the cancel items
             CancelEmail(int.Parse(_cartid), int.Parse(_itemid), int.Parse(_optionid));
          
         }
         else
         {
         string message=" Failed to cancel your order.";
         }
     }
     catch(Exception ee)
     {
     string excepti="Error :"+ee.Message;; 
     }
        finally
     {
      cmd.Connection.Close();
     }
         statusmessage = "You are successfully cancel your order";
        Response.Redirect("http://www.semiprecious.in/MOO/modlist.cfm?status=" + statusmessage);
    }
       
        
    }
   

    public void CancelEmail(int ctid,int itid,int optid)
    {
        MailMessage message = new MailMessage();
        message.Subject = "Cancel Order By Harish";
        string strMessageBody = "Harish has canceled the order CartId :" + ctid + ""  + "ItemID:" +""+ itid + "OptionID:" + optid;
        message.Body = strMessageBody;
        string Host = System.Configuration.ConfigurationManager.AppSettings["smtpServer"];
        string msgfrom = System.Configuration.ConfigurationManager.AppSettings["adminMailID"];

        string messageto ="anup@semiprecious.com";
        string messagetobcc ="scorpionitish@yahoo.com";

        try
        {
            message.To.Add(new MailAddress(messageto));
            message.Bcc.Add(new MailAddress(messagetobcc));
            
        }
        catch (Exception a)
        {
            return;
        }
        message.From = new MailAddress(msgfrom);
        //System.Net.NetworkCredential NTLMAuthentication = new System.Net.NetworkCredential(UserName, Password);
        message.IsBodyHtml = true;
        SmtpClient client = new SmtpClient(Host);
        try
        {
            client.Send(message);
        }
        catch (Exception ex)
        {
            return;
        }
    }
    //public int gettime(int cartid,int itemid,int optionid,DateTime dt)
    //{
    //    int Hour =-1;
    //    SqlConnection con = new SqlConnection(WebConnectionStrig);
    //    SqlCommand cmd = new SqlCommand();
    //    cmd.Connection = con;
    //    cmd.CommandText = "SELECT DATEDIFF(hh, INDATE, GETDATE()) AS NumberOfHours FROM cartstatus where CARTID=@CARTID,ITEMID=@ITEMID,OPTIONID=@OPTIONID";
    //    cmd.CommandType = CommandType.Text;
    //    cmd.Parameters.AddWithValue("@CARTID", cartid);
    //    cmd.Parameters.AddWithValue("@ITEMID", itemid);
    //    cmd.Parameters.AddWithValue("@OPTIONID", optionid);
    //   // cmd.Parameters.AddWithValue("@indate", dt);
    //    SqlDataReader reader;
    //    try
    //    {
    //        cmd.Connection.Open();
    //        reader = cmd.ExecuteReader();
    //        if (reader.HasRows)
    //        { 
    //         while(reader.Read())
    //         {
              
    //           string strhour = reader["NumberOfHours"].ToString();
    //           Hour = int.Parse(strhour);
              
    //         }
    //        }
           
    //    }
    //    catch(Exception ex)
    //    {
    //       string strmessage= ex.Message;
    //    }
    //    finally
    //    {
    //        cmd.Connection.Close();
    //    }
    //    return Hour;
    //}



}