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
var smOrientation=1;
var dmRTL=0;
var pressedItem=-2;
var itemCursor="default";
var itemTarget="_self";
var statusString="";
var blankImage="data-clear-5.files/blank.gif";
var pathPrefix_img="";
var pathPrefix_link="";

//--- Dimensions
var menuWidth="325px";
var menuHeight="";
var smWidth="";
var smHeight="";

//--- Positioning
var absolutePos=0;
var posX="30px";
var posY="110px";
var topDX=5;
var topDY=0;
var DX=0;
var DY=0;
var subMenuAlign="center";
var subMenuVAlign="top";

//--- Font
var fontStyle=["normal 12px Arial","normal 12px Arial"];
var fontColor=["#FFFFFF","#000000"];
var fontDecoration=["none","none"];
var fontColorDisabled="#AAAAAA";

//--- Appearance
var menuBackColor="#4B7ECB";
var menuBackImage="";
var menuBackRepeat="repeat";
var menuBorderColor="#000000";
var menuBorderWidth="0px";
var menuBorderStyle="solid";
var smFrameImage="";
var smFrameWidth=0;

//--- Item Appearance
var itemBackColor=["#4B7ECB","#FFFFFF"];
var itemBackImage=["",""];
var itemSlideBack=0;
var beforeItemImage=["",""];
var afterItemImage=["",""];
var beforeItemImageW="";
var afterItemImageW="";
var beforeItemImageH="";
var afterItemImageH="";
var itemBorderWidth="0px";
var itemBorderColor=["#c0e0FF","#80A0FF"];
var itemBorderStyle=["solid","solid"];
var itemSpacing=1;
var itemPadding="4px";
var itemAlignTop="center";
var itemAlign="center";

//--- Icons
var iconTopWidth=16;
var iconTopHeight=16;
var iconWidth=16;
var iconHeight=16;
var arrowWidth=7;
var arrowHeight=7;
var arrowImageMain=["",""];
var arrowWidthSub=0;
var arrowHeightSub=0;
var arrowImageSub=["data-clear-5.files/arrv_white_2.gif","data-clear-5.files/arrv_black_2.gif"];

//--- Separators
var separatorImage="data-clear-5.files/sep_white.gif";
var separatorColor="";
var separatorWidth="70%";
var separatorHeight="3px";
var separatorAlignment="center";
var separatorVImage="";
var separatorVColor="";
var separatorVWidth="5px";
var separatorVHeight="100%";
var separatorPadding="0px";

//--- Floatable Menu
var floatable=1;
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
var transparency="90";
var transition=12;
var transOptions="";
var transDuration=250;
var transDuration2=200;
var shadowLen=3;
var shadowColor="#CA8877";
var shadowTop=1;

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
    ["itemWidth=100","itemBackColor=#FF981A,#FFFFFF","fontStyle=bold 12px Arial"],
];
var menuStyles = [
    ["menuBackColor=#FF981A"],
];

