<!-- comments -->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<?php

//     $redirect= "https://www3883.ssldomain.com/DomainID190799/".$_SERVER['REQUEST_URI'];
//     header("Location:$redirect");   
$amount = $_POST["amount"];
$invoiceNumber = $_POST["invoiceNumber"];
$fullName = $_POST["fullName"];
		// Break apart full-name to get first and last names:
		$fullName = explode(" ", $fullName, 2);
$firstName = $fullName[0];
$lastName = $fullName[1];

$address = $_POST["address"];
$city = $_POST["city"];
$country = strtoupper($_POST["country"]);
		// Cleanse country of dots, dashes and replace aper&and with AND:
		$country = strtoupper($country);
		$country = preg_replace("/[^\&0-9a-zA-Z\s]/", "" , $country);
		$country = preg_replace("/[&]/", "AND" , $country);
		$country = preg_replace("/[.]/", "" , $country);

$state = $_POST["State"];
$email = $_POST["email"];
$cart =  $_POST["cart"];
$phonenumber = $_POST["phonenumber"];


//If user directly came to this page, the invoice no. and/or the amount would be missing. In which case, redirect them to semiprecious.com
if (!$amount || !$invoiceNumber)
	{
		header ("location: https://www.semiprecious.com/confirmation.cfm"); 
	}
	
	function displayShippingCountryOptions()
	{
	
		$html = '';
		$countriesList = getCountryCodeArray();
		global $country;
		
		$country_aliases_US = array ("US", "UNITED STATES", "USA", "UNITED STATE OF AMERICA", "UNITED STATES AMERICA");
		$country_aliases_UK = array ("UK", "UNITED KINGDOM", "UNITED KINGDOMS");
		
		if (in_array($country, $country_aliases_US))
			{ $country = "UNITED STATES OF AMERICA";}
		elseif (in_array($country, $country_aliases_UK))
			{ $country = "UNITED KINGDOM";}
		
		foreach ( $countriesList as $aCountryCode => $aCountryName ) {
			
			if ($aCountryName == $country)
			{
				$html =  "<option value=\"$aCountryCode\" SELECTED>$aCountryName</option> \n";
				return $html;
			}
			
			else { $html .= "			<option value=\"$aCountryCode\">$aCountryName</option> \n";}
		}
		
		return $html;
		
	}
	function displayCountryOptions() {
		
		$html = '';
		$countriesList = getCountryCodeArray();
		global $country;
		
		$country_aliases_US = array ("US", "UNITED STATES", "USA", "UNITED STATE OF AMERICA", "UNITED STATES AMERICA");
		$country_aliases_UK = array ("UK", "UNITED KINGDOM", "UNITED KINGDOMS");
		
		if (in_array($country, $country_aliases_US))
			{ $country = "UNITED STATES OF AMERICA";}
		elseif (in_array($country, $country_aliases_UK))
			{ $country = "UNITED KINGDOM";}
		
		foreach ( $countriesList as $aCountryCode => $aCountryName ) {
			
			if ($aCountryName == $country)
			{
				$html .= "			<option value=\"$aCountryCode\" SELECTED>$aCountryName</option> \n";
		
			}
			
			else { $html .= "			<option value=\"$aCountryCode\">$aCountryName</option> \n";}
		}
		
		return $html;
		
	}
 
   //-------------------------------------
   function getCountryCodeArray() {
   
      $countriesArray = array();
      
      // A
      $countriesArray['AL'] = 'ALBANIA';
      $countriesArray['DZ'] = 'ALGERIA';
      $countriesArray['AS'] = 'AMERICAN SAMOA';
      $countriesArray['AD'] = 'ANDORRA';
      $countriesArray['AI'] = 'ANGUILLA';
      $countriesArray['AG'] = 'ANTIGUA AND BARBUDA';
      $countriesArray['AR'] = 'ARGENTINA';
      $countriesArray['AM'] = 'ARMENIA';
      $countriesArray['AW'] = 'ARUBA';
      $countriesArray['AU'] = 'AUSTRALIA';
      $countriesArray['AT'] = 'AUSTRIA';
      $countriesArray['AZ'] = 'AZERBAIJAN';
      
      // B
      $countriesArray['BS'] = 'BAHAMAS';
      $countriesArray['BH'] = 'BAHRAIN';
      $countriesArray['BD'] = 'BANGLADESH';
      $countriesArray['BB'] = 'BARBADOS';
      $countriesArray['BY'] = 'BELARUS';
      $countriesArray['BE'] = 'BELGIUM';
      $countriesArray['BZ'] = 'BELIZE';
      $countriesArray['BJ'] = 'BENIN';
      $countriesArray['BM'] = 'BERMUDA';
      $countriesArray['BO'] = 'BOLIVIA';
      $countriesArray['BA'] = 'BOSNIA AND HERZEGOVINA';
      $countriesArray['BW'] = 'BOTSWANA';
      $countriesArray['BR'] = 'BRAZIL';
      $countriesArray['VG'] = 'BRITISH VIRGIN ISLANDS';
      $countriesArray['BN'] = 'BRUNEI';
      $countriesArray['BG'] = 'BULGARIA';
      $countriesArray['BF'] = 'BURKINA FASO';
      
      // C
      $countriesArray['KH'] = 'CAMBODIA';
      $countriesArray['CM'] = 'CAMEROON';
      $countriesArray['CA'] = 'CANADA';
      $countriesArray['CV'] = 'CAPE VERDE';
      $countriesArray['KY'] = 'CAYMAN ISLANDS';
      $countriesArray['CL'] = 'CHILE';
      $countriesArray['CN'] = 'CHINA';
      $countriesArray['CO'] = 'COLOMBIA';
      $countriesArray['CK'] = 'COOK ISLANDS';
      $countriesArray['HR'] = 'CROATIA';
      $countriesArray['CY'] = 'CYPRUS';
      $countriesArray['CZ'] = 'CZECH REPUBLIC';
      
      // D
      $countriesArray['DK'] = 'DENMARK';
      $countriesArray['DJ'] = 'DJIBOUTI';
      $countriesArray['DM'] = 'DOMINICA';
      $countriesArray['DO'] = 'DOMINICAN REPUBLIC';
      
      // E
      $countriesArray['TP'] = 'EAST TIMOR';
      $countriesArray['EG'] = 'EGYPT';
      $countriesArray['SV'] = 'EL SALVADOR';
      $countriesArray['EE'] = 'ESTONIA';
      
      // F
      $countriesArray['FJ'] = 'FIJI';
      $countriesArray['FI'] = 'FINLAND';
      $countriesArray['FR'] = 'FRANCE';
      $countriesArray['GF'] = 'FRENCH GUIANA';
      $countriesArray['PF'] = 'FRENCH POLYNESIA';
      
      // G
      $countriesArray['GA'] = 'GABON';
      $countriesArray['GE'] = 'GEORGIA';
      $countriesArray['DE'] = 'GERMANY';
      $countriesArray['GH'] = 'GHANA';
      $countriesArray['GI'] = 'GIBRALTAR';
      $countriesArray['GR'] = 'GREECE';
      $countriesArray['GD'] = 'GRENADA';
      $countriesArray['GP'] = 'GUADELOUPE';
      $countriesArray['GU'] = 'GUAM';
      $countriesArray['GT'] = 'GUATEMALA';
      $countriesArray['GN'] = 'GUINEA';
      $countriesArray['GY'] = 'GUYANA';
      
      // H
      $countriesArray['HT'] = 'HAITI';
      $countriesArray['HN'] = 'HONDURAS';
      $countriesArray['HK'] = 'HONG KONG';
      $countriesArray['HU'] = 'HUNGARY';
      
      // I
      $countriesArray['IS'] = 'ICELAND';
      $countriesArray['IN'] = 'INDIA';
      $countriesArray['ID'] = 'INDONESIA';
      $countriesArray['IE'] = 'IRELAND';
      $countriesArray['IL'] = 'ISRAEL';
      $countriesArray['IT'] = 'ITALY';
      $countriesArray['CI'] = 'IVORY COAST';
      
      // J
      $countriesArray['JM'] = 'JAMAICA';
      $countriesArray['JP'] = 'JAPAN';
      $countriesArray['JO'] = 'JORDAN';
      
      // K
      $countriesArray['KZ'] = 'KAZAKHSTAN';
      $countriesArray['KE'] = 'KENYA';
      $countriesArray['KW'] = 'KUWAIT';
      
      // L
      $countriesArray['LA'] = 'LAO PEOPLE\'S DEMOCRATIC REPUBLIC';
      $countriesArray['LV'] = 'LATVIA';
      $countriesArray['LB'] = 'LEBANON';
      $countriesArray['LS'] = 'LESOTHO';
      $countriesArray['LT'] = 'LITHUANIA';
      $countriesArray['LU'] = 'LUXEMBOURG';
      
      // M
      $countriesArray['MO'] = 'MACAO';
      $countriesArray['MK'] = 'MACEDONIA';
      $countriesArray['MG'] = 'MADAGASCAR';
      $countriesArray['MY'] = 'MALAYSIA';
      $countriesArray['MV'] = 'MALDIVES';
      $countriesArray['ML'] = 'MALI';
      $countriesArray['MT'] = 'MALTA';
      $countriesArray['MH'] = 'MARSHALL ISLANDS';
      $countriesArray['MQ'] = 'MARTINIQUE';
      $countriesArray['MU'] = 'MAURITIUS';
      $countriesArray['MX'] = 'MEXICO';
      $countriesArray['FM'] = 'MICRONESIA, FEDERATED STATES OF';
      $countriesArray['MD'] = 'MOLDOVA';
      $countriesArray['MN'] = 'MONGOLIA';
      $countriesArray['MS'] = 'MONTSERRAT';
      $countriesArray['MA'] = 'MOROCCO';
      $countriesArray['MZ'] = 'MOZAMBIQUE';
      
      // N
      $countriesArray['NA'] = 'NAMIBIA';
      $countriesArray['NP'] = 'NEPAL';
      $countriesArray['NL'] = 'NETHERLANDS';
      $countriesArray['AN'] = 'NETHERLANDS ANTILLES';
      $countriesArray['NZ'] = 'NEW ZEALAND';
      $countriesArray['NI'] = 'NICARAGUA';
      $countriesArray['MP'] = 'NORTHERN MARIANA ISLANDS';
      $countriesArray['NO'] = 'NORWAY';
      
      // O
      $countriesArray['OM'] = 'OMAN';
      
      // P
      $countriesArray['PK'] = 'PAKISTAN';
      $countriesArray['PW'] = 'PALAU';
      $countriesArray['PS'] = 'PALESTINE';
      $countriesArray['PA'] = 'PANAMA';
      $countriesArray['PG'] = 'PAPUA NEW GUINEA';
      $countriesArray['PY'] = 'PARAGUAY';
      $countriesArray['PE'] = 'PERU';
      $countriesArray['PH'] = 'PHILIPPINES, REPUBLIC OF';
      $countriesArray['PL'] = 'POLAND';
      $countriesArray['PT'] = 'PORTUGAL';
      $countriesArray['PR'] = 'PUERTO RICO';
      
      // Q
      $countriesArray['QA'] = 'QATAR';
      
      // R
      $countriesArray['RO'] = 'ROMANIA';
      $countriesArray['RU'] = 'RUSSIAN FEDERATION';
      $countriesArray['RW'] = 'RWANDA';
      
      // S
      $countriesArray['KN'] = 'SAINT KITTS AND NEVIS';
      $countriesArray['LC'] = 'SAINT LUCIA';
      $countriesArray['VC'] = 'SAINT VINCENT AND THE GRENDINES';
      $countriesArray['WS'] = 'SAMOA';
      $countriesArray['SA'] = 'SAUDI ARABIA';
      $countriesArray['CS'] = 'SERBIA AND MONTENEGRO';
      $countriesArray['SC'] = 'SEYCHELLES';
      $countriesArray['SG'] = 'SINGAPORE';
      $countriesArray['SK'] = 'SLOVAKIA';
      $countriesArray['SI'] = 'SLOVENIA';
      $countriesArray['SB'] = 'SOLOMON ISLANDS';
      $countriesArray['ZA'] = 'SOUTH AFRICA';
      $countriesArray['KR'] = 'SOUTH KOREA';
      $countriesArray['ES'] = 'SPAIN';
      $countriesArray['LK'] = 'SRI LANKA';
      $countriesArray['SZ'] = 'SWAZILAND';
      $countriesArray['SE'] = 'SWEDEN';

      $countriesArray['CH'] = 'SWITZERLAND';
      
      // T
      $countriesArray['TW'] = 'TAIWAN';
      $countriesArray['TZ'] = 'TANZANIA, UNITED REPUBLIC OF';
      $countriesArray['TH'] = 'THAILAND';
      $countriesArray['TG'] = 'TOGO';
      $countriesArray['TO'] = 'TONGA';
      $countriesArray['TT'] = 'TRINIDAD AND TOBAGO';
      $countriesArray['TN'] = 'TUNISIA';
      $countriesArray['TR'] = 'TURKEY';
      $countriesArray['TM'] = 'TURKMENISTAN';
      $countriesArray['TC'] = 'TURKS AND CAICOS ISLANDS';
      
      // U
      $countriesArray['UG'] = 'UGANDA';
      $countriesArray['UA'] = 'UKRAINE';
      $countriesArray['AE'] = 'UNITED ARAB EMIRATES';
      $countriesArray['GB'] = 'UNITED KINGDOM';
      $countriesArray['US'] = 'UNITED STATES OF AMERICA';
      $countriesArray['UY'] = 'URUGUAY';
      $countriesArray['UZ'] = 'UZBEKISTAN';
      
      // V
      $countriesArray['VU'] = 'VANUATU';
      $countriesArray['VE'] = 'VENEZUELA';
      $countriesArray['VN'] = 'VIETNAM';
      $countriesArray['VI'] = 'VIRGIN ISLANDS, U.S.';
      
      // W, X, Y, Z
      $countriesArray['YE'] = 'YEMEN ARAB REPUBLIC';
      $countriesArray['ZM'] = 'ZAMBIA';
      
      return $countriesArray;
   }
