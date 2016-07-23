<?php 
session_start();
		$shipping_fee = '4.99';
		$shipping_fee_non_us = '7.99';
	 	//print_r($_POST); error_reporting(E_ALL); ini_set("display_errors", 1);//exit;
	 	
	 	$stoneURL="www.essentialsjewelry.com/stock/".'smithsonite/smithsonite-rings/smithsonite-rings.html';//$_GET['stone'];
		
        // create curl resource
        $ch = curl_init();

        // set url
        curl_setopt($ch, CURLOPT_URL,$stoneURL);

        //return the transfer as a string
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);

        // $output contains the output string
        $output = curl_exec($ch);
		
		
		//customize by mak
		$files=file_get_contents('common_header.php');
	
		
		$output = str_ireplace("<body>", '<body>' ."$files", $output);
		$output = str_ireplace("<br />", "", $output);
		
		
		
		/*$output = str_ireplace("<body>", '<body><div align=center><div  align="center" style="display:inline;" ><img src="images/semipreciouswholesale.png"><img src="/images/call.jpg" style="position:relative;display:inline;"></div><div id="call"  style="display:inline;vertical-align:top;width:15%;position:relative;top:20px;"><span>Call Ritu! 512 779 8863 <font size=-1>8 AM to 6 PM CST</font></span></div></div>
		<div style="position:relative;top:100px;border-top:double;border-top-color:red;font-family:cabili;font-weight:300;" align="center">
		<a href=silver_gemstone_ring.php>Silver Gemstone Rings</a> || <a href=/silver_gemstone_pendant.php>Silver Gemstone Pendants</a>	|| <a href=/silver_gemstone_earrings.php?stone=amethyst-cylinder/amethyst-cylinder-earrings/amethyst-cylinder-earrings.html>Silver Gemstone Earrings</a>	 										  
		</div><!--div id="discount" name="discount" style="position:absolute;top:28%;left:72%;"><img src="images/discount.jpg" height=60><br>with $400 order</div-->
				', $output);*/


    	$output = str_ireplace("<h1>Silver", "<h2>Buy with confidence, 92.5% Real Silver and Real Stones", $output);
		
		$output = str_ireplace('"http://www.essentialsjewelry.com/images/pendants.jpg"', '"http://www.essentialsjewelry.com/images/pendants.jpg" style=display:none; ', $output);
    	$output = str_ireplace("</h1>", ". Call me if in doubt!</h2>", $output);
		$output = str_ireplace(" Smithsonite Rings ", "", $output);
		$output = str_ireplace(" cab ", " Cabachone ", $output);
		$output = str_ireplace(" cab. ", " Cabachone. ", $output);
		$output = str_ireplace(" cab, ", " Cabachone, ", $output);
		$output = str_ireplace(" 925 ", " 92.5% ", $output);
		$output = str_ireplace(" stone ", " gemstone ", $output);
		$output = str_ireplace(" supplier ", " market ", $output);
		
		$output = str_ireplace(" Jaipur ", " Pink City ", $output);
		$output = str_ireplace(" Ring ", " Gemstone Ring ", $output);
        $output = str_replace("www.semipreciouswholesale.com/", "www.essentialsjewelry.com/", $output);
		$output = str_replace("../../../css/stylesheet.css", "http://www.essentialsjewelry.com/css/stylesheet.css", $output);
		$output = str_replace("../../../right-click-off.js", "http://www.essentialsjewelry.com/right-click-off.js", $output);
		$output = str_replace("../../../", "http://www.essentialsjewelry.com/", $output);
