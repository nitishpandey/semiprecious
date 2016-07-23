using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Xml.Linq;


public  class spmresult
{
    private int _success;
    private string _message;
    public int success
    {
        get { return _success;}
          set {_success = success ;}
        }

    public string message
    {
        get { return _message;}
          set {_message = message ;}
    }

     public spmresult()
	{
        this.success = 0;
        this.message = "No message";
		
	}
     public spmresult(int i, string m)
     {
         this.success = i;
         this.message = m;

     }
}
