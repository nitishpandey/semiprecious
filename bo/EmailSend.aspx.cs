using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.Odbc;
using System.Web.Configuration;
using System.Net.Mail;
public partial class EmailSend : System.Web.UI.Page
{
    OdbcConnection Conn = new OdbcConnection("DSN=citiesDB");
    string strsubject = "My Testing";//This subject will be dynamic
    string strbody = "This mail for checking only."; //this body will be dynamic
    protected void Page_Load(object sender, EventArgs e)
    {
        //GridViewBindToExcel();
        selectemail();
    }

    //public void GridViewBindToExcel()
    //{

    //    try
    //    {
    //        // Open connection
    //        Conn.Open();

    //        // Create OleDbCommand object and select data from worksheet Sheet1
    //        OdbcCommand cmd = new OdbcCommand("SELECT * FROM [Test$]", Conn);

    //        // Create new OleDbDataAdapter
    //        OdbcDataAdapter Ada = new OdbcDataAdapter();
    //        Ada.SelectCommand = cmd;
    //        DataTable  dt = new DataTable();
    //        Ada.Fill(dt);

    //        // Bind the data to the GridView
    //        GrdExccel.DataSource = dt;
    //        GrdExccel.DataBind();
    //    }
    //    catch (Exception ex)
    //    {
    //        Alert.Show("Not Bind To GridView");
    //    }
    //    finally
    //    {
    //        // Close connection
    //        Conn.Close();
    //    }

    //}

    public void selectemail()
    {

        string[] strArray = new string[] { "Deli","CHENNAI", "DELHI", "GZB.", "GRG.", "INDORE", "KANPUR", "MUMBAI -1", "MUMBAI-2", "NAVI MUMBAI", "Noida", "Pune" };
        int indiaemailid = 1;
        OdbcDataReader reader;
        OdbcCommand cmd = new OdbcCommand();
        Conn.Open();
        cmd.Connection = Conn;
            
        foreach (string city in strArray)
        {

            cmd.CommandText = "select top 300 * from  [" + city + "$] where emailsent <> " + indiaemailid;
            reader = cmd.ExecuteReader();
            
               if (reader.HasRows)
                {
                    CityInformation newcity = new CityInformation();
                    while (reader.Read())
                    {
                        string emailaddress =(string)reader["Email"];
                        if (emailaddress != null)
                        {
                            //newcity.S_No=(int)reader["S. NO"];
                           // newcity.Name = (string)reader["Name"];
                           // newcity.Email = emailaddress;
                           // newcity.CurrentLocation = (string)reader["Current Location"];

                            SendEmail(emailaddress,indiaemailid,city);
                        }
                    }
                    GridView1.DataSource = reader;
                    GridView1.DataBind();

                    break;
                }
               reader.Close();
                
        }
        Conn.Close();

  
    }
    public void SendEmail(string email, int indiaemailid, string city)
    {
        MailMessage message = new MailMessage();
        message.Subject = strsubject;
        message.Body = strbody;
        string Host = System.Configuration.ConfigurationManager.AppSettings["smtpServer"];
        string msgfrom = System.Configuration.ConfigurationManager.AppSettings["adminMailID"];
        //string messageto ="rampravesh.goswami@gmail.com";
        string messageto = email;
        
        message.To.Add(new MailAddress(messageto));
        message.From = new MailAddress(msgfrom);

        //System.Net.NetworkCredential NTLMAuthentication = new System.Net.NetworkCredential(UserName, Password);


       
        message.IsBodyHtml = true;

        SmtpClient client = new SmtpClient(Host);
        try
        {
         //   client.Send(message);
            UpdateStatus(email, indiaemailid, city);
        }
        catch (Exception ex)
        {
         //   UpdateStatus(email); 
            Alert.Show("Sorry ! Currently,Unable To Send");
            
        }

        Alert.Show("successfully");
        
    }

    public void UpdateStatus(string EmailAddress, int indiaemailid, string sheet)
    {
        OdbcCommand cmd = new OdbcCommand();
       cmd.CommandText = " UPDATE ["+ sheet + "$] SET emailsent=" + indiaemailid + " WHERE Email = '" + EmailAddress + "'";
       /* cmd.Parameters.AddWithValue("@Email", EmailAddress);
              cmd.Parameters.AddWithValue("@eid", indiaemailid);
       */
        cmd.Connection = Conn;
     
          //  Conn.Open();
            int result = cmd.ExecuteNonQuery();
            if (result > 0)
            {
             //   Alert.Show(" Successfully updated ");
            }
          //  Conn.Close();
        
    }
}
