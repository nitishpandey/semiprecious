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
using System.Web.Configuration;

public partial class InsertMysql : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        selectemail();

    }
    public void selectemail()
    {
        OdbcConnection Conn = new OdbcConnection("DSN=citiesDB");
        string[] strArray = new string[] { "DELHI", "GZB.", "GRG.", "INDORE", "KANPUR", "MUMBAI -1", "MUMBAI-2", "NAVI MUMBAI", "Noida", "Pune" };
        int indiaemailid = 1;
        OdbcDataReader reader;
        OdbcCommand cmd = new OdbcCommand();
        int next_city = 0;
        foreach (string city in strArray)
        {

            cmd.CommandText = "select * from  [" + city + "$] ";

            Conn.Open();
            cmd.Connection = Conn;

            
            reader = cmd.ExecuteReader();

            if (reader.HasRows)
            {
               
                while (reader.Read())
                {
                    try
                    {
                        string emailaddress = (string)reader["Email"];
                        if (emailaddress != null)
                        {
                            //int sno=(int)reader["S.NO"];
                            string name = (string)reader["Name"];
                            string currentlocation = (string)reader["Current Location"];
                            // int emailsent=(int)reader["emailsent"];
                            inserttomysql(name, emailaddress, currentlocation);
                        }
                    }
                    catch (Exception a)
                    {
                        Alert.Show(city);
                        break;
                    }
                }
              
            //    GridView1.DataSource = reader;
            //    GridView1.DataBind();

           //     break;
            }
            Alert.Show(city);
            reader.Close();
            Conn.Close();
        }
     


    }
    public void inserttomysql(string Iname,string Imail,string Icurrentlocation)
    { 
     string ConString = "Driver={MySQL ODBC 5.1 Driver};Server=localhost;DATABASE=smtp;UID=root;PASSWORD=glspl123;port=3306;charset=UTF8";

      
      // // string ConString = "Driver={MySQL ODBC 5.1 Driver};" + "Server=209.200.117.22;" + "Database=Employees;" + "user id=nitish;" + "password=nitish;" + "Port=3306";
      //   OdbcConnection connection = new OdbcConnection("DSN=sptm");
        OdbcConnection connection = new OdbcConnection(ConString);
        OdbcCommand cmd=new OdbcCommand();
        cmd.CommandText = "insert into cities(name,email,currentlocation) values('" +Iname+ "','" +Imail+ "','" + Icurrentlocation+ "')";
        cmd.CommandType=CommandType.Text;
        cmd.Connection = connection;
       // cmd.Parameters.AddWithValue("@s_no",sno);
        //cmd.Parameters.AddWithValue("@name", Iname);
        //cmd.Parameters.AddWithValue("@email", Imail);
        //cmd.Parameters.AddWithValue("@currentlocation",Icurrentlocation);
       //cmd.Parameters.AddWithValue("@emailsent",Iemailsent);
       
        try
        {
           connection.Open();
            int result = cmd.ExecuteNonQuery();
            if (result > 0)
            {
               // Alert.Show(" Successfully updated ");
            }
        }
        catch(Exception ee)
        {
         //Alert.Show("exception");
        }
        finally
        {
         connection.Close();
        }
           
     }
}
