using System;
using System.Data;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Net.Mail;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.IO;
using System.Text;

public class CentraliseEmail
{
    string connectionstring = WebConfigurationManager.ConnectionStrings["SqlConnectionString"].ConnectionString;
    string EmailID;
    string EmailContent;
    string tempsubject;
    string strTimeSlot = string.Empty;
    string timeslot = string.Empty;
    int ID;
	List<int> idlist = new List<int>();
    int MaximumLimit = 0;
    int TotalEmailSent=0;
    int CounterValue = 0;
    int balanceCount = 0;
    public int AddEmail(string toemailid, string subject, bool delay, DateTime dt, string messagecontent)
    {
        return AddEmail(toemailid, subject, delay, dt, messagecontent, 0);
    }
  
    public int AddEmail(string toemailid, string subject, bool delay, DateTime dt, int msgid)
    {
        string errormessage = MessageIdContent(msgid);

        if ((errormessage == "errorerror") || (errormessage == "error"))
        {
            return 0;
        }
        else
        {
        return AddEmail(toemailid, subject, delay, dt, "", msgid);
        
        }
        
    }

   private int AddEmail(string toemailid,string subject,bool delay,DateTime dt,string messagecontent,int msgid)

    {
        if (!delay)
        {
            //check day and timeslot limit
            //if not exceeded then do rest of code
            TimeSlot();
            allowedCount(strTimeSlot);

            if (balanceCount > 0)
            {
                MailMessage message = new MailMessage();
                message.Subject = subject;
                if (msgid != 0)
                {
                    //pick msg from emailmessage table
                    //if reader has no row return with a positive number to represent error
                    message.Body = MessageIdContent(msgid);
                }
                else
                {
                    message.Body = messagecontent;
                }

                string Host = System.Configuration.ConfigurationManager.AppSettings["smtpServer"];
                string msgfrom = System.Configuration.ConfigurationManager.AppSettings["adminMailID"];
                string messageto = toemailid;
                try
                {
                    message.To.Add(new MailAddress(messageto));

                }
                catch (Exception a)
                {
                    return 1;
                }
                message.From = new MailAddress(msgfrom);
                message.IsBodyHtml = true;
                SmtpClient client = new SmtpClient(Host);
                try
                {
                    client.Send(message);
                    // add email
                    string date = Convert.ToDateTime(DateTime.Now).ToString("MM/dd/yyyy");
                    // DateTime dt1 = DateTime.Now;
                    string datetosend = Convert.ToDateTime(dt).ToString("MM/dd/yyyy");
                    SqlConnection con = new SqlConnection(connectionstring);
                    SqlCommand cmd = new SqlCommand();
                    cmd.Connection = con;
                    cmd.CommandText = "insert into EmailRegister(timeofreceipt,EmailTo,Msgcontent,datetosend,sent,Subject,msgid) values(@timeofreceipt,@EmailTo,@Msgcontent,@datetosend,@sent,@Subject,@msgid)";
                    cmd.CommandType = CommandType.Text;
                    //parameters passed
                    cmd.Parameters.AddWithValue("@timeofreceipt", date);
                    cmd.Parameters.AddWithValue("@EmailTo", toemailid);
                    cmd.Parameters.AddWithValue("@Msgcontent", messagecontent);
                    cmd.Parameters.AddWithValue("@datetosend", datetosend);
                    cmd.Parameters.AddWithValue("@sent", "Y");
                    cmd.Parameters.AddWithValue("@Subject", subject);
                    cmd.Parameters.AddWithValue("@msgid", msgid);

                    cmd.Connection.Open();
                    int i = cmd.ExecuteNonQuery();
                    if (i > 0)
                    {
                        return 3;
                    }


                }
                catch (Exception ex)
                {

                    //Alert.Show("Sorry ! Currently,Unable To Send");
                    return 2;
                }
               
                return 0;
                // Alert.Show("successfully");
            }
        }

        else // if delay then add to queue
        {
            string date = Convert.ToDateTime(DateTime.Now).ToString("MM/dd/yyyy");
            // DateTime dt1 = DateTime.Now;
            string datetosend = Convert.ToDateTime(dt).ToString("MM/dd/yyyy");
            SqlConnection con = new SqlConnection(connectionstring);
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "insert into EmailRegister(timeofreceipt,EmailTo,Msgcontent,datetosend,sent,Subject,msgid) values(@timeofreceipt,@EmailTo,@Msgcontent,@datetosend,@sent,@Subject,@msgid)";
            cmd.CommandType = CommandType.Text;
            //parameters passed
            cmd.Parameters.AddWithValue("@timeofreceipt", date);
            cmd.Parameters.AddWithValue("@EmailTo", toemailid);
            cmd.Parameters.AddWithValue("@Msgcontent", messagecontent);
            cmd.Parameters.AddWithValue("@datetosend", datetosend);
            cmd.Parameters.AddWithValue("@sent", "N");
            cmd.Parameters.AddWithValue("@Subject", subject);
            cmd.Parameters.AddWithValue("@msgid", msgid);
            try
            {
                cmd.Connection.Open();
                int i = cmd.ExecuteNonQuery();
                if (i > 0)
                {
                    return 3;
                }
            }
            catch (Exception ee)
            {
                string errormessage = "Error" + ee.Message;
            }
            finally
            {
                cmd.Connection.Close();
            }


            return 0;
        }
        return 0;
    }
    public int SendMail()
    {
        TimeSlot(); //find out slot of mailing is peak or non peak 
        allowedCount(strTimeSlot); // find out balance count for this time slot
        if (balanceCount >0)
        {
            //counter;
            //Count;
            string firstMessageContent = string.Empty;
            string SecondMessageContent = string.Empty;
            string finalMessage = string.Empty;
            string emailerto = string.Empty;
            string messagecontent = string.Empty;
            string mainsubject = string.Empty;
            string Subject = string.Empty;
            int messageid = 0;
            int id;
            int count = 0;
            string Host = System.Configuration.ConfigurationManager.AppSettings["smtpServer"];
            string msgfrom = System.Configuration.ConfigurationManager.AppSettings["adminMailID"];
            string date = Convert.ToDateTime(DateTime.Now).ToString("MM/dd/yyyy");
            DateTime dt1 = DateTime.Now.Date;
            SqlConnection con = new SqlConnection(connectionstring);
            SqlCommand cmd = new SqlCommand();
            MailMessage message = new MailMessage();
            EmailID = "";
            cmd.Connection = con;
            cmd.CommandText = "SELECT TOP " + balanceCount + " EmailTo,Msgcontent,Subject,ID,msgid from EmailRegister where sent='N' and datetosend<='" + date + "'   ORDER BY EmailTo asc, datetosend asc";
            cmd.CommandType = CommandType.Text;
            //cmd.Parameters.AddWithValue("@datetosend", date);
            SqlDataReader reader;
            con.Open();
            reader = cmd.ExecuteReader();
            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    	emailerto = (string)reader["EmailTo"];
                        messageid=(int)reader["msgid"];
                       
                        if(messageid!=0)
                        {
                            messagecontent = MessageIdContent(messageid);
                        }
                        else
                        {
                             messagecontent = (string)reader["Msgcontent"];
                        }
                        
                        mainsubject = (string)reader["Subject"];
                        idlist.Add((int)reader["ID"]);
                       
					if (count > 0)
                    {
                       count++;
					     // if email equal to next email
                       
                        
                        if (emailerto == EmailID)
                        {
                            if (!Subject.Equals("Emails from Your Jewelry Store"))
                            {
                                finalMessage = "Subject :" + tempsubject + "<br/>" + EmailContent + "<br/>";
                                Subject = "Emails from Your Jewelry Store";
                            }
                            finalMessage += "" + "Subject :" + mainsubject + "<br/>" + messagecontent + "<br/>";
                        }
                        else
                        {
                            if (finalMessage != string.Empty)
                            {
                              /* Send email */
                               email(Subject, EmailID, finalMessage);
                               /* update emailer on the basis EmailID and Date to Send */
                               //UpdateEmailer(EmailID, date); // this updates for a date and email id and the bug is if we did not get all the emails for that person in the selection query. The selection query limits to a particular count!
                               	
                               finalMessage = string.Empty;
                             }

                            EmailID = emailerto;
                            Subject = tempsubject = mainsubject;
                            EmailContent = messagecontent;
                            finalMessage = EmailContent;
                        }

                    }
					else
					{// the first time
							count++;
							EmailID = emailerto;
                            Subject = tempsubject = mainsubject;
                            EmailContent = messagecontent;
                            finalMessage = EmailContent;
					}//end of if loop
                   
                }// while loop
				  if (finalMessage != string.Empty)
                          {
					         /* Send email */
                                email(Subject, EmailID, finalMessage);
                                /* update emailer on the basis EmailID and Date to Send */
                                //UpdateEmailer(EmailID, date); // this updates for a date and email id and the bug is if we did not get all the emails for that person in the selection query. The selection query limits to a particular count!
                                count++;
                                finalMessage = string.Empty;
                             }
                UpdateEmailer(idlist);
                reader.Close();
                con.Close();
               
                //int totalcount = CounterValue + count;
                /* Insert to emailercounter table */
                DateTime dt = Convert.ToDateTime(date);
               
                update_EmialerCounter(count,dt);
              
               
               
            }//outer if

