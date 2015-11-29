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
var blankImage="topmenu.files/blank.gif";
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
var fontStyle=["normal 12px Trebuchet MS, Tahoma","normal 12px Trebuchet MS, Tahoma"];
var fontColor=["#000000","#FFFFFF"];
var fontDecoration=["none","none"];
var fontColorDisabled="#AAAAAA";

//--- Appearance
var menuBackColor="#EEEEEE";
var menuBackImage="";
var menuBackRepeat="repeat";
var menuBorderColor="#868686";
var menuBorderWidth="1px";
var menuBorderStyle="solid";
var smFrameImage="";
var smFrameWidth=0;

//--- Item Appearance
var itemBackColor=["#EEEEEE","#E68B2C"];
var itemBackImage=["",""];
var itemSlideBack=0;
var beforeItemImage=["",""];
var afterItemImage=["",""];
var beforeItemImageW="";
var afterItemImageW="";
var beforeItemImageH="";
var afterItemImageH="";
var itemBorderWidth="1px";
var itemBorderColor=["#D8D8D8","#FFFFFF"];
var itemBorderStyle=["solid","solid"];
var itemSpacing=1;
var itemPadding="2px 2px 2px 9px";
var itemAlignTop="left";
var itemAlign="left";

//--- Icons
var iconTopWidth=16;
var iconTopHeight=16;
var iconWidth=16;
var iconHeight=16;
var arrowWidth=7;
var arrowHeight=7;
var arrowImageMain=["topmenu.files/arrv_black.gif","topmenu.files/arrv_black.gif"];
var arrowWidthSub=0;
var arrowHeightSub=0;
var arrowImageSub=["topmenu.files/arr_black.gif","topmenu.files/arr_white.gif"];

//--- Separators
var separatorImage="";
var separatorColor="";
var separatorWidth="100%";
var separatorHeight="3px";
var separatorAlignment="left";
var separatorVImage="";
var separatorVColor="";
var separatorVWidth="3px";
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
var moveColor="#DECA9A";
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
var shadowColor="#B1B1B1";
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
    ["itemBackColor=transparent,transparent","itemBackImage=topmenu.files/tab01_back_n.gif,topmenu.files/tab01_back_s.gif","beforeItemImage=topmenu.files/tab01_before_n.gif,topmenu.files/tab01_before_s.gif","afterItemImage=topmenu.files/tab01_after_n.gif,topmenu.files/tab01_after_s.gif","beforeItemImageW=5","afterItemImageW=5","beforeItemImageH=20","afterItemImageH=20","itemBorderWidth=0px","fontStyle='normal 11px Tahoma','normal 11px Tahoma'","fontColor=#000000,#000000"],
];
var menuStyles = [
    ["menuBackColor=transparent","menuBorderWidth=0px","itemSpacing=0","itemPadding=0px 2px 0px 2px"],
];

