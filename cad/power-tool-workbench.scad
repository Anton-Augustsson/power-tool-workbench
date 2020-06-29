/*

    Power tool workbench
    
    By Anton Augustsson
    
    
*/

//https://www.hornbach.se/shop/MDF-Board-19x2440x1220-mm/5115465/artikel-detaljer.html
//https://www.hornbach.se/shop/Furuplywood-BB-X-12x1220x2440-mm-WBP-LIM/5507269/artikel-detaljer.html
use <module/simple-drawer.scad>;
use <module/sliding-shelf.scad>;
use <module/storage-unit.scad>;
use <module/power-tool-storage.scad>;
use <module/drawer-storage.scad>;
use <module/middle-storage-unit.scad>;
use <module/top.scad>;
use <module/bottom.scad>;

/*
    ---------- Variables ---------- 
*/

standardSheathingWidth = 1220; 
standardSheathingLength = 2440;

mdfTopThickness = 19;
plywoodTopThickness = 12;

// Side protection for ply and mdf
edgeTopThickness = 20; 
edgeTopWidth = 167;
edgeTopLengthX = standardSheathingLength
    +2*edgeTopThickness;
edgeTopLengthY = standardSheathingWidth
    +2*edgeTopThickness;

// 4 list betweend mdf and ply (Pine)
listTopThickness = 20; 
listTopWidth = 80;
listTopLengthX = standardSheathingLength/4
    -listTopThickness;
listTopLengthY = standardSheathingWidth;

// 6 legs (Pine)
legLength = 900
    -plywoodTopThickness
    -mdfTopThickness
    -listTopWidth;
legWidth = 69;
legThickness = 42;

// 3 bottom list (Pine)
listBottomThickness = 20; 
listBottomWidth1 = 60;
listBottomWidth2 = listBottomWidth1
    -plywoodTopThickness;
listBottomLengthX = standardSheathingLength;
listBottomLengthY = standardSheathingWidth;
listBottomLengthY2 = standardSheathingWidth
    +listBottomThickness*2;
bottomHeight = 100;

storageUnitLength=standardSheathingLength/2
    -legThickness*3/2;
storageUnitWidth=400;  
storageUnitHeight=(900-edgeTopWidth)
    -(bottomHeight+listBottomWidth2);
storageUnitThickness=12;

/*
    ---------- Code ---------- 
*/

// ---------- Storage Unit ----------

// left storageUnit
powerToolStorage (
    storageUnitThickness,
    storageUnitLength,
    storageUnitWidth,
    storageUnitHeight,
    legThickness,
    0,
    bottomHeight+listBottomWidth2
    +plywoodTopThickness
    );

// Right storageUnit
powerToolStorage (
    storageUnitThickness,
    storageUnitLength,
    storageUnitWidth,
    storageUnitHeight,
    legThickness*2+storageUnitLength,
    0,
    bottomHeight+listBottomWidth2
    +plywoodTopThickness
    );


// Left back storageUnit
drawerStorage (
    storageUnitThickness,
    storageUnitLength,
    storageUnitWidth,
    storageUnitHeight,
    legThickness+storageUnitLength,
    standardSheathingWidth-storageUnitWidth
    +storageUnitWidth,
    bottomHeight+listBottomWidth2
    +plywoodTopThickness,
    180
    );
    

// Right back storageUnit
drawerStorage (
    storageUnitThickness,
    storageUnitLength,
    storageUnitWidth,
    storageUnitHeight,
    legThickness*2+storageUnitLength*2,
    standardSheathingWidth-storageUnitWidth
    +storageUnitWidth,
    bottomHeight+listBottomWidth2
    +plywoodTopThickness,
    180
    );


middleStorageUnit (
    storageUnitThickness,
    standardSheathingLength-legThickness*2,
    standardSheathingWidth
    -storageUnitWidth*2,
    300,
    legThickness,        
    (storageUnitWidth)*2
    +storageUnitThickness/5*8,
    bottomHeight+listBottomWidth2
    +plywoodTopThickness,
    -90
    );
    



// ---------- Bottom ----------

bottom (
    standardSheathingWidth,
    standardSheathingLength,
    plywoodTopThickness,
    legLength,
    legWidth,
    legThickness,
    listBottomThickness,
    listBottomWidth1,
    listBottomLengthX,
    listBottomLengthY,
    listBottomLengthY2,
    bottomHeight,
    0,0,0
    );
    
    
// ---------- Top ----------

top (
    standardSheathingWidth,
    standardSheathingLength,
    mdfTopThickness,
    plywoodTopThickness,
    edgeTopThickness,
    edgeTopWidth,
    edgeTopLengthX,
    edgeTopLengthY,
    listTopThickness,
    listTopWidth,
    listTopLengthX,
    listTopLengthY,
    0,0,legLength
    );
    