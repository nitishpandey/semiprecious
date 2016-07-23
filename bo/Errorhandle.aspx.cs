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
using System.Diagnostics;

public partial class Errorhandle : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            int i  = 1;
            int j = 0;
            int k=(i/j);
            throw new Exception("Sample Exception");
        }
        catch (Exception ex)
        {
            // Log the error to a text file in the Error folder
            ErrHandler.WriteError(ex.Message);
        }
    }
}
