<!--#INCLUDE file="simlib.asp"-->
<!--#INCLUDE file="simdata.asp" -->

<!--

  DISCLAIMER:
     This code is distributed in the hope that it will be useful, but without any warranty; 
     without even the implied warranty of merchantability or fitness for a particular purpose.

   Main ASP that demonstrates how to use the SIM library. 
   Input (Form or QueryString):
      x_Amount
      x_Description
-->






<FORM action="https://secure.authorize.net/gateway/transact.dll" method="post">
<%
Dim sequence
Dim amount
Dim ret
Dim invoicenum
Dim address
Dim zip
dim city
Dim email
Dim first_name
Dim last_name
' *** IF YOU WANT TO PASS CURRENCY CODE uncomment the next 2 lines **
' Dim currencycode
' Assign the transaction currency (from your shopping cart) to currencycode variable

' Trim $ dollar sign if it exists
address  = Request("x_address")
zip = Request("x_zip")
city = Request("x_city")
email = Request("x_email")
first_name = Request("x_first_name")
last_name = Request("x_last_name")
amount = Request("x_amount")
currencycode = Request("currency")
invoicenum = Request("x_invoice_num")
If Mid(amount, 1,1) = "$" Then
	amount = Mid(amount,2)
End If

' Seed random number for more security and more randomness
Randomize
sequence = Int(1000 * Rnd)
'sequence = Request("cartid")
' Now we need to add the SIM related data like fingerprint to the HTML form.

'ret = InsertFP (loginid, txnkey, amount, sequence)

' *** IF YOU ARE PASSING CURRENCY CODE uncomment and use the following instead of the InsertFP invocation above  ***
 ret = InsertFP (loginid, txnkey, amount, sequence, currencycode)

' Insert other form elements similiar to legacy weblink integration
Response.Write ("<input type=""hidden"" name=""x_description"" value=""" & Request("x_description") & """>" & vbCrLf)
Response.Write ("<input type=""hidden"" name=""x_login"" value=""" & loginid & """>" & vbCrLf)
Response.Write ("<input type=""hidden"" name=""x_amount"" value=""" & amount & """>" & vbCrLf)
'Response.Write ("<input type=""hidden"" name=""x_receiptlink_method"" value=""" & amount & """>" & vbCrLf)
' *** IF YOU ARE PASSING CURRENCY CODE uncomment the line below *****
 Response.Write ("<input type=""hidden"" name=""x_currency_code"" value=""USD"" >" & vbCrLf)
Response.Write ("<input type=""hidden"" name=""x_invoice_num"" value=""" & invoicenum & """>" & vbCrLf)
Response.Write ("<input type=""hidden"" name=""x_method"" value=""CC"" >" & vbCrLf)
Response.Write ("<input type=""hidden"" name=""x_type"" value=""AUTH_CAPTURE"" >" & vbCrLf)
Response.Write("<input type=""hidden"" name=""x_address"" value=""" &address &""" >" & vbCrLF)
Response.Write("<input type=""hidden"" name=""x_zip"" value=""" & zip &""" >" & vbCrLF)
Response.Write("<input type=""hidden"" name=""x_city"" value=""" &city &""" >" & vbCrLF)
Response.Write("<input type=""hidden"" name=""x_email"" value=""" &email &""" >" & vbCrLF)
Response.Write("<input type=""hidden"" name=""x_first_name"" value=""" & first_name&""" >" & vbCrLF)
Response.Write("<input type=""hidden"" name=""x_last_name"" value=""" &last_name &""" >" & vbCrLF)
Response.Write("<INPUT TYPE=""HIDDEN"" NAME=""x_relay_response"" VALUE=""True"" >" & vbCrLF)
%>
<INPUT type="hidden" name="x_show_form" value="PAYMENT_FORM">
<!--- control test mode from settings in merchant interface. <INPUT type="hidden" name="x_test_request" value="TRUE"> --->
<INPUT type="submit" value="WELLS FARGO (AUTHORIZE.NET)">
</FORM>
