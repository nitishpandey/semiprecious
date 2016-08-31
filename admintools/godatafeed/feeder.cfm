<?xml version="1.0" encoding="utf-8" ?><cfsilent><cfparam name=start default=1><cfquery datasource="gemssql" name="s">Select * from qryFroogleJewelry where quantity>0  order by ID</cfquery></cfsilent>
<GoDataFeed>
<Paging>
<Start><cfoutput>#start#</cfoutput></Start>
<Count>2000</Count>
<Total><cfoutput>#s.recordcount#</cfoutput></Total>
</Paging>
<Fields>
<Field name="UniqueID"/>
<Field name="Name"/>
<Field name="Description"/>
<Field name="Price"/>
<Field name="MerchantCategory"/>
<Field name="URL"/>
<Field name="ImageURL"/>
<Field name="Manufacturer"/>
<Field name="ManufacturerPartNumber" />
<Field name="Keywords"/>
<Field name="Quantity"/>
<Field name="Condition"/>
</Fields>
<Products><cfoutput query="s" startrow="#start#" maxrows="100">
<Product>
<UniqueID>#ID#</UniqueID>
<Name>#titlecase(Title)#</Name>
<Description>#replace(description, "&", "and")#</Description>
<Price>#decimalformat(price)#</Price>
<MerchantCategory>#cat#</MerchantCategory>
<URL>#link#</URL>
<ImageURL>#image_link#</ImageURL>
<Manufacturer>NARI</Manufacturer>
<ManufacturerPartNumber>#ID#</ManufacturerPartNumber>
<Keywords>#cat#,#Title#,jewelry,jewellery,gemstone jewellery,semiprecious</Keywords>
<Quantity>#quantity#</Quantity>
<Condition>New</Condition>
</Product></cfoutput>
</Products>
</GoDataFeed>