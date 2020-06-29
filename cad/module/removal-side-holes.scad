/*

    Removal Side Holes
    
    By Anton Augustsson


*/


module removalSideHoles (
    thickness,
    length,
    x,y,z
    ){
/*
    ---------- Local varibles ---------- 
*/

r = 25;
h = thickness+1;
lengthRectangle = length-r*2;


/*
    ---------- Code ---------- 
*/

translate([
    x,
    y+h-1,
    z]) 
rotate([90,0,0])
union () {

translate([
    r,
    r,
    -1
    ])  
cylinder(
    h=h+2,
    r=r
    );

translate([
    r,
    0,
    -1
    ])
cube(size = [
    lengthRectangle,
    r*2,
    h+2
    ]);

translate([
    length-r,
    r,
    -1
    ])  
cylinder(
    h=h+2,
    r=r
    );


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


thickness = edgeTopThickness;
length = 300;

x=0;
y=0;
z=0;
yRotate=0;

removalSideHoles (
    thickness,
    length,
    x,y,z
    );