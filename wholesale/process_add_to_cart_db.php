<?php

		/* Database part */
		
		

		if (isset($_POST['sku']) && isset($_POST['price'])) { //&& isset($_POST['size'])
			$new['sku'] = mysqli_real_escape_string($mysqli, $_POST['sku']);;
			$new['price'] = (float) str_replace('$', '', $_POST['price']);
			$new['size'] = isset($_POST['size']) ? (float) $_POST['size'] : 0;
			$new['size_changed'] = isset($_POST['size_changed']) ? (int) $_POST['size_changed'] : 0;
			if ($new['size_changed']) $new['price'] += $cfg['size_change_price'];
			//$_SESSION['cart'][] = $new;
			
			if (!isset($_COOKIE['cartid'])) {
				$res = mysqli_query($mysqli, "SELECT MAX(cartid) FROM shopping_cart") or die('Unable to select from the database.');
				$cartid = mysqli_fetch_array($res);
				$cartid = $cartid[0] + 1;
				$res = mysqli_query($mysqli, "INSERT INTO shopping_cart (cartid, customerid, total, discounted_total, paymethod, paid_amount)
				 VALUES ($cartid, '0', '0', '0', '', '0')") or die('Unable to insert into the database: '. mysqli_error($mysqli));
				setcookie("cartid", $cartid, 0, '/');
			} else {
				$cartid = $_COOKIE['cartid'];
			}
			
			
			$res = mysqli_query($mysqli, "SELECT sku FROM shopping_cart_items WHERE sku='{$new['sku']}' AND cartid='$cartid'") or die('Unable to select from the database.');
			$sku = mysqli_fetch_array($res);
			if (empty($sku)) {
				$res = mysqli_query($mysqli, "INSERT INTO shopping_cart_items (cartid, sku, qty, vendor, price, size, size_changed)  VALUES ($cartid, '{$new['sku']}', '1', '0', '{$new['price']}', '{$new['size']}', '{$new['size_changed']}')") or die('Unable to insert into the database: '. mysqli_error($mysqli));
			} else {
				$res = mysqli_query($mysqli, "UPDATE shopping_cart_items SET qty=qty+1 WHERE sku='{$new['sku']}' AND cartid='$cartid'") or die('Unable to insert into the database: '. mysqli_error($mysqli));
			}
			$res = mysqli_query($mysqli, "UPDATE shopping_cart SET total=total+{$new['price']} WHERE cartid='$cartid'") or die('Unable to insert into the database: '. mysqli_error($mysqli));
			
			header('Location: /'.$finalurl);

		}
eco $cartid