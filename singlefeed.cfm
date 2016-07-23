<cfsetting enablecfoutputonly="yes"> <!--- Required for CSV export to function properly --->
<cfquery datasource="gemssql" name=s>
Select * from qryFroogleJewelry
</cfquery><cfset fcontent="UNIQUE INTERNAL CODE#chr(9)#PRODUCT NAME#CHR(9)#PRODUCT DESCRIPTION#CHR(9)#PRODUCT PRICE#CHR(9)#PRODUCT URL#CHR(9)#IMAGE URL#CHR(9)#CATEGORY#CHR(9)#SHIPPING COST#CHR(9)#GENDER#CHR(9)#COLOR#CHR(9)#GOOGLE TAX#CHR(9)#MANUFACTURER#CHR(9)#Google Age Group#CHR(9)#MPN (MANUFACTURER PART NUMBER)">

<cfloop query='s'><cfset fcontent=fcontent &
"
#s.ID##chr(9)##titlecase(s.Title)##chr(9)##s.description##chr(9)##s.price##chr(9)##s.link##chr(9)##s.image_link##chr(9)##s.product_Type##chr(9)#3.99#chr(9)#f#chr(9)##color##chr(9)#US:TX:8.25:y#CHR(9)#Semiprecious.com#CHR(9)#Adult#CHR(9)##s.ID#">
</cfloop>
<!---
#Brand##chr(9)##payment_accepted##chr(9)##payment_notes##chr(9)##quantity##chr(9)##condition##chr(9)##color##chr(9)##Weight##chr(9)##Year##chr(9)##currency##chr(13)#
--->
<cffile action = "write" 
    file = "d:\inetpub\semiprecious\datafeed\singlefeed.txt" 
    output = "#fcontent#">