//		$output = str_replace("http://www.essentialsjewelry.com/images/", "http://www.semipreciouswholesale.com/images/", $output);
//		$output = str_replace('<div id="top">', '<div id="top" style=display:none;>', $output);
		$output = str_replace('<div id="bannertop">', '<div id="bannertop" style=display:none;>', $output);
		$output = str_replace('id="bannerleft"', 'id="bannerleft" style="display:none;"', $output);
		$output = str_replace('id="bannerright"', 'id="bannerright" style="display:none;"', $output);
		$output = str_replace('wholesalers', 'wholesale', $output);
		$output = str_replace('Mookaite', 'Mookite', $output);
 		$output = str_replace('manuafcturer', 'manufacturer', $output);
		$output = str_replace('http://www.essentialsjewelry.com/images/rings.jpg', 'http://www.semipreciouswholesale.com/images/rings.jpg', $output);
		$output = str_replace('http://www.essentialsjewelry.com/images/earrings.jpg', 'http://www.semipreciouswholesale.com/images/rings.jpg', $output);
		$output = str_replace('http://www.essentialsjewelry.com/images/pendants.jpg', 'http://www.semipreciouswholesale.com/images/rings.jpg', $output);
		$output = str_replace('http://www.essentialsjewelry.com/images/bracelets.jpg', 'http://www.semipreciouswholesale.com/images/rings.jpg', $output);
		$output = str_replace('http://www.essentialsjewelry.com/images/arrow.jpg', 'http://www.semipreciouswholesale.com/images/rings.jpg', $output);
		//$output = str_replace('http://www.essentialsjewelry.com/images/15.gif', 'http://www.semipreciouswholesale.com/images/discount.jpg', $output);
		
		
		
		$output = str_replace('Stock Rings', ' ', $output);
		$output = str_replace('id="basenav"', 'id="basenav" style="display:none;"', $output);		
		$output = str_replace('id="base"', 'id="base" style="display:none;"', $output);		
		$output = str_replace('2006 Essential Jewelery', '2006 SemipreciousWholesale.com', $output);
		$output = str_replace('Essentials Jewelery', 'semipreciouswholesale.com', $output);
		$output = str_replace('<a href="../../sterling-silver-pendants.html" class="stone-main">Stock Pendants</a>  ::', 'In Stock Gemstone Silver Pendants:', $output);
				 
		$output = str_replace('id="silver2"', 'id="silver2" style=display:none;', $output);		
		$output = str_replace('Code : :', '<div style="position:relative;top:13px;">SKU:</div><div style="position:relative;left:50px;"><input style="font-size:small;" type="button" height=30px value="Call 512 779 8863"></div>', $output);
		$output = str_replace('<td><span class="imprtant">', '<td style="visibility:hidden"><span class="imprtant">', $output);
		
		$output = str_replace('essentialsjewelry.com/stock/', 'semipreciouswholesale.com/silver_gemstone_rings.php?stone=', $output);
		
		$output = preg_replace('#<table[^>]+>\s*(?:<[^>]+>\s*|&nbsp;)+Rings In Stock.*?</table>#msi', '', $output);//
		
		$checkout = '';
		
		$checkout .= '<a href="'.$_GET['back'].'"><font size=+3><<< Back</font></a><br /><br /><br />';
		
		$checkout = '';
		
		$cartid = $_COOKIE['cartid'];
		if (!empty($cartid)) {
		
			include 'db.php';
			
			// Stripe
			require_once('./lib/Stripe.php');
			$stripe = array(
		  		"secret_key"      => "sk_live_MbupdBm1rk5UHbznlwdmYdrH",//sk_test_4pgLGlAau7eiMw1FtwoXurEm
				"publishable_key" => "pk_live_E2JwbaR2iOLQ4eBWGRP9ITd2",//pk_test_o86hAnFyyUqxUJQcN2yzOLgx
				'currency'		  => 'usd'
			);
			// Stripe end

			if (isset($_POST['stripeToken']) && isset($_POST['stripeEmail']) && isset($_POST['stripeBillingAddressCountry']) && isset($_POST['stripeBillingAddressCity']) && isset($_POST['stripeBillingAddressZip']) && isset($_POST['stripeBillingAddressLine1']) && isset($_POST['stripeBillingName']) ) { //print_r($_POST);exit;//$_POST['email']

				$token  = $_POST['stripeToken'];
				$email  = $_POST['stripeEmail'];
				
				$res = mysqli_query($mysqli, "SELECT total FROM shopping_cart WHERE cartid='$cartid'") or die('Unable to select from the database.');
				if (mysqli_num_rows($res)) {
					$total = mysqli_fetch_array($res);
					$total = number_format($total['total'], 2);
					$total_stripe = str_replace('.', '', $total);

					// Stripe
					Stripe::setApiKey($stripe['secret_key']);
					
					$email_db = mysqli_real_escape_string($mysqli, $email);//$_POST['email']
					$res = mysqli_query($mysqli, "SELECT customerid, stripe_id FROM customers WHERE email='$email_db'") or die('Unable to select from the database.');
					if (mysqli_num_rows($res)) {
						$row = mysqli_fetch_array($res);
						$customerid = $row['customerid'];
						$stripe_id = $row['stripe_id'];
					} else {
						$customer = Stripe_Customer::create(array(
							'email' => $email,
							'card'  => $token
						));
						$stripe_id = $customer->id;
					}
					$charge = Stripe_Charge::create(array(
						'customer' => $stripe_id,
						'amount'   => $total_stripe,
						'currency' => $stripe['currency']
					));
					// Stripe end
				
					//echo "---{$customer->id}---";
					//var_dump($charge);exit;

					if ($charge->paid && $charge->amount == $total_stripe && $charge->currency == $stripe['currency'] && !$charge->refunded) {

						$res = mysqli_query($mysqli, "SELECT customerid FROM customers WHERE email='$email'") or die('Unable to select from the database.');
						if (!isset($customerid)) {
							$res = mysqli_query($mysqli, "INSERT INTO customers (email, stripe_id) VALUES ('$email_db', '$stripe_id')") or die('Unable to insert into the database: '. mysqli_error($mysqli));//, first_name, last_name, street_address, street_address2, city, state, country, zip, '$first_name_db', '$last_name_db', '$address1_db', '$address2_db', '$city_db', '$state', '$country_db', '$zip_db'
							$customerid = mysqli_insert_id($mysqli);
						}
						
						$country_db = mysqli_real_escape_string($mysqli, $_POST['stripeBillingAddressCountry']);//$_POST['email']
						$city_db = mysqli_real_escape_string($mysqli, $_POST['stripeBillingAddressCity']);
						$zip_db = mysqli_real_escape_string($mysqli, $_POST['stripeBillingAddressZip']);
						$address1_db = mysqli_real_escape_string($mysqli, $_POST['stripeBillingAddressLine1']);
						$address2_db = isset($_POST['stripeBillingAddressLine2']) ? mysqli_real_escape_string($mysqli, $_POST['stripeBillingAddressLine2']) : '';
						$name = preg_split("#\s+#", $_POST['stripeBillingName']);
						$first_name_db = mysqli_real_escape_string($mysqli, $name[0]);
						$last_name_db = mysqli_real_escape_string($mysqli, preg_replace('#'.$name[0].'\s+#', '', $_POST['stripeBillingName']));
						$state_db = isset($_POST['stripeBillingAddressState']) ? mysqli_real_escape_string($mysqli, $_POST['stripeBillingAddressState']) : '';
						
						$res = mysqli_query($mysqli, "UPDATE shopping_cart SET customerid='$customerid', first_name='$first_name_db', last_name='$last_name_db ', street_address='$address1_db', street_address2='$address2_db', city='$city_db', state='$state_db', country='$country_db', zip='$zip_db' WHERE cartid='$cartid'") or die('Unable to insert into the database: '. mysqli_error($mysqli));
						unset($_COOKIE['cartid']);
						setcookie ("cartid", "", time() - 3600, '/');
				
						$checkout .= 'Your order is completed.';//Your details are recorded and we will contact you back shortly.
						mail($email, 'SemipreciousWholesale order', 'Your order of $'.$total.' is completed. Thank you.', 'From: SemipreciousWholesale <semiprecioushelp@gmail.com>');
					} else {//echo $total_stripe;var_dump($charge);
						$checkout .= 'Payment error! Please email semiprecioushelp@gmail.com ';
					}
				}
			} else {
				$qty_chng =  isset($_POST['qty']) ? $_POST['qty'] : (isset($_GET['qty']) ? $_GET['qty'] : '');
				$update_total = false;
				if ($qty_chng && is_array($qty_chng)) {
					foreach($qty_chng as $sku => $qty) {
						$qty = (int) $qty;
						$sku = mysqli_real_escape_string($mysqli, $sku);
						if ($qty == 0) {
							$res = mysqli_query($mysqli, "DELETE FROM shopping_cart_items WHERE cartid='$cartid' AND sku='$sku'") or die('Unable to insert into the database: '. mysqli_error($mysqli));
						} else {
							$res = mysqli_query($mysqli, "UPDATE shopping_cart_items SET qty=$qty WHERE cartid='$cartid' AND sku='$sku'") or die('Unable to insert into the database: '. mysqli_error($mysqli));
						}
					}
					$update_total = true;
				}
			
				$total = 0;
				$res = mysqli_query($mysqli, "SELECT * FROM shopping_cart_items WHERE cartid='$cartid'") or die('Unable to select from the database.');
				if (mysqli_num_rows($res)) {
					$checkout .= '<h2>Cart contents:</h2><br/><form action="" method="POST"><table><tr bgcolor=orange><!--td>Product name</td--><td>SKU</td><td>Size<!-- / Length--></td><td>Price</td><td>Action</td><!--td>Total price</td--></tr>';//Quantity
					
					while ($row = mysqli_fetch_array($res)) {//print_r($row);
						$price = number_format($row['price'], 2);
						$checkout .= "<tr ><!--td></td--><td width=200px>{$row['sku']}</td><td width=100px>".($row['size'] ? $row['size'] : '')."</td><td width=100px>\\\${$price}</td><td>&nbsp;&nbsp;&nbsp;<a href='?qty[{$row['sku']}]=0&back=".urlencode($_GET['back'])."'>Delete</a></td><!--td>\\\$".number_format($row['price']*$row['qty'], 2)."</td--></tr>";//<input type='hidden' name='qty[{$row['sku']}]' value='{$row['qty']}'>
						$total += $row['price']*$row['qty'];
					}
					
					
					
					$cpnmsg="";
					if(isset($_SESSION['discount']))
					{
						$total=$total - $_SESSION['discount'];
					}
					
					
					if(isset($_POST['couponcode']))
					{
						$cpntyped=$_POST['couponcode'];
						$getcpn = mysqli_query($mysqli, "SELECT * FROM coupons WHERE couponcode='$cpntyped' and active='1' limit 1") or die('Unable to select from the database.');       
						$cpncount=mysqli_num_rows($getcpn);
						if($cpncount>0)
						{
							while($cpnrow=mysqli_fetch_array($getcpn))
							{
								$cpntype=$cpnrow['discounttype'];
								$cpnvalue=$cpnrow['value'];
								if($cpntype=="percentage")
								{
									$_SESSION['discount']= $total*($cpnvalue/100);
									$total=$total-$_SESSION['discount'];
									
								}
								if($cpntype=="flat")
								{
									$_SESSION['discount']=$cpnvalue;
									$total=$total-$_SESSION['discount'];
								}
								$query=mysqli_query($mysqli,"update shopping_cart set couponcode='$cpntyped', discounted_total='$total' where cartid='$cartid'");
								$_SESSION['activecpn']=$cpntyped;
							$cpnmsg='<br/><span style="color:#090;font-weight:bold;">Coupon Applied to cart!</span>';
							}
						}
						else
						{
							$cpnmsg='<br/><span style="color:#f00;font-weight:bold;">Coupon Invalid or Expired!</span>';
						}
					}
					
					
					
				
					
					
					
					
					$total_incl_shipping = $total + $shipping_fee;
					$total_incl_shipping = number_format($total_incl_shipping, 2);
					$checkout .= '<tr><td colspan="2"><br><br><b>Domestic (USA) or International Shipping:</b> </td><td><br><br>\$'.number_format($shipping_fee, 2).'</td><td colspan="2"></td></tr></table><h2>Total: \$'.$total_incl_shipping.'</h2><br/><br/><!--input type="submit" value="Update"--></form>';
					
					$checkout .='<h2>Apply Coupon</h2><br/><form method="post"><input type="text" name="couponcode"/><br/><br/><input type="submit" name="subcoup" value="Apply"></form>';
					
					$checkout .=$cpnmsg;
					
					if(isset($_SESSION['discount']))
					{
						$checkout .="<br/><strong style='color:#f60;font-size:14px;'>Active Coupon : ".$_SESSION['activecpn']."</strong>";
					}
				
					
					
					// Stripe
					$total_stripe = str_replace('.', '', $total_incl_shipping);
					$stripe = '
					  <script
						src="https://checkout.stripe.com/checkout.js" class="stripe-button"
						data-key="'.$stripe['publishable_key'].'"
						data-amount="'.$total_stripe.'"
						data-name="Semiprecious wholesale"
						data-description=""
						data-image="/images/semipreciouswholesale.png"

						data-address="1"
						data-country="1"
						>
					  </script>					
					  ';//						data-zip-code="1" data-currency="uah"
					// Stripe end
					
					//$checkout .= '<br/><br/>Enter your details to checkout:<br/><form action="" method="POST">'.$stripe.'E-mail address: <input name="email"><br/><input type="submit" value="Checkout!"></form>';
					$checkout .= '<br/><br/><h2>Checkout:</h2><br /><br /><form action="" method="POST">'.$stripe.'</form>';
				}
				
				if ($update_total) {
					$res = mysqli_query($mysqli, "UPDATE shopping_cart SET total=$total WHERE cartid='$cartid'") or die('Unable to insert into the database: '. mysqli_error($mysqli));
				}
			}
			mysqli_close($mysqli);
		}		
		

		$output = preg_replace('#<table[^>]+>\s*(?:<[^>]+>\s*|&nbsp;)+:: Smithsonite Rings.*?</table>#msi', $checkout, $output);//
		
        // close curl resource to free up system resources
        curl_close($ch);     
		
		   echo $output; 
		    require_once ("common_footer.php");
