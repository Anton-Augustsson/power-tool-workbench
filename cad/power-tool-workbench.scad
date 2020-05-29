/*

    Nightstand
    
    By Anton Augustsson
    
    
*/

//https://www.hornbach.se/shop/MDF-Board-19x2440x1220-mm/5115465/artikel-detaljer.html
//https://www.hornbach.se/shop/Furuplywood-BB-X-12x1220x2440-mm-WBP-LIM/5507269/artikel-detaljer.html



/*
    ---------- Variables ---------- 
*/

standardSheathingWidth = 1220; 
standardSheathingLength = 2440;

mdfTopThickness = 19;
plywoodTopThickness = 12;

// Side protection for ply and mdf
edgeTopThickness = 20; 
edgeTopWidth = 110;
edgeTopLengthX = standardSheathingLength
    +2*edgeTopThickness;
edgeTopLengthY = standardSheathingWidth
    +2*edgeTopThickness;

// 4 list betweend mdf and ply (Pine)
listTopThickness = 20; 
listTopWidth = edgeTopWidth
    -plywoodTopThickness
    -mdfTopThickness;
listTopLengthX = standardSheathingLength/4
    -listTopThickness;
listTopLengthY = standardSheathingWidth;

// 6 legs (Pine)
legLength = 900-edgeTopWidth;
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

/*
    ---------- Code ---------- 
*/


// storage blocks
translate([
    110,
    10,
    200]) 
cube(size = [
    442,
    357,
    389]);

// storage blocks
color("Gray")
translate([
    110,
    10,
    200+357+40]) 
cube(size = [
    442,
    357,
    117]);

// storage blocks
translate([
    650,
    10,
    180]) 
cube(size = [
    442,
    357,
    253]);

color("Gray")
// storage blocks
translate([
    650,
    10,
    180+253+20]) 
cube(size = [
    442,
    357,
    253]);



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

// top ply
translate([
    0,
    0,
    legLength]) 
cube(size = [
    standardSheathingLength,
    standardSheathingWidth,
    plywoodTopThickness]);
       
       
// top front edge
translate([
    -edgeTopThickness,
    -edgeTopThickness,
    legLength]) 
cube(size = [
    edgeTopLengthX,
    edgeTopThickness,
    edgeTopWidth]);
    
// top back edge
translate([
    -edgeTopThickness,
    standardSheathingWidth,
    legLength]) 
cube(size = [
    edgeTopLengthX,
    edgeTopThickness,
    edgeTopWidth]);

// top left edge
translate([
    -edgeTopThickness,
    -edgeTopThickness,
    legLength]) 
cube(size = [
    edgeTopThickness,
    edgeTopLengthY,
    edgeTopWidth]);
    
// top right edge
translate([
    standardSheathingLength,
    -edgeTopThickness,
    legLength]) 
cube(size = [
    edgeTopThickness,
    edgeTopLengthY,
    edgeTopWidth]);
    
    
// top left list
translate([
    0,
    0,
    legLength+plywoodTopThickness]) 
cube(size = [
    edgeTopThickness,
    listTopLengthY,
    listTopWidth]);

// top midle left list
translate([
    standardSheathingLength/4,
    0,
    legLength+plywoodTopThickness]) 
cube(size = [
    edgeTopThickness,
    listTopLengthY,
    listTopWidth]);

// top midle list
translate([
    standardSheathingLength/2,
    0,
    legLength+plywoodTopThickness]) 
cube(size = [
    edgeTopThickness,
    listTopLengthY,
    listTopWidth]);

// top right midle list
translate([
    standardSheathingLength/4*3,
    0,
    legLength+plywoodTopThickness]) 
cube(size = [
    edgeTopThickness,
    listTopLengthY,
    listTopWidth]);

// top right list
translate([
    standardSheathingLength-edgeTopThickness,
    0,
    legLength+plywoodTopThickness]) 
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
    legLength+plywoodTopThickness]) 
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
    legLength+plywoodTopThickness]) 
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
    legLength+plywoodTopThickness]) 
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
    legLength+plywoodTopThickness]) 
cube(size = [
    listTopLengthX,
    edgeTopThickness,
    listTopWidth]);



// mdf top
/*color("Tan")
translate([
    0,
    0,
    legLength+plywoodTopThickness
    +listTopWidth]) 
cube(size = [
    standardSheathingLength,
    standardSheathingWidth,
    mdfTopThickness]);
*/