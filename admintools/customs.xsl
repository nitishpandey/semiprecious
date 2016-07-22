<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output 
    method="xml"
    encoding="iso-8859-1"
    indent="yes"
    doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
    doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
  />
 <xsl:template match="/">
<html>
<head>
  <title>Accounts</title>
  <link href="/styles/style_semiprecious.css" rel="stylesheet" type="text/css" />
</head>
<body>
<table>
<thead>
<th>ItemID</th><th>Description</th><th>Qty</th><th>Rate(USD)</th><th>Amount</th>
<th>Beads</th><th>Silver
</th>
</thead>
 <tbody> 
   <xsl:for-each select="invoice/form/cart">
   <tr><td colspan="7">Cart ID: <xsl:value-of select="cartid"   />
   </td></tr>
 <xsl:for-each select="itemlist/item">
   <tr><td class="product-number"><xsl:value-of select="itemid"/></td>    
<td class="description"><xsl:value-of select="description"/></td> 
<td class="reg_price"><xsl:value-of select="quantity"/></td>
<td class="price"><xsl:value-of select="sell_rate"/></td>
<td class="price"><xsl:value-of select="sell_price"/></td>
<td class="price"><xsl:value-of select="weight/stone_weight"/></td>
<td class="price"><xsl:value-of select="weight/silver_weight"/></td>
  </tr> 
  </xsl:for-each>
  </xsl:for-each> 
 </tbody> 
</table> 
<xsl:variable name="silver_weight"><xsl:value-of select="invoice/weights/silver_weight"/></xsl:variable>
   <xsl:variable name="stone_weight"><xsl:value-of select="invoice/weights/stone_weight"/></xsl:variable>
   <xsl:variable name="customs_total"><xsl:value-of select="invoice/money_summary/customs_sell"/></xsl:variable>
<table>
<tr><td>
Silver Wt:
<xsl:value-of select="$silver_weight" /> </td><td>Value
<xsl:value-of select="0.58*$silver_weight" />
     </td></tr>
<tr><td>
Stone Wt:
<xsl:value-of select="$stone_weight" /> </td><td>Value
<xsl:value-of select="$customs_total - 0.15*$customs_total - 0.58*$silver_weight" />
     </td></tr>
<tr><td colspan="2">
Labour  Value
<xsl:value-of select="0.15*$customs_total" />
     </td></tr>          
</table>
<div id="customs_total"> USD <xsl:value-of select="$customs_total" /></div>
 
</body> 
</html> 
 </xsl:template> 
 
  <xsl:template match="cart"> 
    </xsl:template>
    
   
   
 <xsl:template match="item"> 
 </xsl:template>
</xsl:stylesheet>
