using System;
using System.Data;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;





public partial class   testing: System.Web.UI.Page
{
    private 	List<int> idlist; 
	public   testing()
			{   
			idlist = new List<int>();
			}	
    
	 protected void Page_Load(object sender, EventArgs e)
   			{
			  this.idlist.Add(1);
			  this.idlist.Add(2);
			  this.idlist.Add(4);
			    foreach(int k in idlist)
					Response.Write(k);
			 }
    
	}

