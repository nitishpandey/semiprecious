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


public partial class Email_Emailformat : System.Web.UI.Page
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
        if (!Page.IsPostBack)
        {
            string HtmlFileName = Request.QueryString["Name"];
            if (HtmlFileName != null)
            {
                Editor1.Content = showfile(HtmlFileName);
                txtFileName.Text = Path.GetFileNameWithoutExtension(HtmlFileName);

            }
        }

    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (Editor1.Content != string.Empty)
        {
            try
            {

                string filename = txtFileName.Text + ".html";
                string strPath = Request.PhysicalApplicationPath + "\\email_content\\" + filename;


                if (File.Exists(strPath))
                {
                    if (CheckBox1.Checked == true)
                    {
                        //string strTextToWrite = TextBox1.Text;
                        FileStream fStream = File.Create(strPath);
                        fStream.Close();
                        StreamWriter sWriter = new StreamWriter(strPath);
                        sWriter.Write(Editor1.Content);
                        sWriter.Close();
                        lblstatus.Text = " file is edited successfully ";
                    }
                    else
                    {
                        lblstatus.Text = "File  already exists.";
                    }

                }
                else
                {
                    //string strTextToWrite = TextBox1.Text;
                    FileStream fStream = File.Create(strPath);
                    fStream.Close();
                    StreamWriter sWriter = new StreamWriter(strPath);
                    sWriter.Write(Editor1.Content);
                    sWriter.Close();
                    lblstatus.Text = " file is created successfully ";
                }
            }
            catch (Exception ee)
            {
                lblstatus.Text = "Error :" + ee.Message;
            }
        }
        else
        {
            lblstatus.Text = "It should not be empty.";
        }

    }
    protected void BtnClear_Click(object sender, EventArgs e)
    {
        txtFileName.Text = "";
        Editor1.Content = "";
        lblstatus.Text = "";
        CheckBox1.Checked = false;
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


    protected void Button1_Click(object sender, EventArgs e)
    {
        if (fldupload.HasFile)
        {
            int UploadFileLength = fldupload.PostedFile.ContentLength;
            string strPostedFileName = fldupload.PostedFile.FileName;

            try
            {
                string strPath = Request.PhysicalApplicationPath + "\\indaiemail\\" + strPostedFileName;
                if (File.Exists(strPath))
                {
                    if (CheckBox1.Checked == true)
                    {
                        if (strPostedFileName != string.Empty)
                        {
                            string strExtn = System.IO.Path.GetExtension(strPostedFileName);

                            //if((strExtn = ".html")||(strExtn = ".htm"))
                            if ((strExtn == ".html") || (strExtn == ".htm") || (strExtn == ".HTML"))
                            {
                                if (UploadFileLength != 0)
                                {
                                    //string filename = Path.GetFileName(FileUpload1.FileName);
                                    fldupload.SaveAs(Server.MapPath("~/indaiemail/") + strPostedFileName);
                                    lblstatus.Text = "Upload status: File " + strPostedFileName + " uploaded ";
                                }
                            }
                            else if ((strExtn == ".txt") || (strExtn == ".TXT"))
                            {

                                if (UploadFileLength != 0)
                                {
                                    //string filename = Path.GetFileName(FileUpload1.FileName);
                                    fldupload.SaveAs(Server.MapPath("~/indaiemail/") + strPostedFileName);
                                    lblstatus.Text = "Upload status: File " + strPostedFileName + " uploaded successfully";
                                }

                                else
                                {
                                    lblstatus.Text = " Upload Only Html  or text file!";
                                }
                            }
                        }
                    }
                   else
                   {
                     lblstatus.Text = "If you want to over write the existing file .Please check the checkbox.";
                   }
                }
                   else
                    {
                        if (strPostedFileName != string.Empty)
                        {
                            string strExtn = System.IO.Path.GetExtension(strPostedFileName);

                            if ((strExtn == ".html") || (strExtn == ".htm") || (strExtn == ".HTML"))
                            {
                                if (UploadFileLength != 0)
                                {
                                    //string filename = Path.GetFileName(FileUpload1.FileName);
                                    fldupload.SaveAs(Server.MapPath("~/indaiemail/") + strPostedFileName);
                                    lblstatus.Text = "Upload status: File " + strPostedFileName + " uploaded successfully";
                                }
                            }
                            else if ((strExtn == ".txt") || (strExtn == ".TXT"))
                            {

                                if (UploadFileLength != 0)
                                {
                                    //string filename = Path.GetFileName(FileUpload1.FileName);
                                    fldupload.SaveAs(Server.MapPath("~/indaiemail/") + strPostedFileName);
                                    lblstatus.Text = "Upload status: File " + strPostedFileName + " uploaded successfully";
                                }
                            }
                            else
                            {
                                lblstatus.Text = " Upload Only Html  or text file!";
                            }
                        }
                    }
                }
            
            catch (Exception ex)
            {
                lblstatus.Text = "Upload status: The file could not be uploaded. The following error occured: " + ex.Message;
            }
        }
    }
}

