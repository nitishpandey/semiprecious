<?php
error_reporting(0);
$conn = mysql_connect('localhost','semipre_mgnt1','WRzK05bHyOdNb1TI');
if(!$conn) die("Failed to connect to database!");
$status = mysql_select_db('semipre_mgnt1', $conn);
if(!$status) die("Failed to select database!");

//print_r($_GET);
include('simple_html_dom.php');
$html = new simple_html_dom();
//$page = 'http://www.essentialsjewelry.com/stock/laguna-lace/laguna-lace-rings/laguna-lace-rings.html';
$page =$_GET['url'];
$html->load_file($page);
$i = 0;
foreach($html->find('table tr td[class=stone-main]') as $element) {
     if($i ==0) {
        $name = strip_tags(trim($element->innertext)); 
     }
$i++;
}
//$name = str_replace(" ","", $name);
$name = explode("::", $name);
print_r($name);
$imageArr = array();
  $fullArr = array();
foreach($html->find('table tr') as $row) {
	
  $cells1= $row->find('td img[width=250]');
  //print_r($cells1);
 if (count($cells1) >= 1) {
    $imageArr[0]=$cells1[0]->src; // EUR, CHF etc
    $imageArr[1]=$cells1[1]->src; // USD 0.599 etc
    $imageArr[2]=$cells1[2]->src; // USD 0.599 etc
    //echo "$abbr1 $value11 $value21<br>";
	//echo $imageArr[0]."---".$imageArr[1]."---".$imageArr[2]."<br>";
  }
  if(count($imageArr)>0) {
	$fullArr = $imageArr;
	
  }
  $cells = $row->find('td.bras');
  array_filter($imageArr);
  //print_r($imageArr);
 // print_r($cells);
//echo count($cells)."/////";
  if (count($cells) >= 1) {
	  
    $value=$cells[0]->innertext; // EUR, CHF etc
	$value=strip_tags(trim($value));
echo $value."----";
	$codeAtr1 = GetCodeSize($value);
	
	$txt = writeSql($name[1],$codeAtr1,$imageArr[0],$name[0]);
	//echo $name[1]."---".$codeAtr1."---".$imageArr[0]."---".$name[0];
    $value1=$cells[1]->innertext; // USD 0.599 etc
	$value1=strip_tags(trim($value1));
	$codeAtr2 = GetCodeSize($value1);
	$txt1 = writeSql($name[1],$codeAtr2,$imageArr[1],$name[0]);

	//echo $name[1]."---".$codeAtr2."---".$imageArr[1]."---".$name[0];
    $value2=$cells[2]->innertext; // USD 0.599 etc
	$value2=strip_tags(trim($value2));
	$codeAtr3 = GetCodeSize($value2);
	$txt2 = writeSql($name[1],$codeAtr3,$imageArr[2],$name[0]);
	
	//echo $name[1]."---".$codeAtr3."---".$imageArr[2]."---".$name[0];
 
   
	   
   }
}

function GetCodeSize($value) {
//echo $value ."------------------<br>";
	$value = str_replace(" ","", $value);
	$value = explode("::", $value);
	$code1 = explode("Price",$value[1]);
	$price1 = explode("Length",$value[2]);
	$size = $value[3];
	$code = $code1[0];
	$price = $price1[0];
	//echo $code."/".$price."/".$size;
	return $code."/".$price."/".$size;
}

function writeSql($name,$codeAtr1,$imageArr,$catName) {
	//echo $name."--".$codeAtr1."--".$imageArr."--------<br>";
	$codArr = explode("/", $codeAtr1);
	$pos = strpos($imageArr, trim($codArr[0]));
	//echo $pos."--------<br>";
	$category  = str_replace("Stock ","",$catName);
	if ($pos !== false) {
		echo $sel = "select * from essencialData where code = '".trim($codArr[0])."'";
		$dt = mysql_query($sel);
		$rows = mysql_num_rows($dt);
		if($rows<1) {

			$stoneName  = str_replace(trim($category),"",$name);
			$imageName = str_replace("../../../","http://www.essentialsjewelry.com/",$imageArr); 
			echo $sql71 = "INSERT INTO essencialData (category,stone,name,code,price,size,image,manufacurer) VALUES  ('".trim($category)."','".trim($stoneName)."','".trim($name)."','".trim($codArr[0])."','".trim($codArr[1])."','".trim($codArr[2])."','".$imageName."','RahulDhull')";
echo "<br>";			
mysql_query($sql71);
		}
		
	}
}
?> 