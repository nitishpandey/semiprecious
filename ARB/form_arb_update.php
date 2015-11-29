<!-- comments -->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">


<?php

//     $redirect= "https://www3883.ssldomain.com/DomainID190799/".$_SERVER['REQUEST_URI'];
//     header("Location:$redirect");

	
$updatesub_key = $_GET["updatesub_key"];
$subscriptionID = $_GET["subscriptionID"];

//echo 

		$hostname = "MySQLB2.webcontrolcenter.com";
		$dbName = "sptm";
		$username = "nitish";
		$password = "rangeela";
		MYSQL_CONNECT($hostname, $username, $password) OR DIE("DB connection unavailable now");
		mysql_select_db( "$dbName") or die( "Unable to select database");
		

		
// Fetch the current value of cartID from the subscriptionID received
$result = mysql_query("SELECT invoiceNumber, ARB_startDate, ARB_cardNumber, amount, ARB_successfulPayments FROM cartARB WHERE response_subscriptionID = '$subscriptionID' AND updatesub_key = '$updatesub_key'") or die('Query failed: ' . mysql_error() . '<br><br># Internal Error 03');
$row = mysql_fetch_assoc($result);
// print_r($row);

$amount = $row['amount'];	
$ARB_successfulPayments = $row['ARB_successfulPayments'];
$cardNumber = $row['ARB_cardNumber'];
$invoiceNumber = $row['invoiceNumber'];
$ARB_startDate = $row['ARB_startDate'];


	
//If user directly came to this page, the invoice no. and/or the amount would be missing. In which case, redirect them to semiprecious.com

if (!$amount || !$invoiceNumber)
	{
		header ("location: http://www.semiprecious.com"); 
	}


?>


<?php include('vdaemon/vdaemon.php'); ?>

<html>
<head>
<title>Authorize.Net ARB Payment gateway</title>

<style type="text/css">
<!--
.error {
    color: #AA0000
}
.controlerror {
    background-color: #ffffdd;
    border: 1px solid #AA0000;
}
-->
</style>

<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link rel="stylesheet" type="text/css" href="CSS/upc.css">

<script language="JavaScript" src="jscripts/upc.js"></script>
<script language="JavaScript" src="jscripts/overlib.js"></script>

<script src="validation.js" type="text/javascript"></script>
<script type="text/javascript">
<!--

function jsExpDateCheck(oStatus)
{
    currDate = new Date();
    year = document.forms["form1"].elements["cc_year"].value;
    month = document.forms["form1"].elements["cc_month"].value;
    if (currDate.getFullYear() > year || (currDate.getFullYear() == year && currDate.getMonth() + 1 > month))
    {
        oStatus.isvalid = false;
        oStatus.errmsg = "Check the Expiration Date of the Credit Card";
    }
}
 
-->
</script>
<!--
<script type="text/javascript" language="javascript">var ANS_customer_id="ef41378d-bba2-4e5a-8e8f-3a413a95f192";</script> <script type="text/javascript" language="javascript" src="//verify.authorize.net/anetseal/seal.js" ></script> 
-->
</head>

<body>

<div id="overDiv" style="position:absolute; visibility:hide; z-index:1;">
</div>


<form method="post" name="form1" action="subscription_update.php" runat="vdaemon">
  <br>
  
