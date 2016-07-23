/*
   Deluxe Menu Data File
   Created by Deluxe Tuner v3.10
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
var blankImage="newtopmenu.files/blank.gif";
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
var menuBorderWidth="2px";
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
var itemSpacing=2;
var itemPadding="2px 5px 2px 10px";
var itemAlignTop="left";
var itemAlign="left";

//--- Icons
var iconTopWidth=16;
var iconTopHeight=16;
var iconWidth=16;
var iconHeight=16;
var arrowWidth=7;
var arrowHeight=7;
var arrowImageMain=["newtopmenu.files/arrv_black.gif","newtopmenu.files/arrv_black.gif"];
var arrowWidthSub=0;
var arrowHeightSub=0;
var arrowImageSub=["newtopmenu.files/arr_black.gif","newtopmenu.files/arr_white.gif"];

//--- Separators
var separatorImage="";
var separatorWidth="100%";
var separatorHeight="3px";
var separatorAlignment="left";
var separatorVImage="";
var separatorVWidth="3px";
var separatorVHeight="100%";
var separatorPadding="0px";

//--- Floatable Menu
var floatable=1;
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
var transition=-1;
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
    ["itemBackColor=transparent,transparent","itemBackImage=newtopmenu.files/tab01_back_n.gif,newtopmenu.files/tab01_back_s.gif","beforeItemImage=newtopmenu.files/tab01_before_n.gif,newtopmenu.files/tab01_before_s.gif","afterItemImage=newtopmenu.files/tab01_after_n.gif,newtopmenu.files/tab01_after_s.gif","beforeItemImageW=5","afterItemImageW=5","beforeItemImageH=20","afterItemImageH=20","itemBorderWidth=0px","fontStyle='normal 11px Tahoma','normal 11px Tahoma'","fontColor=#000000,#000000"],
];
var menuStyles = [
    ["menuBackColor=transparent","menuBorderWidth=0px","itemSpacing=0","itemPadding=0px 5px 0px 5px"],
];

var menuItems = [

    ["Home","http://www.semiprecious.com", "", "", "", "", "", "", "", "", "", ],
    ["Jewelry","/jewelry.cfm", "", "", "", "", "-1", "-1", "", "", "", ],
        ["|All Jewelry","/gem-stone-jewelry.cfm", "", "", "Jewelry By Theme", "", "", "", "", "", "", ],
        ["|Silver Jewelry","/sterling-silver-jewelry.cfm", "", "", "Sterling Silver", "", "", "", "", "", "", ],
        ["|Beaded Jewelry","/beaded_jewelry.cfm", "", "", "", "", "", "", "", "", "", ],
        ["|Designer Jewelry","/designer_jewelry_angela.cfm", "", "", "by Angela Daczko", "", "", "", "", "", "", ],
        ["|Mens Jewelry","//shaped/mens-gemstone-jewellery.cfm", "", "", "", "", "", "", "", "", "", ],
        ["|Affordable","/cheap-jewelry.cfm", "", "", "", "", "", "", "", "", "", ],
    ["Pendants","/pendants.cfm", "", "", "", "", "", "", "", "", "", ],
        ["|All Pendants","/gem-stone-pendants.cfm", "", "", "by Theme", "", "", "", "", "", "", ],
        ["|Silver Pendants","/silver_gemstone_pendants.cfm", "", "", "Sterling Silver", "", "", "", "", "", "", ],
        ["|Stone Only","/stone_pendants.cfm", "", "", "", "", "", "", "", "", "", ],
        ["|Designer Pendants","/handmade_pendants_designer.cfm", "", "", "by Angela Daczko", "", "", "", "", "", "", ],
        ["|Mini Pendants","/shaped/mini-gemstone-pendants.cfm", "", "", "Smaller than 0.5 inches", "", "", "", "", "", "", ],
        ["|Men's Pendants","/shaped/mens-gemstone-pendants.cfm", "", "", "", "", "", "", "", "", "", ],
        ["|Affordable","/cheap-pendants.cfm", "", "", "", "", "", "", "", "", "", ],
    ["Rings","/rings.cfm", "", "", "Most rings in all sizes", "", "", "", "", "", "", ],
        ["|All Rings","/gem-stone-rings.cfm", "", "", "any size desired", "", "", "", "", "", "", ],
        ["|Men's Rings","/shaped/mens-gemstone-rings.cfm", "", "", "", "", "", "", "", "", "", ],
        ["|Designer Rings","/handmade_rings_designer.cfm", "", "", "Mostly Adjustable", "", "", "", "", "", "", ],
        ["|Engagement Rings","/shaped/engagement-gemstone-rings.cfm", "", "", "Affordable to Premium", "", "", "", "", "", "", ],
        ["|Affordable","/cheap-rings.cfm", "", "", "", "", "", "", "", "", "", ],
    ["Earrings","/earrings.cfm", "", "", "", "", "", "", "", "", "", ],
        ["|All Earrings","gem-stone-earrings.cfm", "", "", "", "", "", "", "", "", "", ],
        ["|Silver Earrings","/silver_gemstone_earrings.cfm", "", "", "", "", "", "", "", "", "", ],
        ["|Beaded Earrings","/beaded_earrings.cfm", "", "", "", "", "", "", "", "", "", ],
        ["|Designer Earrings","/handmade_earrings_designer.cfm", "", "", "", "", "", "", "", "", "", ],
        ["|Posts and Studs","", "", "", "", "", "", "", "", "", "", ],
            ["||Post Earrings","/shaped/post-gemstone-earrings.cfm", "", "", "", "", "", "", "", "", "", ],
            ["||Stud Earrings","/shaped/studs-gemstone-earrings.cfm", "", "", "", "", "", "", "", "", "", ],
        ["|Affordable","/cheap-earrings.cfm", "", "", "", "", "", "", "", "", "", ],
    ["Necklaces","/necklaces.cfm", "", "", "", "", "", "", "", "", "", ],
        ["|All Necklaces","/gem-stone-necklaces.cfm", "", "", "Necklaces by Theme", "", "", "", "", "", "", ],
        ["|Silver Necklaces","/silver_gemstone_necklaces.cfm", "", "", "Sterling Silver", "", "", "", "", "", "", ],
        ["|Beaded Necklaces","/beaded_necklaces.cfm", "", "", "with or without silver", "", "", "", "", "", "", ],
        ["|Designer Necklaces","/handmade_necklaces_designer.cfm", "", "", "by Angela Daczko", "", "", "", "", "", "", ],
        ["|Affordable","/cheap-necklaces.cfm", "", "", "", "", "", "", "", "", "", ],
    ["Bracelets","/gem-stone-bracelets.cfm", "", "", "", "", "", "", "", "", "", ],
        ["|All Bracelets","/gem-stone-bracelets.cfm", "", "", "", "", "", "", "", "", "", ],
        ["|Silver Bracelets","silver_gemstone_bracelets.cfm", "", "", "sterling silver", "", "", "", "", "", "", ],
        ["|Beaded Bracelets","/beaded_bracelets.cfm", "", "", "with our without silver", "", "", "", "", "", "", ],
        ["|Designer Bracelets","/handmade_bracelets_designer.cfm", "", "", "by Angela Daczko", "", "", "", "", "", "", ],
        ["|Affordable","/cheap-bracelets.cfm", "", "", "", "", "", "", "", "", "", ],
    ["Chains","/shaped/chains-gemstone-necklaces.cfm", "", "", "", "", "", "", "", "", "", ],
    ["Brooches","/brooches.cfm", "", "", "", "", "", "", "", "", "", ],
    ["Healing","/healing.cfm", "", "", "Crystals, wands, pyramids etc.", "", "", "", "", "", "", ],
        ["|Spheres","http://www.semiprecious.com/list.cfm?groupname=Spheres&category=healing", "", "", "", "", "", "", "", "", "", ],
        ["|Pyramids","/list.cfm?groupname=Pyramid&category=Healing", "", "", "", "", "", "", "", "", "", ],
        ["|Eggs","/list.cfm?groupname=Eggs&category=Healing", "", "", "", "", "", "", "", "", "", ],
        ["|Wands","/list.cfm?groupname=Wands&category=Healing", "", "", "", "", "", "", "", "", "", ],
        ["|Pendulums","/list.cfm?groupname=Pendulum&category=healing", "", "", "", "", "", "", "", "", "", ],
        ["|Donuts","/stone_pendants.cfm", "", "", "", "", "", "", "", "", "", ],
        ["|Drops","/stone_pendants.cfm", "", "", "", "", "", "", "", "", "", ],
        ["|Buddha","/list.cfm?groupname=Buddha&category=healing", "", "", "Buddha", "", "", "", "", "", "", ],
        ["|Ganesh","/list.cfm?groupname=Ganesha&category=healing", "", "", "", "", "", "", "", "", "", ],
    ["Beads","/beads.cfm", "", "", "", "", "", "", "", "", "", ],
    ["Gemstones","/gems.cfm", "", "", "", "", "", "", "", "", "", ],
    ["Wholesale","http://www.wholesale-gemstone-jewelry.com/wholesale_login.cfm", "", "", "", "", "", "", "", "", "", ],
];

dm_init();