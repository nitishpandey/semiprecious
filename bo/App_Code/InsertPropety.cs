using System;
using System.Data;
using System.Configuration;

using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

using System.Data.SqlClient;
using System.Web.Configuration;

public class InsertPropety
{
    private string _PName;
    private int _PValue;
  
    public string PrName
    {
        get { return _PName; }
        set { _PName = value; }
    }

    public int PrValue
    {
        get { return _PValue; }
        set { _PValue = value; }
    }
    
    
    public void InsertPropeties(string pname,int pvalue)
	{
        string connectionstring = WebConfigurationManager.ConnectionStrings["sptmConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(connectionstring);
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "insert into Properties(PName,PValue) values(@PName,@PValue)";
        cmd.CommandType = CommandType.Text;
        cmd.Parameters.AddWithValue("@PName", PrName);
        cmd.Parameters.AddWithValue("@PValue",PrValue);
        try
        {
           cmd.Connection.Open();
            int result = cmd.ExecuteNonQuery();
            if (result > 0)
            {
                Alert.Show("Inserted successfully");
            }
            else
            {
                Alert.Show("Data are Not Inserted Successfully");
            }
        }
        catch (SqlException ee)
        {
            string message = ee.Message;
            Alert.Show(message);
        }
        catch (Exception ee)
        {
            string message = ee.Message;
            Alert.Show(message);
        }

        finally
        {
          cmd.Connection.Close();
        }
	}
}
