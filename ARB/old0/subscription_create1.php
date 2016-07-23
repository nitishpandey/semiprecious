<?php
// Set headers for cache control
session_cache_limiter( 'nocache' );
session_start();
header( 'Cache-Control: no-cache, must-revalidate, post-check=0, pre-check=0' );


define('VDAEMON_PARSE', false);
include('vdaemon/vdaemon.php');

include ("data.php");
include ("authnetfunction.php");

/*
// MAKE A CONNECTION TO THE DATABASE
		$hostname = "localhost";
		$dbName = "weissnatso_semiprecious";
		$username = "weissnatso";
		$password = "nbjxrnqhpbtb";
		// $usertable = "verify_cron_log"; 
		MYSQL_CONNECT($hostname, $username, $password) OR DIE("DB connection unavailable now");
		@mysql_select_db( "$dbName") or die( "Unable to select database"); */

// Server side validation of credit card's expiry date check (if it has already expired) using vdaemon's library
function phpExpDateCheck($sValue, &$oStatus)
{
    $nMonth = $_POST['cc_month'];
    $nYear  = $_POST['cc_year'];
    $nCurrMonth = date('m');
    $nCurrYear  = date('Y');
    
    if ($nCurrYear > $nYear || ($nCurrYear == $nYear && $nCurrMonth > $nMonth))
    {
        $oStatus->bValid = false;
        $oStatus->sErrMsg = "Check the Expiration Date of the Credit Card";
    }
}


//gather and define POST variables
$amount = $_POST["sub_amount"]; //This is the subscription amount (per month for 3 months), NOT the total order amount.
//$refId = $_POST["refId"];
$name = $_POST["name"];
$length = "1"; //$_POST["length"]; // This value is hard-coded right now.
$unit = "months"; //$_POST["unit"]; // This value is hard-coded right now.
$startDate = date("Y-m-d"); //$_POST["startDate"]; // Today's date.
$totalOccurrences = "3"; //$_POST["totalOccurrences"]; // This value is hard-coded right now.
//$trialOccurrences = $_POST["trialOccurrences"];
//$trialAmount = $_POST["trialAmount"];
$cardNumber = $_POST["cardNumber"];
$expirationDate = $_POST["cc_year"]."-".$_POST["cc_month"];

$invoiceNumber = $_POST["invoiceNumber"];
$description = $_POST["description"];

$billing_firstName = $_POST["billing_firstName"];
$billing_lastName = $_POST["billing_lastName"];
$billing_company = $_POST["billing_company"];
$billing_address = $_POST["billing_address"];
$billing_city = $_POST["billing_city"];
$billing_state = $_POST["billing_state"];
$billing_state_ous = $_POST["billing_state_ous"]; //Outside US		
$billing_zip = $_POST["billing_zip"];
$billing_country = $_POST["billing_country"];

	//Set proper billing state
	if ($billing_state == "OUS")
		{ $billing_state = $billing_state_ous; }


$phoneNumber = $_POST["phoneNumber"];
$email = $_POST["email"];

$shipping_firstName = $_POST["shipping_firstName"];
$shipping_lastName = $_POST["shipping_lastName"];
$shipping_company = $_POST["shipping_company"];
$shipping_address = $_POST["shipping_address"];
$shipping_city = $_POST["shipping_city"];
$shipping_state = $_POST["shipping_state"];
$shipping_state_ous = $_POST["shipping_state_ous"]; //Outside US
$shipping_zip = $_POST["shipping_zip"];
$shipping_country = $_POST["shipping_country"];

	//Set proper billing state
	if ($shipping_state == "OUS")
		{ $shipping_state = $shipping_state_ous; }

//If user directly came to this page, the invoice no. and/or the amount would be missing. In which case, redirect them to semiprecious.com
if (!$amount || !$invoiceNumber)
	{
		header ("Location: http://www.semiprecious.com/confirmation.cfm"); 
	}


