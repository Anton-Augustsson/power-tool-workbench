/*

    Middle Storage Unit
    
    By Anton Augustsson


*/



module middleStorageUnit (
    thickness,
    length,
    width,
    height,
    x,y,z,
    zRotate
    ){
/*
    ---------- Local varibles ---------- 
*/


/*
    ---------- Code ---------- 
*/

translate([
    x,
    y,
    z]) 
rotate([0,0,zRotate])
union () {

// Left
color("Wheat")
translate([
    0,
    0,
    0]) 
cube(size = [
    thickness,
    length,
    height]);

// Right
color("Wheat")
translate([
    width-thickness,
    0,
    0]) 
cube(size = [
    thickness,
    length,
    height]);


// Divider
color("Wheat")
translate([
    (width-thickness)/2,
    0,
    thickness]) 
cube(size = [
    thickness,
    length,
    height-thickness*2]);
    
    
// Middle Left Divider
color("Wheat")
translate([
    thickness,
    1000-thickness,
    0]) 
cube(size = [
    width/2-thickness/2*3,
    thickness,
    height-thickness]);

// Middle Left Divider
color("Wheat")
translate([
    thickness*2+(width/2-thickness/2*3),
    1500-thickness,
    0]) 
cube(size = [
    width/2-thickness/2*3,
    thickness,
    height-thickness]);


// Bottom 
color("Wheat")
translate([
    thickness,
    0,
    0]) 
cube(size = [
    width-thickness*2,
    length-thickness,
    thickness]);

// Top
color("BurlyWood")
translate([
    thickness,
    0,
    height-thickness]) 
cube(size = [
    width-thickness*2,
    length-thickness,
    thickness]);    


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
y=standardSheathingWidth
    -storageUnitWidth*2;
z=0;
zRotate=-90;

middleStorageUnit (
    thickness,
    standardSheathingLength-legThickness*2,
    standardSheathingWidth
    -storageUnitWidth*2,
    300,
    x,y,z,
    zRotate
    );