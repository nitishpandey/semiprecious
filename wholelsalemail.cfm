<?xml version="1.0" encoding="iso-8859-1"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
</head>

<body>
<!--- <cfquery  datasource="sptm" username="nitish" password="rangeela" name="g">
select * from bulkbuyers</cfquery>
<cfdump var="#g#">
 --->
<cfset form.name = 'test' />
<cfset form.message = 'test msg' />
<cfmail server="mail23.webcontrolcenter.com" from="raju@gmail.com" to="nitish@semiprecious.com" subject="#form.name#'s Semiprecious.com query" cc="nitish@semiprecious.com,stacy@semiprecious.com"   type="html">
<cfif isdefined("form.itemid")><a href='http://www.semiprecious.com/jewelry_item.cfm/#form.itemid#_doesthishaveacluster.htm'>View Item</a></cfif>
From : #form.name#  <br><span style="border:2px gray inset;padding:10px;display:block;width:400px">
#form.message#.  </span>


</cfmail>

 <cfmail from="service@semiprecious.com" to="nitish@semiprecious.com" server="mail23.webcontrolcenter.com" subject="indian customer" type="html">
    Hi Smriti, We would love to shop with you. But first this message from me. 
    #form.message#.<br>
    You can get in touch with me at  Bye and Love, #form.name# 
  </cfmail>
sfsdf
 <cfmail from="service@semiprecious.com" to="nitish@semiprecious.com"  subject="wholesale jewelry"  server="mail23.webcontrolcenter.com" type="html">
<!--- 
<img src="http://www.semiprecious.com/images/newtopimage.cfm_r1_c1.jpg" width="267" height="75"  style="margin-bottom:-20px;margin-left:20px;"/>
<div style="width:700px;border:3px ##666600 dashed;display:inline;padding:3px;">
  <div align="justify"> <br />
    Hi, 
    <ol>
      <li>Believe me, it's really so gladdening to see you benefit immensely shopping with us at wholesale prices. We know that as long as you are able to run your 
        business profitably by buying great quality,range and at fantastic prices         we will continue to get valuable repeat visits from you.</li>
		<li><strong><font color="##CC3366">Its Mid November and we wanted to share this with you. Our sales are showing christmas sales are just picking up. Isnt it time to stock up? And  why worry with our guaranteed refund and exchange policy? No reason at all. Just stock up and put in your best this is going to be your christmas!</font></strong></li>
           <li>Remember, if you shop for more than $ 500 we are going to charge you 5% less.  We are in this business for last  9 years and i know it doesn't  get better than this.</li>
      <li> One more thing, this may sound familiar yet,  i am sure you would agree that the shipping and handling         charges of $5.00 are the lowest that anybody offers. With such low profit 
           on our products it has indeed become difficult for us to maintain the         shipping and handling charges at $7.5 and consequently will be <strong>raising 
        them to $ 10 from 15 Dec 05</strong>.</li>

      <li>If you have any query or suggestion do call us or write in to me at smriti@semiprecious.com. To shop now simple cut and paste this URL <br />
               http://www.semiprecious.com/login.cfm?email=fafafd or click <a href="http://www.semiprecious.com/login.cfm?email=fafafd">here</a></li>
    </ol>
    <p>Regards, <br />
      <font color="##808040"><strong>Smriti </strong></font><br />
      For www.semiprecious.com </p>
    </div></div>
	--->
	</cfmail>asdf
</body>
</html>