?>

<?php include('vdaemon/vdaemon.php'); ?>

<html>
<head>
<title>Authorize.Net ARB Payment gateway</title>

<style type="text/css">
<!--
.error {
    color: #AA0000
}
.controlerror {
    background-color: #ffffdd;
    border: 1px solid #AA0000;
}
-->
</style>

<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link rel="stylesheet" type="text/css" href="CSS/upc.css">

<script language="JavaScript" src="jscripts/upc.js"></script>
<script language="JavaScript" src="jscripts/overlib.js"></script>
<!-- 
<script src="validation.js" type="text/javascript"></script> -->
<script type="text/javascript">
<!--

function jsExpDateCheck(oStatus)
{
    currDate = new Date();
    year = document.forms["form1"].elements["cc_year"].value;
    month = document.forms["form1"].elements["cc_month"].value;
    if (currDate.getFullYear() > year || (currDate.getFullYear() == year && currDate.getMonth() + 1 > month))
    {
        oStatus.isvalid = false;
        oStatus.errmsg = "Check the Expiration Date of the Credit Card";
    }
}
 
-->
</script>
<!--
<script type="text/javascript" language="javascript">var ANS_customer_id="ef41378d-bba2-4e5a-8e8f-3a413a95f192";</script> <script type="text/javascript" language="javascript" src="//verify.authorize.net/anetseal/seal.js" ></script> 
-->
</head>

