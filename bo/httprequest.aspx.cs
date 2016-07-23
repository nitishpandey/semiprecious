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
using System.IO;
using System.Net.Mail;
using System.Collections.Specialized;
using System.Net;
using System.Text;
using System.Xml;


public partial class httprequest : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        readfile();

       // string strIcrawlURL = "http://localhost:1776/myproject/experimentxml1.html";
       // WebRequest  ObjWebRequest = null;
       // WebResponse ObjWebResponse = null;
       // Stream ObjReceiveStream = null;
       // string strResponse = string.Empty;

       // try
       // {

       //     ObjWebRequest = WebRequest.Create(strIcrawlURL);
       //     // Use the default credential for accessing the page
       //   //  ObjWebRequest.Credentials = System.Net.CredentialCache.DefaultCredentials;
       //     // Send the 'WebRequest' and wait for response.
       //    // ObjWebResponse = ObjWebRequest.GetResponse();
       //     // Obtain a 'Stream' object associated with the response object.
       //   //  ObjReceiveStream = ObjWebResponse.GetResponseStream();
       //     // Pipe the stream to a higher level stream reader with the required encoding format.
       // //    StreamReader readStream = new StreamReader(ObjReceiveStream, System.Text.Encoding.GetEncoding("utf-8"));
       // //    strResponse = readStream.ReadToEnd();
       //      // Read xml file   
       //   //  XmlTextReader xtr = new XmlTextReader(ObjWebRequest);
       //    // XmlDocument k = new XmlDocument();
       //    // k.LoadXml(strResponse);
       //      XmlReader xr = XmlReader.Create(strIcrawlURL, null);
            
       //     XmlDocument k = new XmlDocument();
       //     k.Load(strIcrawlURL);
       //     k.Load(xr);
       //     xr.Read();
            
       // //    xr= xr.ReadContentAs(System.Type.GetType("System.String"),null);
       ////     Alert.Show(a);
       //   //  doc.LoadXml(strResponse);
       //     //doc.Load(Server.MapPath(strResponse));

       //    // XmlNode root = doc.DocumentElement;
       //     //Authorname.Text = root.SelectSingleNode("to").ChildNodes[0].Value;
       //     //Titel.Text = root.SelectSingleNode("from").ChildNodes[0].Value;
       //     //body.Text = root.SelectSingleNode("body").ChildNodes[0].Value;

       //     ////literal.Text = strResponse;
       //     //readStream.Close();
       //     ////// Release the resources of response object.
       //     //ObjWebResponse.Close();
       //  }

       // catch (Exception ex)
       // {
       //     // Do something here for exception raised if any

       // }

       // finally
       // {

       //     ObjWebRequest = null;

       //     ObjWebResponse = null;

       //     ObjReceiveStream = null;

       // }           

    }
public void readfile()
{

     string xmlFile = Request.PhysicalApplicationPath + "experimentxml1.html";  
         XmlReaderSettings settings = new XmlReaderSettings();  
         settings.IgnoreComments = true;  
         settings.IgnoreWhitespace = true;  
         try  
         {  
             using (XmlReader reader = XmlReader.Create(xmlFile, settings))  
             {  
                 string xmlContent;  
                 while (reader.Read())  
                 {  
                     if (reader.NodeType == XmlNodeType.Element)  
                     {  
                         xmlContent = "";  
                         if (reader.Name == "author")  
                         {  
                             xmlContent += "author: " + reader.ReadString().ToString() + "<br />";  
                         }  
                         if (reader.Name == "title")  
                         {  
                             xmlContent += "title: " + reader.ReadString().ToString() + "<br />";  
                         }  
                         if(reader.Name == "Book")  
                         {  
                             xmlContent += "Book: $" + reader.ReadString().ToString() + "<br />";  
                         }  
                         if(reader.Name == "Price")  
                         {  
                             xmlContent += "Price: " + reader.ReadString().ToString() + "<br />";  
                         }  
                        
                         literal.Text += xmlContent;  
                     }  
                 }  
             }  
         }  
         catch (Exception ex)  
         {  
             literal.Text = "An Error Occured: " + ex.Message;  
         }  
     }  
}
