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


public partial class Giftcoupon_coupon : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        GiftCertificate objgft = new GiftCertificate();
        string message = "initialised";
        try{
            string couponcode = Request.QueryString["couponcode"];
            string action = Request.QueryString["action"];
      
        switch (action)
        {
            case ("checks"):
                          message = objgft.Giftcodecheck(couponcode);
                     break;
            case ("usecoupon"):
                int cartid = int.Parse(Request.QueryString["cartid"]);
                message = objgft.UseGiftcode(couponcode, cartid);
         
                break;
            default:
                message = "There is no such actions";
                break;
        }
       
        }
        catch(Exception couponex)
        {
            message = couponex.Message;
       }
        Response.Write(message);
     

    }
}
