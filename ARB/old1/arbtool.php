<?php
echo "<PRE>";


echo "<form method=post action=subscription_create.php>";
echo "<table width=35% border=0>";
  echo "<tr>";
    echo "<td><b><font size=2 face=arial>Create Subscription </b><br><br></td>";
    echo "<td></td>";
  echo "</tr>";
 
  echo "<tr>";
    echo "<td><font size=2 face=arial>Reference Id</td>";
   echo "<td><input type=text name=refId value=''><font size=1 face=arial> MAX = 20 chars</td>";
  echo "</tr>";
  echo "<tr>";
    echo "<td><font size=2 face=arial>Subscription Name</td>";
    echo "<td><input type=text name=name value=''></td>";
  echo "</tr>";
  echo "<tr>";
   echo "<td><font size=2 face=arial>Subscription Length</td>";
    echo "<td><input type=text name=length value=''><font size=1 face=arial> 1 - 12 or 7 - 365</td>";
  echo "</tr>";
  echo "<tr>";
    echo "<td><font size=2 face=arial>Subscription Unit</td>";
    echo "<td><input type=text name=unit value=''><font size=1 face=arial> months or days</td>";
  echo "</tr>";
  echo "<tr>";
    echo "<td><font size=2 face=arial>Start Date</td>";
    echo "<td><input type=text name=startDate value=''><font size=1 face=arial> YYYY-MM-DD</td>";
  echo "</tr>";
  echo "<tr>";
    echo "<td><font size=2 face=arial>Total Occurrences</td>";
    echo "<td><input type=text name=totalOccurrences value=''><font size=1 face=arial> MAX = 9999</td>";
  echo "</tr>";
  echo "<tr>";
    echo "<td><font size=2 face=arial>Trial Occurrences</td>";
    echo "<td><input type=text name=trialOccurrences value=''><font size=1 face=arial> 0 = None. MAX = 99</td>";
  echo "</tr>";
 echo "<tr>";
   echo "<td><font size=2 face=arial>Amount</td>";
    echo "<td><input type=text name=amount value=''></td>";
  echo "</tr>";
  echo "<tr>";
   echo "<td><font size=2 face=arial>Trial Amount</td>";
    echo "<td><input type=text name=trialAmount value=''> <font size=1 face=arial>0 = None</td>";
  echo "</tr>";
  echo "<tr>";
   echo "<td><font size=2 face=arial>Credit Card Number</td>";
    echo "<td><input type=text name=cardNumber value=''></td>";
  echo "</tr>";
  echo "<tr>";
    echo "<td><font size=2 face=arial>Expiration Date</td>";
    echo "<td><input type=text name=expirationDate value=''><font size=1 face=arial> YYYY-MM</td>";
  echo "</tr>";
  echo "<tr>";
    echo "<td><font size=2 face=arial>First Name</td>";
   echo "<td><input type=text name=firstName value=''></td>";
 echo "</tr>";
  echo "<tr>";
    echo "<td><font size=2 face=arial>Last Name</td>";
    echo "<td><input type=text name=lastName value=''></td>";
  echo "</tr>";
  echo "<tr>";
   echo "<td><br><input type=submit name=submit value=Submit><input type=reset name=reset value=Reset></td>";
   echo "<td></td>";
  echo "</tr>";
echo "</table>";
echo "</form>";


echo "<form method=post action=subscription_update.php>";
echo "<table width=29% border=0>";
  echo "<tr>";
    echo "<td><b><font size=2 face=arial>Update Subscription </b><br><br></td>";
    echo "<td></td>";
  echo "</tr>";
  echo "<tr>";
    echo "<td><font size=2 face=arial>Subscription Id</td>";
   echo "<td><input type=text name=subscriptionId value=''></td>";
  echo "</tr>";
  echo "<tr>";
    echo "<td><font size=2 face=arial>Credit Card Number</td>";
    echo "<td><input type=text name=cardNumber value=''></td>";
  echo "</tr>";
  echo "<tr>";
   echo "<td><font size=2 face=arial>Expiration Date</td>";
    echo "<td><input type=text name=expirationDate value=''>";
  echo "</tr>";
  echo "<tr>";
    echo "<td><font size=2 face=arial>First Name</td>";
    echo "<td><input type=text name=firstName value=''>";
  echo "</tr>";
  echo "<tr>";
    echo "<td><font size=2 face=arial>Last Name</td>";
    echo "<td><input type=text name=lastName value=''>";
  echo "</tr>";
  echo "<tr>";
   echo "<td><br><input type=submit name=submit value=Submit><input type=reset name=reset value=Reset></td>";
   echo "<td></td>";
  echo "</tr>";
echo "</table>";
echo "</form>";

echo "<form method=post action=subscription_cancel.php>";
echo "<table width=29% border=0>";
  echo "<tr>";
    echo "<td><b><font size=2 face=arial>Cancel Subscription </b><br><br></td>";
    echo "<td></td>";
  echo "</tr>";
  echo "<tr>";
    echo "<td><font size=2 face=arial>Subscription Id</td>";
   echo "<td><input type=text name=subscriptionId value=''></td>";
  echo "</tr>";
  echo "<tr>";
   echo "<td><br><input type=submit name=submit value=Submit><input type=reset name=reset value=Reset></td>";
   echo "<td></td>";
  echo "</tr>";
echo "</table>";
echo "</form>";


echo "</PRE>";
?>
