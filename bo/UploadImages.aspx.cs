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
using System.Collections.Generic;
using System.IO;

public partial class UploadImages : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

       if (!this.IsPostBack)
        {
            ArrayList arl = new ArrayList();
            arl.Add("Select");
            arl.Add("For Email");
            arl.Add("For Center Graphics");

                     
        }
 
    }
    protected void ButtonUpload_Click(object sender, EventArgs e)
    {
       
            HttpFileCollection httpFileCollection = Request.Files;
            for (int i = 0; i < httpFileCollection.Count; i++)
            {
                HttpPostedFile httpPostedFile = httpFileCollection[i];
                string strExtn = Path.GetExtension(httpPostedFile.FileName).ToLower();
                if ((strExtn == ".jpg") || (strExtn == ".gif") || (strExtn == ".png"))
                {
                    if (httpPostedFile.ContentLength > 0)
                    {
                        httpPostedFile.SaveAs(Server.MapPath("~/Images/") + System.IO.Path.GetFileName(httpPostedFile.FileName));
                        Alert.Show("Upload Successfully");
                    }
                    else
                        Alert.Show("Length must be greater than 0");
                }
                else
                    Alert.Show(" Upload Only jpg or gif or png files !");
            }
        }
       
    }