//build xml to post
$content =
	    "<?xml version=\"1.0\" encoding=\"utf-8\"?>" .
        "<ARBCreateSubscriptionRequest xmlns=\"AnetApi/xml/v1/schema/AnetApiSchema.xsd\">" .
        "<merchantAuthentication>".
        	"<name>" . $loginname . "</name>".
        	"<transactionKey>" . $transactionkey . "</transactionKey>".
        "</merchantAuthentication>".
		"<subscription>".
        	"<name>" . $name . "</name>".
        	"<paymentSchedule>".
        		"<interval>".
        			"<length>". $length ."</length>".
       				"<unit>". $unit ."</unit>".
       			"</interval>".
        		"<startDate>" . $startDate . "</startDate>".
        		"<totalOccurrences>". $totalOccurrences . "</totalOccurrences>".
       		"</paymentSchedule>" .
        	"<amount>" . $amount ."</amount>".
   			"<payment>" .
        		"<creditCard>".
        			"<cardNumber>" . $cardNumber . "</cardNumber>".
        			"<expirationDate>" . $expirationDate . "</expirationDate>".
       			"</creditCard>".
        	"</payment>".
        	"<order>" .
        			"<invoiceNumber>". $invoiceNumber . "</invoiceNumber>".
        	"</order>" .
        	"<customer>".
        		"<email>" . $email . "</email>".
        		"<phoneNumber>" . $phoneNumber . "</phoneNumber>".
        	"</customer>".
        	"<billTo>" .
        		"<firstName>". $billing_firstName . "</firstName>".
        		"<lastName>" . $billing_lastName . "</lastName>".
        		"<company>" . $billing_company . "</company>".
        		"<address>" . $billing_address . "</address>".
        		"<city>" . $billing_city . "</city>".
        		"<state>" . $billing_state . "</state>".
        		"<zip>" . $billing_zip . "</zip>".
        		"<country>" . $billing_country . "</country>".
        	"</billTo>".
        	"<shipTo>".
        		"<firstName>". $shipping_firstName . "</firstName>".
        		"<lastName>" . $shipping_lastName . "</lastName>".
        		"<company>" . $shipping_company . "</company>".
        		"<address>" . $shipping_address . "</address>".
        		"<city>" . $shipping_city . "</city>".
        		"<state>" . $shipping_state . "</state>".
        		"<zip>" . $shipping_zip . "</zip>".
        		"<country>" . $shipping_country . "</country>".
        	"</shipTo>".
        "</subscription>".
        "</ARBCreateSubscriptionRequest>";


//send the xml via curl
$response = send_request_via_curl($host,$path,$content);

//if curl is unavilable try using fsockopen
// $response = send_request_via_fsockopen($host,$path,$content);

//if the connection and send worked $response holds the return from Authorize.net. ECHOEs TURNED-OFF for LIVE SERVER.


// TURNED-OFF for LIVE SERVER:
// echo $content;

if ($response)
{

	list ($refId, $resultCode, $code, $text, $subscriptionId)=parse_return($response);
	
	// TURNED-OFF for LIVE SERVER:
	/*
	echo " Response Code: $resultCode <br>";
	echo " Response Reason Code: $code<br>";
	echo " Response Text: $text<br>";
	// echo " Reference Id: $refId<br>";
	echo " Subscription Id: $subscriptionId <br><br>";
	echo " Data has been written to data.log<br><br>";
	echo $loginname;
	echo "<br />";
	echo $transactionkey;
	echo "<br />";
  
  echo "amount:";
  echo $amount;
  echo "<br \>";
 
  
  echo "name:";
  echo $name;
  echo "<br \>";
  
  echo "amount: ";
  echo $HTTP_POST_VARS[amount];
  echo "<br \>";
  echo "<br \>";
  //echo $content;
  echo "<br \>";
  echo "<br \>";
	
$fp = fopen('data.log', "a");
fwrite($fp, "$refId\r\n");
fwrite($fp, "$subscriptionId\r\n");
fwrite($fp, "$amount\r\n");
fclose($fp);*/

}


else { 
		// TURNED-OFF for LIVE SERVER:
		// echo "Transaction Failed. <br>";
	 }


/* // ########### INSERT INTO THE DATABASE THE TRANSACTION DETAILS #############
// Process some of the values above for inserting into the record.
// Trim the credit card no. to the last 4 digits.
$cardNumber_last4 = substr($cardNumber,-4);

mysql_query("REPLACE INTO cartARB VALUES ('$invoiceNumber', now(), '$amount', '$length', '$startDate', '$totalOccurrences', '$cardNumber_last4',
			'$expirationDate', '$email', '$phoneNumber', '$billing_firstName', '$billing_lastName', '$billing_address','$billing_city',
			'$billing_state', '$billing_zip', '$billing_country', '$shipping_firstName', '$shipping_lastName', '$shipping_address',
			'$shipping_city', '$shipping_state', '$shipping_zip', '$shipping_country', '$resultCode', '$code', '$text', '$subscriptionId')")
			or die('Query failed: ' . mysql_error() . '<br><br># Internal Error 155');
*/

