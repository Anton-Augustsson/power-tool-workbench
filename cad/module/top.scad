/*

    Top
    
    By Anton Augustsson


*/



module top (
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
    x,y,z
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
union () {

// Left
color("Wheat")


// top ply
color("Wheat")
translate([
    0,
    0,
    0]) 
cube(size = [
    standardSheathingLength,
    standardSheathingWidth,
    plywoodTopThickness]);
       
       
// top front edge
color("Wheat")
translate([
    -edgeTopThickness,
    -edgeTopThickness,
    plywoodTopThickness
    +listTopWidth+mdfTopThickness
    -edgeTopWidth]) 
cube(size = [
    edgeTopLengthX,
    edgeTopThickness,
    edgeTopWidth]);
    
// top back edge
color("Wheat")
translate([
    -edgeTopThickness,
    standardSheathingWidth,
    plywoodTopThickness
    +listTopWidth+mdfTopThickness
    -edgeTopWidth]) 
cube(size = [
    edgeTopLengthX,
    edgeTopThickness,
    edgeTopWidth]);

// top left edge
color("Wheat")
translate([
    -edgeTopThickness,
    -edgeTopThickness,
    plywoodTopThickness
    +listTopWidth+mdfTopThickness
    -edgeTopWidth]) 
cube(size = [
    edgeTopThickness,
    edgeTopLengthY,
    edgeTopWidth]);
    
// top right edge
color("Wheat")
translate([
    standardSheathingLength,
    -edgeTopThickness,
    plywoodTopThickness
    +listTopWidth+mdfTopThickness
    -edgeTopWidth]) 
cube(size = [
    edgeTopThickness,
    edgeTopLengthY,
    edgeTopWidth]);
    
    
// top left list
translate([
    0,
    0,
    plywoodTopThickness]) 
cube(size = [
    edgeTopThickness,
    listTopLengthY,
    listTopWidth]);

// top midle left list
translate([
    standardSheathingLength/4,
    0,
    plywoodTopThickness]) 
cube(size = [
    edgeTopThickness,
    listTopLengthY,
    listTopWidth]);

// top midle list
translate([
    standardSheathingLength/2,
    0,
    plywoodTopThickness]) 
cube(size = [
    edgeTopThickness,
    listTopLengthY,
    listTopWidth]);

// top right midle list
translate([
    standardSheathingLength/4*3,
    0,
    plywoodTopThickness]) 
cube(size = [
    edgeTopThickness,
    listTopLengthY,
    listTopWidth]);

// top right list
translate([
    standardSheathingLength-edgeTopThickness,
    0,
    plywoodTopThickness]) 
cube(size = [
    edgeTopThickness,
    listTopLengthY,
    listTopWidth]);


// top left lenght list
color("Gray")
translate([
    edgeTopThickness*1+listTopLengthX*0,
    standardSheathingWidth/2
    -edgeTopThickness,
    plywoodTopThickness]) 
cube(size = [
    listTopLengthX,
    edgeTopThickness,
    listTopWidth]);


// top left middle lenght list
color("Gray")
translate([
    edgeTopThickness*2+listTopLengthX*1,
    standardSheathingWidth/2
    -edgeTopThickness,
    plywoodTopThickness]) 
cube(size = [
    listTopLengthX,
    edgeTopThickness,
    listTopWidth]);


// top right midle lenght list
color("Gray")
translate([
    edgeTopThickness*3+listTopLengthX*2,
    standardSheathingWidth/2
    -edgeTopThickness,
    plywoodTopThickness]) 
cube(size = [
    listTopLengthX,
    edgeTopThickness,
    listTopWidth]);

// top right lenght list
color("Gray")
translate([
    edgeTopThickness*4+listTopLengthX*3,
    standardSheathingWidth/2
    -edgeTopThickness,
    plywoodTopThickness]) 
cube(size = [
    listTopLengthX,
    edgeTopThickness,
    listTopWidth]);



// mdf top
color("BurlyWood")
translate([
    0,
    0,
    plywoodTopThickness
    +listTopWidth]) 
cube(size = [
    standardSheathingLength,
    standardSheathingWidth,
    mdfTopThickness]);


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
z=legLength;
yRotate=0;

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
    x,y,z
    );