<body style="margin-top:0">

<div id="overDiv" style="position:absolute; visibility:hide; z-index:1;">
</div>
<div align="center">
<div style="text-align:center;width:906px"><img src="/images/header.gif" /> </div></div>
<form method="post" name="form1" action="subscription_create.php" runat="vdaemon">
  <br>
  
<table width="500" align="center" cellpadding="4" cellspacing="0" class="border_configuration">
    <tr align="left" valign="top" bgcolor="#FFFFFF"> 
      <td colspan="3" bgcolor="666666" class="header"><div align="center"><b> 
          PAYMENT INFORMATION</b></div></td>
    </tr>
    
    <tr align="left" valign="top" bgcolor="f0f0f0" > 
      <td width="171" class="field_name" ><a href="#" onMouseOver="overlib('Total amount of your order (in US Dollars).', CAPTION, 'Order Amount', HEIGHT, 30, LEFT, BELOW, SNAPX, 20, SNAPY, 5); return true;" onMouseOut="nd(); return true;"><img src="images/info_icon.gif" border="0"></a> 
          Order Amount: </td>
<td colspan="2"><input disabled value="<?php echo "$".$amount; ?>">
				<input type="hidden" name="amount" value="<?php echo $amount; ?>"> <i>(Billed over next 2 months)</i>
		<!--	<div>Your card will be charged <?php echo "$".round(($amount/3), 2) ; ?>$</div> -->
	</td>
    </tr>

 	<tr align="left" valign="top" bgcolor="f0f0f0" > 
      <td width="171" class="field_name" ><a href="#" onMouseOver="overlib('Subscription amount to be charged for this order (in US Dollars). The subscription is over a period of one month, starting on the date of first payment.', CAPTION, 'Subscription Amount', HEIGHT, 30, LEFT, BELOW, SNAPX, 20, SNAPY, 5); return true;" onMouseOut="nd(); return true;"><img src="images/info_icon.gif" border="0"></a> 
          Subscription Amount: </td>
	<td colspan="2"><input disabled value="<?php echo "$".round(($amount/3), 2); ?>">
				<input type="hidden" name="sub_amount" value="<?php echo round(($amount/3), 2); ?>">
			<div>Your card will be charged as per the following Billing Schedule:<br>
				 <b><?php echo "$".round(($amount/3), 2); ?>: Today </b><br>
				    <?php echo "$".round(($amount/3), 2); ?>: <?php echo date("F j, Y", mktime(0,0,0,date("m")+1,date("d"),date("Y"))); ?><br>
				    <?php echo "$".round(($amount/3), 2); ?>: <?php echo date("F j, Y", mktime(0,0,0,date("m")+2,date("d"),date("Y"))); ?><br>
				    
			</div>
	</td>
    </tr>
    
    <tr align="left" valign="top" bgcolor="f0f0f0"> 
      <td class="field_name"><a href="#" onMouseOver="overlib('Invoice number, or the Cart ID for the reference of this order.', CAPTION, 'Invoice no. / Cart ID', HEIGHT, 30, LEFT, BELOW, SNAPX, 20, SNAPY, 5); return true;" onMouseOut="nd(); return true;"><img src="images/info_icon.gif" border="0"></a> 
          Invoice No.:</td>
