<?php
   
$pattern2= "/".basename(__FILE__);

if (strpos($pattern2,'.cfm') !== false) {
     $conn2 = mysql_connect('localhost','gemstone_web','abcd1234@');
if(!$conn2) die("Failed to connect to database!");
$status = mysql_select_db('gemstone_aw', $conn2);
if(!$status) die("Failed to select database!");

  $sql = "select * from mgnt_redirect_rules where rule_source ='".trim($pattern2)."'";
  $rss = mysql_query($sql);
$reso = mysql_fetch_array($rss);
$rows = mysql_num_rows($rss);

  $path="http://www.semiprecious.com".$reso["rule_dest"];

$html=file_get_contents($path);

echo $html;

}