var menuItems = [

    ["Home","http://www.wholesale-gemstone-jewelry.com", "", "", "", "", "0", "0", "", "", "", ],
    ["Jewelry","", "", "", "", "", "0", "-1", "", "", "", ],
        ["|All Jewelry","/jewelry.cfm", "", "", "Jewelry By Theme", "", "", "", "", "", "", ],
        ["|By Gemstone","/rare-stones/rare-gems-jewelry.cfm", "", "", "", "", "", "", "", "", "", ],
        ["|Silver Jewelry","/sterling-silver-jewelry.cfm", "", "", "Sterling Silver", "", "", "", "", "", "", ],
        ["|Beaded Jewelry","/beaded_jewelry.cfm", "", "", "", "", "", "", "", "", "", ],
        ["|Designer Jewelry","/designer_jewelry_angela.cfm", "", "", "by Angela Daczko", "", "", "", "", "", "", ],
        ["|Mens Jewelry","/shaped/mens-gemstone-jewellery.cfm", "", "", "", "", "", "", "", "", "", ],
        ["|Affordable","/cheap-jewelry.cfm", "", "", "", "", "", "", "", "", "", ],
    ["Pendants","", "", "", "", "", "0", "", "", "", "", ],
        ["|All Pendants","/pendants.cfm", "", "", "by Theme", "", "", "", "", "", "", ],
        ["|By Gemstones","/rare-stones/rare-gems-jewelry.cfm?category=pendants", "", "", "", "", "", "", "", "", "", ],
        ["|Silver Pendants","/silver_gemstone_pendants.cfm", "", "", "Sterling Silver", "", "", "", "", "", "", ],
        ["|Stone Only","/stone_pendants.cfm", "", "", "", "", "", "", "", "", "", ],
        ["|Designer Pendants","/handmade_pendants_designer.cfm", "", "", "by Angela Daczko", "", "", "", "", "", "", ],
        ["|Mini Pendants","/shaped/mini-gemstone-pendants.cfm", "", "", "Smaller than 0.5 inches", "", "", "", "", "", "", ],
        ["|Men's Pendants","/shaped/mens-gemstone-pendants.cfm", "", "", "", "", "", "", "", "", "", ],
        ["|Affordable","/cheap-pendants.cfm", "", "", "", "", "", "", "", "", "", ],
    ["Rings","", "", "", "Most rings in all sizes", "", "0", "", "", "", "", ],
        ["|All Rings","/rings.cfm", "", "", "any size desired", "", "", "", "", "", "", ],
        ["|By Gemstones","/rare-stones/rare-gems-jewelry.cfm?category=rings", "", "", "", "", "", "", "", "", "", ],
        ["|Men's Rings","/shaped/mens-gemstone-rings.cfm", "", "", "", "", "", "", "", "", "", ],
        ["|Designer Rings","/handmade_rings_designer.cfm", "", "", "Mostly Adjustable", "", "", "", "", "", "", ],
        ["|Engagement Rings","/shaped/engagement-gemstone-rings.cfm", "", "", "Affordable to Premium", "", "", "", "", "", "", ],
        ["|Affordable","/cheap-rings.cfm", "", "", "", "", "", "", "", "", "", ],
    ["Earrings","", "", "", "", "", "0", "", "", "", "", ],
        ["|All Earrings","/earrings.cfm", "", "", "", "", "", "", "", "", "", ],
        ["|By Gemstones","/rare-stones/rare-gems-jewelry.cfm?category=earrings", "", "", "", "", "", "", "", "", "", ],
        ["|Silver Earrings","/silver_gemstone_earrings.cfm", "", "", "", "", "", "", "", "", "", ],
        ["|Beaded Earrings","/beaded_earrings.cfm", "", "", "", "", "", "", "", "", "", ],
        ["|Designer Earrings","/handmade_earrings_designer.cfm", "", "", "", "", "", "", "", "", "", ],
        ["|Posts and Studs","", "", "", "", "", "", "", "", "", "", ],
            ["||Post Earrings","/shaped/post-gemstone-earrings.cfm", "", "", "", "", "", "", "", "", "", ],
            ["||Stud Earrings","/shaped/studs-gemstone-earrings.cfm", "", "", "", "", "", "", "", "", "", ],
        ["|Affordable","/cheap-earrings.cfm", "", "", "", "", "", "", "", "", "", ],
    ["Necklaces","", "", "", "", "", "0", "", "", "", "", ],
        ["|All Necklaces","/necklaces.cfm", "", "", "Necklaces by Theme", "", "", "", "", "", "", ],
        ["|By Gemstones","/rare-stones/rare-gems-jewelry.cfm?category=necklaces", "", "", "", "", "", "", "", "", "", ],
        ["|Silver Necklaces","/silver_gemstone_necklaces.cfm", "", "", "Sterling Silver", "", "", "", "", "", "", ],
        ["|Beaded Necklaces","/beaded_necklaces.cfm", "", "", "with or without silver", "", "", "", "", "", "", ],
        ["|Designer Necklaces","/handmade_necklaces_designer.cfm", "", "", "by Angela Daczko", "", "", "", "", "", "", ],
        ["|Affordable","/cheap-necklaces.cfm", "", "", "", "", "", "", "", "", "", ],
    ["Bracelets","", "", "", "", "", "0", "", "", "", "", ],
        ["|All Bracelets","/bracelets.cfm", "", "", "", "", "", "", "", "", "", ],
        ["|Silver Bracelets","silver_gemstone_bracelets.cfm", "", "", "sterling silver", "", "", "", "", "", "", ],
        ["|Beaded Bracelets","/beaded_bracelets.cfm", "", "", "with our without silver", "", "", "", "", "", "", ],
        ["|Designer Bracelets","/handmade_bracelets_designer.cfm", "", "", "by Angela Daczko", "", "", "", "", "", "", ],
        ["|Affordable","/cheap-bracelets.cfm", "", "", "", "", "", "", "", "", "", ],
        ["|By Gemstones","/rare-stones/rare-gems-jewelry.cfm?category=bracelets", "", "", "", "", "", "", "", "", "", ],
    ["Chains","/shaped/chains-gemstone-necklaces.cfm", "", "", "", "", "0", "", "", "", "", ],
    ["Brooches","/brooches.cfm", "", "", "", "", "0", "", "", "", "", ],
    ["Healing","", "", "", "Crystals, wands, pyramids etc.", "", "0", "", "", "", "", ],
        ["|All Healing","/healing.cfm", "", "", "", "", "", "", "", "", "", ],
        ["|Spheres","http://www.semiprecious.com/list.cfm?groupname=Spheres&category=healing", "", "", "", "", "", "", "", "", "", ],
        ["|Pyramids","/list.cfm?groupname=Pyramid&category=Healing", "", "", "", "", "", "", "", "", "", ],
        ["|Eggs","/list.cfm?groupname=Eggs&category=Healing", "", "", "", "", "", "", "", "", "", ],
        ["|Wands","/list.cfm?groupname=Wands&category=Healing", "", "", "", "", "", "", "", "", "", ],
        ["|Pendulums","/list.cfm?groupname=Pendulum&category=healing", "", "", "", "", "", "", "", "", "", ],
        ["|Donuts","/stone_pendants.cfm", "", "", "", "", "", "", "", "", "", ],
        ["|Drops","/stone_pendants.cfm", "", "", "", "", "", "", "", "", "", ],
        ["|Buddha","/list.cfm?groupname=Buddha&category=healing", "", "", "Buddha", "", "", "", "", "", "", ],
        ["|Ganesh","/list.cfm?groupname=Ganesha&category=healing", "", "", "", "", "", "", "", "", "", ],
    ["Beads","/beads.cfm", "", "", "", "", "0", "", "", "", "", ],
    ["Loose Gems","/gems.cfm", "", "", "", "", "0", "", "", "", "", ],
];

dm_init();