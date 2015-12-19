/*
   Deluxe Menu Data File
   Created by Deluxe Tuner v3.15
   http://deluxe-menu.com
*/
var key="165b1680extg";
// -- Deluxe Tuner Style Names
var itemStylesNames=["Top Item",];
var menuStylesNames=["Submenu",];
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
var statusString="";
var blankImage="/wholesalemenu.files/blank.gif";
var pathPrefix_img="";
var pathPrefix_link="";

//--- Dimensions
var menuWidth="1px";
var menuHeight="24px";
var smWidth="70px";
var smHeight="";

//--- Positioning
var absolutePos=0;
var posX="0px";
var posY="10px";
var topDX=0;
var topDY=0;
var DX=0;
var DY=0;
var subMenuAlign="left";
var subMenuVAlign="top";

//--- Font
var fontStyle=["strong 11px Trebuchet MS, Tahoma","normal 11px Trebuchet MS, Tahoma"];
var fontColor=["#FFFFFF","#FFFFFF"];
var fontDecoration=["none","none"];
var fontColorDisabled="#557D4F";

//--- Appearance
var menuBackColor="";
var menuBackImage="url(/images/main_bgs.png) repeat-x scroll 110px -460px #EEDDEE";
var menuBackRepeat="repeat";
var menuBorderColor="#6B8D58 #3F6932 #3F6932 #AB5DA8";
var menuBorderWidth="0px";
var menuBorderStyle="solid";
var smFrameImage="";
var smFrameWidth=0;

//--- Item Appearance
var itemBackColor=["#799ea3","#799ea3"];
var itemBackImage=["undefined","undefined"];
var itemSlideBack=0;
var beforeItemImage=["",""];
var afterItemImage=["",""];
var beforeItemImageW="";
var afterItemImageW="";
var beforeItemImageH="";
var afterItemImageH="";
var itemBorderWidth="1px";
var itemBorderColor=["#FFFFFF","#FFFFFF #86C76D"];
var itemBorderStyle=["solid","groove"];
var itemSpacing=3;
var itemPadding="0px 7px 2px 5px";
var itemAlignTop="left";
var itemAlign="left";

//--- Icons
var iconTopWidth="";
var iconTopHeight="";
var iconWidth="";
var iconHeight="";
var arrowWidth=7;
var arrowHeight=7;
var arrowImageMain=["/wholesalemenu.files/arrv_white.gif",""];
var arrowWidthSub=0;
var arrowHeightSub=0;
var arrowImageSub=["/wholesalemenu.files/arr_black.gif","wholesalemenu.files/arr_white.gif"];

//--- Separators
var separatorImage="";
var separatorColor="";
var separatorWidth="100%";
var separatorHeight="3px";
var separatorAlignment="left";
var separatorVImage="";
var separatorVColor="";
var separatorVWidth="5px";
var separatorVHeight="100%";
var separatorPadding="0px";

//--- Floatable Menu
var floatable=0;
var floatIterations=5;
var floatableX=1;
var floatableY=1;
var floatableDX=5;
var floatableDY=5;

//--- Movable Menu
var movable=0;
var moveWidth=12;
var moveHeight=18;
var moveColor="#AAFFFF";
var moveImage="";
var moveCursor="move";
var smMovable=0;
var closeBtnW=11;
var closeBtnH=11;
var closeBtn="";

//--- Transitional Effects & Filters
var transparency="95";
var transition=104;
var transOptions="";
var transDuration=250;
var transDuration2=200;
var shadowLen=3;
var shadowColor="#D1D1D1";
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
var smShowPause=200;
var smHidePause=500;
var smSmartScroll=1;
var topSmartScroll=0;
var smHideOnClick=1;
var dm_writeAll=0;
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
var keystrokes=1;
var dm_focus=1;
var dm_actKey=113;

//--- Sound
var onOverSnd="";
var onClickSnd="";

