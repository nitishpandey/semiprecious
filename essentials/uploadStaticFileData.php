<?php
//max_execution_time();
set_time_limit(0);
$conn = mysql_connect('localhost','semipre_mgnt1','WRzK05bHyOdNb1TI');
if(!$conn) die("Failed to connect to database!");
$status = mysql_select_db('semipre_mgnt1', $conn);
if(!$status) die("Failed to select database!");

//$sql = "select * from essencialData where id >21048";
$sql = "select * from essencialData ORDER BY id DESC limit 0,1";
$dt  = mysql_query($sql);
while($res = mysql_fetch_array($dt)) {
	echo $res['category']."--".$res['name']."--".$res['stone']."--".$res['code']."--".$res['price']."--".$res['size']."--".$res['image']."---".$res['manufacurer'];
	echo "<br><br>";

    
	$curDate = date('Y-m-d H:i:s');
	$category = $res['category'];

	$sku = strtolower($res['code']);

	$sqlGet  = "select * from mgnt_catalog_product_entity where sku = '".$sku."'";
	$resGet= mysql_query($sqlGet);
	$totRows = mysql_num_rows($resGet);
	if($totRows<1) {
		$sql2 = "INSERT INTO mgnt_catalog_product_entity (entity_type_id, attribute_set_id, type_id,sku,created_at) VALUES (4,9,'simple','".$sku."','".$curDate."')";
		$dt2 = mysql_query($sql2);
		$productId = mysql_insert_id();

		if(strtolower($category) == 'rings') {
			$catId = '224';
			$sql11 = "INSERT INTO mgnt_catalog_category_product (category_id, product_id, position) VALUES ('223','".$productId."',1)";
			$dt11 = mysql_query($sql11);
		} else if(strtolower($category) == 'pendants') {
			$catId = '225';
			$sql11 = "INSERT INTO mgnt_catalog_category_product (category_id, product_id, position) VALUES ('223','".$productId."',1)";
			$dt11 = mysql_query($sql11);
		} else if(strtolower($category) == 'earrings') {
			$catId = '226';
			$sql11 = "INSERT INTO mgnt_catalog_category_product (category_id, product_id, position) VALUES ('223','".$productId."',1)";
			$dt11 = mysql_query($sql11);
		} else if(strtolower($category) == 'bracelets') {
			$catId = '227';
			$sql11 = "INSERT INTO mgnt_catalog_category_product (category_id, product_id, position) VALUES ('223','".$productId."',1)";
			$dt11 = mysql_query($sql11);
		} else {
			echo $sqlCat ="select entity_id from mgnt_catalog_category_entity_varchar where value like '%".strtolower($category)."%'";
			$dtCat = mysql_query($sqlCat);
			$resCat = mysql_fetch_array($dtCat);
			$catId = $resCat['entity_id'];
		}

		$sql11cc = "INSERT INTO mgnt_catalog_category_product (category_id, product_id, position) VALUES ('".$catId."','".$productId."',1)";
		$dt11cc = mysql_query($sql11cc);

		$sql11c = "INSERT INTO mgnt_catalog_category_product (category_id, product_id, position) VALUES ('2','".$productId."',1)";
		$dt11c = mysql_query($sql11c);

		$sql111 = "INSERT INTO mgnt_catalog_category_entity_text (entity_type_id,attribute_id, store_id, entity_id, value) VALUES (3,44,0,'".$catId."','".strtolower($category)."')";
		$dt111 = mysql_query($sql111);

		$sql1111 = "INSERT INTO mgnt_catalog_category_entity_text (entity_type_id,attribute_id, store_id, entity_id, value) VALUES (3,44,3,'".$catId."','".strtolower($category)."')";
		$dt1111 = mysql_query($sql1111);

		echo $sql21 = "INSERT INTO mgnt_catalog_category_product_index (category_id, product_id, position, is_parent,store_id,visibility) VALUES ('".$catId."','".$productId."',1,1,3,4)";
		$dt21 = mysql_query($sql21);

		$sql3 = "INSERT INTO mgnt_catalog_category_product_index (category_id, product_id, position, is_parent,store_id,visibility) VALUES ('2','".$productId."',0,1,3,4)";
		$dt3 = mysql_query($sql3);

		$sql4 = "INSERT INTO mgnt_cataloginventory_stock_item (product_id, stock_id,qty,use_config_min_qty,is_in_stock) VALUES ('".$productId."',1,'1',1,'1')";
		$dt4 = mysql_query($sql4);

		
		$sql5 = "INSERT INTO mgnt_cataloginventory_stock_status (product_id,website_id, stock_id,qty,stock_status) VALUES ('".$productId."',12,1,'1',1)";
		$dt5 = mysql_query($sql5);

		$arr1 = array(77,78,93,94,104,105);
		for($j=0;$j<count($arr1);$j++) {
			 $sql6 = "INSERT INTO mgnt_catalog_product_entity_datetime (entity_type_id,attribute_id, store_id,entity_id,value) VALUES (4,'".$arr1[$j]."',0,'".$productId."',null)";
			$dt6 = mysql_query($sql6);
		}

		$sqlO ="select option_id from mgnt_eav_attribute_option_value where value like '%".strtolower($res['stone'])."%'";
		$dtO = mysql_query($sqlO);
		$resO = mysql_fetch_array($dtO);
		$stone = $resO['option_id'];
		$stone1 = $resO['option_id']; 

		$price = str_replace('$','',$res['price']);
		$arr2 = array(75,76,79,80,120);
		for($j1=0;$j1<count($arr2);$j1++) {
			if($arr2[$j1] == 75) {
				$sql7 = "INSERT INTO mgnt_catalog_product_entity_decimal (entity_type_id,attribute_id, store_id,entity_id,value) VALUES (4,'".$arr2[$j1]."',0,'".$productId."','".$price."')";
				$dt7 = mysql_query($sql7);

				$sql7 = "INSERT INTO mgnt_catalog_product_entity_decimal (entity_type_id,attribute_id, store_id,entity_id,value) VALUES (4,'".$arr2[$j1]."',3,'".$productId."','".$price."')";
				$dt7 = mysql_query($sql7);
				
			} else if($arr2[$j1] == 79) {
				$sql7 = "INSERT INTO mgnt_catalog_product_entity_decimal (entity_type_id,attribute_id, store_id,entity_id,value) VALUES (4,'".$arr2[$j1]."',0,'".$productId."','".$price."')";
				$dt7 = mysql_query($sql7);
			} else if($arr2[$j1] == 80) {
				$val1 = 0;
				$sql7 = "INSERT INTO mgnt_catalog_product_entity_decimal (entity_type_id,attribute_id, store_id,entity_id,value) VALUES (4,'".$arr2[$j1]."',0,'".$productId."','".$val1."')";
				$dt7 = mysql_query($sql7);
			} else {
				 $sql7 = "INSERT INTO mgnt_catalog_product_entity_decimal (entity_type_id,attribute_id, store_id,entity_id,value) VALUES (4,'".$arr2[$j1]."',0,'".$productId."',Null)";
				$dt7 = mysql_query($sql7);
			}
		}

		$arr3 = array(96,100,102,121,122,150,144);
		for($j2=0;$j2<count($arr3);$j2++) {
			if($arr3[$j2] == 96 || $arr3[$j2] == 121) {
				$val2 = 1;
			} else if($arr3[$j2] == 102) {
				$val2 = 4;
			} else if($arr3[$j2] == 122) {
				$val2 = 2;
			} else if($arr3[$j2] == 150) {
				$val2 = 7145;
			}else if($arr3[$j2] == 144) {
				$val2 = $stone;
			} else {
				$val2 = 0;
			}
			$sql8 = "INSERT INTO mgnt_catalog_product_entity_int (entity_type_id,attribute_id, store_id,entity_id,value) VALUES (4,'".$arr3[$j2]."',0,'".$productId."','".$val2."')";
			$dt8 = mysql_query($sql8);
		}

		$file = $res['image'];
		$imageFirstCharacter = substr(strtolower($res['code']),0,1);
		$imageName = '/'.$imageFirstCharacter.'/'.strtolower($category).'/'.strtolower($res['code']).'.jpg';
		$newfile = dirname(__FILE__).'/media/catalog/product/'.$imageFirstCharacter.'/'.strtolower($category).'/'.strtolower($res['code']).'.jpg';
		copy($file, $newfile);

		$sql8m = "INSERT INTO mgnt_catalog_product_entity_media_gallery (attribute_id,entity_id,value) VALUES (88,'".$productId."','".$imageName."')";
		$dt8m = mysql_query($sql8m);
		$mediaValueId = mysql_insert_id();
		
		$sql8mv = "INSERT INTO mgnt_catalog_product_entity_media_gallery_value (value_id,store_id,position,disabled) VALUES ('".$mediaValueId."',3,1,0)";
		$dt8mv = mysql_query($sql8mv);

		$arr4 = array(72,73,83,106);
		for($j3=0;$j3<count($arr4);$j3++) {
			if($arr4[$j3] == 83 || $arr4[$j3] == 106) {
				$sql9 = "INSERT INTO mgnt_catalog_product_entity_text (entity_type_id,attribute_id, store_id,entity_id,value) VALUES (4,'".$arr4[$j3]."',0,'".$productId."',Null)";
				$dt9 = mysql_query($sql9);
			} else if($arr4[$j3] == 72) {
				$val3 = addslashes($res['name']);
				$sql9 = "INSERT INTO mgnt_catalog_product_entity_text (entity_type_id,attribute_id, store_id,entity_id,value) VALUES (4,'".$arr4[$j3]."',0,'".$productId."','".$val3."')";
				$dt9 = mysql_query($sql9);
			} else if($arr4[$j3] == 73) {
				$val3 = addslashes($res['name']);
				$sql9 = "INSERT INTO mgnt_catalog_product_entity_text (entity_type_id,attribute_id, store_id,entity_id,value) VALUES (4,'".$arr4[$j3]."',0,'".$productId."','".$val3."')";
				$dt9 = mysql_query($sql9);
			} 
		}



		$sqlOSu ="select option_id from mgnt_eav_attribute_option_value where value like '%".$res['manufacurer']."%'";
		$dtOSu = mysql_query($sqlOSu);
		$resSu = mysql_fetch_array($dtOSu);
		$Supplier = $resSu['option_id'];

		$urlKey = str_replace(" ","-",$res['name']);
		$urlkey1 = $urlKey.'.html';
		$arr5 =   array(71 => addslashes($res['name']),
						82 => null,
						84 => null,
						85 => $imageName,
						86 => $imageName,
						87 => $imageName,
						97 => $urlKey,
						98 => $urlKey.'.html',
						103 => null,
						107 => 'two_columns_left',
						109 => 'container2',
						112 => Null,
						113 => null,
						114 => Null,
						117 => Null,
						118 => 2,
						119 => 4,
						123 => null,
						144 => $stone,
						136 => $Supplier,
						140 => 640
					  );
		$sql10 = "INSERT INTO mgnt_catalog_product_entity_varchar (entity_type_id,attribute_id, store_id,entity_id,value) VALUES (4,98,3,'".$productId."','".$urlkey1."')";
		$dt10 = mysql_query($sql10);
		foreach ($arr5 as $k => $v) {
			   if($k != 123 && $k != 117 && $k != 114 && $k != 113 && $k != 112 && $k != 103 && $k != 82 && $k != 84) {
					$sql11 = "INSERT INTO mgnt_catalog_product_entity_varchar (entity_type_id,attribute_id, store_id,entity_id,value) VALUES (4,'".$k."',0,'".$productId."','".$v."')";
					$dt11 = mysql_query($sql11);
			   } else {
					$sql11 = "INSERT INTO mgnt_catalog_product_entity_varchar (entity_type_id,attribute_id, store_id,entity_id,value) VALUES (4,'".$k."',0,'".$productId."',NULL)";
					$dt11 = mysql_query($sql11);
			   }
		} 

		$urlKey2 = str_replace(" ","-",$res['name']);
		$urlkey3 = $urlKey2.'.html';
        $cost=$price/1.3;
		
		echo $sql12 = "INSERT INTO mgnt_catalog_product_flat_3 (entity_id, attribute_set_id, type_id, cost,created_at, enable_googlecheckout,has_options,is_recurring, msrp_display_actual_price_type, msrp_enabled, name, price, short_description, sku, small_image, tax_class_id, thumbnail, updated_at, url_key, url_path, visibility, weight) VALUES (".$productId.", 9, 'simple', '".$cost."','".$curDate."',1,0, 0,4,2,'".addslashes($res['name'])."', '".$price."', '".addslashes($res['name'])."','".$res['code']."','".$imageName."', 2,'".$imageName."', '".$curDate."', '".$urlKey2."', '".$urlkey3."', 4, 0)";
		$dt12 = mysql_query($sql12);
		

		$sql13 = "INSERT INTO mgnt_catalog_product_index_eav (entity_id,attribute_id, store_id,value) VALUES ('".$productId."',122,3,2)";
		$dt13 = mysql_query($sql13);

		$sql14 = "INSERT INTO mgnt_catalog_product_index_eav_tmp (entity_id,attribute_id, store_id,value) VALUES ('".$productId."',122,3,2)";
		$dt14 = mysql_query($sql14);

		$sql13111 = "INSERT INTO mgnt_catalog_product_index_eav (entity_id,attribute_id, store_id,value) VALUES ('".$productId."',144,3,".$stone.")";
		$dt13111 = mysql_query($sql13111);

		$sql1411 = "INSERT INTO mgnt_catalog_product_index_eav_tmp (entity_id,attribute_id, store_id,value) VALUES ('".$productId."',144,3,".$stone.")";
		$dt1411 = mysql_query($sql1411);

		$sql13111 = "INSERT INTO mgnt_catalog_product_entity_varchar (entity_type_id,entity_id,attribute_id, store_id,value) VALUES (4,'".$productId."',146,0,'".$res['size']."')";
		$dt13111 = mysql_query($sql13111);

		$arr6 = array(0,1,2,3);
		for($j6=0;$j6<count($arr6);$j6++) {
				$sql15 = "INSERT INTO mgnt_catalog_product_index_price (entity_id,customer_group_id, website_id,tax_class_id,price,final_price,min_price,max_price,group_price) VALUES ('".$productId."','".$arr6[$j6]."',12,2,'".$price."','".$price."','".$price."','".$price."',null)";
				$dt15 = mysql_query($sql15);

				$sql16 = "INSERT INTO mgnt_catalog_product_index_price_tmp (entity_id,customer_group_id, website_id,tax_class_id,price,final_price,min_price,max_price,group_price) VALUES ('".$productId."','".$arr6[$j6]."',12,2,'".$price."','".$price."','".$price."','".$price."',null)";
				$dt16 = mysql_query($sql16);

				$sql16 = "INSERT INTO mgnt_catalog_product_index_price_idx (entity_id,customer_group_id, website_id,tax_class_id,price,final_price,min_price,max_price,group_price) VALUES ('".$productId."','".$arr6[$j6]."',12,2,'".$price."','".$price."','".$price."','".$price."',null)";
				$dt16 = mysql_query($sql16);
		}

		$sql17 = "INSERT INTO mgnt_catalog_product_website (product_id,website_id) VALUES ('".$productId."',4)";
		$dt17 = mysql_query($sql17);

		$dataIndex = $res['code']."|Enabled|Taxable Goods|".addslashes($res['name'])."|".$stone."|".addslashes($res['name'])."|".addslashes($res['name'])."|".$price;
		$sql18 = "INSERT INTO mgnt_catalogsearch_fulltext (product_id,store_id,data_index) VALUES ('".$productId."',3,'".$dataIndex."')";
		$dt18 = mysql_query($sql18);
	}
}
		$sql19 = "delete from essencialData";
		$dt19 = mysql_query($sql19);

?>