?>






<html>

<head>

<title>&lt;Authorize.Net ARB Subscription&gt;</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link type="text/css" rel="stylesheet" href="CSS/upc.css"> 

</head>

<body>
<br>
<table width="500" align="center" cellpadding="4" cellspacing="0" class="border_configuration">
  	<tr align="left" valign="top" bgcolor="#FFFFFF"> 
    	<td colspan="3" bgcolor="666666" class="header"><div align="center"><b> SUBSCRIPTION 
       		 ORDER REQUEST</b></div></td>
  	</tr>

	<tr align="left" valign="top" bgcolor="f0f0f0"> 
   	 	<td width="124" class="field_name" ><div align="left">Invoice no.:</div></td>
    	<td width="361" colspan="2"><?php echo $invoiceNumber; ?></td>
  	</tr>
  	
  	<tr align="left" valign="top" bgcolor="f0f0f0"> 
   	 	<td width="124" class="field_name" ><div align="left">Merchant:</div></td>
    	<td width="361" colspan="2">Semiprecious.com</td>
  	</tr>	
  	
  	<tr align="left" valign="top" bgcolor="f0f0f0"> 
   	 	<td width="124" class="field_name" ><div align="left">Subscription Amount:</div></td>
    	<td width="361" colspan="2"><?php echo "$".$amount; ?> (Recurring)</td>
  	</tr>				
  					
 	<?php  
 		if ($code == "I00001")
 			{
 				echo"<tr align=\"left\" valign=\"top\" bgcolor=\"f0f0f0\"> 
   	 				<td width=\"121\" class=\"field_name\" ><div align=\"left\">Subscription ID:</div></td>
    				<td width=\"361\" colspan=\"2\"> <b>". $subscriptionId. "</b></td>
  					</tr>";
 			}
 				
	?>
 
	<tr align="left" valign="top" bgcolor="f0f0f0" > 
   	 	<td width="124" class="field_name" ><div align="left">Subscription Status:</div></td>
    	<td width="361" colspan="2"><?php
    									if ($code == "I00001") echo "<b>Order sent for subscription approval.</b>";
    									
    									elseif ($code == "E00012")
  											{
  												echo "<b>Order pending subscription approval.</b><br>
  												<i>".$text."<i></td></tr>";
  											}
  					
    									else 
    										{
    											echo "<b>Error in processing order.</b><br>";
    											echo"<tr align=\"left\" valign=\"top\" bgcolor=\"f0f0f0\"> 
   	 												 <td width=\"121\" class=\"field_name\" ><div align=\"left\">Error Reason:</div></td>
    									 			 <td width=\"361\" colspan=\"2\"> <i>". $text. "</i></td>
  													 </tr>";
    										}
    										
    								?>
    	</td>
  	</tr>
  	

</table>
	<br>

