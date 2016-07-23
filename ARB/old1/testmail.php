<?php

// Mail settings for outgoing mail.
ini_set("SMTP","mail.semiprecious.com");
ini_set("smtp_port","25");
ini_set('sendmail_from', 'cs@semiprecious.com');
 $a = "76.76";


	$to = "nullyn@gmail.com";
	$subject = "ARB subscription ID ".$fields[x_subscription_id]." first installment received";
$message = "Hi!\n
This is the silentpost.php script writing. I just received a ping from Authorize.net\n
regarding ARB subscription ID . This subscription has been approved\n
and the first of three installments of $$a have been received.\n
Consequently, the table 'items' and 'buyingrecord' for the said cartID \n
have been indented with the respective quantities.\n
You may check the ARB details in the table 'cartARB' in 'sptm' database, as well as thru Authroize.net's website.\n
Thanks and have a nice day!";
	
	$from = "cs@semiprecious.com";
	$headers = "From: $from";

	// Mail function that sends the email.
	mail($to,$subject,$message,$headers);

?>

