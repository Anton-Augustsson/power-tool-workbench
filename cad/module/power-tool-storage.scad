/*

    Power Tool Storage
    
    By Anton Augustsson


*/

use <simple-drawer.scad>;
use <sliding-shelf.scad>;
use <storage-unit.scad>;

module powerToolStorage (
    thickness,
    length,
    width,
    height,
    x,y,z
    ){
/*
    ---------- Local varibles ---------- 
*/


storageUnitThickness = thickness;
storageUnitWidth     = width;
storageUnitLength    = length;
storageUnitHeight    = height;

thicknessBottom = thickness;
thicknessSide   = thickness;
thicknessFront  = 15;
        
slidingShelfWidth  = (length
        -thickness*2)/2-
        thickness/2;
slidingShelfLength = width
        -thickness*2;
slidingShelfHeight = height/3*2
        +9;

/*
    ---------- Code ---------- 
*/

translate([
    x,
    y,
    z]) 
union () {

storageUnit (
    storageUnitThickness,
    storageUnitWidth,
    storageUnitLength,
    storageUnitHeight,
    0,0,0
    );

// Left Lower
slidingShelf  (
    thicknessBottom,
    thicknessSide,
    thicknessFront,
    slidingShelfLength,
    slidingShelfWidth,
    slidingShelfHeight,
    thickness,0,thickness
    );
    
// Left Upper
slidingShelf  (
    thicknessBottom,
    thicknessSide,
    thicknessFront,
    slidingShelfLength,
    slidingShelfWidth,
    slidingShelfHeight,
    thickness,
    0,
    thickness+slidingShelfHeight
    );

// Right Lower
slidingShelf  (
    thicknessBottom,
    thicknessSide,
    thicknessFront,
    slidingShelfLength,
    slidingShelfWidth,
    slidingShelfHeight,
    thickness*2
    +slidingShelfWidth,
    0,
    thickness
    );
    
// Right Upper
slidingShelf  (
    thicknessBottom,
    thicknessSide,
    thicknessFront,
    slidingShelfLength,
    slidingShelfWidth,
    slidingShelfHeight,
    thickness*2
    +slidingShelfWidth,
    0,
    thickness+slidingShelfHeight
    );


color("Navy")
union () {
// Left lower storage blocks
translate([
    length/4-442/2,
    thicknessFront+thicknessSide,
    thickness+thicknessBottom]) 
cube(size = [
    442,
    357,
    389]);
    
// Left Upper storage blocks
translate([
    length/4-442/2,
    thicknessFront+thicknessSide,
    (thickness+thicknessBottom)*2
    +slidingShelfHeight]) 
cube(size = [
    442,
    357,
    117]);

// Left lower storage blocks
translate([
    length/4*3-442/2,
    thicknessFront+thicknessSide,
    thickness+thicknessBottom]) 
cube(size = [
    442,
    357,
    389]);
    
// Left Upper storage blocks
translate([
    length/4*3-442/2,
    thicknessFront+thicknessSide,
    (thickness+thicknessBottom)*2
    +slidingShelfHeight]) 
cube(size = [
    442,
    357,
    117]);
}

}}
    
/*
    ---------- Example ---------- 
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


thickness = storageUnitThickness;

length = storageUnitLength;
width  = storageUnitWidth;
height = storageUnitHeight;


x=0;
y=0;
z=0;
yRotate=0;

powerToolStorage (
    thickness,
    length,
    width,
    height,
    x,y,z
    );