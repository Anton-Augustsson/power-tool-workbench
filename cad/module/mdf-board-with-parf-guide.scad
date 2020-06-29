/*

    MDF Board With Parf Guide
    
    By Anton Augustsson


*/


module mdfBoardWithParfGuide (
    standardSheathingWidth,
    standardSheathingLength,
    mdfTopThickness,
    x,y,z
    ){
/*
    ---------- Local varibles ---------- 
*/

startX = 120;
startY = startX;

parfHoles = 10; //20mm 
betweedHoles = 96;

/*
    ---------- Code ---------- 
*/

translate([
    x,
    y,
    z])
difference() { 
union () {

// mdf top
color("BurlyWood")
translate([
    0,
    0,
    0]) 
cube(size = [
    standardSheathingLength,
    standardSheathingWidth,
    mdfTopThickness]);

}

union () {

for(i = [
    1:
    1: 
    (standardSheathingLength-startX)
    /betweedHoles])
for(x = [
    1:
    1: 
    (standardSheathingWidth-startY)
    /betweedHoles])
translate([
    startX+betweedHoles*(i-1),
    startY+betweedHoles*(x-1),
    -1
    ])  
cylinder(
    h=mdfTopThickness+2,
    r=parfHoles
    );
// parf guide holes

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


thickness= 12;

length = 500;
width  = 600;
height = 400;

x=0;
y=0;
z=plywoodTopThickness
    +listTopWidth;
yRotate=0;

mdfBoardWithParfGuide (
    standardSheathingWidth,
    standardSheathingLength,
    mdfTopThickness,
    x,y,z
    );