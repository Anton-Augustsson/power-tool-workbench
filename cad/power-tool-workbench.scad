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



// left storageUunit
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

// Right storageUunit
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


// Left back storageUunit
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
    

// Right back storageUunit
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
    



// ---------- Leg ----------

// leg 1
translate([
    0,
    0,
    0]) 
cube(size = [
    legThickness,
    legWidth,
    legLength]);

// leg 2
translate([
    standardSheathingLength/2
    -legThickness/2,
    0,
    0]) 
cube(size = [
    legThickness,
    legWidth,
    legLength]);

// leg 3
translate([
    standardSheathingLength
    -legThickness,
    0,
    0]) 
cube(size = [
    legThickness,
    legWidth,
    legLength]);

// leg 4
translate([
    0,
    standardSheathingWidth-legWidth,
    0]) 
cube(size = [
    legThickness,
    legWidth,
    legLength]);

// leg 5
translate([
    standardSheathingLength/2
    -legThickness/2,
    standardSheathingWidth-legWidth,
    0]) 
cube(size = [
    legThickness,
    legWidth,
    legLength]);

// leg 6
translate([
    standardSheathingLength
    -legThickness,
    standardSheathingWidth-legWidth,
    0]) 
cube(size = [
    legThickness,
    legWidth,
    legLength]);


// ---------- Bottom ----------
// front bottom list
translate([
    0,
    -listBottomThickness,
    bottomHeight]) 
cube(size = [
    listBottomLengthX,
    listBottomThickness,
    listBottomWidth1]);

// back bottom list
translate([
    0,
    standardSheathingWidth,
    bottomHeight]) 
cube(size = [
    listBottomLengthX,
    listBottomThickness,
    listBottomWidth1]);

// left bottom list
translate([
    legThickness,
    0,
    bottomHeight]) 
cube(size = [
    listBottomThickness,
    listBottomLengthY,
    listBottomWidth2]);

// midle left bottom list
translate([
    standardSheathingLength/4,
    0,
    bottomHeight]) 
cube(size = [
    listBottomThickness,
    listBottomLengthY,
    listBottomWidth2]);

// midle bottom list
translate([
    standardSheathingLength/2
    -legThickness/2
    -listBottomThickness,
    0,
    bottomHeight]) 
cube(size = [
    listBottomThickness,
    listBottomLengthY,
    listBottomWidth2]);

// midle right bottom list
translate([
    standardSheathingLength/4*3,
    0,
    bottomHeight]) 
cube(size = [
    listBottomThickness,
    listBottomLengthY,
    listBottomWidth2]);

// right bottom list
translate([
    standardSheathingLength
    -legThickness
    -listBottomThickness,
    0,
    bottomHeight]) 
cube(size = [
    listBottomThickness,
    listBottomLengthY,
    listBottomWidth2]);


// bottom ply
translate([
    0,
    0,
    bottomHeight+listBottomWidth2]) 
cube(size = [
    standardSheathingLength,
    standardSheathingWidth,
    plywoodTopThickness]);

    
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
    