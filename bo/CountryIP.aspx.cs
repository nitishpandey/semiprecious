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
using System.Data.Odbc;
using System.Web.Configuration;

public partial class CountryIP : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string ipaddress;
        long ipno;
        ipaddress = Request.QueryString["ipaddress"]; ;
        if (ipaddress != "")
        {
            // check if the IP address is supported in demo version
            ipno = IP2Decimal(ipaddress);
            OdbcDataReader reader;
            // select MS-SQL database using DSNless connection
            try
            {
                OdbcConnection sqlConn = new OdbcConnection("DSN=MYSQLdsn");
                // query string to lookup the country by matching the range of IP address number
                OdbcCommand sqlCmd = new OdbcCommand("SELECT countrySHORT,countryLONG FROM ipcountry WHERE " + ipno + " BETWEEN ipFROM AND ipTO", sqlConn);
                sqlCmd.Connection.Open();
                // execute the query
                reader = sqlCmd.ExecuteReader(System.Data.CommandBehavior.CloseConnection);
                // display results
                if (reader.Read())
                {
                    Response.Write(reader.GetString(1));
                }
                else
                {
                    //lblIPAddress.Text = "Not Found !!";
                    Response.Write("Not Found !!");
                }
                sqlCmd.Connection.Close();
            }
            catch(Exception ex)
            {
                string mess = ex.Message;
                //Label1.Text = mess;
            Response.Write("-1");
 
            }
        }
        else
        {
            //lblIPAddress.Text = "0";
            Response.Write("0");
        }
        }
     	// Convert dotted IP address into IP number in long
		private long IP2Decimal(String DottedIP)
		{
			string [] arrConvert;
			int i;
			long intResult=0;
			try
			{
				arrConvert = DottedIP.Split('.');
				for (i = arrConvert.Length - 1; i >= 0; i--)
				{
					intResult = intResult + ((long.Parse(arrConvert[i]) % 256) * long.Parse(Math.Pow(256, 3 - i).ToString()));
				}
				return intResult;
			}
			catch (Exception ex)
			{
                //lblIPAddress.Text = "Error :" + ex.Message;
                Response.Write(ex.Message);
				return 0;
			}
		}
    }

