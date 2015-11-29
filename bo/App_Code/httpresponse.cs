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

public class httpresponse
{
	public httpresponse()
	{
	}
    [STAThread]

    static void Main(string[] args)
    {
        string param1 = "value1";
        string param2 = "value2";
        
        ASCIIEncoding encoding = new ASCIIEncoding();
        string postData = string.Format("param1={0}&param2={1}", param1, param2);
        byte[] buffer = encoding.GetBytes(postData);

        // Prepare web request...
        HttpWebRequest myRequest =(HttpWebRequest)WebRequest.Create("http://");
                
        // We use POST ( we can also use GET )
        myRequest.Method = "POST";

        // Set the content type to a FORM
        myRequest.ContentType = "application/x-www-form-urlencoded";

        // Get length of content
        myRequest.ContentLength = buffer.Length;

        // Get request stream
        Stream newStream = myRequest.GetRequestStream();

         // Send the data.
         newStream.Write(buffer, 0, buffer.Length);

        // Close stream
        newStream.Close();

        // Assign the response object of 'HttpWebRequest' to a 'HttpWebResponse' variable.
        HttpWebResponse myHttpWebResponse = (HttpWebResponse)myRequest.GetResponse();

        // Display the contents of the page to the console.
        Stream streamResponse = myHttpWebResponse.GetResponseStream();
        // Get stream object
        StreamReader streamRead = new StreamReader(streamResponse);
        Char[] readBuffer = new Char[256];

        // Read from buffer
        int count = streamRead.Read(readBuffer, 0, 256);
        while (count > 0)
        {
            // get string
            String resultData = new String(readBuffer, 0, count);
            // Write the data
            Console.WriteLine(resultData);
            // Read from buffer
            count = streamRead.Read(readBuffer, 0, 256);

         }
        // Release the response object resources.
        streamRead.Close();
        streamResponse.Close();
        // Close response
        myHttpWebResponse.Close();
    }
}