<td colspan="2"><input disabled value="<?php echo $invoiceNumber ?>">
				<input type="hidden" name="invoiceNumber" value="<?php echo $invoiceNumber; ?>">
	</td>
    </tr>
				
    <tr align="left" valign="top" bgcolor="f0f0f0"> 
      <td class="field_name"><a href="#" onMouseOver="overlib('Brief description of the order.', CAPTION, 'Description', HEIGHT, 20, LEFT, BELOW, SNAPX, 20, SNAPY, 5); return true;" onMouseOut="nd(); return true;"><img src="images/info_icon.gif" border="0"></a> 
          Description:</td>
<td colspan="2"><input disabled size="50" value="Semiprecious.com Jewelry">
				<input type="hidden" name="name" size="50" value="Semiprecious.com Jewelry">
	</td>
    </tr>
    
    			<input type="hidden" name="cart" value="<?php echo $cart; ?>">
    <!--

    
  -->
  
  </table>
  <br>
  <table width="500" align="center" cellpadding="4" cellspacing="0" class="border_configuration">
    <tr align="left" valign="top" bgcolor="#FFFFFF"> 
      <td colspan="2" bgcolor="666666" class="header"><div align="center"><b> 
          BILLING INFORMATION</b></div></td>
    </tr>

    <tr align="left" valign="top" bgcolor="f0f0f0"> 
      <td class="field_name">
      <vllabel validators="billing_firstName_required,billing_firstName_syntax" errclass="error" for="billing_firstName" cerrclass="controlerror">First Name:</vllabel>
      </td>
      
<td><input type="text" name="billing_firstName" maxLength="50" size="50" value="<?php echo $firstName; ?>" >
		
		<vlvalidator name="billing_firstName_required" type="required" control="billing_firstName" errmsg="'First Name' is required in Billing Information">
        <vlvalidator name="billing_firstName_syntax" type="regexp" control="billing_firstName"
          errmsg="'First Name' in Billing Information can only contain letters" regexp="/^[a-z]*([\s][a-z][.])?$/i">	

</td>
    </tr>
    
    <tr align="left" valign="top" bgcolor="f0f0f0"> 
      <td class="field_name">
      <vllabel validators="billing_lastName_required,billing_lastName_syntax" errclass="error" for="billing_lastName" cerrclass="controlerror">Last Name:</vllabel>
	  </td>	
<td><input type="text" name="billing_lastName" maxLength="50" size="50" value="<?php echo $lastName; ?>"></td>
    
    	<vlvalidator name="billing_lastName_required" type="required" control="billing_lastName" errmsg="'Last Name' is required in Billing Information">
        <vlvalidator name="billing_lastName_syntax" type="regexp" control="billing_lastName"
          errmsg="'Last Name' in Billing Information can only contain letters" regexp="/^[a-z]*$/i">
    </tr>

	<tr align="left" valign="top" bgcolor="f0f0f0" > 
      <td width="156" class="field_name" >Company:</td>
<td width="326"><input type="text" name="billing_company" maxLength="50" size="50" ></td>
    </tr>
   
   
   <!----------  TESTCODE
    <tr align="left" valign="top" bgcolor="f0f0f0" > 
      <td width="156" class="field_name" ><?php echo "hi";?></td>
<td width="326"><input type="text" name="billing_company" maxLength="50" size="50" ></td>
    </tr>
    
     -->
    
    <tr align="left" valign="top" bgcolor="f0f0f0"> 
      <td class="field_name">
      <vllabel validators="billing_address_required" errclass="error" for="billing_address" cerrclass="controlerror">Address:</vllabel>
      </td>
<td><input type="text" name="billing_address" maxLength="60" size="60" value="<?php echo $address; ?>"></td>
    	<vlvalidator name="billing_address_required" type="required" control="billing_address" errmsg="'Address' is required in Billing Information">
    </tr>
    
    <tr align="left" valign="top" bgcolor="f0f0f0"> 
      <td class="field_name">
      <vllabel validators="billing_city_required,billing_city_syntax" errclass="error" for="billing_city" cerrclass="controlerror">City:</vllabel>
      </td>
<td><input type="text" name="billing_city" maxLength="40" size="40" value="<?php echo $city; ?>"></td>
    <vlvalidator name="billing_city_required" type="required" control="billing_city" errmsg="'City' is required in Billing Information">
    <vlvalidator name="billing_city_syntax" type="regexp" control="billing_city" errmsg="'City' in Billing Information can only contain letters" regexp="/^[a-zA-Z ]*$/">
    </tr>
    
    <tr align="left" valign="top" bgcolor="f0f0f0"> 
      <td class="field_name">
  	<vllabel validators="billing_state_required" errclass="error" for="billing_state" cerrclass="controlerror">State:</vllabel>
 <!--     <vllabel validators="billing_state_ous_required" errclass="error" for="billing_state_ous" cerrclass="controlerror"></vllabel>  -->
      </td>
