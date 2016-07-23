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
using System.Net;
using System.Text;
using System.Xml;
using System.Management;
using System.Web.SessionState;

public  class cfsession
{
    static string cfid;
    static string cftoken;
    static string jsessionid;
    
    private static void getname()
    {
        try
        {
            HttpContext.Current.Session["Name"] = httpurl("/aspx/getname.cfm").Trim();

            return;
        }
        catch (Exception getnameex)
        {
            //do something
            return ;
        }
    }
    private static void getemail()
    {
        try
        {
           
           HttpContext.Current.Session["Email"]=httpurl("/aspx/getemail.cfm");
           
           return;
        }
        catch (Exception getnameex)
        {
            //do something
            return ;
        }
    }
    private static void getrole()
    {
        try 
        {
          HttpContext.Current.Session["role"]=httpurl("/aspx/getrole.cfm");
           
           return;
        }
        catch(Exception exgetrole)
        {
        
            return ;
        }
      
    }
   

    private static bool isadmin()
    {
        if (httpurl("/aspx/isadmin.cfm") == "1")
            return true;
        else
            return false;
    }

    public static void setsession()
    {

  
       if (isadmin())
       {
           HttpContext.Current.Session["admin"] = 1;
       }
       else
       {
           HttpContext.Current.Session["admin"] = 0;
       }
      getemail();
      getname();
      getrole();
    
    }
    private static string httpurl(string url)
    {
        
        HttpWebRequest ObjWebRequest = null;
        WebResponse ObjWebResponse = null;
        Stream ObjReceiveStream = null;
        string strResponse = string.Empty;
       
        
        // session and request for cfid and cftoken
        if((HttpContext.Current.Request["cfid"]!=null)& (HttpContext.Current.Request["cftoken"]!=null) & (HttpContext.Current.Request.Cookies["jsessionid"]!=null))
        {
         
          HttpContext.Current.Session["cfid"] = HttpContext.Current.Request["cfid"].Trim();
          HttpContext.Current.Session["cftoken"]=HttpContext.Current.Request["cftoken"].Trim();
          HttpContext.Current.Session["jsessionid"]=HttpContext.Current.Request["jsessionid"].Trim();
    //      Request.Cookies("UserSettings")("Font") IsNot Nothing
        }
        else
        {
         try
         {
           //  if ((HttpContext.Current.Session["cfid"].ToString() == null) || (HttpContext.Current.Session["cftoken"].ToString() == null))
            if ((HttpContext.Current.Session["JSESSIONID"].ToString() == null))
             {
                 return "";
             }
             else
             {
                 cfid = HttpContext.Current.Session["cfid"].ToString();
                 cftoken = HttpContext.Current.Session["cftoken"].ToString();     
                 jsessionid = HttpContext.Current.Session["jsessionid"].ToString();
                   
           
             }
        }
        catch(Exception ee)
         {
          //Alert.Show("Please log in first");
          HttpContext.Current.Response.Redirect("/tm-tm/login.cfm?v=0");
          //return "";
         }
            
       }
      
       
        try
        {
            string strIcrawlURL = "http://"+ HttpContext.Current.Request.Url.Host + url + "?cfid=" + cfid + "&cftoken=" + cftoken;
       
 Alert.Show(strIcrawlURL);
            ObjWebRequest = (HttpWebRequest)WebRequest.Create(strIcrawlURL);
            ObjWebRequest.Credentials = System.Net.CredentialCache.DefaultCredentials;
             ObjWebRequest.CookieContainer = new CookieContainer();
             System.Net.Cookie cookie = new System.Net.Cookie("JSESSIONID", jsessionid, "/", HttpContext.Current.Request.Url.Host);
               ObjWebRequest.CookieContainer.Add(cookie);
              cookie = new System.Net.Cookie("CFID", cfid, "/", HttpContext.Current.Request.Url.Host);
              ObjWebRequest.CookieContainer.Add(cookie);
              cookie = new System.Net.Cookie("CFTOKEN", cftoken, "/", HttpContext.Current.Request.Url.Host);
              ObjWebRequest.CookieContainer.Add(cookie);
            ObjWebResponse = ObjWebRequest.GetResponse();
            ObjReceiveStream = ObjWebResponse.GetResponseStream();
            // Pipe the stream to a higher level stream reader with the required encoding format.
            StreamReader readStream = new StreamReader(ObjReceiveStream, System.Text.Encoding.GetEncoding("utf-8"));
            strResponse = readStream.ReadToEnd();
            readStream.Close();
            // Release the resources of response object.
            ObjWebResponse.Close();
            return strResponse.Trim();

         }

        catch (Exception ex)
        {
           //throw (ex);
       //     Alert.Show("Server time out. Please try again .");
			return ex.Message;
        }

        finally
        {

            ObjWebRequest = null;

            ObjWebResponse = null;

            ObjReceiveStream = null;

        }
    }
}
