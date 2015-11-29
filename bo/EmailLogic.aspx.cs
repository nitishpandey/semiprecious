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
public partial class EmailLogic : System.Web.UI.Page
{
    OdbcConnection Conn = new OdbcConnection("DSN=SMTPDB");
    string strsubject = "Authentic Silver Jewellery";//This subject will be dynamic
    int indiaemailid = 1;
    int mailcount = 0;
    string strbody = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        selectemail();
    }

    public void indiaemail()
    {

        // create reader & open file
        TextReader tr = new StreamReader("~/myproject/indaiemail/1.html");

        // read a line of text
        strbody = tr.ReadToEnd();

        // close the stream
        tr.Close();
    }    



    public void selectemail()
    {
        indiaemail();
        string[] strArray = new string[] { "Deli", "CHENNAI", "DELHI", "GZB.", "GRG.", "INDORE", "KANPUR", "MUMBAI -1", "MUMBAI-2", "NAVI MUMBAI", "Noida", "Pune" };

        OdbcDataReader reader;
        OdbcCommand cmd = new OdbcCommand();
        Conn.Open();
        cmd.Connection = Conn;

        foreach (string city in strArray)
        {

            cmd.CommandText = "select * from cities  where emailsent <> " + indiaemailid + " and currentlocation='" + city + "'";
            reader = cmd.ExecuteReader();

            if (reader.HasRows && (mailcount <= 10))
            {
                while (reader.Read())
                {
                    string emailaddress = (string)reader["Email"];
                    if (emailaddress != null)
                    {
                        SendEmail(emailaddress, indiaemailid, city);
                        mailcount++;
                    }
                }

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
        try
        {
            message.To.Add(new MailAddress(messageto));
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
            message.To.Add(new MailAddress("rpgoswami123@zoho.com"));
            // client.Send(message);
            UpdateStatus(email, indiaemailid, city);
        }
        catch (Exception ex)
        {
        
        }

     }

    public void UpdateStatus(string EmailAddress, int indiaemailid, string sheet)
    {
        OdbcCommand cmd = new OdbcCommand();
        cmd.CommandText = " UPDATE cities SET emailsent=" + indiaemailid + " WHERE Email = '" + EmailAddress + "'";
        cmd.Connection = Conn;
        int result = cmd.ExecuteNonQuery();
        if (result > 0)
        {
            //   Alert.Show(" Successfully updated ");
        }
        //  Conn.Close();

    }
}