<td><select name="billing_state"
onMouseUp="
var a = this.form.getElementsByTagName('option');
for (var i=0; i<a.length; ++i) {
if (a[i].selected == true && a[i].value == 'OUS') {
document.getElementById('billingDiv').style.display = 'block';
//this.form['billing_state_ous'].removeAttribute('disabled');
this.form['billing_state_ous'].value = '';
this.form['billing_country'].value = '';
break;
} 
else if (a[i].selected == true && a[i].value != '' && a[i].value != 'OUS') {
this.form['billing_country'].value = 'US';
}
else {
// sets the previous value the fields, you may not want to do this
//this.form['billing_state_ous'].value = 'defaultstate';
// and disables them again
//this.form['billing_state_ous'].setAttribute('disabled','disabled');
document.getElementById('billingDiv').style.display = 'block';
}}">
          <option value="">-- Select Option --</option>
          <option value="OUS"> (Outside US) </option>
          <option value="AL">Alabama</option>
          <option value="AK">Alaska</option>
          <option value="AS">American Samoa</option>
          <option value="AZ">Arizona</option>
          <option value="AR">Arkansas</option>
          <option value="CA">California</option>
          <option value="CO">Colorado</option>
          <option value="CT">Connecticut</option>
          <option value="DE">Delaware</option>
          <option value="DC">District of Columbia</option>
          <option value="FL">Florida</option>
          <option value="GA">Georgia</option>
          <option value="GU">Guam</option>
          <option value="HI">Hawaii</option>
          <option value="ID">Idaho</option>
          <option value="IL">Illinois</option>
          <option value="IN">Indiana</option>
          <option value="IA">Iowa</option>
          <option value="KS">Kansas</option>
          <option value="KY">Kentucky</option>
          <option value="LA">Louisiana</option>
          <option value="ME">Maine</option>
          <option value="MH">Marshall Islands</option>
          <option value="MD">Maryland</option>
          <option value="MA">Massachusetts</option>
          <option value="MI">Michigan</option>
          <option value="FM">Micronesia</option>
          <option value="MN">Minnesota</option>
          <option value="MS">Mississippi</option>
          <option value="MO">Missouri</option>
          <option value="MT">Montana</option>
          <option value="NE">Nebraska</option>
          <option value="NV">Nevada</option>
          <option value="NH">New Hampshire</option>
          <option value="NJ">New Jersey</option>
          <option value="NM">New Mexico</option>
          <option value="NY">New York</option>
          <option value="NC">North Carolina</option>
          <option value="ND">North Dakota</option>
          <option value="MP">Northern Marianas</option>
          <option value="OH">Ohio</option>
          <option value="OK">Oklahoma</option>
          <option value="OR">Oregon</option>
          <option value="PW">Palau</option>
          <option value="PA">Pennsylvania</option>
          <option value="PR">Puerto Rico</option>
          <option value="RI">Rhode Island</option>
          <option value="SC">South Carolina</option>
          <option value="SD">South Dakota</option>
          <option value="TN">Tennessee</option>
          <option value="TX">Texas</option>
          <option value="UT">Utah</option>
          <option value="VT">Vermont</option>
          <option value="VI">Virgin Islands</option>
          <option value="VA">Virginia</option>
          <option value="WA">Washington</option>
          <option value="WV">West Virginia</option>
          <option value="WI">Wisconsin</option>
          <option value="WY">Wyoming</option>
          <option value="AA">Armed Forces Americas</option>
          <option value="AE">Armed Forces Africa</option>
          <option value="AE">Armed Forces Canada</option>
          <option value="AE">Armed Forces Europe</option>
          <option value="AE">Armed Forces Middle East</option>
          <option value="AP">Armed Forces Pacific</option>
          </select>
        <div id="billingDiv" style="float:right; display:block"><i>(if outside US)</i>:<input type ="text" name="billing_state_ous" maxLength="14" size="14"> <!-- disabled="disabled"> -->
        </div>
      </td>

<!--    <vlvalidator name="billing_state_required" type="required" control="billing_state" errmsg="'State' is required in Billing Information">
    <vlvalidator name="billing_state_ous_required" type="required" control="billing_state_ous" errmsg="'State (outside US)' is required in Billing Information"> -->
   </tr>
    
    <tr align="left" valign="top" bgcolor="f0f0f0"> 
      <td class="field_name">
      <vllabel validators="billing_zip_required,billing_zip_syntax" errclass="error" for="billing_zip" cerrclass="controlerror">Zip:</vllabel>
      </td>
<td><input type="text" name="billing_zip" maxLength="20" size="20" ></td>
    <vlvalidator name="billing_zip_required" type="required" control="billing_zip" errmsg="'Zip' is required in Billing Information">
    <vlvalidator name="billing_zip_syntax" type="regexp" control="billing_zip" errmsg="'Zip' in Billing Information in not valid" regexp="/^[0-9a-zA-Z]+[- ]?[0-9a-zA-Z]*?$/">
    </tr>
  

    <tr align="left" valign="top" bgcolor="f0f0f0"> 
      <td class="field_name">
      <vllabel validators="billing_country_required" errclass="error" for="billing_country" cerrclass="controlerror">Country:</vllabel>
      </td>
<td><select name="billing_country">Country
<option value="" selected>Choose a Country</option>

	<?php echo displayCountryOptions(); ?>

 </select></td>
    <vlvalidator name="billing_country_required" type="required" control="billing_country" errmsg="'Country' is required in Billing Information">
 </tr>

    <tr align="left" valign="top" bgcolor="f0f0f0"> 
      <td class="field_name">
      <vllabel validators="phoneNumber_required,phoneNumber_syntax" errclass="error" for="phoneNumber" cerrclass="controlerror">Phone:</vllabel>
      </td>
