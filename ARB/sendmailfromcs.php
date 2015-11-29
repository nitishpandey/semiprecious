<?php

// Mail settings for outgoing mail.
ini_set("SMTP","mail.semiprecious.com");
ini_set("smtp_port","25");
ini_set('sendmail_from', 'cs@semiprecious.com');


echo "hi";


	// Send the mail to customer asking him / her to update the 	
		$subject = "Your Order at Semiprecious.com. Invoice no. 65900";
		
		$message = "Dear Customer,
		
You placed an order on Semiprecious.com on 2010-01-16 for a total of $174.63 and chose
to pay by subscription (recurring billing). The details of your order are as following:

==================================================================
Customer's name: Mira Vaysbeyn
Invoice No.: 65900
Total Amount: $174.63
Subscription Amount: $58.21 every month, for three months
Successful Payments made: 1 of 3
Subscription ID: 5821588
Order date: 2010-01-16
Credit Card (last 4 digits): xxxxxxxxxxxx7450
==================================================================
					
The payment for this installment of your order has been Declined by the payment gateway.
Please make sure your credit card is valid and has sufficient funds. Click on the link
below to update your credit-card information:

https://semiprecious.com/arb/form_arb_update.php?updatesub_key=iusr8egf&subscriptionID=5821588
					
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
		mail("mamzel1950@yahoo.com",$subject,$message,$headers);


?>


        
         