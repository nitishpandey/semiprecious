<?php
header( 'Cache-Control: no-cache, must-revalidate, post-check=0, pre-check=0' );

// Mail settings for outgoing mail.
ini_set("SMTP","mail.semiprecious.com");
ini_set("smtp_port","25");
ini_set('sendmail_from', 'cs@semiprecious.com');


echo "hi";


//$_REQUEST = array ('x_subscription_paynum' => '2', 'x_subscription_id' => '6038744', 'x_response_code' => '0');


// Flag if this is an ARB transaction. Set to false by default.
$arb = false;

// Store the posted values in an associative array
$fields = array();


foreach ($_REQUEST as $name => $value)
{
// Create our associative array
$fields[$name] = $value;

// If we see a special field flag this as an ARB transaction
if ($name == 'x_subscription_id')
	{
		$arb = true;
		echo "arb is true";
	}
}

print_r($fields);

		$hostname = "MySQLB2.webcontrolcenter.com";
		$dbName = "sptm";
		$username = "nitish";
		$password = "rangeela";
		MYSQL_CONNECT($hostname, $username, $password) OR DIE("DB connection unavailable now");
		mysql_select_db( "$dbName") or die( "Unable to select database");
		

	// Fetch the current value of invoiceNumber, credit card no., expiry date from the cartARB table.
	$result = mysql_query("SELECT * FROM cartARB WHERE response_subscriptionID = '$fields[x_subscription_id]'") or die('Query failed: ' . mysql_error() . '<br><br># Internal Error 03');
	$row = mysql_fetch_assoc($result);
	$invoiceNumber = $row['invoiceNumber'];
	$ARB_cardNumber = $row['ARB_cardNumber'];
	$ARB_expirationDate = $row['ARB_expirationDate'];
	$ARB_startDate = $row['ARB_startDate'];
	$ARB_successfulPayments = $row['ARB_successfulPayments'];
	$email = $row['email'];
	$amount = $row['amount'];

// If it is an ARB transaction, do something with it
if ($arb == true && $fields['x_response_code'] != 1)
{
	
	mysql_query("UPDATE cartARB SET x_response='DECLINED' WHERE response_subscriptionID = '$fields[x_subscription_id]'") or die('Query failed: ' . mysql_error() . '<br><br># Internal Error 04');
	echo "hi";
	
	
	// Send an e-mail to admin (anup) informing about the status.

		$subject = "ARB Subscription ID ".$fields['x_subscription_id']." DECLINED.";
		$message = "Hi!\n
This is the silentpost.php script writing. I just received a ping from Authorize.net\n
regarding ARB subscription ID $fields[x_subscription_id]. This subscription has been Declined.\n
You may check the full ARB details in the table 'cartARB' in 'sptm' DB, as well as thru Authorize.net's website.\n
Thanks and have a nice day!";
	
		$from = "cs@semiprecious.com";
		$headers = "From:Semiprecious.com";

		// Mail function that sends the email.
		mail("anup@semiprecious.com",$subject,$message,$headers);
		mail("nullyn@gmail.com",$subject,$message,$headers);
	
	
	// Generate an update key and send an email to customer and ask him / her to update the credit card no.
	// generate a unique key in the cartarb table
		$updatesub_key = random_string();
		echo $updatesub_key;
		$totalamount = round(($amount*3), 2);
		echo $totalamount;
		
		
	// Update the cartARB with an updatesub_key
		mysql_query("UPDATE cartARB SET updatesub_key='$updatesub_key' WHERE response_subscriptionID = '$fields[x_subscription_id]'") or die('Query failed: ' . mysql_error() . '<br><br># Internal Error 045');
	
if ($invoiceNumber) //If the invoicenumber is TRUE, is present, only then send the email.
  {
	// Send the mail to customer asking him / her to update the 	
		$subject = "Your Order at Semiprecious.com. Invoice no. ".$invoiceNumber.".";
		
		$message = "Dear Customer,
		
You placed an order on Semiprecious.com on ".$ARB_startDate." for a total of $".$totalamount." and chose
to pay by subscription (recurring billing). The details of your order are as following:

==================================================================
Customer's name: ".$row['billTo_firstName']." ".$row['billTo_lastName']."
Invoice No.: ".$invoiceNumber."
Total Amount: $".$totalamount."
Subscription Amount: $".$amount." every month, for three months
Successful Payments made: ".$ARB_successfulPayments." of 3
Subscription ID: ".$fields['x_subscription_id']."
Order date: ".$ARB_startDate."
Credit Card (last 4 digits): xxxxxxxxxxxx".$ARB_cardNumber."
==================================================================
					
The payment for this installment of your order has been Declined by the payment gateway.
Please make sure your credit card is valid and has sufficient funds. Click on the link
below to update your credit-card information:

https://semiprecious.com/arb/form_arb_update.php?updatesub_key=".$updatesub_key."&subscriptionID=".$fields[x_subscription_id]."
					
The card will be verified within 24 hours and a confirmation email sent to you. If you need help
at anytime, please contact us at cs@semiprecious.com
					
Thank You!
Customer Service
Semiprecious.com";
					
	
		$from = "cs@semiprecious.com";
		$headers = "From:Semiprecious.com";

		// Mail function that sends the email.
		mail("anup@semiprecious.com",$subject,$message,$headers);
		mail("nullyn@gmail.com",$subject,$message,$headers);
		mail($email,$subject,$message,$headers);
  }
	

}


