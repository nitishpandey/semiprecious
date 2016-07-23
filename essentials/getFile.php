<?php
error_reporting(0);
$conn = mysql_connect('localhost','semipre_mgnt1','WRzK05bHyOdNb1TI');
if(!$conn) die("Failed to connect to database!");
$status = mysql_select_db('semipre_mgnt1', $conn);
if(!$status) die("Failed to select database!");

include('simple_html_dom.php');
$html = new simple_html_dom();
$page =$_GET['url'];
$pageArr = explode("/",$page);
$pageTot = count($pageArr);
$pageName = $pageArr[$pageTot-1];
$pageNameRec = str_replace("-"," ",$pageName);

$pageNameRec1 = str_replace("s.html","",$pageNameRec);
$pageNameArr = explode(".",$pageName);
$pageNameArr1 = explode("-",$pageNameArr[0]);
$tot = count($pageNameArr1);
$catName = $pageNameArr1[$tot-1];
$html->load_file($page);
$i = 0;
foreach($html->find('table tr td[class=stone-main]') as $element) {
     if($i ==0) {
        $name = strip_tags(trim($element->innertext)); 
     }
$i++;
}
$name = explode("::", $name);
//$name = $pageNameRec1;
$imageArr = array();
  $fullArr = array();
foreach($html->find('table tr') as $row) {
	
  $cells1= $row->find('td img[width=170]');
  
 if (count($cells1) >= 3) {
    $imageArr[0]=$cells1[0]->src; // EUR, CHF etc
    $imageArr[1]=$cells1[1]->src; // USD 0.599 etc
    $imageArr[2]=$cells1[2]->src; // USD 0.599 etc
  }
  if(count($imageArr)>0) {
	$fullArr = $imageArr;
	
  }
  $cells = $row->find('td.stone-main');
  array_filter($imageArr);
  if (count($cells) >= 3) {

    $value=$cells[0]->innertext; // EUR, CHF etc
	$value=strip_tags(trim($value));
	$codeAtr1 = GetCodeSize($value);
	
	$txt = writeSql($name[1],$codeAtr1,$imageArr[0],$catName,$pageNameRec1);

    $value1=$cells[1]->innertext; // USD 0.599 etc
	$value1=strip_tags(trim($value1));
	$codeAtr2 = GetCodeSize($value1);
	$txt1 = writeSql($name[1],$codeAtr2,$imageArr[1],$catName,$pageNameRec1);

    $value2=$cells[2]->innertext; // USD 0.599 etc
	$value2=strip_tags(trim($value2));
	$codeAtr3 = GetCodeSize($value2);
	$txt2 = writeSql($name[1],$codeAtr3,$imageArr[2],$catName,$pageNameRec1);
	
 
   
	   
   }
}

function GetCodeSize($value) {
	$value = str_replace(" ","", $value);
	$value = str_replace("&quot;","", $value);
	$value = explode("::", $value);
	$code1 = explode("Price",$value[1]);
	$price1 = explode("Length",$value[2]);
	$size = $value[3];
	$code = $code1[0];
	$price = $price1[0];
	$cost=$price/1.3;
	return $code."/".$price."/".$size;
}

function writeSql($name,$codeAtr1,$imageArr,$catName,$pageNameArr1) {
	$codArr = explode("/", $codeAtr1);
	$pos = strpos($imageArr, trim($codArr[0]));
	$category  = $catName;
	if ($pos !== false) {
		$sel = "select * from essencialData where code = '".trim($codArr[0])."'";
		$dt = mysql_query($sel);
		$rows = mysql_num_rows($dt);
		if($rows<1) {
            $price1 = str_replace('$','',$codArr[1]);
			$price =$price1*1.3;
			$stoneName  = str_replace(trim(strtolower($category)),"",strtolower($name));
			$imageName = str_replace("../../../","http://www.essentialsjewelry.com/",$imageArr); 
			echo $sql71 = "INSERT INTO essencialData (category,stone,name,code,price,size,image,manufacurer) VALUES  ('".trim($category)."','".trim($stoneName)."','".trim($pageNameArr1)."','".trim($codArr[0])."','$".$price."','".trim($codArr[2])."','".$imageName."','RahulDhull')";
			echo "<br>";			
			mysql_query($sql71);
		}
		
	}
}
?> 