<td><input type="text" name="phoneNumber" maxLength="25" size="25" value="<?php echo $phonenumber; ?>" ></td>
    <vlvalidator name="phoneNumber_required" type="required" control="phoneNumber" errmsg="'Phone number' is required">
    <vlvalidator name="phoneNumber_syntax" type="regexp" control="phoneNumber" errmsg="'Phone number' is invalid" regexp="/^\+?[(]?\d{1,3}[\s.()-]?([\s.()-]\d{1,5}[.()-])?([\s]\d{1,6})?(?:\d[\s.()-]*){4,13}(?: x \d* )?$/x">
    </tr>
    
    <tr align="left" valign="top" bgcolor="f0f0f0"> 
      <td class="field_name">E-mail:</td>
<td><input type="text" name="email" maxLength="255" size="40" value="<?php echo $email; ?>"</td>
    <vlvalidator name="email_required" type="required" control="email" errmsg="'Email Address' is required">
    <vlvalidator name="email_syntax" type="regexp" control="email" errmsg="'Email address' is invalid" regexp="/^([a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4})*$/">
    
    </tr>
  </table>
  <br>
  <table width="500" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr> 
      <td width="21"> <input type="checkbox" name="sInfo" onClick="copyAddress();"> 
      </td>
      <td width="479">Click this checkbox to ship your order to your billing address.</td>
    </tr>
  </table>
  <br>
  <table width="500" align="center" cellpadding="4" cellspacing="0" class="border_configuration">
    <tr align="left" valign="top" bgcolor="#FFFFFF"> 
      <td colspan="2" bgcolor="666666" class="header"><div align="center"><b> 
          SHIPPING INFORMATION</b></div></td>
    </tr>

    <tr align="left" valign="top" bgcolor="f0f0f0"> 
      <td class="field_name">
      <vllabel validators="shipping_firstName_required,shipping_firstName_syntax" errclass="error" for="shipping_firstName" cerrclass="controlerror">First Name:</vllabel>
      </td>
<td><input type="text" name="shipping_firstName" compulsory="yes" validate="alpha" maxLength="50" size="50" value="<?php echo $firstName; ?>"></p>
	  <vlvalidator name="shipping_firstName_required" type="required" control="shipping_firstName" errmsg="'First Name' is required in Shipping Information">
      <vlvalidator name="shipping_firstName_syntax" type="regexp" control="shipping_firstName"
          errmsg="'First Name' in Shipping Information can only contain letters" regexp="/^[a-z]*([\s][a-z][.])?$/i">
</td>
    </tr>
    
    <tr align="left" valign="top" bgcolor="f0f0f0"> 
      <td class="field_name">
      <vllabel validators="shipping_lastName_required,shipping_lastName_syntax" errclass="error" for="shipping_lastName" cerrclass="controlerror">Last Name:</vllabel>
      </td>
<td><input type="text" name="shipping_lastName" maxLength="50" size="50" value="<?php echo $lastName; ?>" ></td>
    <vlvalidator name="shipping_lastName_required" type="required" control="shipping_lastName" errmsg="'Last Name' is required in Shipping Information">
    <vlvalidator name="shipping_lastName_syntax" type="regexp" control="shipping_lastName"
          errmsg="'Last Name' in Shipping Information can only contain letters" regexp="/^[a-z]*$/i">
    
    </tr>
    <tr align="left" valign="top" bgcolor="f0f0f0" > 
      <td width="149" class="field_name" >Company:</td>
<td width="333"><input type="text" name="shipping_company" maxLength="50" size="50" ></td>
    </tr>
    
    <tr align="left" valign="top" bgcolor="f0f0f0"> 
      <td class="field_name">
      <vllabel validators="shipping_address_required" errclass="error" for="shipping_address" cerrclass="controlerror">Address:</vllabel>
      </td>
<td><input type="text" name="shipping_address" maxLength="60" size="60" value="<?php echo $address; ?>"></td>
    <vlvalidator name="shipping_address_required" type="required" control="shipping_address" errmsg="'Address' is required in Shipping Information">
    </tr>
      
    <tr align="left" valign="top" bgcolor="f0f0f0"> 
      <td class="field_name">
      <vllabel validators="shipping_city_required,shipping_city_syntax" errclass="error" for="shipping_city" cerrclass="controlerror">City:</vllabel>
      </td>
<td><input type="text" name="shipping_city" maxLength="40" size="40"></td>
    <vlvalidator name="shipping_city_required" type="required" control="shipping_city" errmsg="'City' is required in Shipping Information">
    <vlvalidator name="shipping_city_syntax" type="regexp" control="shipping_city" errmsg="'City' in Shipping Information can only contain letters" regexp="/^[a-zA-Z ]*$/">
    </tr>
    <tr align="left" valign="top" bgcolor="f0f0f0"> 
      <td class="field_name">
      <vllabel validators="shipping_state_required" errclass="error" for="shipping_state" cerrclass="controlerror">State:</vllabel>
<!--      <vllabel validators="shipping_state_ous_required" errclass="error" for="shipping_state_ous" cerrclass="controlerror"></vllabel>   -->
      </td>
