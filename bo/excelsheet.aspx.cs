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
using System.Data.Odbc;
public partial class excelsheet : System.Web.UI.Page
{
    //string ID, Name, Address, EmailAddress, EmailContent;
    protected void Page_Load(object sender, EventArgs e)
    {

       // string connString = ConfigurationManager.ConnectionStrings["xls"].ConnectionString;
        //// Create the connection object
       // OleDbConnection oledbConn = new OleDbConnection(connString);
      OdbcConnection oledbConn = new OdbcConnection("DSN=exceldb");
        try
        {
            // Open connection
            oledbConn.Open();

            // Create OleDbCommand object and select data from worksheet Sheet1
            OdbcCommand cmd = new OdbcCommand("SELECT * FROM [ter$] where Address like 'M%'", oledbConn);
            
            // Create new OleDbDataAdapter
            OdbcDataAdapter oleda = new OdbcDataAdapter();

            oleda.SelectCommand = cmd;
            
            // Create a DataSet which will hold the data extracted from the worksheet.
           // DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            
            // Fill the DataSet from the data extracted from the worksheet.
            oleda.Fill(dt);
     /*      if(dt.Rows.Count>0)
           {
                ID = dt.Rows[0]["ID"].ToString(); //Where ColumnName is the Field from the DB that you want to display
                name= dt.Rows[0]["Name"].ToString();
                Address = dt.Rows[0]["Address"].ToString();
                EmailAddress = dt.Rows[0]["emailaddress"].ToString();
                if(EmailAddress!=null)
                {
                 if(EmailAddress==)
                }
                EmailContent = dt.Rows[0]["emailcontent"].ToString();
            }
       */
            DataView dv = new DataView(dt);
            dv.Sort = "emailcontents";
           // dv.Sort = "Name";
            
            // Bind the data to the GridView
            Grdexcel.DataSource = dv;
            Grdexcel.DataBind();
            // cmd = new OdbcCommand("delete FROM [ter$] where Address like 'M%'", oledbConn);
            // cmd.ExecuteNonQuery();
            //cmd.CommandType
        }
        catch(Exception ex)
        {
            Alert.Show("Sorry ! Currently,Unable To Send");
        }
        finally
        {
            // Close connection
            oledbConn.Close();
        }      

    }

    private DataTable CreateDataTable()
    {
        DataTable myDataTable = new DataTable();

        DataColumn myDataColumn;

        myDataColumn = new DataColumn();
        myDataColumn.DataType = Type.GetType("System.String");
        myDataColumn.ColumnName = "id";
        myDataTable.Columns.Add(myDataColumn);

        myDataColumn = new DataColumn();
        myDataColumn.DataType = Type.GetType("System.String");
        myDataColumn.ColumnName = "Name";
        myDataTable.Columns.Add(myDataColumn);

        myDataColumn = new DataColumn();
        myDataColumn.DataType = Type.GetType("System.String");
        myDataColumn.ColumnName = "Address";
        myDataTable.Columns.Add(myDataColumn);

        myDataColumn = new DataColumn();
        myDataColumn.DataType = Type.GetType("System.String");
        myDataColumn.ColumnName = "emailaddress";
        myDataTable.Columns.Add(myDataColumn);

        myDataColumn = new DataColumn();
        myDataColumn.DataType = Type.GetType("System.String");
        myDataColumn.ColumnName = "emailcontents";
        myDataTable.Columns.Add(myDataColumn);


        return myDataTable;
    } 

//      public  DataTable createstruc()
//         {
//           DataTable dtOriginal = new DataTable();
//           dtOriginal = ReturnTable(); //Return Table consisting data

//           //Create Tempory Table
//            DataTable dtTemp = new DataTable();

//           //Creating Header Row
//            dtTemp.Columns.Add("<b>ID</b>");
//            dtTemp.Columns.Add("<b>Name</b>");
//            dtTemp.Columns.Add("<b>Email Address</b>");
//            dtTemp.Columns.Add("<b>Email Content</b>");
            
//            DataRow drAddItem;
//            for (int i = 0; i < dtOriginal.Rows.Count; i++)
//           {
//            drAddItem = dtTemp.NewRow();
//            drAddItem[0] = dtOriginal.Rows[i][0].ToString();//Name
//            drAddItem[1] = dtOriginal.Rows[i][1].ToString();//Name
//            drAddItem[2] = dtOriginal.Rows[i][2].ToString();//Emai Address
//            drAddItem[3] = dtOriginal.Rows[i][3].ToString();//Email Content
//            dtOriginal[4]= dtOriginal.Rows[i][4].ToString();//update value
//           dtTemp.Rows.Add(drAddItem);
//           }

//          //Data bind to Gridview
//          Grdexcel.DataSource = dtTemp;
//          Grdexcel.DataBind();
          
          
//}
protected void  Grdexcel_RowUpdating(object sender, GridViewUpdateEventArgs e)
{

}
protected void  Grdexcel_RowUpdated(object sender, GridViewUpdatedEventArgs e)
{

}
protected void Button1_Click(object sender, EventArgs e)
{

    string[] strArray = new string[5] { "Delhi", "Mumbai", "Kolkata", "Chennai", "Chandigarh" };
    foreach (string str in strArray)
    {
       OdbcConnection oledbConn = new OdbcConnection("DSN=exceldb");
        try
        {
            // Open connection
            oledbConn.Open();

            // Create OleDbCommand object and select data from worksheet Sheet1
            OdbcCommand cmd = new OdbcCommand("SELECT * FROM [Details$]", oledbConn);
            //cmd.Parameters.AddWithValue("@city",str);where city=@city
            // Create new OleDbDataAdapter
            OdbcDataAdapter oleda = new OdbcDataAdapter();

            oleda.SelectCommand = cmd;

            // Create a DataSet which will hold the data extracted from the worksheet.
            // DataSet ds = new DataSet();
            DataTable dt = new DataTable();

            // Fill the DataSet from the data extracted from the worksheet.
            oleda.Fill(dt);
            /*      if(dt.Rows.Count>0)
                  {
                       ID = dt.Rows[0]["ID"].ToString(); //Where ColumnName is the Field from the DB that you want to display
                       name= dt.Rows[0]["Name"].ToString();
                       Address = dt.Rows[0]["Address"].ToString();
                       EmailAddress = dt.Rows[0]["emailaddress"].ToString();
                       if(EmailAddress!=null)
                       {
                        if(EmailAddress==)
                       }
                       EmailContent = dt.Rows[0]["emailcontent"].ToString();
                   }
              */
            DataView dv = new DataView(dt);
            // dv.Sort = "emailcontents";
            // dv.Sort = "Name";

            // Bind the data to the GridView
            Grdexcel.DataSource = dv;
            Grdexcel.DataBind();
            // cmd = new OdbcCommand("delete FROM [ter$] where Address like 'M%'", oledbConn);
            // cmd.ExecuteNonQuery();
            //cmd.CommandType
        }
        catch (Exception ex)
        {
            Alert.Show("Sorry");
        }
        finally
        {
            // Close connection
            oledbConn.Close();
        }
    }
}
}

