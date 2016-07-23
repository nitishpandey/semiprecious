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

using System.Web.Configuration;
using System.IO;
using System.Text;

public partial class viewmail : System.Web.UI.Page
{
    string strfilecontent;
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            cfsession.setsession();

            if (Session["Name"].ToString() == string.Empty)
            {
                Response.Redirect("/tm-tm/login.cfm");
            }

            if (Session["admin"].Equals("0"))
            {
                Response.Redirect("/tm-tm/login.cfm");
            }

        }
        catch (Exception ee)
        {
            Response.Redirect("/tm-tm/login.cfm");
        }
        Label5.Text = Session["Name"].ToString();
        string filename = Request.QueryString["file"];
        //Label1.Text ="File Name :" + filename;
        string file = Server.MapPath("~/indaiemail/" + filename);
        showemailcontent(file);
    }

    public void showemailcontent(string filename)
    {
        try
        {
            TextReader tr = new StreamReader(filename);
            // read a line of text
            strfilecontent = tr.ReadToEnd();
            Literal1.Text = strfilecontent;
            // close the stream
            tr.Close();

        }
        catch (Exception e)
        {
            Alert.Show("Error to read file");
        }

    }
}
