
<html>
<head>

<title>Continue Your  Shopping Later</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body style="font-family:Arial;font-size:14px;font-color:blue;padding:4px;">
<p><span style="font-weight:bold">Wish to continue shopping  later ?</span><br>
  You must <span style="color:blue;">generate a cartid for your 
  cart now. Generate the cartid by clicking on the 'Start CheckOut' button</span>. You dont need to fill any payment details at this stage.
  Simply note down or memorize the cart id and close your browser window if you so desire.<br>
  When you return to shop you can <span style="background-color:orange">use this cart id to fill 
  up your cart in one step</span> from the cart page or from the 'activate cart' link on home page.<br>
  <br>
This is required because if there is no activity from your side for a long time the shopping session is expired (Cart is emptied) for security reasons. 
  The same can also happen due to closing of browser window or due to web site server restart. <br>
  To avoid seeing an empty cart we suggest you generate  your cartid now.<br>
  <font color="#B30000">Caution:</font> The cart will be available for  next 72 hours 
  and there is <strong>no guarantee </strong>that the items will be available 
  in stock on your return or at the same price (could be lower  or higher). </p>
  <cfif session.screenwidth neq 833>
  <cfquery datasource="semiprecious">
  update properties set pvalue = pvalue +1 where pname = 'shoplater'
  </cfquery>
  </cfif>
</body>
</html>
