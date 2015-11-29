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

/// <summary>
/// Summary description for CityInformation
/// </summary>
public class CityInformation
{
    private int s_no;
    private string _Name;
    private string _email;
    private string _currentlocation;

	public int S_No
	{
        get { return s_no; }
        set { s_no = value; }
	}

    public string Name
    {
        get { return _Name; }
        set { _Name = value; }
    }

    public string Email
    {
        get { return _email; }
        set { _email = value; }
    }

    public string CurrentLocation
    {
        get { return _currentlocation; }
        set { _currentlocation = value; }
    }
}
