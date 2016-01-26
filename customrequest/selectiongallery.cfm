<cfparam name="PageNum_custom_items" default="1">
<cfquery name="custom_items" datasource="sptm">
SELECT *
FROM custom_items 
</cfquery>
<cfset MaxRows_custom_items=30>
<cfset StartRow_custom_items=Min((PageNum_custom_items-1)*MaxRows_custom_items+1,Max(custom_items.RecordCount,1))>
<cfset EndRow_custom_items=Min(StartRow_custom_items+MaxRows_custom_items-1,custom_items.RecordCount)>
<cfset TotalPages_custom_items=Ceiling(custom_items.RecordCount/MaxRows_custom_items)>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
<link href="/styles/style_semiprecious.css" rel="stylesheet" type="text/css" media="screen" />
<script src="/SpryAssets/SpryTabbedPanels.js" type="text/javascript"></script>
<link href="/SpryAssets/SpryTabbedPanels.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div id="TabbedPanels1" class="TabbedPanels">
  <ul class="TabbedPanelsTabGroup">
    <li class="TabbedPanelsTab" tabindex="0">Tab 1</li>
    <li class="TabbedPanelsTab" tabindex="0">Tab 2</li>
  </ul>
  <div class="TabbedPanelsContentGroup">
    <div class="TabbedPanelsContent">Content
      <table border="1">
        <tr>
          <td>imageid</td>
          <td>category</td>
          <td>status</td>
          <td>dateofupdate</td>
        </tr>
        <cfoutput query="custom_items" startRow="#StartRow_custom_items#" maxRows="#MaxRows_custom_items#">
          <tr>
            <td>#custom_items.imageid#</td>
            <td>#custom_items.category#</td>
            <td>#custom_items.status#</td>
            <td>#custom_items.dateofupdate#</td>
          </tr>
        </cfoutput>
      </table>
1</div>
    <div class="TabbedPanelsContent">Content 2</div>
  </div>
</div>
<script type="text/javascript">
var TabbedPanels1 = new Spry.Widget.TabbedPanels("TabbedPanels1");
</script>
</body>
</html>