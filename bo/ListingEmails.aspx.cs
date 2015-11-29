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
using System.Web.Configuration;

public partial class ListingEmails : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // FilePath = Server.MapPath("~/indaiemail/");

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


        string action = Request.QueryString["action"];
        if (!Page.IsPostBack)
        {
            if (action == "delete")
            {
                deleteImage();
                
            }
            else
                showlisting();  //call the GetFiles method
        }
        showlisting();
    }

    public void showlisting()
    {
           string FilePath = Server.MapPath("~/indaiemail/");

            //Create the DataTable, with columns in which to add the file list
            DataTable dt = new DataTable();
            DataColumn imgclm = new DataColumn();
            dt.Columns.Add("emailurl", typeof(string));

            DataRow dr = null;
            DirectoryInfo dir = new DirectoryInfo(FilePath);

            // Iterate through the datatable,
            // adding file to a new row, along with the  filesize to each row
            String listing = "<table>";


            foreach (FileInfo fi in dir.GetFiles())
            {
                listing = listing + "<tr><td>http://wwww.semiprecious.com/myproject/indaiemail/" + fi.Name + "</td><td><a href='ListingEmails.aspx?action=delete&file=" + fi.Name + "'> Delete</a></td><td><a href='viewmail.aspx?file=" + fi.Name + "'> view</a></td></tr>";

            }
            listing = listing + "</table>";
            ltlemaillisting.Text = listing;

        }
        
 
    public void deleteImage()
    {
        string filename = Request.QueryString["file"];
        string strpath = Server.MapPath("~/indaiemail/" + filename);

        //DirectoryInfo dir = new DirectoryInfo(FilePath);
        FileInfo fi = new FileInfo(strpath);
        if (fi.Exists)
        {
            File.Delete(strpath);
           
        }
        return;
    }
}
