/*
   Deluxe Menu Data File
   Created by Deluxe Tuner v3.15
   http://deluxe-menu.com
*/

var key="165b1680extg";

// -- Deluxe Tuner Style Names
var itemStylesNames=["Top Item",];
var menuStylesNames=["Top Menu",];
// -- End of Deluxe Tuner Style Names

//--- Common
var menuIdentifier="";
var isHorizontal=1;
var smColumns=1;
var smOrientation=0;
var dmRTL=0;
var pressedItem=-2;
var itemCursor="default";
var itemTarget="_self";
var statusString="link";
var blankImage="/topmenu.files/blank.gif";
var pathPrefix_img="";
var pathPrefix_link="";

//--- Dimensions
var menuWidth="";
var menuHeight="";
var smWidth="";
var smHeight="";

//--- Positioning
var absolutePos=0;
var posX="10px";
var posY="10px";
var topDX=0;
var topDY=0;
var DX=-5;
var DY=0;
var subMenuAlign="left";
var subMenuVAlign="top";

//--- Font
var fontStyle=["normal 14px Arial","normal 14px Arial"];
var fontColor=["#ffffff","#FFFFFF"];
var fontDecoration=["none","none"];
var fontColorDisabled="#AAAAAA";

//--- Appearance
var menuBackColor="#799ea3";
var menuBackImage="";
var menuBackRepeat="repeat";
var menuBorderColor="#FFFFFF";
var menuBorderWidth="2px";
var menuBorderStyle="solid";
var smFrameImage="";
var smFrameWidth=0;

//--- Item Appearance
var itemBackColor=["#799ea3","#799ea3"];
var itemBackImage=["",""];
var itemSlideBack=0;
var beforeItemImage=["",""];
var afterItemImage=["",""];
var beforeItemImageW="";
var afterItemImageW="";
var beforeItemImageH="";
var afterItemImageH="";
var itemBorderWidth="1px";
var itemBorderColor=["#FFFFFF","black"];
var itemBorderStyle=["double","solid"];
var itemSpacing=1;
var itemPadding="2px 5px 2px 6px";
var itemAlignTop="left";
var itemAlign="left";

//--- Icons
var iconTopWidth=16;
var iconTopHeight=16;
var iconWidth=16;
var iconHeight=16;
var arrowWidth=7;
var arrowHeight=7;
var arrowImageMain=["/topmenu.files/arrv_white.gif","/topmenu.files/arrv_white.gif"];
var arrowWidthSub=0;
var arrowHeightSub=0;
var arrowImageSub=["/topmenu.files/arrv_black.gif","/topmenu.files/arrv_white.gif"];

//--- Separators
var separatorImage="";
var separatorColor="";
var separatorWidth="100%";
var separatorHeight="3px";
var separatorAlignment="left";
var separatorVImage="";
var separatorVColor="";
var separatorVWidth="4px";
var separatorVHeight="100%";
var separatorPadding="0px";

//--- Floatable Menu
var floatable=0;
var floatIterations=6;
var floatableX=0;
var floatableY=1;
var floatableDX=5;
var floatableDY=5;

//--- Movable Menu
var movable=0;
var moveWidth=12;
var moveHeight=20;
var moveColor="#CEBABA";
var moveImage="";
var moveCursor="move";
var smMovable=0;
var closeBtnW=15;
var closeBtnH=15;
var closeBtn="";

//--- Transitional Effects & Filters
var transparency="100";
var transition=22;
var transOptions="";
var transDuration=350;
var transDuration2=200;
var shadowLen=3;
var shadowColor="#917181";
var shadowTop=0;

//--- CSS Support (CSS-based Menu)
var cssStyle=0;
var cssSubmenu="";
var cssItem=["",""];
var cssItemText=["",""];

//--- Advanced
var dmObjectsCheck=0;
var saveNavigationPath=1;
var showByClick=0;
var noWrap=1;
var smShowPause=50;
var smHidePause=1000;
var smSmartScroll=1;
var topSmartScroll=0;
var smHideOnClick=1;
var dm_writeAll=1;
var useIFRAME=0;
var dmSearch=0;

//--- AJAX-like Technology
var dmAJAX=0;
var dmAJAXCount=0;
var ajaxReload=0;

//--- Dynamic Menu
var dynamic=0;

//--- Popup Menu
var popupMode=0;

//--- Keystrokes Support
var keystrokes=0;
var dm_focus=1;
var dm_actKey=113;

//--- Sound
var onOverSnd="";
var onClickSnd="";
//#9A3073
var itemStyles = [
    ["itemBackColor=#799ea3,#799ea3","itemBackImage=,","beforeItemImage=/topmenu.files/tab01_before_n.gif,/topmenu.files/tab01_before_s.gif","afterItemImage=/images/spacer_.gif,/images/spacer_.gif","beforeItemImageW=4","afterItemImageW=4","beforeItemImageH=20","afterItemImageH=20","itemBorderWidth=0px","fontStyle='bold 12px Verdana','bold 12px Verdana'","fontColor=#FFFFFF,#FFFF80"],
];
var menuStyles = [
    ["fontStyle='normal 12px Verdana',''","fontColor=#FFFFFF,"],
];

