<?php
header( 'Cache-Control: no-cache, must-revalidate, post-check=0, pre-check=0' );

// Mail settings for outgoing mail.
ini_set("SMTP","mail.semiprecious.com");
ini_set("smtp_port","25");
ini_set('sendmail_from', 'cs@semiprecious.com');


echo "hi";


// $_REQUEST = array ('x_subscription_paynum' => '1', 'x_subscription_id' => '5682926', 'x_response_code' => '1');


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
		//echo "arb is true";
	}
}

print_r($fields);

		$hostname = "MySQLB2.webcontrolcenter.com";
		$dbName = "sptm";
		$username = "nitish";
		$password = "rangeela";
		MYSQL_CONNECT($hostname, $username, $password) OR DIE("DB connection unavailable now");
		mysql_select_db( "$dbName") or die( "Unable to select database");
		


// If it is an ARB transaction, do something with it
if ($arb == true && $fields['x_response_code'] != 1)
{
	
	mysql_query("UPDATE cartARB SET x_response='DECLINED' WHERE response_subscriptionID = '$fields[x_subscription_id]'") or die('Query failed: ' . mysql_error() . '<br><br># Internal Error 04');
	
	//Send an e-mail to admin (anup) informing about the 
	// Set parameters of the email
	$to = "anup@semiprecious.com";
	$subject = "ARB Subscription ID ".$fields[x_subscription_id]." DECLINED.";
$message = "Hi!\n
This is the silentpost.php script writing. I just received a ping from Authorize.net\n
regarding ARB subscription ID $fields[x_subscription_id]. This subscription has been Declined.\n
You may check the full ARB details in the table 'cartARB' in 'sptm' DB, as well as thru Authorize.net's website.\n
Thanks and have a nice day!";
	
	$from = "cs@semiprecious.com";
	$headers = "From: $from";

	// Mail function that sends the email.
	mail($to,$subject,$message,$headers);
	mail("nullyn@gmail.com",$subject,$message,$headers);

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
	$to = "anup@semiprecious.com";
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
	$headers = "From: $from";

	// Mail function that sends the email.
	mail($to,$subject,$message,$headers);
	mail("nullyn@gmail.com",$subject,$message,$headers);
	

	}
	
}

else
{
	mysql_query("REPLACE INTO _test VALUES (now(), '$fields[x_subscription_id]', '$fields[x_response_code]')") or die('Query failed: ' . mysql_error() . '<br><br># Internal Error 06');
}



?>


        
         