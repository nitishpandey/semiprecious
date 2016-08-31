
<cfmail to="#url.buyer#" from="Semiprecious.com <cs@semiprecious.com>" subject="Jewelry Store Cart "  type="html">
<div align="center" style="border:solid 1px gray;padding:4px;margin-top:10px;width:600px">
<img src="http://www.semiprecious.com/images/header.gif" style="margin-bottom:20px;" height="70px" />
<div align="left" style="width:100%;margin:10px;">
Hi,<br />
Please refer to your shopping at our online jewelry store semiprecious.com. <br />

Some items in your order (Invoice no. #url.cartid#) are in transit from our India sourcing office. You would be aware that due to volcanic eruption in Iceland flight schedules are disturbed. This has  delayed our deliveries as well.

<br />We do expect that the situation will improve this week. We will inform you when we ship your order. 
 
<br />Sincere apologies.<br /><br /><br />

 Best Regards and assuring you of the best service,<br />
Customer Service Team Semiprecious.com
</div>
</div>
  </cfmail>
  <cflocation url="http://www.semiprecious.com/cartstatus21.cfm?show=abandoned" />
  