<td><select name="shipping_state"
onMouseUp="
var a = this.form.getElementsByTagName('option');
for (var i=0; i<a.length; ++i) {
if (a[i].selected == true && a[i].value == 'OUS') {
document.getElementById('shippingDiv').style.display = 'block';
this.form['shipping_state_ous'].value = '';
this.form['shipping_country'].value = '';
break;
} 
else if (a[i].selected == true && a[i].value != '' && a[i].value != 'OUS') {
this.form['shipping_country'].value = 'US';
}
else {
document.getElementById('shippingDiv').style.display = 'block';
}}">
          <option value="">-- Select Option --</option>
          <option value="OUS"> (Outside US) </option>
          <option value="AL">Alabama</option>
          <option value="AK">Alaska</option>
          <option value="AS">American Samoa</option>
          <option value="AZ">Arizona</option>
          <option value="AR">Arkansas</option>
          <option value="CA">California</option>
          <option value="CO">Colorado</option>
          <option value="CT">Connecticut</option>
          <option value="DE">Delaware</option>
          <option value="DC">District of Columbia</option>
          <option value="FL">Florida</option>
          <option value="GA">Georgia</option>
          <option value="GU">Guam</option>
          <option value="HI">Hawaii</option>
          <option value="ID">Idaho</option>
          <option value="IL">Illinois</option>
          <option value="IN">Indiana</option>
          <option value="IA">Iowa</option>
          <option value="KS">Kansas</option>
          <option value="KY">Kentucky</option>
          <option value="LA">Louisiana</option>
          <option value="ME">Maine</option>
          <option value="MH">Marshall Islands</option>
          <option value="MD">Maryland</option>
          <option value="MA">Massachusetts</option>
          <option value="MI">Michigan</option>
          <option value="FM">Micronesia</option>
          <option value="MN">Minnesota</option>
          <option value="MS">Mississippi</option>
          <option value="MO">Missouri</option>
          <option value="MT">Montana</option>
          <option value="NE">Nebraska</option>
          <option value="NV">Nevada</option>
          <option value="NH">New Hampshire</option>
          <option value="NJ">New Jersey</option>
          <option value="NM">New Mexico</option>
          <option value="NY">New York</option>
          <option value="NC">North Carolina</option>
          <option value="ND">North Dakota</option>
          <option value="MP">Northern Marianas</option>
          <option value="OH">Ohio</option>
          <option value="OK">Oklahoma</option>
          <option value="OR">Oregon</option>
          <option value="PW">Palau</option>
          <option value="PA">Pennsylvania</option>
          <option value="PR">Puerto Rico</option>
          <option value="RI">Rhode Island</option>
          <option value="SC">South Carolina</option>
          <option value="SD">South Dakota</option>
          <option value="TN">Tennessee</option>
          <option value="TX">Texas</option>
          <option value="UT">Utah</option>
          <option value="VT">Vermont</option>
          <option value="VI">Virgin Islands</option>
          <option value="VA">Virginia</option>
          <option value="WA">Washington</option>
          <option value="WV">West Virginia</option>
          <option value="WI">Wisconsin</option>
          <option value="WY">Wyoming</option>
          <option value="AA">Armed Forces Americas</option>
          <option value="AE">Armed Forces Africa</option>
          <option value="AE">Armed Forces Canada</option>
          <option value="AE">Armed Forces Europe</option>
          <option value="AE">Armed Forces Middle East</option>
          <option value="AP">Armed Forces Pacific</option>
          </select>
        <div id="shippingDiv" style="float:right; display:block"><i>(if outside US)</i>:<input type ="text" name="shipping_state_ous" maxLength="14" size="14">
        </div>
        </td>
<!--    <vlvalidator name="shipping_state_required" type="required" control="shipping_state" errmsg="'State' is required in Shipping Information">
    <vlvalidator name="shipping_state_ous_required" type="required" control="shipping_state_ous" errmsg="'State (outside US)' is required in Shipping Information">  -->
    </tr>
    
    <tr align="left" valign="top" bgcolor="f0f0f0"> 
      <td class="field_name">
      <vllabel validators="shipping_zip_required,shipping_zip_syntax" errclass="error" for="shipping_zip" cerrclass="controlerror">Zip:</vllabel>
      </td>
<td><input id="shipping_zip" type="text" name="shipping_zip" size="40" ></td>
    <vlvalidator name="shipping_zip_required" type="required" control="shipping_zip" errmsg="'Zip' is required in Shipping Information">
    <vlvalidator name="shipping_zip_syntax" type="regexp" control="shipping_zip" errmsg="'Zip' in Shipping Information is not valid" regexp="/^[0-9a-zA-Z]+[- ]?[0-9a-zA-Z]*?$/">
    </tr>
    
    <tr align="left" valign="top" bgcolor="f0f0f0"> 
      <td class="field_name">
      <vllabel validators="shipping_country_required" errclass="error" for="shipping_country" cerrclass="controlerror">Country:</vllabel>
      </td>
<td><select name="shipping_country">
<option value="" selected>Shipping To Country 
	<?php echo displayShippingCountryOptions(); ?>
     </select></td>
         <vlvalidator name="shipping_country_required" type="required" control="shipping_country" errmsg="'Country' is required in Shipping Information">
   </tr>
  </table>
  <br>
<br>
  <table width="500" align="center" cellpadding="4" cellspacing="0" class="border_configuration">
    <tr align="left" valign="top" bgcolor="#FFFFFF"> 
      <td colspan="2" bgcolor="666666" class="header"><div align="center"><b> 
          CREDIT CARD INFORMATION</b></div></td>
    </tr>
    <tr align="left" valign="top" bgcolor="f0f0f0"> 
      <td width="145" class="field_name">&nbsp;</td>
      <td width="337"><img src="images/cclogos2.gif" width="200" height="30"></td>
    </tr>
    
    <tr align="left" valign="top" bgcolor="f0f0f0"> 
      <td class="field_name">
      <vllabel validators="cardNumber_required,cardNumber_syntax" errclass="error" for="cardNumber" cerrclass="controlerror">Credit Card Number:</vllabel>
      </td>
