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

public partial class createfolder : System.Web.UI.Page
{
    string FilePath;
    string SubFolderName;
   
    protected void Page_Load(object sender, EventArgs e)
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
            Response.Redirect("/tm-tm/login.cfm");
        }
        // Label2.Text=Session["Name"].ToString();

        FilePath = Server.MapPath("~/centergraphics/");
        string action = Request.QueryString["action"];
        if (!Page.IsPostBack)
        {
            if (action == "delete")
        {
            deleteImage();
            string FolderName = Request.QueryString["folder"];
            SubFolderName = FolderName;
        } 
            else
            GetFiles();  //call the GetFiles method
        }
    }
   

    private void GetFiles()
    {
        
        //Create the DataTable, with columns in which to add the file list
        DataTable dt = new DataTable();
        dt.Columns.Add("FileName", typeof(System.String));
        //dt.Columns.Add("Size", typeof(System.String));
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
        
        DrplSubfolder.DataTextField="FileName";;
       // DrplSubfolder.Items(0,"Select Subfolder");
        DrplSubfolder.DataSource = dt;
        DrplSubfolder.DataBind();
        //grdFiles.DataSource = dt;
        //grdFiles.DataBind();

        
    }
    private void GetFileImages()
    {
        /* Subfolder path */
        string FilePath = Server.MapPath("~/centergraphics/" +  SubFolderName);
        
        //Create the DataTable, with columns in which to add the file list
        DataTable dt = new DataTable();
        DataColumn imgclm = new DataColumn();
        dt.Columns.Add("pictureurl",typeof(string));
        //dt.Columns.Add(imgclm);

        //dt.Columns.Add("Size", typeof(System.String));
        DataRow dr = null;
        DirectoryInfo dir = new DirectoryInfo(FilePath);
        //FileInfo dir = new FileInfo(FilePath);
        // Iterate through the datatable,
        // adding file to a new row, along with the  filesize to each row
        String listing = "<table>";
        foreach (FileInfo fi in dir.GetFiles())
        {
            listing = listing + "<tr><td>" + SubFolderName+fi.Name + "</td><td><img width='120px' src='centergraphics/" + SubFolderName + fi.Name + "' /> </td></tr>";
            //dr = dt.NewRow();
            //dr[0] = "<img src='"+FilePath+"/"+fi.Name.ToString()+"' />"+ fi.Name.ToString();
            //dr[1] = "<img src='"+FilePath+""+fi.Name.ToString()+"' />";
            //string str= FilePath.Replace(Server.MapPath("/" & fi.Name.ToString()));
            //dr[0] =ResolveUrl(str.Replace("/"));

            //dt.Rows.Add(dr);
        }
        listing = listing + "</table>";
        listingtable.Text = listing;
        //GrdImages.DataSource = dt;
        //GrdImages.DataBind();
    }

    protected void DrplSubfolder_SelectedIndexChanged(object sender, EventArgs e)
    {
        SubFolderName = DrplSubfolder.SelectedValue.ToString();
        
    }
    protected void btnshowimages_Click(object sender, EventArgs e)
    {
       // GetFileImages();
        /* Subfolder path */
        if ((SubFolderName != "select subfolder") & (SubFolderName !=null))
        {
           
            string FilePath = Server.MapPath("~/centergraphics/" + SubFolderName + "/");

            //Create the DataTable, with columns in which to add the file list
            DataTable dt = new DataTable();
            DataColumn imgclm = new DataColumn();
            dt.Columns.Add("pictureurl", typeof(string));
          
            DataRow dr = null;
            DirectoryInfo dir = new DirectoryInfo(FilePath);
           
            // Iterate through the datatable,
            // adding file to a new row, along with the  filesize to each row
            String listing = "<table>";
            
            
            foreach (FileInfo fi in dir.GetFiles())
            {
                listing = listing + "<tr><td>http://wwww.semiprecious.com/myproject/centergraphics/" + SubFolderName+"/"+fi.Name + "</td><td><img width='120px' src='centergraphics/" + SubFolderName + "/" + fi.Name + "'/></td><td><a href='createfolder.aspx?action=delete&file=" + fi.Name + "&folder=" + SubFolderName + "'> Delete</a></td></tr>";
               
            }
            listing = listing + "</table>";
            listingtable.Text = listing;
            
        }
        else
        {
            lblerror.Text = "Please select folder !";
        }
    }
    public void deleteImage()
    {
        string filename = Request.QueryString["file"];
        string foldername = SubFolderName = Request.QueryString["folder"];
        string strpath = Server.MapPath("~/centergraphics/" +foldername+"/"+filename);
      
        //DirectoryInfo dir = new DirectoryInfo(FilePath);
        FileInfo fi = new FileInfo(strpath);
        if (fi.Exists)
        {
            File.Delete(strpath);
            btnshowimages_Click((Object)null, (EventArgs)null);
        }
        return;
    }


}
