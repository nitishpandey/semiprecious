using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Net;
using System.IO;
using System.Text;
using System.Collections;
using System.Xml;
using System.Collections.Specialized;
using System.Text.RegularExpressions;
using System.Web.Caching;
using System.Web.SessionState;
using System.Web.Profile;

public class HttpWebReq
{
	
    //public void httpurl()
    //{
    //    string param1 = "value1";
    //    string param2 = "value2";
    //    ASCIIEncoding encoding = new ASCIIEncoding();
    //    string postData = string.Format("param1={0}&param2={1}", param1, param2);

        
        
    //    string strIcrawlURL = "http://www.semiprecious.com/tm-tm/test.cfm?cfid=" + action1 + "&cftoken=" + action2;
    //    string action1 = "27735292";// Request.QueryString["cfid"];
    //    string action2 = "25867808&CFAUTHORIZATION_wwwsemiprecious=cnBnb3N3YW1pDXJwZ29zd2FtaQ13d3dzZW1pcHJlY2lvdXM=";// Request.QueryString["cftoken"];

    //    if ((Request.QueryString["cfid"] != "") & (Request.QueryString["cftoken"] != ""))
    //    {
    //        string cfID = Request.QueryString["cfid"];
    //        string cfToken = Request.QueryString["cfToken"];
    //        Session["cfid"] = cfID;
    //        Session["cftoen"] = cfToken;

    //        WebRequest ObjWebRequest = null;
    //        WebResponse ObjWebResponse = null;
    //        Stream ObjReceiveStream = null;
    //        string strResponse = string.Empty;

    //        try
    //        {

    //            ObjWebRequest = WebRequest.Create(strIcrawlURL);
    //            Use the default credential for accessing the page
    //            ObjWebRequest.Credentials = System.Net.CredentialCache.DefaultCredentials;
    //            Send the 'WebRequest' and wait for response.
    //            ObjWebResponse = ObjWebRequest.GetResponse();
    //             Obtain a 'Stream' object associated with the response object.
    //            ObjReceiveStream = ObjWebResponse.GetResponseStream();
    //             Pipe the stream to a higher level stream reader with the required encoding format.
    //            StreamReader readStream = new StreamReader(ObjReceiveStream, System.Text.Encoding.GetEncoding("utf-8"));
    //            strResponse = readStream.ReadToEnd();

    //            readStream.Close();
    //             Release the resources of response object.
    //            ObjWebResponse.Close();
    //        }

    //        catch (Exception ex)
    //        {
    //             Do something here for exception raised if any

    //        }

    //        finally
    //        {

    //            ObjWebRequest = null;

    //            ObjWebResponse = null;

    //            ObjReceiveStream = null;

    //        }
    //    }
    //    else
    //    {
         
    //    }
        
    
    
}