var menuItems = [

    ["Specials","", "", "", "", "", "0", "", "", "", "", ],
        ["|Premium","/gemstone_jewelry_gallery.cfm?pricegreater=100&priceless=1000", "", "", "Ultra Chic", "", "", "", "", "", "", ],
        ["|Latest Pendants","/latest-pendants.cfm", "", "", "New Designs", "", "", "", "", "", "", ],
        ["|Latest Necklaces","/latest-necklaces.cfm", "", "", "New Designs", "", "", "", "", "", "", ],
        ["|Latest Earrings","/latest-earrings.cfm", "", "", "New Designs", "", "", "", "", "", "", ],
        ["|Latest Rings","/latest-rings.cfm", "", "", "New Designs", "", "", "", "", "", "", ],
    ["All Jewelry","", "", "", "", "", "0", "-1", "", "", "", ],
        ["|By Theme","/jewelry.cfm", "", "", "Jewelry By Theme", "", "", "", "", "", "", ],
        ["|By Gemstone","/rare-stones/rare-gems-jewelry.cfm", "", "", "", "", "", "", "", "", "", ],
        ["|Silver Jewelry","/sterling-silver-jewelry.cfm", "", "", "Sterling Silver", "", "", "", "", "", "", ],
        ["|Beaded Jewelry","/beaded_jewelry.cfm", "", "", "", "", "", "", "", "", "", ],
        ["|Mens Jewelry","/shaped/mens-gemstone-jewellery.cfm", "", "", "", "", "", "", "", "", "", ],
        ["|Affordable","/cheap-jewelry.cfm", "", "", "", "", "", "", "", "", "", ],
        ["|Jewelry on Sale","/jewelry-sale.cfm", "", "", "All designs", "", "", "", "", "", "", ],
        ["|Ships in 24 hrs","/expedited-express-shipping-jewelry.cfm", "", "", "Ships in 24 hrs", "", "", "", "", "", "", ],
    ["Pendants","", "", "", "", "", "0", "", "", "", "", ],
        ["|By Theme","/pendants.cfm", "", "", "by Theme", "", "", "", "", "", "", ],
        ["|By Gemstones","/rare-stones/rare-gems-pendants.cfm", "", "", "", "", "", "", "", "", "", ],
        ["|Silver Pendants","/silver_gemstone_pendants.cfm", "", "", "Sterling Silver", "", "", "", "", "", "", ],
        ["|Stone Only","/stone_pendants.cfm", "", "", "", "", "", "", "", "", "", ],
        ["|Mini Pendants","/shaped/mini-gemstone-pendants.cfm", "", "", "Smaller than 0.5 inches", "", "", "", "", "", "", ],
        ["|Men's Pendants","/shaped/mens-gemstone-pendants.cfm", "", "", "", "", "", "", "", "", "", ],
        ["|Affordable","/cheap-pendants.cfm", "", "", "", "", "", "", "", "", "", ],
        ["|Pendants on Sale","/pendants-sale.cfm", "", "", "", "", "", "", "", "", "", ],
        ["|Ships in 24 hrs","/expedited-express-shipping-pendants.cfm", "", "", "Ships in 24 hrs", "", "", "", "", "", "", ],
    ["Rings","", "", "", "Most rings in all sizes", "", "0", "", "", "", "", ],
        ["|By Theme","/rings.cfm", "", "", "any size desired", "", "", "", "", "", "", ],
        ["|By Gemstones","/rare-stones/rare-gems-rings.cfm", "", "", "", "", "", "", "", "", "", ],
        ["|Men's Rings","/shaped/mens-gemstone-rings.cfm", "", "", "", "", "", "", "", "", "", ],
        ["|Engagement Rings","/shaped/engagement-gemstone-rings.cfm", "", "", "Affordable to Premium", "", "", "", "", "", "", ],
        ["|Affordable","/cheap-rings.cfm", "", "", "", "", "", "", "", "", "", ],
        ["|Rings on Sale","/rings-sale.cfm", "", "", "", "", "", "", "", "", "", ],
        ["|Ships in 24 hrs","/expedited-express-shipping-rings.cfm", "", "", "Ships in 24 hrs", "", "", "", "", "", "", ],
    ["Earrings","", "", "", "", "", "0", "", "", "", "", ],
        ["|By Theme","/earrings.cfm", "", "", "", "", "", "", "", "", "", ],
        ["|By Gemstones","/rare-stones/rare-gems-earrings.cfm", "", "", "", "", "", "", "", "", "", ],
        ["|Silver Earrings","/silver_gemstone_earrings.cfm", "", "", "", "", "", "", "", "", "", ],
        ["|Beaded Earrings","/beaded_earrings.cfm", "", "", "", "", "", "", "", "", "", ],
        ["|Post/Stud/Hoop","", "", "", "", "", "", "", "", "", "", ],
            ["||Post Earrings","/shaped/post-gemstone-earrings.cfm", "", "", "", "", "", "", "", "", "", ],
            ["||Stud Earrings","/shaped/studs-gemstone-earrings.cfm", "", "", "", "", "", "", "", "", "", ],
            ["||Hoop Earrings","/shaped/hoops-gemstone-earrings.cfm", "", "", "", "", "", "", "", "", "", ],
        ["|Affordable","/cheap-earrings.cfm", "", "", "", "", "", "", "", "", "", ],
        ["|Earrings on Sale","/earrings-sale.cfm", "", "", "", "", "", "", "", "", "", ],
        ["|Ships in 24 hrs","/expedited-express-shipping-earrings.cfm", "", "", "Ships in 24 hrs", "", "", "", "", "", "", ],
    ["Necklaces","", "", "", "", "", "0", "", "", "", "", ],
        ["|By Theme","/necklaces.cfm", "", "", "Necklaces by Theme", "", "", "", "", "", "", ],
        ["|By Gemstones","/rare-stones/rare-gems-necklaces.cfm", "", "", "", "", "", "", "", "", "", ],
        ["|Silver Necklaces","/silver_gemstone_necklaces.cfm", "", "", "Sterling Silver", "", "", "", "", "", "", ],
        ["|Beaded Necklaces","/beaded_necklaces.cfm", "", "", "with or without silver", "", "", "", "", "", "", ],
        ["|Affordable","/cheap-necklaces.cfm", "", "", "", "", "", "", "", "", "", ],
        ["|Necklaces on Sale","/necklaces-sale.cfm", "", "", "", "", "", "", "", "", "", ],
        ["|Ships in 24 hrs","/expedited-express-shipping-necklaces.cfm", "", "", "Ships in 24 hrs", "", "", "", "", "", "", ],
    ["Bracelets","", "", "", "", "", "0", "", "", "", "", ],
        ["|By Theme","/bracelets.cfm", "", "", "", "", "", "", "", "", "", ],
        ["|By Gemstones","/rare-stones/rare-gems-bracelets.cfm", "", "", "", "", "", "", "", "", "", ],
        ["|Silver Bracelets","/silver_gemstone_bracelets.cfm", "", "", "sterling silver", "", "", "", "", "", "", ],
        ["|Beaded Bracelets","/beaded_bracelets.cfm", "", "", "with our without silver", "", "", "", "", "", "", ],
        ["|Affordable","/cheap-bracelets.cfm", "", "", "", "", "", "", "", "", "", ],
        ["|Bracelets on Sale","/bracelets-sale.cfm", "", "", "", "", "", "", "", "", "", ],
        ["|Ships in 24 hrs","/expedited-express-shipping-bracelets.cfm", "", "", "Ships in 24 hrs", "", "", "", "", "", "", ],
    ["Chains","/chains.cfm", "", "", "", "", "0", "", "", "", "", ],
    ["Brooches","/brooches.cfm", "", "", "", "", "0", "", "", "", "", ],
    ["Healing","", "", "", "Crystals, wands, pyramids etc.", "", "0", "", "", "", "", ],
        ["|All Healing","/healing.cfm", "", "", "", "", "", "", "", "", "", ],
        ["|Stone Pendants","/stone_pendants.cfm", "", "", "", "", "", "", "", "", "", ],
        ["|By Gemstone","/rare-stones/rare-gems-healing.cfm", "", "", "", "", "", "", "", "", "", ],
        ["|Ships in 24 hrs","/expedited-express-shipping-healing.cfm", "", "", "Ships in 24 hrs", "", "", "", "", "", "", ],
    ["Beads","", "", "", "", "", "0", "", "", "", "", ],
        ["|Gallery","/gem-stone-beads.cfm", "", "", "", "", "", "", "", "", "", ],
        ["|by Shape","/beads.cfm", "", "", "", "", "", "", "", "", "", ],
        ["|By Gemstones","/rare-stones/rare-gems-beads.cfm", "", "", "", "", "", "", "", "", "", ],
    ["Wholesale","/wholesale_register.cfm?beaded_jewelry=1", "", "", "", "", "0", "", "", "", "", ],
];

dm_init();