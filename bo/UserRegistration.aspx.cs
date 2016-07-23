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

public partial class UserRegistration : System.Web.UI.Page
{

    string WebConnectionStrig = WebConfigurationManager.ConnectionStrings["SqlConnectionString"].ConnectionString;
    string updateby;
    string date;
    string suppliercode;
    string currenttime = string.Empty;
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
            AltSupplier();
        }

        DateTime dt = DateTime.Now;
        currenttime = String.Format("{0:yyyy/M/d HH:mm:ss}", dt);


        Lblfirststage.Visible = false;
        DrplAltsupplier.Enabled = false;

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string password = string.Empty;

        SqlConnection con = new SqlConnection(WebConnectionStrig);
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "insert into users(Apptt,password,fullname,emailaddress,usertype,MobileNo,PhoneNo,Address,spldate,Comments,Backupsupplier,updatedby)  values(@Apptt,@password,@fullname,@emailaddress,@usertype,@MobileNo,@PhoneNo,@Address,@spldate,@Comments,@Backupsupplier,@updatedby)";
        cmd.CommandType = CommandType.Text;

        /* Passing parameters for Users*/
        cmd.Parameters.AddWithValue("@Apptt", TxtUserName.Text.Trim());

        if (DrplUserType.SelectedItem.Text == "Supplier/Vendor")
        {
            string strpassword = date + TxtPassword.Text.Trim();
            cmd.Parameters.AddWithValue("@password", strpassword);
        }
        else
        {
            cmd.Parameters.AddWithValue("@password", TxtPassword.Text.Trim());
        }
        cmd.Parameters.AddWithValue("@fullname", TxtName.Text.Trim());
        cmd.Parameters.AddWithValue("@emailaddress", TxtEmailAddress.Text.Trim());
        cmd.Parameters.AddWithValue("@usertype", DrplUserType.SelectedItem.Text);
        cmd.Parameters.AddWithValue("@MobileNo", Txtmobileno.Text.Trim());
        if (TxtPhoneNumber.Text != "")
        {
            cmd.Parameters.AddWithValue("@PhoneNo", TxtPhoneNumber.Text.Trim());
        }
        else
        {
            cmd.Parameters.AddWithValue("@PhoneNo", TxtPhoneNumber.Text.Trim());
        }
        cmd.Parameters.AddWithValue("@Address", TxtAddress.Text.Trim());
        cmd.Parameters.AddWithValue("@spldate", currenttime);
        if (TxtComments.Text != "")
        {
            cmd.Parameters.AddWithValue("@Comments", TxtComments.Text.Trim());
        }
        else
        {
            cmd.Parameters.AddWithValue("@Comments", "");
        }
        if (DrplUserType.SelectedItem.Text != "select supplier")
        {
            cmd.Parameters.AddWithValue("@Backupsupplier", DrplUserType.SelectedItem.Text);
        }
        else
        {
            cmd.Parameters.AddWithValue("@Backupsupplier", "");
        }

        cmd.Parameters.AddWithValue("@updatedby", updateby);
        try
        {
            cmd.Connection.Open();
            int result = cmd.ExecuteNonQuery();

            if (result > 0)
            {
               
                string subject = "User Registration";

                string EmailBody = "<html><body><b>You registered successfully in the semiprecious.com</b><br/><br/>" +
                " <font color=\"Blue\"><b>Your UserName :" + TxtUserName.Text.Trim() + "</b></font><br/>" +
                " <font color=\"Blue\"><b>Your Password :" + TxtPassword.Text.Trim() + "</b></font><br/>" +
                " <font color=\"Blue\"><b>Mobile Number :" + Txtmobileno.Text.Trim() + "</b></font><br/>" +
                " <font color=\"Blue\"><b>Email Address :" + TxtEmailAddress.Text.Trim() + "</b></font><br/>" +
                " <font color=\"Blue\"><b>Role of User  :" + DrplUserType.SelectedItem.Text + "</b></font><br/>" +
                "</body></html>";
                string bccemail="scorpionitish@yahoo.com";
                string message = email(subject, TxtEmailAddress.Text.Trim(), EmailBody, bccemail);
                message = "You are successfully created userid and password." + "username :" + TxtUserName.Text.Trim() + "Password :" + TxtPassword.Text.Trim();
                LblStatus.Text = message;
            }
            else
            {
                string message = "User creation is failed.Try again.";
                LblStatus.Text = message;
            }

        }
        catch (SqlException ex)
        {
            string message = "Sql Error :" + ex.Message;
            LblStatus.Text = message;

        }
        finally
        {
            cmd.Connection.Close();
        }


    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        TxtUserName.Text = "";
        TxtPassword.Text = "";
        TxtName.Text = "";
        TxtEmailAddress.Text = "";
        TxtPhoneNumber.Text = "";
        Txtmobileno.Text = "";
        TxtComments.Text = "";
        TxtAddress.Text = "";


    }

    public void AltSupplier()
    {
        SqlConnection con = new SqlConnection(WebConnectionStrig);
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "select apptt from users where usertype='Supplier/Vendor'";
        cmd.CommandType = CommandType.Text;
        SqlDataAdapter ada = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        ada.Fill(dt);
        DrplAltsupplier.DataTextField = "apptt";
        DrplAltsupplier.DataValueField = "apptt";
        DrplAltsupplier.DataSource = dt;
        DrplAltsupplier.DataBind();
        // DrplSupplierName.Items.Insert(0, new ListItem("Select Supplier"));
    }
    protected void DrplUserType_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DrplUserType.SelectedItem.Text == "supplier")
        {
            DrplAltsupplier.Enabled = true;
            TxtUserName.MaxLength = 3;
        }
        else
        {
            TxtUserName.MaxLength =30;
        }
    }

    public string email(string sub, string to, string content,string bccemailaddress)
    {
        string resultmessage = string.Empty;
        string Host = System.Configuration.ConfigurationManager.AppSettings["smtpServer"];
        string msgfrom = System.Configuration.ConfigurationManager.AppSettings["adminMailID"];
        MailMessage message = new MailMessage();
        message.Subject = sub;
        message.Body = content;
        message.To.Add(new MailAddress(to));
        message.Bcc.Add(new MailAddress(bccemailaddress));
        message.From = new MailAddress(msgfrom);
        message.IsBodyHtml = true;
        SmtpClient client = new SmtpClient(Host);
        try
        {
            client.Send(message);
            resultmessage = "successfully send email to user";

        }
        catch (Exception ex)
        {

            resultmessage = ex.Message;
        }
        return resultmessage;

    }
}