<td><input type="text" name="cardNumber" maxLength="16" size="20" id="cardNumber" lang="Credit Card Number Required" value="xxxxxxxxxxxxxxxx"></td>
    <vlvalidator name="cardNumber_required" type="required" control="cardNumber" errmsg="'Credit Card Number' is required">
    <vlvalidator name="cardNumber_syntax" type="regexp" control="cardNumber" errmsg="'Credit Card Number' is not valid" regexp="/^(?:4[0-9]{12}(?:[0-9]{3})?|5[1-5][0-9]{14}|6011[0-9]{12}|622((12[6-9]|1[3-9][0-9])|([2-8][0-9][0-9])|(9(([0-1][0-9])|(2[0-5]))))[0-9]{10}|64[4-9][0-9]{13}|65[0-9]{14}|3(?:0[0-5]|[68][0-9])[0-9]{11}|3[47][0-9]{13})*$/">
    </tr>
    
    <tr align="left" valign="top" bgcolor="f0f0f0"> 
      <td class="field_name">
      <vllabel validators="cc_month_required" errclass="error" for="cc_month" cerrclass="controlerror">Expiration Date:</vllabel>
      <vllabel validators="cc_year_required" errclass="error" for="cc_year" cerrclass="controlerror"></vllabel>
      </td>
      <td><select name="cc_month">
          <option >-- Select Option --</option>
          <option value="01">01 - January</option>
          <option value="02">02 - February</option>
          <option value="03">03 - March</option>
          <option value="04">04 - April</option>
          <option value="05">05 - May</option>
          <option value="06">06 - June</option>
          <option value="07">07 - July</option>
          <option value="08">08 - August</option>
          <option value="09">09 - September</option>
          <option value="10">10 - October</option>
          <option value="11">11 - November</option>
          <option value="12">12 - December</option>
        </select> <select name="cc_year">
          <option >-- Select Option --</option>
	<?php
    	// Set the year to be the current year up to ten years from now
    	for ($i = date("Y"); $i < date("Y") + 10; $i++)
    	{echo "<option value=\"" . $i . "\">" . $i . "</option>";}
	?>
  </select>
    <vlvalidator name="cc_month_required" type="regexp" control="cc_month" errmsg="Select the Expiration Month of the Credit Card" regexp="/\d+/">
    <vlvalidator name="cc_year_required" type="regexp" control="cc_year" errmsg="Select the Expiration Year of the Credit Card" regexp="/\d+/">   
	<vlvalidator name="ExpDate" type="custom" errmsg="Check the Expiration Date of the Credit Card" function="phpExpDateCheck" clientfunction="jsExpDateCheck">
  </td>
  
    </tr>
    <tr align="left" valign="top" bgcolor="f0f0f0">
      <td class="field_name">
      <vllabel validators="card_code_required,card_code_syntax" errclass="error" for="card_code" cerrclass="controlerror">Card Code: </vllabel>
      <a href="#" onClick="window.open('pop_card_code.htm','','width=650,height=400')">What is this?</a>
      </td>
        
      <td><input type="text" name="card_code" maxLength="4" size="4">
      	<vlvalidator name="card_code_required" type="required" control="card_code" errmsg="'Card Code' is required"></vlvalidator>
      	<vlvalidator name="card_code_syntax" type="regexp" control="card_code" errmsg="'Card Code' is invalid" regexp="/^[0-9]{3,4}$/"></vlvalidator>
      </td>
    </tr>
  </table>
  <br>
  <table width="500" border="0" align="center" cellpadding="2" cellspacing="1">
    <tr><td width="254"<vlsummary class="error" headertext="Please correct the following error(s):" displaymode="bulletlist"></td></tr>
  </table>
  
  <table width="500" border="0" align="center" cellpadding="2" cellspacing="1">
  <td width="154"><input class="form_button" type="submit" name="upc_submit" value="< Submit Information >" ></td>
      <td width="346"> <input class="form_button" type="reset" name="reset" value="< Clear Form >"></td>
    </tr>
  </table>

  <br>
  <table width="500" border="0" align="center" cellpadding="2" cellspacing="1">
    <tr> 
     <td width="154"><!-- (c) 2005, 2009. Authorize.Net is a registered trademark of CyberSource Corporation --> <div class="AuthorizeNetSeal"> <script type="text/javascript" language="javascript">var ANS_customer_id="ef41378d-bba2-4e5a-8e8f-3a413a95f192";</script> <script type="text/javascript" language="javascript" src="//verify.authorize.net/anetseal/seal.js" ></script> <a href="https://www.authorize.net/" id="AuthorizeNetText" target="_blank">Online Payments</a> </div></td>
     <td width="346">&nbsp; </td>
    </tr>
  
  <!-- CHECK IF *BILLING* STATE IS NOT SELECTED AS OUTSIDE-US WHILE COUNTRY IS ALSO SELECTED AS U.S -->
  <vlgroup operator="OR" errmsg="Can't have a US Billing State when country selected is not United States. Select (Outside US) instead.">
  	<vlvalidator type="compare" validtype="string" control="billing_country" comparevalue="US" operator="e">
  	<vlvalidator type="compare" validtype="string" control="billing_state" comparevalue="OUS" operator="e">
  </vlgroup>
  
  
   <vlgroup operator="OR" errmsg="Select either a US Billing State or enter your state if 'Outside US'">
		<vlvalidator type="compare" validtype="string" control="billing_state"  comparevalue="OUS" operator="ne">
  		<vlvalidator type="required" control="billing_state_ous"  comparevalue="" operator="ne">
  </vlgroup>
  
  <vlvalidator name="billing_state_required" type="required" control="billing_state" errmsg="'Billing State' is required">
  
 <!-- CHECK IF *SHIPPING* STATE IS NOT SELECTED AS OUTSIDE-US WHILE COUNTRY IS ALSO SELECTED AS U.S -->
   <vlgroup operator="OR" errmsg="Can't have a US Shipping State when country selected is not United States. Select (Outside US) instead.">
  	<vlvalidator type="compare" validtype="string" control="shipping_country" comparevalue="US" operator="e">
  	<vlvalidator type="compare" validtype="string" control="shipping_state" comparevalue="OUS" operator="e">
  </vlgroup>
  
  
   <vlgroup operator="OR" errmsg="Select either a US Shipping State or enter your state if 'Outside US'">
		<vlvalidator type="compare" validtype="string" control="shipping_state"  comparevalue="OUS" operator="ne">
  		<vlvalidator type="required" control="shipping_state_ous"  comparevalue="" operator="ne">
  </vlgroup>
  
  <vlvalidator name="shipping_state_required" type="required" control="shipping_state" errmsg="'Shipping State' is required">

 
  </table>
  <input type="hidden" name="subscription_type" value="create">

</form>

</body>
</html>

<?php VDEnd(); ?>