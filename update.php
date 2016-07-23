<?php echo "<?xml version=\"1.0\" encoding=\"iso-8859-1\"?".">"; ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
</head>

<body>
<? $mysql = "update memberinfo set email = 'auerm@intergate.com' where email like 'auerm@intergate.com%' " ;
     $res = mysql_query($mysql);
	 $mysql = "select * from memberinfo where email like 'auerm%'";
	 $res = mysql_query($mysql);
	 
	 echo $res[email];
	 ?>
</body>
</html>
