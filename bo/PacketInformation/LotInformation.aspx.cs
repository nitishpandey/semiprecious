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
using System.Data.SqlClient;
using System.Web.Configuration;

public partial class PacketInformation_LotInformation : System.Web.UI.Page
{
    string ConnectionStrig = WebConfigurationManager.ConnectionStrings["SqlConnectionString"].ConnectionString;
    string GlobalCurrentTime;
    string updateby;
    string totaladdedweight;
    string totaladdedquanity;
    string totaladdedvalue;
    string totalvalue;
    string totalweight;
    string totalquality;
    string status;
    string lotid;
    string strPostedFileName = string.Empty;
    string suppliername = string.Empty;
    string InvoiceNo;
    string Remarks;
    string finalname = string.Empty;
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Request.IsLocal)
        {
            updateby = "localuser";
        }
        else
        {
            try
            {
                cfsession.setsession();
                if (Session["Name"].ToString() == string.Empty)
                {
                    Response.Redirect("/tm-tm/login.cfm");
                }
                //check admin
                if (Session["admin"].Equals("0"))
                {
                    Response.Redirect("/tm-tm/login.cfm");
                }
                updateby = Session["Name"].ToString();
            }
            catch (Exception ee)
            {
                Response.Redirect("/tm-tm/login.cfm?error=" + ee.Message);
            }
        }

        if (! Page.IsPostBack)
       {
            //supplier name
            LotSuppliername();

            // lots status
            LotsStatus();
       }
        Txtquantity.Enabled = false;
        Txtquantity.Visible = false;
        Txtweight.Enabled = false;
        Txtweight.Visible = false;
        TxtAmount.Enabled = false;
        TxtAmount.Visible = false;
        Label17.Visible = false;
        Label15.Visible = false;
        Label16.Visible = false;
        Label18.Visible = false;
        DrplStatus.Enabled = false;
        

        lotid =Request.QueryString["lotid"];
        if(lotid!=null)
        {
            if (lotid != "")
            {
                LotInfoID(Convert.ToInt32(lotid));

                Txtquantity.Visible = true;
                Txtweight.Visible = true;
                TxtAmount.Visible = true;
                Label17.Visible = true;
                Label15.Visible = true;
                Label16.Visible = true;
                Label18.Visible = true;
            }
        }
       

        // current time 
        DateTime dt = DateTime.Now;
        GlobalCurrentTime = String.Format("{0:yyyy/M/d HH:mm:ss}", dt);
        Txtcurrentdate.Text = GlobalCurrentTime;
        Txtcurrentdate.Enabled = false;

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
       if(DrplStatus.SelectedItem.Text == "Complete")
       {
           string errormessage = string.Empty;
           if ((TxtTotalWeight.Text == totalweight) & (Txttotalamount.Text == totalvalue) & (txttotalquantity.Text == totalquality))
           {
               SqlConnection con = new SqlConnection(ConnectionStrig);
               SqlCommand cmd = new SqlCommand();
               cmd.Connection = con;
               cmd.CommandText = "update LotInfo set totalvalue=totalvalue,totalweight=totalweight,totalquantity=totalquantity,status=@status where lotid=@lotid";
               cmd.CommandType = CommandType.Text;

               cmd.Parameters.AddWithValue("@lotid", lotid);
               cmd.Parameters.AddWithValue("@totalvalue", float.Parse(Txttotalamount.Text.Trim()));
               cmd.Parameters.AddWithValue("@totalweight", float.Parse(TxtTotalWeight.Text.Trim()));
               cmd.Parameters.AddWithValue("@totalquantity", int.Parse(txttotalquantity.Text.Trim()));
               cmd.Parameters.AddWithValue("@status", DrplStatus.SelectedItem.Text);

               try
               {
                   cmd.Connection.Open();
                   int result = cmd.ExecuteNonQuery();
                   if (result > 0)
                   {
                       string message = "Successfully updated and completed your lot information.";
                       Lbllotsstatus.Text = message;
                   }

               }
               catch (SqlException ex)
               {
                   string message = "Sql Error :" + ex.Message;
                   Lbllotsstatus.Text = message;

               }
               finally
               {
                   cmd.Connection.Close();
               }
           }
           else
           {
               Lbllotsstatus.Text = "Weight or Quantity or Value is not equal.Please make sure these are equal. ";
           
           }
          
       }
       else if (DrplStatus.SelectedItem.Text == "Inprogress")
       {
               SqlConnection con = new SqlConnection(ConnectionStrig);
               SqlCommand cmd = new SqlCommand();
               cmd.Connection = con;
               cmd.CommandText = "update LotInfo set totalvalue=totalvalue,totalweight=totalweight,totalquantity=totalquantity where lotid=@lotid";
               cmd.CommandType = CommandType.Text;

               cmd.Parameters.AddWithValue("@lotid", lotid);
               cmd.Parameters.AddWithValue("@totalvalue", float.Parse(Txttotalamount.Text.Trim()));
               cmd.Parameters.AddWithValue("@totalweight", float.Parse(TxtTotalWeight.Text.Trim()));
               cmd.Parameters.AddWithValue("@totalquantity", int.Parse(txttotalquantity.Text.Trim()));
              
               try
               {
                   cmd.Connection.Open();
                   int result = cmd.ExecuteNonQuery();
                   if (result > 0)
                   {
                       string message = "Successfully updated";
                       Lbllotsstatus.Text = message;
                   }

               }
               catch (SqlException ex)
               {
                   string message = "Sql Error :" + ex.Message;
                   Lbllotsstatus.Text=message;

               }
               finally
               {
                   cmd.Connection.Close();
               }      
       }
       else
       {
           if (DrplSupplierName.SelectedItem.Text != "Select Supplier Code")
           {
              

                   SqlConnection con = new SqlConnection(ConnectionStrig);
                   SqlCommand cmd = new SqlCommand();
                   cmd.Connection = con;
                   cmd.CommandText = "insert into LotInfo(Apptt,totalquantity,totalweight,totalvalue,status,lotdate,updatedby,InvoiceNo) values(@Apptt,@totalquantity,@totalweight,@totalvalue,@status,@lotdate,@updatedby,@InvoiceNo)";
                   cmd.CommandType = CommandType.Text;

                   cmd.Parameters.AddWithValue("@Apptt", DrplSupplierName.SelectedItem.Text.Trim());
                   cmd.Parameters.AddWithValue("@totalquantity", int.Parse(txttotalquantity.Text.Trim()));
                   cmd.Parameters.AddWithValue("@totalweight", float.Parse(TxtTotalWeight.Text.Trim()));
                   cmd.Parameters.AddWithValue("@totalvalue", float.Parse(Txttotalamount.Text.Trim()));
                   cmd.Parameters.AddWithValue("@status", "Inprogress");
                   cmd.Parameters.AddWithValue("@lotdate", GlobalCurrentTime);
                   cmd.Parameters.AddWithValue("@updatedby", updateby);
                   cmd.Parameters.AddWithValue("@InvoiceNo", TxtInvoiceNumber.Text.Trim());
                 
                   try
                   {
                       cmd.Connection.Open();
                       int result = cmd.ExecuteNonQuery();
                       if (result > 0)
                       {
                           string message = "Successfully inserted.";
                           Lbllotsstatus.Text = message;
                       }
                       else
                       {
                           string message = "Failed to Insert.";
                           Lbllotsstatus.Text = message;
                       }
                       /********************************* Read lotID from lotinfo ****************************************/

                      
                       cmd.CommandText = "select lotid from LotInfo where lotdate='"+GlobalCurrentTime+"'";
                       cmd.CommandType = CommandType.Text;
                       
                       SqlDataReader rder;
                       try
                       {
                           rder = cmd.ExecuteReader();
                           if (rder.HasRows)
                           {
                               while (rder.Read())
                               {
                                   lotid = rder["lotid"].ToString();

                               }
                           }
                           rder.Close();
                       }
                       catch(Exception ex)
                       {
                           Lbllotsstatus.Text = ex.Message;
                       }

                      
                       /*********************************end of reading ***************************************/

                       /*************************************update lotinfo table with filename*******************************************/
                       if (FileUpload1.HasFile)
                       {
                           //lot file uploaded
                           string flname = lotfileupload(lotid);
                           cmd.CommandText = "update lotinfo set filename=@filename where lotid=" + Convert.ToUInt32(lotid) + "";
                           cmd.CommandType = CommandType.Text;

                           cmd.Parameters.AddWithValue("@filename", flname);
                           try
                           {
                               int reslut= cmd.ExecuteNonQuery();
                               if (reslut > 0)
                               {
                                   string errormessage = "FIle name is updated successfully.";
                               }
                               else
                               {
                                   string errormessage = "FIle name is not updated ";
                               }
                           }
                           catch(Exception ex)
                           {
                               string errormessage = ex.Message;
                           }
                       }
                       
                       /*************************************End of lotinfo*******************************************/

                 
                   }
                   catch (SqlException ex)
                   {
                       string message = "Sql Error :" + ex.Message;
                       Lbllotsstatus.Text = message;

                   }
                   finally
                   {
                       cmd.Connection.Close();
                   }
               }
             
           
           else
           {
               Lbllotsstatus.Text = "Please select supplier Code";
           }
       }
    }
    public void LotSuppliername()
    {
        SqlConnection con = new SqlConnection(ConnectionStrig);
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "select Apptt from users where usertype='supplier '";
        cmd.CommandType = CommandType.Text;
        SqlDataAdapter ada = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        ada.Fill(dt);
        DrplSupplierName.DataTextField = "Apptt";
        DrplSupplierName.DataValueField = "Apptt";
        DrplSupplierName.DataSource = dt;
        DrplSupplierName.DataBind();
        //DrplSupplierName.Items.Insert(0, new ListItem("Select Supplier"));
    }


    protected void Button2_Click(object sender, EventArgs e)
    {
        Txttotalamount.Text = "";
        txttotalquantity.Text = "";
        TxtTotalWeight.Text = "";
        Lbllotsstatus.Text = "";
    }
   public void LotsStatus()
   {
      
      ArrayList objlotsstatus = new ArrayList();
     
      objlotsstatus.Add("Inprogress");
      objlotsstatus.Add("Complete");
      DrplStatus.DataSource = objlotsstatus;
      DrplStatus.DataBind();
    }
  
   public void LotInfoID(int lotinfoid)
   {
    
           SqlConnection con = new SqlConnection(ConnectionStrig);
           SqlCommand cmd = new SqlCommand();
           cmd.Connection = con;
           cmd.CommandText = "select Apptt,totalvalue,totalweight,totalquantity,status,totalAddedWeight,totalAddedUantity,totalAddedValue,InvoiceNo,Remarks from  LotInfo where lotid=@lotid";
           cmd.CommandType = CommandType.Text;
           cmd.Parameters.AddWithValue("@lotid", lotinfoid);
           SqlDataReader dr;
           try
           {
               cmd.Connection.Open();
               dr = cmd.ExecuteReader();
               if (dr.HasRows)
               {
                   while (dr.Read())
                   {
                       suppliername = dr["Apptt"].ToString();
                       totalvalue = dr["totalvalue"].ToString();
                       totalweight = dr["totalweight"].ToString();
                       totalquality = dr["totalquantity"].ToString();
                       totaladdedweight = dr["totalAddedWeight"].ToString();
                       totaladdedquanity = dr["totalAddedUantity"].ToString();
                       totaladdedvalue = dr["totalAddedValue"].ToString();
                       status = dr["status"].ToString();
                       InvoiceNo = dr["InvoiceNo"].ToString();
                       Remarks = dr["Remarks"].ToString();
                     
                       if (status == "Complete")
                       {
                           DrplSupplierName.SelectedItem.Text = suppliername;
                           DrplSupplierName.Enabled = false;
                           Txtweight.Text = totaladdedweight;
                           Txtweight.Enabled = false;
                           Txtquantity.Text = totaladdedquanity;
                           Txtquantity.Enabled = false;
                           TxtAmount.Text = totaladdedvalue;
                           TxtAmount.Enabled = false;
                           txttotalquantity.Text = totalquality;
                           txttotalquantity.Enabled = false;
                           Txttotalamount.Text = totalvalue;
                           Txttotalamount.Enabled = false;
                           TxtTotalWeight.Text = totalweight;
                           TxtTotalWeight.Enabled = false;
                           TxtInvoiceNumber.Text = InvoiceNo;
                           TxtInvoiceNumber.Enabled = false;
                           DrplStatus.SelectedItem.Text = status;
                           DrplStatus.Enabled = false;
                       }
                       else
                       {
                           Txtweight.Text = totaladdedweight;
                           Txtquantity.Text = totaladdedquanity;
                           TxtAmount.Text = totaladdedvalue;
                           TxtInvoiceNumber.Text = InvoiceNo;
                           DrplStatus.SelectedItem.Text = status;
                           DrplStatus.Enabled = true;
                           DrplSupplierName.SelectedItem.Text = suppliername;

                           txttotalquantity.Text = totalquality;
                           Txtweight.Enabled = false;
                           Txttotalamount.Text = totalvalue;
                           Txtquantity.Enabled = false;
                           TxtTotalWeight.Text = totalweight;
                           Txtquantity.Enabled = false;
                       }
                   }
               }
               else
               {
                   string strrows = "There is no such items";
                   Lbllotsstatus.Text = strrows;
               }

           }
           catch (Exception ex)
           {
               string errormessage = "Errors :" + ex.Message;
               Lbllotsstatus.Text = errormessage;
           }
           finally
           {
            cmd.Connection.Close();
           }
      
   }

   public string lotfileupload( string lot_ID)
   {
       string finalname = string.Empty;
       int UploadFileLength = FileUpload1.PostedFile.ContentLength;
       strPostedFileName = FileUpload1.PostedFile.FileName;

           try
           {
               if (strPostedFileName != string.Empty)
               {
                   string strExtn = System.IO.Path.GetExtension(strPostedFileName).ToLower();

                   if ((strExtn == ".xls") || (strExtn == ".doc") || (strExtn == ".docx") || (strExtn == ".pdf") || (strExtn == ".txt"))
                   {
                       if (UploadFileLength <= 2000)
                       {
                            finalname = lot_ID + "_" + strPostedFileName;
                           FileUpload1.SaveAs(Server.MapPath("~/LotImage/") + finalname);
                           Lbllotsstatus.Text = "Upload status: File uploaded ";
                           Alert.Show("upload successfully");
                       }
                       else
                           Lbllotsstatus.Text = " file size exceeds the limit of 2000 kb.";

                   }
                   else
                       Lbllotsstatus.Text = " Upload Only xls or doc or docx or pdf files are accepted!";
               }

           }
           catch (Exception ex)
           {
               Lbllotsstatus.Text = "Upload status: The file could not be uploaded. The following error occured: " + ex.Message;
           }
           return finalname;
           
       }
   
   }
  

