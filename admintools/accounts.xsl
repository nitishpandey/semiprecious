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
  <title>The Coyote's Bike shop</title>
</head>
<body>
<table>
<thead>
<th>Invoice</th><th>Category</th><th>Description</th><th>itemID</th><th>Option</th><th>Customer(USD)</th><th>Cost(Rs)</th><th>Sellprice(USD)</th>
<th>weight</th><th>Beads</th><th>Silver
</th><th>Returns</th><th>Qty</th>
<th>Pack?</th></thead>
 <tbody> 
  <xsl:apply-templates select="invoice/form"/> 
 </tbody> 
</table> 
</body> 
</html> 
 </xsl:template> 
  <xsl:template match="cart"> 
   <tr class="item"> <td class="cartid"><xsl:value-of select="cartid"/></td>
<td class="product-number"><xsl:value-of select="itemlist/item/itemid"/></td>    
<td class="description"><xsl:value-of select="itemlist/item/description"/></td> 
<td class="price"><xsl:value-of select="itemlist/item/customer_rate"/></td>
  </tr> 
 </xsl:template>
</xsl:stylesheet>