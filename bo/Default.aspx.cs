using System;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Net.Mail;
using System.Web.Configuration;
using System.Data.SqlClient;
using System.Data.Odbc;
public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       // DateTime dt1 = DateTime.Now.ToString("MM/dd/yyyy");
     //   string dte =DateTime.Now.ToShortDateString;
     // string date=  Convert.ToDateTime(DateTime.Now).ToString("dd/MM/yyyy");

      // // string ConString = WebConfigurationManager.ConnectionStrings["MySQLConnectionString"].ConnectionString;
      ///*  string ConString = "Driver={MySQL ODBC 5.1 Driver};Server=localhost;DATABASE=employees;UID=root;PASSWORD=glspl123;port=3306;charset=UTF8";*/

      // // string ConString = "Server=localhost;Database=Employees;user id=root;password=glspl123";
      // // string ConString = "Driver={MySQL ODBC 5.1 Driver};" + "Server=209.200.117.22;" + "Database=Employees;" + "user id=nitish;" + "password=nitish;" + "Port=3306";
      //   OdbcConnection connection = new OdbcConnection("DSN=sptm");
      //  // OdbcConnection connection = new OdbcConnection(ConString);

      //  string sSQL = "select * from emp_details";
      //  OdbcDataAdapter ODA = new OdbcDataAdapter(sSQL,connection);
      //  //OdbcDataAdapter oDataAdapter = new OdbcDataAdapter(sSQL, connection);
      //  DataTable dt = new DataTable();
      //  ODA.Fill(dt);
      //  GRDMYSQL.DataSource = dt;
      //  GRDMYSQL.DataBind();


        CentraliseEmail objsendmail = new CentraliseEmail();
        objsendmail.SendMail();

    }

    private void MessageBox(string message)
    {
        if (!string.IsNullOrEmpty(message))
        {
            Response.Write("<script type=\"text/javascript\">");
            Response.Write("alert('" + message + "');");
            Response.Write("</script>");
        }
    }


    //public void mail()
    //{
    //    SmtpClient smtpClient = new SmtpClient();

    //    MailMessage message = new MailMessage();

    //    try
    //    {

    //        MailAddress fromAddress = new MailAddress("from@site.com", "Nameofsendingperson");

    //        message.From = fromAddress;//here you can set address

    //        message.To.Add("to@site.com");//here you can add multiple to

    //        message.Subject = "Feedback";//subject of email

    //        message.CC.Add("cc@site.com");//ccing the same email to other email address

    //        message.Bcc.Add(new MailAddress("bcc@site.com"));//here you can add bcc address

    //        message.IsBodyHtml = false;//To determine email body is html or not

    //        message.Body = @"Plain or HTML Text";

    //        smtpClient.Send(message);

    //    }

    //    catch (Exception ex)
    //    {

    //        //throw exception here you can write code to handle exception here

    //    }
    //}
    protected void Button1_Click1(object sender, EventArgs e)
    {
        //string UserName = System.Configuration.ConfigurationManager.AppSettings["smtpUsername"];
        //string Password = System.Configuration.ConfigurationManager.AppSettings["smtpPassword"];
        string Host = System.Configuration.ConfigurationManager.AppSettings["smtpServer"];
        string msgfrom = System.Configuration.ConfigurationManager.AppSettings["adminMailID"];
        //string msgto = System.Configuration.ConfigurationManager.AppSettings["tosendmessage"];
     //   string messageto = "ravi.khanna@gnanalife.com";
        MailMessage message = new MailMessage();
        message.To.Add(new MailAddress(messageto));
        message.From = new MailAddress(msgfrom);

        //System.Net.NetworkCredential NTLMAuthentication = new System.Net.NetworkCredential(UserName, Password);


        message.Subject = "checking the mail";
        string txtbody = "now time to check whether it is work or not";
        message.Body = txtbody;
        message.IsBodyHtml = false;

        SmtpClient client = new SmtpClient(Host);
        //client.UseDefaultCredentials = false;
        //client.Credentials = NTLMAuthentication;
        try
        {
            client.Send(message);
        }
        catch (Exception ex)
        {

            Alert.Show("Sorry ! Currently,Unable To Send");
        }

        Alert.Show("successfully");
        //Response.Redirect("~/Home.aspx");
    }
}