<table width="500" align="center" cellpadding="4" cellspacing="0" class="border_configuration">
  	
  	<tr align="left" valign="top" bgcolor="f0f0f0" > 
    	<td  class="field_name" ><div align="left"></div></td>
    	<td  class="field_name" ><p><strong>What's Next?</strong></p>      </td>
  	</tr>

    						  
  	<?php
  				$codes_range = array("E00013", "E00014", "E00015", "E00016", "E00018", "E00019", "E00020");

  				if ($code == "I00001")
  					{
  						echo "<tr align=\"left\" valign=\"top\" bgcolor=\"f0f0f0\" > 
    						  <td height=\"29\" align=\"center\" valign=\"middle\" class=\"field_name\" ><img src=\"images/arrow.gif\"></td>
    						  <td class=\"field_name\" >Your billing subscription request has been sent for subscription approval.<br>It usually takes less than
    						  24 hours for the approval process. You will receive an e-mail as soon as it's done. Once approved, your
    						  order will be despatched immediately upon fulfillment.</td>";
  						
  						echo "<tr align=\"left\" valign=\"top\" bgcolor=\"f0f0f0\" > 
    						  <td height=\"29\" align=\"center\" valign=\"middle\" class=\"field_name\" ><img src=\"images/arrow.gif\"></td>
    						  <td class=\"field_name\" >You may want to Print this page for your records. Remember to mention the Subscription ID
    						  and the Invoice no. in your communications with us for this order.</td>";
  						
  					}
  				
  				elseif ($code == "E00012")
  					{
  						echo "<tr align=\"left\" valign=\"top\" bgcolor=\"f0f0f0\" > 
    						  <td height=\"29\" align=\"center\" valign=\"middle\" class=\"field_name\" ><img src=\"images/arrow.gif\"></td>
    						  <td class=\"field_name\" >Your billing subscription request has <u>ALREADY</u> been sent for approval.<br>
    						  It usually takes less than 24 hours for the approval process. You will receive an e-mail as soon as it's done. Once approved, your
    						  order will be despatched immediately upon fulfillment.</td>";
    						  
    					echo "<tr align=\"left\" valign=\"top\" bgcolor=\"f0f0f0\" > 
    						  <td height=\"29\" align=\"center\" valign=\"middle\" class=\"field_name\" ><img src=\"images/arrow.gif\"></td>
    						  <td class=\"field_name\" >
    						  Click on the 'Continue' button below to continue to Semiprecious.com</td>";	  
  						
  					}
  				elseif (in_array($code, $codes_range))
  					{
  						echo "<tr align=\"left\" valign=\"top\" bgcolor=\"f0f0f0\" > 
    						  <td height=\"29\" align=\"center\" valign=\"middle\" class=\"field_name\" ><img src=\"images/arrow.gif\"></td>
    						  <td class=\"field_name\" >Oops! Looks like there was a problem in filling-out the payment form.<br>
    						  Click on the 'Back' button below, to go back to the payment form and make the necessary corrections.</td>";
  					
  					}
  			
  				else
  					{
  						echo "<tr align=\"left\" valign=\"top\" bgcolor=\"f0f0f0\" > 
    						  <td height=\"29\" align=\"center\" valign=\"middle\" class=\"field_name\" ><img src=\"images/arrow.gif\"></td>
    						  <td class=\"field_name\" >The system is experiencing technical issues. The error has been logged.<br>
    						  We apologize for the inconvenience caused. Please e-mail us at <a href=\"mailto:cs@semiprecious.com?subject=ARB Gateway Critical Error\">
    						  cs@semiprecious.com</a> and let us know what happened.</td>";
  					
  						echo "<tr align=\"left\" valign=\"top\" bgcolor=\"f0f0f0\" > 
    						  <td height=\"29\" align=\"center\" valign=\"middle\" class=\"field_name\" ><img src=\"images/arrow.gif\"></td>
    						  <td class=\"field_name\" >Click on the 'Continue' button below to go back to Semiprecious.com and select a different Checkout method.</td>";	
  					
  					}
  	?>
  	
  	<tr align="left" valign="top" bgcolor="f0f0f0" > 
    	<td height="29" align="center" valign="middle" class="field_name" ><img src="images/arrow.gif"></td>
    	<td class="field_name" >Need help? <a href="mailto:cs@semiprecious.com?subject=ARB Gateway Form">E-mail us</a> or Call us on (phone) 
    	and we'll take care of any issues you might be having.</td>
  	</tr>

</table>

<?php
	if ($code == "I00001") //Send the user to
			{
				echo "<center><p><input type=\"button\" name=\"Print\" value=\"Print\" onClick=\"window.print()\">
				<p><p><input type=\"button\" name=\"Continue\" value=\"CONTINUE\" onClick=\"
				location.href='http://www.semiprecious.com/ARB/arbmailer.cfm?invoiceNumber=$inVoiceNumber&amount=$amount&subscriptionId=$subscriptionId'
				\"></p></p></p></center>";
			}
			
	elseif ($code == "E00012")
			{
				echo "<center><p><input type=\"button\" name=\"Continue\" value=\"CONTINUE\" onClick=\"location.href='http://www.semiprecious.com/emptycart.cfm'\"></p></center>";
			}
			
	elseif (in_array($code, $codes_range))
			{
				echo "<center><p><input type=\"button\" name=\"Back\" value=\"Back\" onClick=\"javascript:history.go(-1);\"></p></center>";
			}

	else { echo "<center><p><input type=\"button\" name=\"Continue\" value=\"CONTINUE\" onClick=\"location.href='http://www.semiprecious.com/confirmation.cfm'\"></p></center>";}
?>



</body>


</html>

