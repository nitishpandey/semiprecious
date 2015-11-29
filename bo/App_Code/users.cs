using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Data.Odbc;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.IO;
using System.Text;


public class User_
{
   static string connectionstring = WebConfigurationManager.ConnectionStrings["OdbcConnectionString"].ConnectionString;
   
    public static string getEmailId(string apptt)
    {
        
		OdbcConnection connection = new OdbcConnection(connectionstring);
                OdbcCommand cmd = new OdbcCommand();
                cmd.CommandText = "select emailaddress as uem from users where apptt = ?";
                cmd.CommandType = CommandType.Text;
                cmd.Connection = connection;
                // Parameters Pass
         	   cmd.Parameters.AddWithValue("@apptt", apptt);
                OdbcDataReader reader;
       			 connection.Open();
           		reader = cmd.ExecuteReader();
         if (reader.HasRows)
				return (string)reader["uem"];
			else
			 return "";
		}
}


