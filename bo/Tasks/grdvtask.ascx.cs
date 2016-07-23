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
using System.Data.Odbc;
using System.Web.Configuration;

public partial class Task_grdvtask : System.Web.UI.UserControl
{
    public void setDS(DataView dv)
	{
	    GrdVTask.DataSource = dv;
        GrdVTask.DataBind();
	}  
    protected void GrdVTask_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GrdVTask.PageIndex = e.NewPageIndex;
        GrdVTask.DataBind();
    }
	
}
