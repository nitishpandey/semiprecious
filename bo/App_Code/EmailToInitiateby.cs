using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Net.Mail;
using System.IO;

public class EmailToInitiateby
{
    public void Email(int taskid)
    {
        MailMessage message = new MailMessage();
        message.Subject ="Close my task";
        message.Body = "Hello sir,"+"<br/>"+"I have completed my task. My Task ID is "+ taskid + "."+"<br/>" +"Please check my task, If task is not completed, acknowledge me otherwise close it .";
        string Host = System.Configuration.ConfigurationManager.AppSettings["smtpServer"];
        string msgfrom = System.Configuration.ConfigurationManager.AppSettings["adminMailID"];

        string messageto = "Nitish@semiprecious.com";
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
            client.Send(message);
        }
        catch (Exception ex)
        {

            Alert.Show("Sorry ! Currently,Unable To Send");

        }

 //       Alert.Show("successfully");
    }
}