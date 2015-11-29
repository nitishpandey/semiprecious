using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.IO;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Web.Configuration;

public class GiftCertificate
{
    string _ConnectionString;
    //DateTime dt1 = DateTime.Now;
    string couponcrtime = String.Format("{0:yyyy/M/d HH:mm:ss}", DateTime.Now);
    string cpnstatus;
    
    public string Creategiftcode(string couponco,int couponval,string rem)
    {
        string message=string.Empty;
        SqlConnection con = new SqlConnection(_ConnectionString);
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "insert into certificatecode(CouponCode,ValueUSD,Dateissued,remark) values(@CouponCode,@ValueUSD,@Dateissued,@remark)";
        cmd.CommandType = CommandType.Text;

        /* Passing parameters for L
         * ot Information*/
        cmd.Parameters.AddWithValue("@CouponCode", couponco);
        cmd.Parameters.AddWithValue("@ValueUSD", couponval);
        cmd.Parameters.AddWithValue("@Dateissued", couponcrtime);
		rem = HttpContext.Current.Session["Name"] + ":"+rem;
         cmd.Parameters.AddWithValue("@remark", rem);
        //  cmd.Parameters.AddWithValue("@DateUsed", "");
        
        try
        {

            cmd.Connection.Open();
            int result = cmd.ExecuteNonQuery();
            if (result > 0)
            {
                 message = "Successfully inserted.";
               
            }

        }
        catch (SqlException ex)
        {
            message = "Sql Error :" + ex.Message;
           
        }
        finally
        {
            cmd.Connection.Close();
           
        }
        return message;
    }

    public string Giftcodecheck(string couponcode)
    {
        string cpncode,dateissued,dateused,status;
        string couponamount;
        
        SqlConnection con = new SqlConnection(_ConnectionString);
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "select CouponCode,ValueUSD,Dateissued,DateUsed from certificatecode where CouponCode=@CouponCode";
        cmd.CommandType = CommandType.Text;
        cmd.Parameters.AddWithValue("@CouponCode",couponcode);
        SqlDataReader reader;
        try
        {
            cmd.Connection.Open();
            reader = cmd.ExecuteReader();
            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    
                    dateissued = reader["Dateissued"].ToString();
                    dateused = reader["DateUsed"].ToString();
                    if (dateused == "")
                    {
                        status = "Unused";
                    }
                    else
                    {
                        status = "Used";
                    }
                    cpnstatus = status + "," + reader["ValueUSD"].ToString(); 
                }
            }
            else
            {
                 cpnstatus = "invalid";
            }
        }
        catch (Exception ex)
        {
             cpnstatus = ex.Message;
        }
        finally
        {
            cmd.Connection.Close();
        }
        return cpnstatus;
    }
    public string UseGiftcode(string couponcode,int cartid)
    {
        string message=string.Empty;
        SqlConnection con = new SqlConnection(_ConnectionString);
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "update certificatecode set cartid=@cartid, DateUsed=@DateUsed where CouponCode=@CouponCode";
        cmd.CommandType = CommandType.Text;
       
        /* Passing parameters for L
         * ot Information*/
        cmd.Parameters.AddWithValue("@cartid", cartid);
        cmd.Parameters.AddWithValue("@CouponCode", couponcode);
        cmd.Parameters.AddWithValue("@DateUsed", couponcrtime);
        //  cmd.Parameters.AddWithValue("@DateUsed", "");
        
        try
        {
            cmd.Connection.Open();
            int result = cmd.ExecuteNonQuery();
            if (result > 0)
            {
                message = "Successfully";
               
            }

        }
        catch (SqlException ex)
        {
             message = "Sql Error :" + ex.Message;
            
        }
        finally
        {
            cmd.Connection.Close();
           
        }
        return message;
    }

    public SqlDataReader GetGiftcodes(string status)
    {
        SqlConnection con = new SqlConnection(_ConnectionString);
        SqlCommand cmd = new SqlCommand();
        SqlDataReader reader;
        cmd.Connection = con;
    if(status=="All")
    {
       
        cmd.CommandText = "select CouponCode,ValueUSD,Dateissued,DateUsed from giftcertifcate";
        cmd.CommandType = CommandType.Text;
    }
    if (status == "unused")
    {
        cmd.CommandText = "select CouponCode,ValueUSD,Dateissued,DateUsed from giftcertifcate where DateUsed is  null";
        cmd.CommandType = CommandType.Text;
    }
    if(status=="unused")
    {
        cmd.CommandText = "select CouponCode,ValueUSD,Dateissued,DateUsed from giftcertifcate where DateUsed is  null";
        cmd.CommandType = CommandType.Text;

    }
    
       con.Open();
       return cmd.ExecuteReader(CommandBehavior.CloseConnection);
     
   
  }

    public GiftCertificate()
    {
        _ConnectionString = WebConfigurationManager.ConnectionStrings["SqlConnectionString"].ConnectionString;
    }

}
public class coupon
{ 
    private string _couponcode;
    private int _couponvalue;
    private DateTime _issueddate;
    private DateTime _useddate;
   
    public string couponcode
    {
        get{return _couponcode;}
        set { _couponcode = value; }
    }
    public int couponvalue
    {
        get { return _couponvalue; }
        set { _couponvalue = value; }
    }
    public DateTime couponissueddate
    {
        get { return _issueddate; }
        set { _issueddate = value; }
    }
    public DateTime couponusedate
    {
        get { return _useddate; }
        set { _useddate = value; }
    }
}
