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
var menuWidth="910";
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
var menuBackColor="gray";
var menuBackImage="";
var menuBackRepeat="repeat";
var menuBorderColor="#FFFFFF";
var menuBorderWidth="2px";
var menuBorderStyle="solid";
var smFrameImage="";
var smFrameWidth=0;

//--- Item Appearance
var itemBackColor=["gray","black"];
var itemBackImage=["",""];
var itemSlideBack=0;
var beforeItemImage=["",""];
var afterItemImage=["",""];
var beforeItemImageW="";
var afterItemImageW="";
var beforeItemImageH="";
var afterItemImageH="";
var itemBorderWidth="1px";
var itemBorderColor=["#F8F8F8","#833096"];
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

var itemStyles = [
    ["itemBackColor=gray,black","itemBackImage=,","beforeItemImage=/topmenu.files/tab01_before_n.gif,/topmenu.files/tab01_before_s.gif","afterItemImage=/images/spacer_.gif,/images/spacer_.gif","beforeItemImageW=4","afterItemImageW=4","beforeItemImageH=20","afterItemImageH=20","itemBorderWidth=0px","fontStyle='bold 12px Verdana','bold 12px Verdana'","fontColor=#FFFFFF,#FFFF80"],
];
var menuStyles = [
    ["fontStyle='normal 12px Verdana',''","fontColor=#FFFFFF,"],
];

var menuItems = [

    ["Home","/index.cfm", "", "", "", "", "0", "", "", "", "", ],
    ["Jewelry","", "", "", "", "", "0", "", "", "", "", ],
       ["|Show All","/gem-stone-jewelry.cfm", "", "", "Random Gallery", "", "", "", "", "", "", ],
      ["|New Arrivals","/latest-jewelry.cfm", "", "", "New Designs", "", "", "", "", "", "", ],
       ["|By Gemstone","/rare-stones/rare-gems-jewelry.cfm", "", "", "", "", "", "", "", "", "", ],
      ["|By Theme","/jewelry.cfm", "", "", "Jewelry By Theme", "", "", "", "", "", "", ],
  	  ["|Silver Jewelry","/sterling-silver-jewelry.cfm", "", "", "Sterling Silver", "", "", "", "", "", "", ],
      ["|Beaded Jewelry","/beaded_jewelry.cfm", "", "", "", "", "", "", "", "", "", ],
      ["|Mens Jewelry","/shaped/mens-gemstone-jewellery.cfm", "", "", "", "", "", "", "", "", "", ],
    ["Gems","/gems.cfm", "", "", "", "", "0", "", "", "", "", ],
	 ["Pendants","", "", "", "", "", "0", "", "", "", "", ],
     ["|Show All","/gem-stone-pendants.cfm", "", "", "Random Gallery", "", "", "", "", "", "", ],
        ["|New Arrivals","/latest-pendants.cfm", "", "", "New Designs", "", "", "", "", "", "", ],
       ["|By Gemstones","/rare-stones/rare-gems-pendants.cfm", "", "", "", "", "", "", "", "", "", ],
       ["|By Theme","/pendants.cfm", "", "", "by Theme", "", "", "", "", "", "", ],
        ["|Silver Pendants","/silver_gemstone_pendants.cfm", "", "", "Sterling Silver", "", "", "", "", "", "", ],
        ["|Stone Only","/stone_pendants.cfm", "", "", "", "", "", "", "", "", "", ],
        ["|Mini Pendants","/shaped/mini-gemstone-pendants.cfm", "", "", "Smaller than 0.5 inches", "", "", "", "", "", "", ],
    ["Rings","", "", "", "Most rings in all sizes", "", "0", "", "", "", "", ],
    ["|Show All","/gem-stone-rings.cfm", "", "", "Random Gallery", "", "", "", "", "", "", ],
        ["|New Arrivals","/latest-rings.cfm", "", "", "New Designs", "", "", "", "", "", "", ],
       ["|By Gemstones","/rare-stones/rare-gems-rings.cfm", "", "", "", "", "", "", "", "", "", ],
         ["|By Theme","/rings.cfm", "", "", "by Theme", "", "", "", "", "", "", ],
    ["Earrings","", "", "", "", "", "0", "", "", "", "", ],
        ["|Show All","/gem-stone-earrings.cfm", "", "", "Random Gallery", "", "", "", "", "", "", ],
        ["|New Arrivals","/latest-earrings.cfm", "", "", "New Designs", "", "", "", "", "", "", ],
       ["|By Gemstones","/rare-stones/rare-gems-earrings.cfm", "", "", "", "", "", "", "", "", "", ],
         ["|By Theme","/earrings.cfm", "", "", "by Theme", "", "", "", "", "", "", ],
        ["|Silver Earrings","/silver_gemstone_earrings.cfm", "", "", "Sterling Silver", "", "", "", "", "", "", ],
        ["|Beaded Earrings","/beaded_earrings.cfm", "", "", "", "", "", "", "", "", "", ],
        ["|Posts and Studs","", "", "", "", "", "", "", "", "", "", ],
            ["||Post Earrings","/shaped/post-gemstone-earrings.cfm", "", "", "", "", "", "0", "", "", "", ],
            ["||Stud Earrings","/shaped/studs-gemstone-earrings.cfm", "", "", "", "", "", "", "", "", "", ],
            ["Cufflinks","/cufflinks.cfm", "", "", "", "", "0", "", "", "", "", ],
              ["Necklaces","", "", "", "", "", "0", "", "", "", "", ],
	    ["|All Necklaces","/gem-stone-necklaces.cfm", "", "", "Random Gallery", "", "", "", "", "", "", ],
        ["|New Arrivals","/latest-necklaces.cfm", "", "", "New Designs", "", "", "", "", "", "", ],
       ["|By Gemstones","/rare-stones/rare-gems-necklaces.cfm", "", "", "", "", "", "", "", "", "", ],
         ["|By Theme","/necklaces.cfm", "", "", "by Theme", "", "", "", "", "", "", ],
        ["|Silver Necklaces","/silver_gemstone_necklaces.cfm", "", "", "Sterling Silver", "", "", "", "", "", "", ],
        ["|Beaded Necklaces","/beaded_necklaces.cfm", "", "", "with or without silver", "", "", "", "", "", "", ],
    ["Bracelets","", "", "", "", "", "0", "", "", "", "", ],
	    ["|Random Gallery","/gem-stone-bracelets.cfm", "", "", "Random Gallery", "", "", "", "", "", "", ],
        ["|New Arrivals","/latest-bracelets.cfm", "", "", "New Designs", "", "", "", "", "", "", ],
        ["|Silver Bracelets","/silver_gemstone_bracelets.cfm", "", "", "sterling silver", "", "", "", "", "", "", ],
        ["|Beaded Bracelets","/beaded_bracelets.cfm", "", "", "with our without silver", "", "", "", "", "", "", ],
    ["Brooches","/gem-stone-brooches.cfm", "", "", "", "", "0", "", "", "", "", ],
    ["Beads","/beads.cfm", "", "", "", "", "0", "", "", "", "", ],
   
];

dm_init();