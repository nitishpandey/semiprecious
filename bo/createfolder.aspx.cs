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
using System.IO;
using System.Text;
public partial class createfolder : System.Web.UI.Page
{
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
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string pathToCreate = "~/centergraphics/" + Txtfoldername.Text;
        try
        {

            //Server.CreateObject("Scripting.FileSystemObject");
            if (Directory.Exists(Server.MapPath(pathToCreate)))
            {
                //In here, start looping and modify the path to create to add a number
                //until you get the value needed
                Lblerrormessage.Text = "Folder exists ! Please try .....";
            }
            else
            {
                //Now you know it is ok, create it
                Directory.CreateDirectory(Server.MapPath(pathToCreate));
                Lblerrormessage.Text = "Created folder successfully";
            }
           
        }
        catch (Exception ee)
        {
            Lblerrormessage.Text = "Error:" + ee;
        }
        Txtfoldername.Text = string.Empty;
    }
}
