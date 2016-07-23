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
<table>
<thead>
</thead>
 <tbody> 
  <xsl:apply-templates select="/contacts/contact/fields"/> 
 </tbody> 
</table> 
 </xsl:template> 
  <xsl:template match="*"> 
    <tr class="item"> <td class="cartid"><xsl:value-of select="value"/></td>
</tr> 
 </xsl:template>
</xsl:stylesheet>