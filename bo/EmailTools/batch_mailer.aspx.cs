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


public partial class   batch_mailer : System.Web.UI.Page
{
         public   batch_mailer()
			{   
			}	
			  protected void Page_Load(object sender, EventArgs e)
    			{
				CentraliseEmail cem = new CentraliseEmail();
				
				Response.Write(cem.SendMail());
			 }
    }