            return count;         
        }
        else
        {
            EmailID = "";
            tempsubject = "";
            EmailContent = "You cannot send more than limit";
           // email(EmailID,EmailContent,tempsubject);
            return 1;
        }

    }

    public void UpdateEmailer(string emailto,string senddate)
    {
        SqlConnection connection = new SqlConnection(connectionstring);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "UPDATE EmailRegister SET sent = 'Y' WHERE EmailTo=@EmailTo and datetosend=@datetosend";
        cmd.CommandType = CommandType.Text;
        cmd.Connection = connection;

        //Parameters Passed
        cmd.Parameters.AddWithValue("@EmailTo",emailto);
        cmd.Parameters.AddWithValue("@datetosend",senddate);

        try
        {
            connection.Open();
            int result = cmd.ExecuteNonQuery();
            if (result > 0)
            {
                //Alert.Show(" Successfully updated ");
              
            }

        }
        catch (SqlException ee)
        {
            Alert.Show("ODBC Exception :" + ee);
        }
        catch (Exception ee)
        {
            Alert.Show("exception");
        }
        finally
        {
            connection.Close();
        }
    
    }

	    public void UpdateEmailer(List<int> idlist)
    {
        SqlConnection connection = new SqlConnection(connectionstring);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "UPDATE EmailRegister SET sent = 'Y' WHERE ID in (";
		    foreach(int k in idlist)
				cmd.CommandText +=  k.ToString()+ ",";
				cmd.CommandText +=  0 + ")";
        cmd.CommandType = CommandType.Text;
        cmd.Connection = connection;
        //Parameters Passed

        try
        {
	    	//HttpContext.Response.Write(cmd.CommandText);
            connection.Open();
            int result = cmd.ExecuteNonQuery();
            if (result > 0)
            {
                //Alert.Show(" Successfully updated ");
            }

        }
        catch (SqlException ee)
        {
            Alert.Show("ODBC Exception :" + ee);
        }
        catch (Exception ee)
        {
            Alert.Show("exception");
        }
        finally
        {
            connection.Close();
        }
    
    }
     public void TimeSlot()
    {
        String A, B; /* check in no send time zone */
        string[] strDay = new string[] { "Monday", "Tuesday", "Wednesday", "Thursday", "Friday","Saturday" };
        DateTime dt = Convert.ToDateTime(DateTime.Now);
        foreach (string Day in strDay)
        {
            if (dt.DayOfWeek.ToString() == Day)
            {
                int mintime = 20;
                int maxtime = 4;
                int k =  DateTime.Now.Hour;
                if ((k < mintime) & (k > maxtime))
                {
                    strTimeSlot="A";
                    MaximumLimit = 50;
                    CheckTimeSlot(dt,strTimeSlot);
                                        
               }
                else
                {
                    strTimeSlot = "B";
                    MaximumLimit = 400;
                    CheckTimeSlot(dt, strTimeSlot);
               }
                
            }
        }
    }
    

    public void SendMailId(int Id)
    {
             
        string Host = System.Configuration.ConfigurationManager.AppSettings["smtpServer"];
        string msgfrom = System.Configuration.ConfigurationManager.AppSettings["adminMailID"];
        string date = Convert.ToDateTime(DateTime.Now).ToString("MM/dd/yyyy");
        DateTime dt1 = DateTime.Now.Date;
        SqlConnection con = new SqlConnection(connectionstring);
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "SELECT Subject,EmailTo,Msgcontent from EmailRegister where ID=@ID";
        cmd.CommandType = CommandType.Text;
        cmd.Parameters.AddWithValue("@ID", Id);
        SqlDataReader reader;
        con.Open();
        reader = cmd.ExecuteReader();
        if (reader.HasRows)
        {
            while (reader.Read())
            {
                string Subject = (string)reader["Subject"];
                string emailerto = (string)reader["EmailTo"];
                string messagecontent = (string)reader["Msgcontent"];

                /* Send mail*/
                
                MailMessage message = new MailMessage();
                message.Subject = Subject;
                message.Body = messagecontent;
                message.To.Add(new MailAddress(emailerto));
                message.From = new MailAddress(msgfrom);
                message.IsBodyHtml = true;
                SmtpClient client = new SmtpClient(Host);
                try
                {
                  //  client.Send(message);
                }
                catch (Exception ex)
                {
                    Alert.Show("Error to send mail");
                }
                /* End of send email*/

            }
            
        }
        reader.Close();
        con.Close();

    }


    public void email(string sub,string to,string content)
    {
        string Host = System.Configuration.ConfigurationManager.AppSettings["smtpServer"];
        string msgfrom = System.Configuration.ConfigurationManager.AppSettings["adminMailID"];
        MailMessage message = new MailMessage();
        message.Subject = sub;
        message.Body = content;
        message.To.Add(new MailAddress(to));
        message.From = new MailAddress(msgfrom);
        message.IsBodyHtml = true;
        SmtpClient client = new SmtpClient(Host);
        try
        {
            client.Send(message);

        }
        catch (Exception ex)
        {
            Alert.Show("Error to send mail");
        }
    
    }
    private void allowedCount(string ts)
    { 
       string date = Convert.ToDateTime(DateTime.Now).ToString("MM/dd/yyyy");
       
        SqlConnection con = new SqlConnection(connectionstring);
        SqlCommand  cmd = new SqlCommand();
        cmd.Connection = con;
       // count the email and time slot to send
        cmd.CommandText = "select counter from Emailercounter where date=@date and timeslot = @timeslot";
        cmd.Parameters.AddWithValue("@date",date);
        cmd.Parameters.AddWithValue("@timeslot", ts);
        SqlDataReader reader;

        try
        {
            con.Open();
            reader = cmd.ExecuteReader();
            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    balanceCount = MaximumLimit - (int)reader["counter"];
                     if (balanceCount < 0)
                        balanceCount = 0;
                    
                }
            }

            else
            {
                balanceCount = MaximumLimit;
            }
            reader.Close();
        }
        catch (Exception ee)
        {
            balanceCount = 0;
            
        }
        return;
    }
    public void update_EmialerCounter(int finalCount,DateTime todate)
    {
        SqlConnection connection = new SqlConnection(connectionstring);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "UPDATE Emailercounter SET counter=@counter and timeslot=@timeslot  WHERE  date=@date";
        cmd.CommandType = CommandType.Text;
        cmd.Connection = connection;

        //Parameters Passed
        cmd.Parameters.AddWithValue("@counter",finalCount );
        cmd.Parameters.AddWithValue("@date", todate);
        cmd.Parameters.AddWithValue("@timeslot", strTimeSlot);
        try
        {
            connection.Open();
            int result = cmd.ExecuteNonQuery();
            if (result > 0)
            {
                //Alert.Show(" Successfully updated ");

            }

        }
        catch (SqlException ee)
        {
            Alert.Show("ODBC Exception :" + ee);
        }
        catch (Exception ee)
        {
            Alert.Show("exception");
        }
        finally
        {
            connection.Close();
        }
    
    }

    public void Insert_EmialerCounter(DateTime date, int finalCount, string slot)
    {
        SqlConnection connection = new SqlConnection(connectionstring);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "insert into Emailercounter(date,counter,timeslot) values(@date,@counter,@timeslot)";
        cmd.CommandType = CommandType.Text;
        cmd.Connection = connection;

        //Parameters Passed
        cmd.Parameters.AddWithValue("@date", date);
        cmd.Parameters.AddWithValue("@counter", finalCount);
        cmd.Parameters.AddWithValue("@timeslot", date);


        try
        {
            connection.Open();
            int result = cmd.ExecuteNonQuery();
            if (result > 0)
            {
                string message = "Successfully inserted";
            }

        }
        catch(Exception ee)
        {
            string errormessage = ee.Message;
        }
        finally
        {
            connection.Close();
        }

    }
    public void CheckTimeSlot(DateTime datt,string strTS)
    {
        int counter=0;
        SqlConnection con = new SqlConnection(connectionstring);
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "select * from Emailercounter where date=@date and timeslot=@timeslot";
        cmd.Parameters.AddWithValue("@date", datt);
        cmd.Parameters.AddWithValue("@timeslot", strTS);
        SqlDataReader reader;
        con.Open();
        reader = cmd.ExecuteReader();
        if (reader.HasRows)
        {
            while (reader.Read())
            {
                 counter = (int)reader["counter"];
            } 
        }
        reader.Close();
       
        if (counter == 0)
        {
            cmd.CommandText = "insert into Emailercounter(date,timeslot,counter) values(@date,@timeslot,@counter)";
            cmd.CommandType = CommandType.Text;
            
            //cmd.Parameters.AddWithValue("@date", datt);
            //cmd.Parameters.AddWithValue("@timeslot", strTS);
            int i = 0;
            cmd.Parameters.AddWithValue("@counter", i);
            int result = cmd.ExecuteNonQuery();
            if (result > 0)
            {

            }
            else
            {
                string errormessage = "Inserting errors";
            }

        }
              
        con.Close();
    
    }

    public string MessageIdContent(int messageid)
    {
        string   msgcon =string.Empty;
        SqlConnection connection = new SqlConnection(connectionstring);
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = connection;
        cmd.CommandText = "select msgcontent from emailmessage where msgid=@msgid";
        cmd.Parameters.AddWithValue("@msgid", messageid);
        cmd.CommandType = CommandType.Text;
        SqlDataReader strreader;
        connection.Open();
        strreader = cmd.ExecuteReader();
        msgcon = "errorerror"; if (strreader.HasRows)
        {
            while (strreader.Read())
            {
                try
                {
                    msgcon = (string)strreader["Msgcontent"];
                  
                }
                catch (Exception ex)
                {

                    msgcon = "error";
                }
            }
        }

       strreader.Close();
        connection.Close();
        return msgcon;
    
    }
 }