<table width="500" align="center" cellpadding="4" cellspacing="0" class="border_configuration">
    <tr align="left" valign="top" bgcolor="#FFFFFF"> 
      <td colspan="3" bgcolor="666666" class="header"><div align="center"><b> 
          UPDATE PAYMENT INFORMATION</b></div></td>
    </tr>
    
   
    <tr align="left" valign="top" bgcolor="f0f0f0" > 
      <td width="171" class="field_name" ><a href="#" onMouseOver="overlib('The Subscription ID of your Automatic Recurring Billing subscription.', CAPTION, 'Subscription ID', HEIGHT, 30, LEFT, BELOW, SNAPX, 20, SNAPY, 5); return true;" onMouseOut="nd(); return true;"><img src="images/info_icon.gif" border="0"></a> 
		 Subscription ID: </td>
	<td colspan="2"><input disabled value="<?php echo $subscriptionID; ?>">
		<input type="hidden" name="subscriptionID" value="<?php echo $subscriptionID; ?>">
	</td>
    </tr>
    


 	<tr align="left" valign="top" bgcolor="f0f0f0" > 
      <td width="171" class="field_name" ><a href="#" onMouseOver="overlib('Subscription amount to be charged for this order (in US Dollars).', CAPTION, 'Subscription Amount', HEIGHT, 30, LEFT, BELOW, SNAPX, 20, SNAPY, 5); return true;" onMouseOut="nd(); return true;"><img src="images/info_icon.gif" border="0"></a> 
          Subscription Amount: </td>
	<td colspan="2"><input disabled value="<?php echo "$".$amount; ?>">
				<input type="hidden" name="sub_amount" value="<?php echo $amount; ?>">
			
			<div><br>Your old card no. xxxx<?php echo $cardNumber; ?> has already been charged <?php echo $ARB_successfulPayments; ?> time(s).<br><br>
			Your new card will be charged as per the following Billing Schedule:<br>
				 
				    
				    <?php if ($ARB_successfulPayments == 0)
				    	{
				    	 	echo "$".$amount; ?>: <b> Today </b><br>
				    <?php	echo "$".$amount.": ".date("F j, Y", mktime(0,0,0,date("m")+1,date("d"),date("Y"))); ?><br>
				    <?php	echo "$".$amount.": ".date("F j, Y", mktime(0,0,0,date("m")+2,date("d"),date("Y"))); 
				    	}?>
				    	
				    
				    <?php if ($ARB_successfulPayments == 1)
				    	{
				    	 	echo "$".$amount; ?>: <b> Today </b><br>
				    <?php	echo "$".$amount.": ".date("F j, Y", mktime(0,0,0,date("m")+1,date("d"),date("Y")));
				    	}?>

				    
				    <?php if ($ARB_successfulPayments == 2)
				    	{
				    	 	echo "$".$amount; ?>: <b> Today </b><br>
				   
				    <?php }?>
				    	
				    <br>
				    
			</div>
	</td>
    </tr>
 
     <tr align="left" valign="top" bgcolor="f0f0f0" > 
      <td width="171" class="field_name" ><a href="#" onMouseOver="overlib('Date on which the order was placed on semiprecious.com', CAPTION, 'Order Date', HEIGHT, 30, LEFT, BELOW, SNAPX, 20, SNAPY, 5); return true;" onMouseOut="nd(); return true;"><img src="images/info_icon.gif" border="0"></a> 
		 Order Date: </td>
	<td colspan="2"><input disabled value="<?php echo $ARB_startDate; ?>">

	</td>
    </tr>
    
    <tr align="left" valign="top" bgcolor="f0f0f0"> 
      <td class="field_name"><a href="#" onMouseOver="overlib('Invoice number, or the Cart ID for the reference of this order.', CAPTION, 'Invoice no. / Cart ID', HEIGHT, 30, LEFT, BELOW, SNAPX, 20, SNAPY, 5); return true;" onMouseOut="nd(); return true;"><img src="images/info_icon.gif" border="0"></a> 
          Invoice No.:</td>
<td colspan="2"><input disabled value="<?php echo $invoiceNumber ?>">
				<input type="hidden" name="invoiceNumber" value="<?php echo $invoiceNumber; ?>">
	</td>
    </tr>
				
    <tr align="left" valign="top" bgcolor="f0f0f0"> 
      <td class="field_name"><a href="#" onMouseOver="overlib('Brief description of the order.', CAPTION, 'Description', HEIGHT, 20, LEFT, BELOW, SNAPX, 20, SNAPY, 5); return true;" onMouseOut="nd(); return true;"><img src="images/info_icon.gif" border="0"></a> 
          Description:</td>
<td colspan="2"><input disabled size="50" value="Semiprecious.com Jewelry">
				<input type="hidden" name="name" size="50" value="Semiprecious.com Jewelry">
	</td>
    </tr>
    
    			<input type="hidden" name="cart" value="<?php echo $cart; ?>">
    <!--

    
  -->
 
  <br>
<br>
  <table width="500" align="center" cellpadding="4" cellspacing="0" class="border_configuration">
    <br>
    <tr align="left" valign="top" bgcolor="#FFFFFF"> 
      <td colspan="2" bgcolor="666666" class="header"><div align="center"><b> 
          CREDIT CARD INFORMATION</b></div></td>
    </tr>
    <tr align="left" valign="top" bgcolor="f0f0f0"> 
      <td width="145" class="field_name">&nbsp;</td>
      <td width="337"><img src="images/cclogos2.gif" width="200" height="30"></td>
    </tr>
    
    <tr align="left" valign="top" bgcolor="f0f0f0"> 
      <td class="field_name">
      <vllabel validators="cardNumber_required,cardNumber_syntax" errclass="error" for="cardNumber" cerrclass="controlerror">Credit Card Number:</vllabel>
      </td>
