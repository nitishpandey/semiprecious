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

<HTML>
<HEAD>
<TITLE>Order Form</TITLE>
</HEAD>
<BODY>
<H3>Final Order</H3>

Description: <%= Request("x_description")%>  <BR />
Total Amount : <%= Request("x_amount") %>

<BR /><BR />
<FORM action="https://certification.authorize.net/gateway/transact.dll">
<%
Dim sequence
Dim amount
Dim ret

' *** IF YOU WANT TO PASS CURRENCY CODE uncomment the next 2 lines **
' Dim currencycode
' Assign the transaction currency (from your shopping cart) to currencycode variable

' Trim $ dollar sign if it exists
amount = Request("x_amount")

If Mid(amount, 1,1) = "$" Then
	amount = Mid(amount,2)
End If

' Seed random number for more security and more randomness
Randomize
sequence = Int(1000 * Rnd)
' Now we need to add the SIM related data like fingerprint to the HTML form.

ret = InsertFP (loginid, txnkey, amount, sequence)

' *** IF YOU ARE PASSING CURRENCY CODE uncomment and use the following instead of the InsertFP invocation above  ***
' ret = InsertFP (loginid, txnkey, amount, sequence, currencycode)

' Insert other form elements similiar to legacy weblink integration
Response.Write ("<input type=""hidden"" name=""x_description"" value=""" & Request("x_description") & """>" & vbCrLf)
Response.Write ("<input type=""hidden"" name=""x_login"" value=""" & loginid & """>" & vbCrLf)
Response.Write ("<input type=""hidden"" name=""x_amount"" value=""" & amount & """>" & vbCrLf)

' *** IF YOU ARE PASSING CURRENCY CODE uncomment the line below *****
' Response.Write ("<input type=""hidden"" name=""x_currency_code"" value=""" & currencycode & """>" & vbCrLf)

%>
<INPUT type="hidden" name="x_show_form" value="PAYMENT_FORM">
<INPUT type="hidden" name="x_test_request" value="TRUE">
<INPUT type="submit" value="Accept Order">
</FORM>
</BODY>
</HTML>
