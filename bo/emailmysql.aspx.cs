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
using System.IO;
using System.Data.Odbc;
using System.Web.Configuration;
using System.Net.Mail;
using System.Data.SqlClient;

public partial class emailmysql : System.Web.UI.Page
{
    OdbcConnection Conn = new OdbcConnection("DSN=MYSQLdsn");
    string strsubject = "Authentic Silver Jewellery";//This subject will be dynamic
    int indiaemailid ;
    int maxmailcount = 200;
    int mailcount;
    int count ; 
                    
    //this body will be dynamic
    string strbody;

    protected void Page_Load(object sender, EventArgs e)
    {
        mailcount = count = 0;
    //  SelectIndiaMailID();
        indiaemailid = 1;
        if (indiaemailid == 0)
        {
           Label1.Text= ((int)indiaemailid).ToString();
           return;
        }
        /* check in no send time zone */
            
        string[] strDay = new string[] { "Monday", "Tuesday", "Wednesday", "Thursday", "Friday" };
        DateTime dt = Convert.ToDateTime(DateTime.Now);
        foreach (string Day in strDay)
        {
            if (dt.DayOfWeek.ToString() == Day)
            {
                int mintime = 20;
                int maxtime = 4;
              
                int k =  DateTime.Now.Hour;
                if ((k < mintime) & (k > maxtime))
                {
                  //  Alert.Show("uhl");
                   return;
                }
            }
        }
        selectemail();
    }



    public int indiaemail()
    {
        try
        {
           TextReader tr = new StreamReader("C:\\inetpub\\wwwroot\\semiprecious\\myproject\\india_email\\" + indiaemailid + ".html");
        //    Alert.Show(filena);
            //TextReader tr = new StreamReader(filena);
            // read a line of text
            strbody = tr.ReadToEnd();

            // close the stream
            tr.Close();
            return 1;
        }
        catch (Exception e)
        {
            return 0;
        }
    }



    public void selectemail()
    {
       count = 0;
			 
			  if (indiaemail() == 0)
        {
            //Alert.Show("email");
            return;
        } 
        string[] strArray = new string[] { "Deli", "CHENNAI", "DELHI", "Ghaziabad", "Gurgaon", "INDORE", "KANPUR", "MUMBAI", "NAVI MUMBAI", "Noida", "Pune"};

                    OdbcDataReader reader;
                    OdbcCommand cmd = new OdbcCommand();
                    Conn.Open();
                    cmd.Connection = Conn;
                    foreach (string city in strArray)
                    {
                      //  Alert.Show(city);
                        
                        cmd.CommandText = "select * from cities  where emailsent <> " + indiaemailid + " and currentlocation='" + city + "'";
                        reader = cmd.ExecuteReader();
                        
                        if (reader.HasRows )
                        {
                         //   cviv = cviv + city;
                          //  Alert.Show((string)reader["Email"]);
                            CityInformation newcity = new CityInformation();
                            while (reader.Read() & (mailcount <= maxmailcount))
                            {
                                string emailaddress = (string)reader["Email"];
                                if (emailaddress != null)
                                 {
                                    
                                   SendEmail(emailaddress, indiaemailid, city);
    							   // Alert.Show(((int)count).ToString());
                                   mailcount++;
                                 }
                            }

                            //GridView1.DataSource = reader;
                            //GridView1.DataBind();
                            
                          // break;
                        }
                        reader.Close();
                        Label1.Text = " Total email sent :" + count ;
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
	    string messageToBcc = "rpgoswami123@zoho.com" ;
        //string messageToBcc = "Nitish@semiprecious.com";
        try
        {
            message.To.Add(new MailAddress(messageto));
            message.Bcc.Add(new MailAddress(messageToBcc));
            
        }
        catch (Exception a)
        {
        UpdateStatus(email, indiaemailid, city);
        return;
            
        }
        message.From = new MailAddress(msgfrom);
        //System.Net.NetworkCredential NTLMAuthentication = new System.Net.NetworkCredential(UserName, Password);
        message.IsBodyHtml = true;
        SmtpClient client = new SmtpClient(Host);
        try
        {
           // Alert.Show("To:"+messageto);
           client.Send(message);
           UpdateStatus(email, indiaemailid, city);
           // Alert.Show(email);
            count++;
        }
        catch (Exception ex)
        {
            //   UpdateStatus(email); 
         // Alert.Show("Sorry ! Currently,Unable To Send");

        }

        //    Alert.Show("successfully");

    }

    public void UpdateStatus(string EmailAddress, int indiaemailid, string sheet)
    {
        OdbcCommand cmd = new OdbcCommand();
        cmd.CommandText = " UPDATE cities SET emailsent=" + indiaemailid + " WHERE Email = '" + EmailAddress + "'";
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
    public void SelectIndiaMailID()
    {

        //string connectionstring = WebConfigurationManager.ConnectionStrings["sptmConnectionString"].ConnectionString;
        //OdbcConnection con = new OdbcConnection("DSN=semiprecious-odbc");
        string connectionstring = WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        OdbcConnection con = new OdbcConnection(connectionstring);
        OdbcCommand cmd = new OdbcCommand();
        cmd.Connection = con;
        cmd.CommandText = "select PValue from Properties where 1 = 1 or PName='indiaemailid'"; 
        OdbcDataReader reader;
                  
        try
        {
            con.Open();
            reader = cmd.ExecuteReader();
            if (reader.HasRows)
            {
                //Alert.Show("a");
                while (reader.Read())
                {

                    indiaemailid = int.Parse(reader["PValue"].ToString().Trim());
                    Label1.Text = ((int)indiaemailid).ToString();
                                      
                }
            }
            reader.Close();
        }
        catch (Exception ee)
        {
            Alert.Show(ee.ToString());
        }
        finally
        {
            con.Close();
        }
    }
}