var itemStyles = [
    ["itemBackColor=#799ea3,#799ea3","itemBackImage=,","beforeItemImage=/topmenu.files/tab01_before_n.gif,/topmenu.files/tab01_before_s.gif","afterItemImage=/images/spacer_.gif,/images/spacer_.gif","beforeItemImageW=4","afterItemImageW=4","beforeItemImageH=20","afterItemImageH=20","itemBorderWidth=0px","fontStyle='bold 12px Tahoma','bold 12px Tahoma'","fontColor=#FFFFFF,#FFFF80"],
];
var menuStyles = [
    ["fontStyle='normal 12px Arial',''","fontColor=#FFFFFF,"],
];

var menuItems = [

    
    ["Jewelry","", "", "", "", "", "0", "", "", "", "", ],
       ["|Inventory Ships in 24 hrs","/gem-stone-jewelry.cfm", "", "", "US Stock", "", "", "", "", "", "", ],
      ["|Special New Additions MUST SEE: By Phone/Fax/Email Only","/essentials", "", "", "New Designs", "", "", "", "", "", "", ],
     ["Pendants","", "", "", "", "", "0", "", "", "", "", ],
      ["|Ready to Ship Inventory","/gem-stone-pendants.cfm", "", "", "Random Gallery", "", "", "", "", "", "", ],
      ["|2 Week Delivery New Additions MUST SEE: By Phone/Fax/Email Only","/essentials/index.cfm?wholesalejewelry=stock/sterling-silver-pendants.html", "", "", "New Designs", "", "", "", "", "", "", ],
    ["Rings","", "", "", "Most rings in all sizes", "", "0", "", "", "", "", ],
    ["|Ready to Ship Inventory","/gem-stone-rings.cfm", "", "", "Ready to Ship", "", "", "", "", "", "", ],
    ["|2 Week Delivery New Additions: By Phone/Fax/Email Only","/essentials/index.cfm?wholesalejewelry=stock/sterling-silver-rings.html", "", "", "New Designs", "", "", "", "", "", "", ],    
	["Earrings","", "", "", "", "", "0", "", "", "", "", ],
    ["|Ready to Ship Inventory","/gem-stone-earrings.cfm", "", "", "Ready to Ship", "", "", "", "", "", "", ],
    ["|2 Week Delivery: By Phone/Fax/Email Only","/essentials/index.cfm?wholesalejewelry=stock/sterling-silver-earrings.html", "", "", "New Designs", "", "", "", "", "", "", ],      
    ["Necklaces","", "", "", "", "", "0", "", "", "", "", ],
	["|Ready to Ship Inventory","/gem-stone-necklaces.cfm", "", "", "Ready to Ship", "", "", "", "", "", "", ],
    ["|2 Week Delivery New Additions: By Phone/Fax/Email Only","/essentials/index.cfm?wholesalejewelry=stock/sterling-silver-necklace.html", "", "", "New Designs", "", "", "", "", "", "", ],     
    
    ["Bracelets","", "", "", "", "", "0", "", "", "", "", ],
	["|Ready to Ship Inventory","/gem-stone-bracelets.cfm", "", "", "Ready to Ship", "", "", "", "", "", "", ],
    ["|2 Week Delivery New Additions: By Phone/Fax/Email Only","/essentials/index.cfm?wholesalejewelry=stock/sterling-silver-bracelets.html", "", "", "New Designs", "", "", "", "", "", "", ],       ["|By Gemstones","/rare-stones/rare-gems-rings.cfm", "", "", "", "", "", "", "", "", "", ],
 
    ["Chains","/chains.cfm", "", "", "", "", "0", "", "", "", "", ],
    ["Brooches","/gem-stone-brooches.cfm", "", "", "", "", "0", "", "", "", "", ],

    ["Healing","", "", "", "Crystals, wands, pyramids etc.", "", "0", "", "", "", "", ],
        ["|All Healing","/healing.cfm", "", "", "", "", "", "0", "", "", "", ],

        ["|Stone only Pendants","/stone_pendants.cfm", "", "", "", "", "", "", "", "", "", ],
        ["|By Stones","/rare-stones/rare-gems-healing.cfm", "", "", "", "", "", "", "", "", "", ],
       ["Cufflinks","/cufflinks.cfm", "", "", "", "", "0", "", "", "", "", ],
    ["Beads","/beads.cfm", "", "", "", "", "0", "", "", "", "", ],

    ["Gems","/gems.cfm", "", "", "", "", "0", "", "", "", "", ],
	 
];

dm_init();