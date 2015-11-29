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
using System.Text;
using System.Collections.Generic;



public partial class fileupload : System.Web.UI.Page
{
    string strfilecontent;
    string FilePath;
    string subfoldername;
    protected void Page_Load(object sender, EventArgs e)
    {
        Lblstatus.Text = string.Empty;
        try
        {
            cfsession.setsession();

            if (Session["Name"].ToString() == string.Empty)
            {
                Response.Redirect("/tm-tm/login.cfm");
            }

            if (Session["admin"].Equals("0"))
            {
                Response.Redirect("/tm-tm/login.cfm");
            }

        }
        catch (Exception ee)
        {
            Response.Redirect("/tm-tm/login.cfm");
        }

        Lblloginby.Text = Session["Name"].ToString();
        
        FilePath = Server.MapPath("~/centergraphics/");
        if (!IsPostBack)
        { 
            //call the GetFiles method
            GetFiles();
           
        }
   }
    protected void BtnSubmit_Click(object sender, EventArgs e)
    {
        if ( FileUpload1.HasFile)
        {
            int UploadFileLength = FileUpload1.PostedFile.ContentLength;
            string strPostedFileName =FileUpload1.PostedFile.FileName;

            try
            {
                if(strPostedFileName != string.Empty)
                {
                    string strExtn = System.IO.Path.GetExtension(strPostedFileName).ToLower();

                    //if((strExtn = ".html")||(strExtn = ".htm"))
                    if(strExtn==".html")
                    {
                        if (UploadFileLength != 0)
                        {
                            //string filename = Path.GetFileName(FileUpload1.FileName);
                            FileUpload1.SaveAs(Server.MapPath("~/indaiemail/") + strPostedFileName);
                            Lblstatus.Text = "Upload status: File uploaded ";
                            Alert.Show("upload successfully");

                            string filena = Server.MapPath("~/indaiemail/" + strPostedFileName);
                             showfile(filena);
                            //HtmlControl frame1 = (HtmlControl)this.FindControl("frame1");
                            //frame1.Attributes["src"] = (Server.MapPath("~/indaiemail/") + strPostedFileName);

                        }
                    //    else
                    //        Lblstatus.Text = " file size exceeds the limit of 4000 kb.";
                    
                    }
                    else
                        Lblstatus.Text = " Upload Only Html files are accepted!";
                }
                
            }
            catch (Exception ex)
            {
                Lblstatus.Text = "Upload status: The file could not be uploaded. The following error occured: " + ex.Message;
            }
        }

    }
    public void showfile(string filename)
    {
        try
        {
            TextReader tr = new StreamReader(filename);
            //    Alert.Show(filena);
            //TextReader tr = new StreamReader(filena);
            // read a line of text
            strfilecontent = tr.ReadToEnd();
            txtHtmlSrc.Text = strfilecontent;
            // close the stream
            tr.Close();

        }
        catch (Exception e)
        {
            Alert.Show("Error to read file");
        }
       
    }

    protected void txtHtmlSrc_TextChanged(object sender, EventArgs e)
    {

    }
    protected void ButtonUpload_Click(object sender, EventArgs e)
    {
        if (subfoldername != "Select Subfolder")
        {
            HttpFileCollection httpFileCollection = Request.Files;
            for (int i = 1; i < httpFileCollection.Count; i++)
            {
                HttpPostedFile httpPostedFile = httpFileCollection[i];
                string strExtn = Path.GetExtension(httpPostedFile.FileName).ToLower();
                if ((strExtn == ".jpg") || (strExtn == ".gif") || (strExtn == ".png"))
                {
                    if (httpPostedFile.ContentLength > 0)
                    {
                        httpPostedFile.SaveAs(Server.MapPath("~/centergraphics/"+ subfoldername+ "/") + System.IO.Path.GetFileName(httpPostedFile.FileName));
                        Alert.Show("Upload Successfully");
                    }
                    else
                        Alert.Show("Length must be greater than 0");
                }
                else
                    Alert.Show(" Upload Only jpg or gif or png files !");
                    //return;
            }
        }
        else
            Alert.Show("Please select Subfolder !");
        
    }
    protected void DrpdImagesType_SelectedIndexChanged(object sender, EventArgs e)
    {
        subfoldername = DrpdImagesType.SelectedValue.ToString();
    }
    private void GetFiles()
    {
        //Create the DataTable, with columns in which to add the file list
        DataTable dt = new DataTable();
        dt.Columns.Add("FileName", typeof(System.String));
        DataRow dr = null;
        DirectoryInfo dir = new DirectoryInfo(FilePath);

        // Iterate through the datatable,
        // adding file to a new row, along with the  filesize to each row
        foreach (DirectoryInfo fi in dir.GetDirectories())
        {
            dr = dt.NewRow();
            dr[0] = fi.Name.ToString();
            dt.Rows.Add(dr);
        }

        DrpdImagesType.DataTextField = "FileName"; ;
        // DrplSubfolder.Items(0,"Select Subfolder");
        DrpdImagesType.DataSource = dt;
        DrpdImagesType.DataBind();
     }
}