<td><input type="text" name="cardNumber" maxLength="16" size="20" id="cardNumber" lang="Credit Card Number Required" value="xxxxxxxxxxxxxxxx"></td>
    <vlvalidator name="cardNumber_required" type="required" control="cardNumber" errmsg="'Credit Card Number' is required">
    <vlvalidator name="cardNumber_syntax" type="regexp" control="cardNumber" errmsg="'Credit Card Number' is not valid" regexp="/^(?:4[0-9]{12}(?:[0-9]{3})?|5[1-5][0-9]{14}|6011[0-9]{12}|622((12[6-9]|1[3-9][0-9])|([2-8][0-9][0-9])|(9(([0-1][0-9])|(2[0-5]))))[0-9]{10}|64[4-9][0-9]{13}|65[0-9]{14}|3(?:0[0-5]|[68][0-9])[0-9]{11}|3[47][0-9]{13})*$/">
    </tr>
    
    <tr align="left" valign="top" bgcolor="f0f0f0"> 
      <td class="field_name">
      <vllabel validators="cc_month_required" errclass="error" for="cc_month" cerrclass="controlerror">Expiration Date:</vllabel>
      <vllabel validators="cc_year_required" errclass="error" for="cc_year" cerrclass="controlerror"></vllabel>
      </td>
      <td><select name="cc_month">
          <option >-- Select Option --</option>
          <option value="01">01 - January</option>
          <option value="02">02 - February</option>
          <option value="03">03 - March</option>
          <option value="04">04 - April</option>
          <option value="05">05 - May</option>
          <option value="06">06 - June</option>
          <option value="07">07 - July</option>
          <option value="08">08 - August</option>
          <option value="09">09 - September</option>
          <option value="10">10 - October</option>
          <option value="11">11 - November</option>
          <option value="12">12 - December</option>
        </select> <select name="cc_year">
          <option >-- Select Option --</option>
	<?php
    	// Set the year to be the current year up to ten years from now
    	for ($i = date("Y"); $i < date("Y") + 10; $i++)
    	{echo "<option value=\"" . $i . "\">" . $i . "</option>";}
	?>
  </select>
    <vlvalidator name="cc_month_required" type="regexp" control="cc_month" errmsg="Select the Expiration Month of the Credit Card" regexp="/\d+/">
    <vlvalidator name="cc_year_required" type="regexp" control="cc_year" errmsg="Select the Expiration Year of the Credit Card" regexp="/\d+/">   
	<vlvalidator name="ExpDate" type="custom" errmsg="Check the Expiration Date of the Credit Card" function="phpExpDateCheck" clientfunction="jsExpDateCheck">
  </td>
  
    </tr>
    <tr align="left" valign="top" bgcolor="f0f0f0">
      <td class="field_name">
      <vllabel validators="card_code_required,card_code_syntax" errclass="error" for="card_code" cerrclass="controlerror">Card Code: </vllabel>
      <a href="#" onClick="window.open('pop_card_code.htm','','width=650,height=400')">What is this?</a>
      </td>
        
      <td><input type="text" name="card_code" maxLength="4" size="4">
      	<vlvalidator name="card_code_required" type="required" control="card_code" errmsg="'Card Code' is required"></vlvalidator>
      	<vlvalidator name="card_code_syntax" type="regexp" control="card_code" errmsg="'Card Code' is invalid" regexp="/^[0-9]{3,4}$/"></vlvalidator>
      </td>
    </tr>
  </table>
  <br>
  <table width="500" border="0" align="center" cellpadding="2" cellspacing="1">
    <tr><td width="254"<vlsummary class="error" headertext="Please correct the following error(s):" displaymode="bulletlist"></td></tr>
  </table>
  
  <table width="500" border="0" align="center" cellpadding="2" cellspacing="1">
  <td width="154"><input class="form_button" type="submit" name="upc_submit" value="< Submit Information >" ></td>
      <td width="346"> <input class="form_button" type="reset" name="reset" value="< Clear Form >"></td>
    </tr>
  </table>

  <br>
  <table width="500" border="0" align="center" cellpadding="2" cellspacing="1">
    <tr> 
     <td width="154"><!-- (c) 2005, 2009. Authorize.Net is a registered trademark of CyberSource Corporation --> <div class="AuthorizeNetSeal"> <script type="text/javascript" language="javascript">var ANS_customer_id="ef41378d-bba2-4e5a-8e8f-3a413a95f192";</script> <script type="text/javascript" language="javascript" src="//verify.authorize.net/anetseal/seal.js" ></script> <a href="http://www.authorize.net/" id="AuthorizeNetText" target="_blank">Online Payments</a> </div></td>
     <td width="346">&nbsp; </td>
    </tr>

 
  </table>
  <input type="hidden" name="subscription_type" value="create">

</form>

</body>
</html>

<?php VDEnd(); ?>