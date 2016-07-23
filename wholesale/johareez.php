<?php
	 		 
	 	$stoneURL="http://www.johareez.com/shop/justbuyit/bracelets/6-00ctw-genuine-opal-925-sterling-silver-bracelet-10514/$10615722";
		
        // create curl resource
        $ch = curl_init();

        // set url
      curl_setopt($ch, CURLOPT_URL,$stoneURL);

        //return the transfer as a string
       curl_setopt($ch, CURLOPT_RETURNTRANSFER, 0);

        // $output contains the output string
        $output = curl_exec($ch);
		
		

    																				
	
		//$output = str_replace('essentialsjewelry.com/stock/', 'semiprecious.com/wholesale/silver_gemstone_rings.php?stone=', $output);
		
		
		
		
        // close curl resource to free up system resources
        curl_close($ch);     
		
		   echo $output;
?>
 