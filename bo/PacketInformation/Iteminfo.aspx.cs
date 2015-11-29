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
using System.IO;

public partial class Packetinfo : System.Web.UI.Page
{
    string WebConnectionStrig = WebConfigurationManager.ConnectionStrings["SqlConnectionString"].ConnectionString;

    string GlobalCurrentTime;
    int ItemID;
    int NewItemID;
    int CRItems;
    string CrItemID;
    string supplier_code;
    string updateby;
    string actualcolor = "";
    protected void Page_Load(object sender, EventArgs e)
    {
      
        if (Request.IsLocal)
        {
             updateby = "localuser" ;
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
       
        
        if (!Page.IsPostBack)
        {
            category();// This is for category dropdownlist
            lotNo();//this is for lot id dropdownlist
            StoneCategory();//this is for stone dropdwonlist
            Stone2();//this is for stone2
            Stone3(); //This is for Stone3
            Shape(); //This is for Shape
            UserLocation();//THIS IS FOR LOCATION
        }
            // current time 

        DateTime dt = DateTime.Now;
        GlobalCurrentTime = String.Format("{0:yyyy/M/d HH:mm:ss}", dt);

        DrplStones.Enabled = true;
        Drpstone2.Enabled = false;
        DrplStone3.Enabled = false;

    }
    protected void BtnSubmit_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(WebConnectionStrig);
        SqlCommand cmd = new SqlCommand();
        String handle = "";
       
        String errMsg = "";
        Boolean errFlag = false;
        cmd.Connection = con;
        
        /* ******************* Create New Items ID************************ */
        cmd.CommandText = "select max(newitem) as nwitems from items ";
        cmd.CommandType = CommandType.Text;
        cmd.Connection.Open();
        SqlDataReader rder;
        rder = cmd.ExecuteReader();

        while (rder.Read())
            {
                CrItemID = rder["nwitems"].ToString();
                 NewItemID = Convert.ToInt32(CrItemID) + 1;
            }

        rder.Close();
        
        
        /* ******************* End of NewItemID ************************* */



        cmd.CommandText = "insert into items(newitem,cat,weight,size,basecost,price,saleprice,wholesaleprice,color,STYLE,subcat,subcat2,subcat3,faceted,shape,storage,inventory) values(@newitem,@cat,@weight,@size,@basecost,@price,@saleprice,@wholesaleprice,@color,@STYLE,@subcat,@subcat2,@subcat3,@faceted,@shape,@storage,@inventory)";
        cmd.CommandType = CommandType.Text;
        // Passing parameters

        cmd.Parameters.AddWithValue("@newitem", NewItemID);
        cmd.Parameters.AddWithValue("@cat", DrplCategory.SelectedItem.Text.Trim());

        cmd.Parameters.AddWithValue("@weight", float.Parse(TxtWeight.Text.Trim()));
        if (TxtSize.Text != "")
        {
            cmd.Parameters.AddWithValue("@size", TxtSize.Text.Trim());
        }
        else
        {
            cmd.Parameters.AddWithValue("@size", "");
        }
        float basecost = float.Parse(TxtCost.Text.Trim()) / float.Parse(TxtQuantity.Text.Trim());
        cmd.Parameters.AddWithValue("@basecost", basecost);

        float price = (basecost / 8);
        cmd.Parameters.AddWithValue("@price", price);

        float saleprice = (basecost / 10);
        cmd.Parameters.AddWithValue("@saleprice",saleprice);

        float wholeprice = (basecost / 12);
        cmd.Parameters.AddWithValue("@wholesaleprice", wholeprice);

        if (DrplColor1.SelectedItem.Text != "Select Color1")
        {
            handle = Session["Name"] + (actualcolor = DrplColor1.SelectedItem.Text.Trim());
            cmd.Parameters.AddWithValue("@color", handle);
            
        }
        else
        {
            errFlag = true;
            errMsg = "Please select color...";

        }


         if (RblSilver.Text == "Yes")
        {
            cmd.Parameters.AddWithValue("@style", "Silver Setting");
        }
        else if (RblSilver.Text == "No")
        {
            cmd.Parameters.AddWithValue("@style", "Beaded");
        }
        else
        {
            cmd.Parameters.AddWithValue("@style", "");
        }

        if ((DrplStones.SelectedItem.Text != "Select Stones") & (Drpstone2.SelectedItem.Text != "Select Stones") & (DrplStone3.SelectedItem.Text != "Select Stones"))
        {
            cmd.Parameters.AddWithValue("@subcat", DrplStones.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@subcat2", Drpstone2.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@subcat3", DrplStone3.SelectedItem.Text);
        }
        else if ((DrplStones.SelectedItem.Text != "Select Stones") & (Drpstone2.SelectedItem.Text != "Select Stones"))
        {
            cmd.Parameters.AddWithValue("@subcat", DrplStones.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@subcat2", Drpstone2.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@subcat3", "");
        }
        else if (DrplStones.SelectedItem.Text != "Select Stones")
        {
            cmd.Parameters.AddWithValue("@subcat", DrplStones.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@subcat2", "");
            cmd.Parameters.AddWithValue("@subcat3", "");
        }
        else
        {
            string ston1 = string.Empty;
            string stone2 = string.Empty;
            cmd.Parameters.AddWithValue("@subcat", ston1);
            cmd.Parameters.AddWithValue("@subcat2", stone2);
            cmd.Parameters.AddWithValue("@subcat3", "");
        }

        if (RadioButtonList1.Text == "Yes")
        {
            cmd.Parameters.AddWithValue("@faceted", 1);
        }
        else if (RadioButtonList1.Text == "No")
        {
            cmd.Parameters.AddWithValue("@faceted", 0);
        }
        else
        {
            cmd.Parameters.AddWithValue("@faceted", "");
        }


        if (DrpLShape.SelectedItem.Text != "Select Shape")
        {
            cmd.Parameters.AddWithValue("@shape", DrpLShape.SelectedItem.Text);
        }
        else
        {
            cmd.Parameters.AddWithValue("@shape", "");
        }
        if (TxtStorage.Text != "")
        {
            cmd.Parameters.AddWithValue("@storage", TxtStorage.Text);
        }
        else
        {
            cmd.Parameters.AddWithValue("@storage", "");
        }
        int status = 2;
        cmd.Parameters.AddWithValue("@STATUS", status);
        
        cmd.Parameters.AddWithValue("@inventory",TxtQuantity.Text);
            try
            {
                
                int result = cmd.ExecuteNonQuery();
                if (result > 0)
                {
                    string message = "Successfully inserted.";
                    LblResult.Text = message;


                    /* ******************* Retrieve NewItemID************************ */

                   // cmd.CommandText = "select newitem from items where addate=@addate";
                    cmd.CommandText = "select newitem from items where color=@color";
                    cmd.CommandType = CommandType.Text;
                    // cmd.Parameters.AddWithValue("@date",GlobalCurrentTime);
                    SqlDataReader reader;
                    reader = cmd.ExecuteReader();
                    if (reader.HasRows)
                    {
                        while (reader.Read())
                        {
                            NewItemID = (int)reader["newitem"];
                        }
                    }
                    reader.Close();
                    cmd.CommandText = "update items set color='"+actualcolor+"' where newitem="+NewItemID;
                    cmd.CommandType = CommandType.Text;
                    cmd.ExecuteNonQuery();
                    /* ******************* End of NewItemID ************************* */

                    /************************Start to insert new item storage in ltbstorage table *************/


                    /************************* To insert into ltbstorage table is end *************************/

                    cmd.CommandText = "insert into itemsstorage(ITEMID,INVENTORY,LOCATION,STORAGE) values(@ITEMID,@INVENTORY,@LOCATION,@STORAGE)";
                    cmd.CommandType = CommandType.Text;

                    cmd.Parameters.AddWithValue("@ITEMID", NewItemID);
                   // cmd.Parameters.AddWithValue("@INVENTORY", TxtQuantity.Text.Trim());
                    cmd.Parameters.AddWithValue("@LOCATION", Drplocation.SelectedItem.Text);
                   // string newstorage = NewItemID + Drplocation.SelectedItem.Text + TxtStorage.Text.Trim() + TxtQuantity.Text.Trim();
                   // cmd.Parameters.AddWithValue("@STORAGE", newstorage);
                    

                    try
                    {
                        int i = cmd.ExecuteNonQuery();
                        if (i > 0)
                        {
                            string strmessage = "Item Storage is inserted successfully";
                            LblResult.Text = strmessage;
                        }
                        else
                        {
                            string strmessage = "Failed to insert in Item Storage";
                            LblResult.Text = strmessage;
                        }

                    }
                    catch (SqlException ex)
                    {
                        string strmessage = "Slq Error : for Item Storage" + ex.Message;
                        LblResult.Text = strmessage;
                    }

                    /*************************** Insert data in iteminfo table *********************************/

                    cmd.CommandText = "insert into ItemInfo(newitem,quantity,size,weight,date,cost,lotid,updatedby) values(@newitem,@quantity,@size,@weight,@date,@cost,@lotid,@updatedby)";
                    cmd.CommandType = CommandType.Text;
                   
                    cmd.Parameters.AddWithValue("@quantity", float.Parse(TxtQuantity.Text.Trim()));
                    cmd.Parameters.AddWithValue("@date", GlobalCurrentTime);
                    cmd.Parameters.AddWithValue("@cost", basecost);
                    cmd.Parameters.AddWithValue("@lotid", DrplLotno.SelectedItem.Text);
                    cmd.Parameters.AddWithValue("@updatedby", updateby);

                    try
                    {
                        int i = cmd.ExecuteNonQuery();
                        if (i > 0)
                        {
                            string updatemesage = "Successfully Updated.";
                            LblResult.Text=updatemesage ;
                        }
                        else
                        {
                            string updatemesage = "Failed To Updated.";
                            LblResult.Text = updatemesage;
                        }

                    }
                    catch (SqlException ex)
                    {
                        string updatemessae = "Slq Error :" + ex.Message;
                        LblResult.Text = updatemessae;
                    }
                    
                    /*************************** Insertion end in iteminfo table *********************************/
                   
                    /*************************** Updation Start in LotsInfo Table *******************************/
                    cmd.CommandText = "update lotinfo set totalAddedWeight=totalAddedWeight + @totalAddedWeight,totalAddedUantity=totalAddedUantity + @totalAddedUantity,totalAddedValue=totalAddedValue + @totalAddedValue where lotid=@lotid";
                    cmd.CommandType = CommandType.Text;

                    cmd.Parameters.AddWithValue("@totalAddedWeight", float.Parse(TxtWeight.Text.Trim()));
                    cmd.Parameters.AddWithValue("@totalAddedUantity", float.Parse(TxtQuantity.Text.Trim()));
                    cmd.Parameters.AddWithValue("@totalAddedValue", float.Parse(TxtCost.Text.Trim()));
                    try 
                    {
                       int j= cmd.ExecuteNonQuery();
                       if (j > 0)
                       { 
                           LblResult.Text = "Successfully Added in the lots";
                           Response.Redirect("Thanks.aspx?itemid=" + NewItemID + "&Lotid=" + DrplLotno.SelectedItem.Text);
                       }
                       else
                       {
                           LblResult.Text = "Failed to add in the lots";
                           
                       }
                     }
                    catch(Exception ex)
                    {
                        LblResult.Text = ex.Message;
                        
                    }
                  }
                else
                {
                    string message = "Insertion is fail";
                }

            }
            catch (SqlException ex)
            {
                string message = "Sql Error :" + ex.Message;
                LblResult.Text = message; 

            }
            finally
            {
                cmd.Connection.Close();
            }
       
    }

   
    public void lotNo()
    {
        SqlConnection con = new SqlConnection(WebConnectionStrig);
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "select lotid from LotInfo where status='Inprogress'";
        cmd.CommandType = CommandType.Text;
        SqlDataAdapter ada = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        ada.Fill(dt);
        DrplLotno.DataTextField = "lotid";
        DrplLotno.DataValueField = "lotid";
        DrplLotno.DataSource = dt;
        DrplLotno.DataBind();
        DrplLotno.Items.Insert(0,new ListItem("Select Lot ID",""));
    }
    public void StoneCategory()
    {
        ArrayList objstones = new ArrayList();
        objstones.Add("Agate");
        objstones.Add("Amber");
        objstones.Add("Amethyst");
        objstones.Add("Aquamarine");
        objstones.Add("Blue Topaz");
        objstones.Add("Carnelian");
        objstones.Add("Chalcedony");
        objstones.Add("Citrine");
        objstones.Add("Cubic");
        objstones.Add("Zirconia");
        objstones.Add("Emerald");
        objstones.Add("Fluorite");
        objstones.Add("Garnet");
        objstones.Add("Iolite");
        objstones.Add("Iasper");
        objstones.Add("Labradorite");
        objstones.Add("Lapis Lazuli");
        DrplStones.DataSource = objstones;
        DrplStones.DataBind();
        DrplStones.Items.Insert(0,new ListItem("Select Stones",""));
    }
    public void Stone2()
    {
        ArrayList objstones = new ArrayList();
        objstones.Add("Agate");
        objstones.Add("Amber");
        objstones.Add("Amethyst");
        objstones.Add("Aquamarine");
        objstones.Add("Blue Topaz");
        objstones.Add("Carnelian");
        objstones.Add("Chalcedony");
        objstones.Add("Citrine");
        objstones.Add("Cubic");
        objstones.Add("Zirconia");
        objstones.Add("Emerald");
        objstones.Add("Fluorite");
        objstones.Add("Garnet");
        objstones.Add("Iolite");
        objstones.Add("Iasper");
        objstones.Add("Labradorite");
        objstones.Add("Lapis Lazuli");
        Drpstone2.DataSource = objstones;
        Drpstone2.DataBind();
        Drpstone2.Items.Insert(0, new ListItem("Select Stones", ""));
    }
    public void Stone3()
    {
        ArrayList objstones3 = new ArrayList();
        objstones3.Add("Agate");
        objstones3.Add("Amber");
        objstones3.Add("Amethyst");
        objstones3.Add("Aquamarine");
        objstones3.Add("Blue Topaz");
        objstones3.Add("Carnelian");
        objstones3.Add("Chalcedony");
        objstones3.Add("Citrine");
        objstones3.Add("Cubic");
        objstones3.Add("Zirconia");
        objstones3.Add("Emerald");
        objstones3.Add("Fluorite");
        objstones3.Add("Garnet");
        objstones3.Add("Iolite");
        objstones3.Add("Iasper");
        objstones3.Add("Labradorite");
        objstones3.Add("Lapis Lazuli");
        DrplStone3.DataSource = objstones3;
        DrplStone3.DataBind();
        DrplStone3.Items.Insert(0, new ListItem("Select Stones", ""));

    }

    public void category()
    {
        ArrayList objCategory = new ArrayList();
        objCategory.Add("Gems ");
        objCategory.Add("Pendants");
        objCategory.Add("Rings");
        objCategory.Add("Earrings");
        objCategory.Add("Cufflinks");
        objCategory.Add("Necklaces");
        objCategory.Add("Bracelets");
        objCategory.Add("Chains");
        objCategory.Add("Brooches");
        objCategory.Add("Healing");
        objCategory.Add("Beads");
        objCategory.Add("Muffler");
        DrplCategory.DataSource = objCategory;
        DrplCategory.DataBind();
        DrplCategory.Items.Insert(0, new ListItem("Select Category", ""));
    }
    protected void BtnClear_Click(object sender, EventArgs e)
    {
       TxtSize.Text = "";
       TxtWeight.Text="";
       TxtCost.Text="";
       DrplCategory.SelectedItem.Text = "Select Category";
       DrplColor1.SelectedItem.Text="Select Color";
       DrplLotno.SelectedItem.Text = "Select Lot ID";
       TxtQuantity.Text = "";
       LblResult.Text = "";
    }
     

    public void Shape()
    { 
     ArrayList objShape = new ArrayList();
     objShape.Add("leaf");
     objShape.Add("marquise");
     objShape.Add("oval");
     objShape.Add("pear");
     objShape.Add("Necklaces");
     objShape.Add("round");
     objShape.Add("rectangular");
     objShape.Add("spherical");
     objShape.Add("square");
     DrpLShape.DataSource = objShape;
     DrpLShape.DataBind();
     DrpLShape.Items.Insert(0, new ListItem("Select Shape", ""));
   }


    protected void BtnSearch_Click(object sender, EventArgs e)
    { 
        if (TxtItemID.Text == "")
        {
            lblerror.Text = "It cannot be blanked.";
        }
        else
        {
          int itemID=Convert.ToInt32(TxtItemID.Text);
          ItemsData(itemID);
          
        }
    }

    public void ItemsData(int ItmID)
    { 
            SqlConnection strconnection = new SqlConnection(WebConnectionStrig);
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = strconnection;
            cmd.CommandText = "select cat,color,shape,size,weight,subcat,subcat2,subcat3,storage,basecost from items  where newitem=@newitem ";
            
            cmd.CommandType = CommandType.Text;
            cmd.Parameters.AddWithValue("@newitem", ItmID);
            SqlDataReader reader;
            try
            {
             cmd.Connection.Open();
             reader = cmd.ExecuteReader();
             if (reader.HasRows)
             {
                 while (reader.Read())
                 {
                     string category = reader["cat"].ToString();
                     Lblcategory.Text = category;
                    
                     string color = reader["color"].ToString();
                     LblItemColor.Text = color;

                     string itemshape = reader["shape"].ToString();
                     LblItemShape.Text = itemshape;

                     string size = reader["size"].ToString();
                     LblItemSize.Text = size;

                     string itemweight = reader["weight"].ToString();
                     LblItemWeight.Text = itemweight;

                     string subcategory = reader["subcat"].ToString();
                     LblItemStone1.Text = subcategory;

                     string subcategory2 = reader["subcat2"].ToString();
                     LblItemStone2.Text = subcategory2;

                     string subcategory3 = reader["subcat3"].ToString();
                     LblItemStone3.Text = subcategory3;

                     string storage = reader["storage"].ToString();
                     LblItemStorage.Text = storage;

                     string cost = reader["basecost"].ToString();
                     LblItemCost.Text = cost;

                     //string location=reader["location"].ToString();
                     //lblitemlocation.Text = location;
                                       
                 }

             }
             else
             {
                 lblerror.Text = "Item ID does not exist.You can add new Item.";
             }
             
            }
            catch(Exception ex)
            {
                lblerror.Text = "Errors :" + ex.Message;
            }
            finally
            {
             cmd.Connection.Close();
            }
    }
    public void existingitem(int newitemid)
    {
        SqlConnection strcon = new SqlConnection();
        SqlCommand strcmd = new SqlCommand();
        strcmd.Connection = strcon;
        strcmd.CommandText = "update items set inventory=" + TxtQuantity.Text + " where newitem=" + newitemid;
        strcmd.CommandType = CommandType.Text;
        try
        {
           strcmd.Connection.Open();
           int i = strcmd.ExecuteNonQuery();
           if (i > 0)
           {
               lblerror.Text = "Successfully updated item table.";
           }
            else
           {
               lblerror.Text = "Unable to update item table.";
           }
        }
        catch(SqlException ex)
        {
            lblerror.Text = ex.Message;
        }
        catch(Exception ex)
        {
            lblerror.Text = ex.Message;
        }
        finally
        {
            strcmd.Connection.Close();
        }
    
    }

    //public void InsertExistingItem()
    //{
    //    SqlConnection strcon = new SqlConnection();
    //    SqlCommand strcmd = new SqlCommand();
    //    strcmd.Connection = strcon;
    //    strcmd.CommandText = "insert into iteminfo(lotid,newitem,quantity,size,weight,date,cost,updatedby) values(@lotid,@newitem,@quantity,@size,@weight,@date,@cost,@updatedby)";
    //    strcmd.CommandType = CommandType.Text;
    //    strcmd.Parameters.AddWithValue("@lotid",);
    //    strcmd.Parameters.AddWithValue("@newitem",TxtItemID.Text.Trim());
    //    strcmd.Parameters.AddWithValue("@quantity",);
    //    strcmd.Parameters.AddWithValue("@size",);
    //    strcmd.Parameters.AddWithValue("@weight",);
    //    strcmd.Parameters.AddWithValue("@date",GlobalCurrentTime);
    //    strcmd.Parameters.AddWithValue("@cost",);
    //    strcmd.Parameters.AddWithValue("@updatedby",);
    //    try
    //    {
    //        strcmd.Connection.Open();
    //        int i = strcmd.ExecuteNonQuery();
    //        if (i > 0)
    //        {
    //            lblerror.Text = "Successfully inserted into the iteminfo table.";
    //        }
    //        else
    //        {
    //            lblerror.Text = "Unable to insert into iteminfo table.";
    //        }
    //    }
    //    catch (SqlException ex)
    //    {
    //        lblerror.Text = ex.Message;
    //    }
    //    catch (Exception ex)
    //    {
    //        lblerror.Text = ex.Message;
    //    }
    //    finally
    //    {
    //        strcmd.Connection.Close();
    //    }
     
    //}
    protected void Btnexistingitems_Click(object sender, EventArgs e)
    {
       // existingitem(newitemid);
      //  InsertExistingItem();
    }
    public void UserLocation()
    {
        SqlConnection con = new SqlConnection(WebConnectionStrig);
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "select location from ltblocation ";
        cmd.CommandType = CommandType.Text;
        SqlDataAdapter ada = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        ada.Fill(dt);
       Drplocation.DataTextField = "location";
       Drplocation.DataValueField = "location";
       Drplocation.DataSource = dt;
       Drplocation.DataBind();
       Drplocation.Items.Insert(0, new ListItem("Select Location", ""));
    }
    protected void DrplStones_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DrplStones.SelectedItem.Text != "Select Stones")
        {
            Drpstone2.Enabled = true;
        }
        else
        {
            Drpstone2.Enabled = false;
        }
    }
    protected void Drpstone2_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (Drpstone2.SelectedItem.Text != "Select Stones")
        {
            DrplStone3.Enabled = true;
        }
        else
        {
            DrplStone3.Enabled = false;
        }
    }
}


