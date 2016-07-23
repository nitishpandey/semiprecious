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
using System.IO;
using System.Data.SqlClient;
using System.Web.Configuration;

public partial class Email_TextEmail : System.Web.UI.Page
{
     protected void Page_Load(object sender, EventArgs e)
    {
        if (!Request.IsLocal)
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

            }
            catch (Exception ee)
            {
                Response.Redirect("/tm-tm/login.cfm?error=" + ee.Message);
            }
        }
        

         // For edit the content
        if (! Page.IsPostBack)
        {
            string FlName =Path.GetFileName( Request.QueryString["Name"]);
            if (FlName != null)
            { 
                TxtMessage.Text = showfile(FlName);
                Txtfilename.Text = Path.GetFileNameWithoutExtension(FlName);
                
            }
        }

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (TxtMessage.Text != string.Empty)
        {
            try
            {
                string filename = Txtfilename.Text + ".txt";
                string strPath = Request.PhysicalApplicationPath + "\\email_content\\" + filename;

                if (File.Exists(strPath))
                {
                    if (Chkfilemessage.Checked == true)
                    {
                        FileStream fStream = File.Create(strPath);
                        fStream.Close();
                        StreamWriter sWriter = new StreamWriter(strPath);
                        sWriter.Write(TxtMessage.Text);
                        sWriter.Close();
                        lblerror.Text = " file" + filename + " is edited successfully ";
                    }
                    else
                    {
                        lblerror.Text = "File already exists.";
                    }
                }
                else
                {
                   //string strTextToWrite = TextBox1.Text;
                    FileStream fStream = File.Create(strPath);
                    fStream.Close();
                    StreamWriter sWriter = new StreamWriter(strPath);
                    sWriter.Write(TxtMessage.Text);
                    sWriter.Close();
                    lblerror.Text = " file " + filename + " is created successfully ";
                }
            }
            catch (Exception ee)
            {
                lblerror.Text = "Error :" + ee.Message;
            }
        }
        else
        {
            lblerror.Text = "It should not be empty.";
        }
                
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Txtfilename.Text = string.Empty;
        TxtMessage.Text = string.Empty;
            
    }
    public string showfile(string filename)
    {
        string message = string.Empty;
        try
        {
            string strPath = Request.PhysicalApplicationPath + "\\email_content\\" + filename;
            FileStream fStream = new FileStream(strPath, FileMode.Open, FileAccess.Read);
            StreamReader sReader = new StreamReader(fStream);
            message = sReader.ReadToEnd();
            sReader.Close();
        }
        catch (Exception e)
        {
            Alert.Show("Error to read file");
        }
        return message;
    }
 
}