var menuItems = [
       ["Home","/index.cfm", "", "", "", "", "0", "", "", "", "", ],
			    
    ["All Jewelry","", "", "", "", "", "0", "-1", "", "", "", ],
			  ["|Silver Jewelry","/sterling-silver-jewelry.cfm", "", "", "Sterling Silver", "", "", "", "", "", "", ],
	      ["|Beaded Jewelry","/beaded_jewelry.cfm", "", "", "", "", "", "", "", "", "", ],
			["|By Gemstones","/rare-stones/rare-gems-jewelry.cfm", "", "", "", "", "", "", "", "", "", ],
				["|New Arrivals","/latest-jewelry.cfm", "", "", "New Designs", "", "", "", "", "", "", ],
        ["|Premium","/jewelry.cfm", "", "", "Ultra Chic", "", "", "", "", "", "", ],
        ["|Mens Jewelry","/shaped/mens-gemstone-jewellery.cfm", "", "", "", "", "", "", "", "", "", ],
        ["|Jewelry on Sale","/jewelry-sale.cfm", "", "", "All designs", "", "", "", "", "", "", ],
<!---				 ["|Quick Shippers","/expedited-express-shipping-jewelry.cfm", "", "", "In Austin Store", "", "", "", "", "", "", ],--->
  		  ["|Silver Plated Jewelry","/german-silver-jewelry.cfm", "", "", "German Silver", "", "", "", "", "", "", ],
  
	  ["Pendants","", "", "", "", "", "0", "", "", "", "", ],
		    ["|Silver Pendants","/silver_gemstone_pendants.cfm", "", "", "Sterling Silver", "", "", "", "", "", "", ],
       	["|By Gemstones","/rare-stones/rare-gems-pendants.cfm", "", "", "", "", "", "", "", "", "", ],
        ["|New Arrivals","/latest-pendants.cfm", "", "", "New Designs", "", "", "", "", "", "", ],
        ["|Premium","/pendants.cfm", "", "", "by Theme", "", "", "", "", "", "", ],
        ["|Mini Pendants","/shaped/mini-gemstone-pendants.cfm", "", "", "Smaller than 0.5 inches", "", "", "", "", "", "", ],
        ["|Men's Pendants","/shaped/mens-gemstone-pendants.cfm", "", "", "", "", "", "", "", "", "", ],
        ["|Affordable","/cheap-pendants.cfm", "", "", "", "", "", "", "", "", "", ],
        ["|Pendants on Sale","/pendants-sale.cfm", "", "", "", "", "", "", "", "", "", ],
			<!---		 ["|Quick Shippers","/expedited-express-shipping-pendants.cfm", "", "", "In Austin Store", "", "", "", "", "", "", ],--->	
        ["|Silver Plated Pendants","/german-silver-pendants.cfm", "", "", "German Silver", "", "", "", "", "", "", ],
  	  ["Rings","", "", "", "Most rings in all sizes", "", "0", "", "", "", "", ],
		    ["|All Rings","/gem-stone-rings.cfm", "", "", "All Gemstone Rings", "", "", "", "", "", "", ],
	      ["|By Gemstones","/rare-stones/rare-gems-rings.cfm", "", "", "", "", "", "", "", "", "", ],
	    ["|Premium","/rings.cfm", "", "", "any size desired", "", "", "", "", "", "", ],
        ["|Adjustable Rings","shaped/adjustable-gemstone-rings.cfm", "", "", "", "", "", "", "", "", "", ],
        ["|Men's Rings","/shaped/mens-gemstone-rings.cfm", "", "", "", "", "", "", "", "", "", ],
        ["|Affordable","/cheap-rings.cfm", "", "", "", "", "", "", "", "", "", ],
        ["|New Arrivals","/latest-rings.cfm", "", "", "New Designs", "", "", "", "", "", "", ],
        ["|Rings on Sale","/rings-sale.cfm", "", "", "", "", "", "", "", "", "", ],
<!---				["|Quick Shippers","/expedited-express-shipping-rings.cfm", "", "", "In Austin Store", "", "", "", "", "", "", ],--->
    ["Earrings","", "", "", "", "", "0", "", "", "", "", ],
			  ["|Silver Earrings","/silver_gemstone_earrings.cfm", "", "", "", "", "", "", "", "", "", ],
	      ["|Beaded Earrings","/beaded_earrings.cfm", "", "", "", "", "", "", "", "", "", ],
        ["|Post/Stud/Hoop","", "", "", "", "", "", "", "", "", "", ],
            ["||Post Earrings","/shaped/post-gemstone-earrings.cfm", "", "", "", "", "", "", "", "", "", ],
            ["||Stud Earrings","/shaped/studs-gemstone-earrings.cfm", "", "", "", "", "", "", "", "", "", ],
            ["||Hoop Earrings","/shaped/hoop-gemstone-earrings.cfm", "", "", "", "", "", "", "", "", "", ],
        ["|New Arrivals","/latest-earrings.cfm", "", "", "New Designs", "", "", "", "", "", "", ],
        ["|By Gemstones","/rare-stones/rare-gems-earrings.cfm", "", "", "", "", "", "", "", "", "", ],
        ["|Premium","/earrings.cfm", "", "", "", "", "", "", "", "", "", ],
        ["|Affordable","/cheap-earrings.cfm", "", "", "", "", "", "", "", "", "", ],
        ["|Earrings on Sale","/earrings-sale.cfm", "", "", "", "", "", "", "", "", "", ],
<!---  				["|Quick Shippers","/expedited-express-shipping-earrings.cfm", "", "", "In Austin Store", "", "", "", "", "", "", ],--->
		["|Silver Plated Earrings","/german-silver-earrings.cfm", "", "", "German Silver", "", "", "", "", "", "", ],
  	  ["Necklaces","", "", "", "", "", "0", "", "", "", "", ],
        ["|Silver Necklaces","/silver_gemstone_necklaces.cfm", "", "", "Sterling Silver", "", "", "", "", "", "", ],
	              ["|Beaded Necklaces","/beaded_necklaces.cfm", "", "", "with or without silver", "", "", "", "", "", "", ],
    	["|Chains","/chains.cfm", "", "", "", "", "0", "", "", "", "", ],
	 ["|New Arrivals","/latest-necklaces.cfm", "", "", "New Designs", "", "", "", "", "", "", ],
		["|By Gemstones","/rare-stones/rare-gems-necklaces.cfm", "", "", "", "", "", "", "", "", "", ],
        ["|Premium","/necklaces.cfm", "", "", "Necklaces by Theme", "", "", "", "", "", "", ],
     	["|Affordable","/cheap-necklaces.cfm", "", "", "", "", "", "", "", "", "", ],
        ["|Necklaces on Sale","/necklaces-sale.cfm", "", "", "", "", "", "", "", "", "", ],
<!---			["|Quick Shippers","/expedited-express-shipping-necklaces.cfm", "", "", "In Austin Store", "", "", "", "", "", "", ],--->
  			["|Silver Plated Necklaces","/german-silver-necklaces.cfm", "", "", "German Silver", "", "", "", "", "", "", ],
  	  ["Bracelets","", "", "", "", "", "0", "", "", "", "", ],
		    ["|Silver Bracelets","/silver_gemstone_bracelets.cfm", "", "", "sterling silver", "", "", "", "", "", "", ],
				      ["|Beaded Bracelets","/beaded_bracelets.cfm", "", "", "with our without silver", "", "", "", "", "", "", ],
        ["|By Gemstones","/rare-stones/rare-gems-bracelets.cfm", "", "", "", "", "", "", "", "", "", ],
		["|New Arrivals","/latest-bracelets.cfm", "", "", "New Designs", "", "", "", "", "", "", ],
        ["|Premium","/bracelets.cfm", "", "", "", "", "", "", "", "", "", ],
        ["|Affordable","/cheap-bracelets.cfm", "", "", "", "", "", "", "", "", "", ],
        ["|Bracelets on Sale","/bracelets-sale.cfm", "", "", "", "", "", "", "", "", "", ],
<!---			["|Quick Shippers","/expedited-express-shipping-bracelets.cfm", "", "", "In Austin Store", "", "", "", "", "", "", ],--->
  			["|Silver Plated Bracelets","/german-silver-bracelets.cfm", "", "", "German Silver", "", "", "", "", "", "", ],
	  
    ["Cufflinks","/gem-stone-cufflinks.cfm", "", "", "", "", "0", "", "", "", "", ],
     ["Brooches","/gem-stone-brooches.cfm", "", "", "", "", "0", "", "", "", "", ],     
    ["Healing","", "", "", "Crystals, wands, pyramids etc.", "", "0", "", "", "", "", ],
        ["|All Healing","/healing.cfm", "", "", "", "", "", "", "", "", "", ],
        ["|Stone Pendants","/stone_pendants.cfm", "", "", "", "", "", "", "", "", "", ],
        ["|By Gemstone","/rare-stones/rare-gems-healing.cfm", "", "", "", "", "", "", "", "", "", ],
		["|New Arrivals","/latest-healing.cfm", "", "", "New Designs", "", "", "", "", "", "", ],
<!---					 ["|Quick Shippers","/expedited-express-shipping-healing.cfm", "", "", "In Austin Store", "", "", "", "", "", "", ],--->
    ["Gems/Beads","", "", "", "", "", "0", "", "", "", "", ],
  				["|Loose Gems","/gems.cfm", "", "", "", "", "", "", "", "", "", ],
				["|New Arrivals","/latest-gems.cfm", "", "", "New Designs", "", "", "", "", "", "", ],
				["|Beads Gallery","/gem-stone-beads.cfm", "", "", "", "", "", "", "", "", "", ],
        ["|Beads by Shape","/beads.cfm", "", "", "", "", "", "", "", "", "", ],
        ["|Beads By Gemstones","/rare-stones/rare-gems-beads.cfm", "", "", "", "", "", "", "", "", "", ],

];

dm_init();