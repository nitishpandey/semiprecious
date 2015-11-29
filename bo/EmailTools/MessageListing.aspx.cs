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
using System.Web.Configuration;



public partial class Email_MessageListing : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string edit = Request.QueryString["Edit"];
        string flextension=Path.GetExtension(edit);
        if (edit != null)
        {
            if( (flextension == ".html")||(flextension == ".Html"))
            {
                Response.Redirect("Emailformat.aspx?Name="+edit);
            }
            if ((flextension == ".txt")||(flextension == ".Txt"))
            {
                Response.Redirect("TextEmail.aspx?Name="+edit);
            }
        }
        DataTable myDt;
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
        if (!Page.IsPostBack)
        {
            myDt = new DataTable();
            myDt = CreateDataTable();
            Session["myDatatable"] = myDt;

            this.GridView1.DataSource = ((DataTable)Session["myDatatable"]).DefaultView;
            this.GridView1.DataBind();
        }

        string action = Request.QueryString["Name"];
        if (!Page.IsPostBack)
        {
            if (action !=null)
            {
                deletefile();
                showmessage();
               
            }
            else
               showmessage();  //call the GetFiles method
        }
      
        
    }
    public void showmessage()
    {
        string FilePath = Server.MapPath("~/email_content/" + "/");

       

            //DataRow dr = null;
            DirectoryInfo dir = new DirectoryInfo(FilePath);

            // Iterate through the datatable,
            // adding file to a new row, along with the  filesize to each row
            //String listing = "<table>";
         

            
        
         foreach (FileInfo fi in dir.GetFiles())
            {
                string fileMessage = showfile(fi.Name);
                //string text = Regex Regex.Replace(html, "<([A-Z][A-Z0-9]*)\b[^>]*>(.*?)</\\1>", string.Empty
                string flname= fi.Name;
                string fllength =Convert.ToString(fi.Length);
                string flCreateTime =Convert.ToString(fi.CreationTime);
                string dryname=fi.DirectoryName;
                AddDataToTable(flname, fllength, flCreateTime, fileMessage,(DataTable)Session["myDatatable"]);

               // listing = listing + "<tr><td>" + fi.Name + "</td><td>" + fileMessage + "</td><td><a href='MessageListing.aspx?action=delete&file=" + fi.Name + "'>Delete</a></td></tr>";
                
            }
            //listing = listing + "</table>";
            GridView1.DataSource = ((DataTable)Session["myDatatable"]).DefaultView;
            GridView1.DataBind();
            
            //lstmessage.Text = listing;

    }
    public string showfile(string filename)
    {
        string message =string.Empty;
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

    public void deletefile()
    {
        string filename = Request.QueryString["Name"];
        string strPath ;
        strPath = Request.PhysicalApplicationPath + "\\email_content\\" + filename;

        //DirectoryInfo dir = new DirectoryInfo(FilePath);
        FileInfo fi = new FileInfo(strPath);
        if (fi.Exists)
        {
            File.Delete(strPath);
           // btnshowimages_Click((Object)null, (EventArgs)null);
        }
        return;
    }

    private DataTable CreateDataTable()
    {
        
        DataTable dt = new DataTable();
        DataColumn dc;
        

        dc = new DataColumn();
        dc.DataType = Type.GetType("System.String");
        dc.ColumnName = "Name";
        dt.Columns.Add(dc);

        dc = new DataColumn();
        dc.DataType = Type.GetType("System.String");
        dc.ColumnName = "Length";
        dt.Columns.Add(dc);

        
        dc = new DataColumn();
        dc.DataType = Type.GetType("System.String");
        dc.ColumnName = "CreationTime";
        dt.Columns.Add(dc);

        dc = new DataColumn();
       
       // dc.DataType = Type.GetType("System.String");
        
        dc.ColumnName ="MessageContent";
        dt.Columns.Add(dc);


        return dt ;
    }

    private void AddDataToTable(string Name, string lng, string crtime, string msgcont, DataTable myTable)
    {
        DataRow row;
        
        row = myTable.NewRow();

        row["Name"] = Name;
        row["Length"] = lng;
        row["CreationTime"] =String.Format("{0:yyyy/M/d HH:mm:ss}", crtime);
        row["MessageContent"] = msgcont;

        myTable.Rows.Add(row);
       
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
       GridView1.PageIndex = e.NewPageIndex;
       this.GridView1.DataSource = ((DataTable)Session["myDatatable"]).DefaultView;
       GridView1.DataBind();
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {

    }
  

}