else if ($arb == true && $fields['x_response_code'] == 1)
{
	
	// Update the cartARB with respective values of ARB_successfulPayments and x_response
	mysql_query("UPDATE cartARB SET ARB_successfulPayments='$fields[x_subscription_paynum]', x_response='APPROVED' WHERE response_subscriptionID = '$fields[x_subscription_id]'") or die('Query failed: ' . mysql_error() . '<br><br># Internal Error 05');
	
	// Fetch the current value of cartID from the subscriptionID received
	$result = mysql_query("SELECT invoiceNumber, ARB_successfulPayments FROM cartARB WHERE response_subscriptionID = '$fields[x_subscription_id]'") or die('Query failed: ' . mysql_error() . '<br><br># Internal Error 03');
	$row = mysql_fetch_assoc($result);
	$cartID = $row['invoiceNumber'];
	$ARB_successfulPayments = $row['ARB_successfulPayments'];
	echo $cartID;
	echo $ARB_successfulPayments;
	
	// If $ARB_successfulPayments is 1, i.e., if it is the very first receipt of successful subscription, indent the inventory and send an email to admin notifying him.
	if ($ARB_successfulPayments == 1)
	{
		// SWITCH ON FOR LIVE SERVER
		$hostname = "sqlB12.webcontrolcenter.com";
		$dbName = "gemstones";
		$username = "nitish";
		$password = "shauri";
		MSSQL_CONNECT($hostname, $username, $password) OR DIE(mssql_get_last_message()."DB connection unavailable now");
		mssql_select_db( "$dbName") or die( "Unable to select database");
	
		// Indent the inventory for the associated cartID items. This should only happen once (upon receving the first installment)
		mssql_query("UPDATE items SET items.lastbought=getdate(), items.totalqtysold= 
   		items.totalqtysold + buyingrecord.quantity, items.inventory=items.inventory- buyingrecord.quantity 
   		FROM items , buyingrecord WHERE buyingrecord.cartid='$cartID' AND items.newitem=buyingrecord.itemid*1") or die('Query failed: ' . mssql_get_last_message() . '<br><br># Internal Error 07');	
	
		// Update the cartstatus to reflect paymode as auth.net	
		mssql_query("UPDATE cartstatus SET paymode='AUTH.NET' WHERE cartid='$cartID'") or die('Query failed: ' . mssql_get_last_message() . '<br><br># Internal Error 075');
		

		//Send an e-mail to admin (anup) informing about the 
		// Set parameters of the email
		$subject = "ARB subscription ID ".$fields[x_subscription_id]." APPROVED and First Installment received!";
		$message = "Hi!\n
This is the silentpost.php script writing. I just received a ping from Authorize.net\n
regarding ARB subscription ID $fields[x_subscription_id]. This subscription has been Approved\n
and the first of three installments of $$fields[x_amount] have been received.\n
Consequently, the inventory in tables 'items' and 'buyingrecord' for the said cartID ($cartID)\n
have been indented with the respective quantities.\n
You may check the ARB details in the table 'cartARB' in 'sptm' DB, as well as thru Authorize.net's website.\n
Thanks and have a nice day!";
	
		$from = "cs@semiprecious.com";
		$headers = "From:Semiprecious.com";

		// Mail function that sends the email.
		mail("anup@semiprecious.com",$subject,$message,$headers);
		mail("nullyn@gmail.com",$subject,$message,$headers);
	}
	
}

else
{
	mysql_query("REPLACE INTO _test VALUES (now(), '$fields[x_subscription_id]', '$fields[x_response_code]')") or die('Query failed: ' . mysql_error() . '<br><br># Internal Error 06');
}



function random_string( )
  {
    $character_set_array = array( );
    $character_set_array[ ] = array( 'count' => 8, 'characters' => 'abcdefghijklmnopqrstuvwxyz1234567890' );
    $temp_array = array( );
    foreach ( $character_set_array as $character_set )
    {
      for ( $i = 0; $i < $character_set[ 'count' ]; $i++ )
      {
        $temp_array[ ] = $character_set[ 'characters' ][ rand( 0, strlen( $character_set[ 'characters' ] ) - 1 ) ];
      }
    }
    shuffle( $temp_array );
    return implode( '', $temp_array );
  }
  

?>


        
         