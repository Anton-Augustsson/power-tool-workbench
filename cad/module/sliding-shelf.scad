/*

    Sliding Shelf
    
    By Anton Augustsson


*/

// use dovtail library

module slidingShelf (
    thicknessBottom,
    thicknessSide,
    thicknessFront,
    lenghtShelf,
    widthShelf,
    heightShelf,
    xShelf,yShelf,zShelf,
    yRotate
    ){
/*
    ---------- Local varibles ---------- 
*/

length = lenghtShelf;
width  = widthShelf;
height = 100;
heightSide = height-20;

x=xShelf;
y=yShelf;
z=zShelf;

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
translate([
    0,
    thicknessFront,
    0]) 
cube(size = [
    thicknessSide,
    length-thicknessFront,
    heightSide]);

// Right
color("Wheat")
translate([
    width-thicknessSide,
    thicknessFront,
    0]) 
cube(size = [
    thicknessSide,
    length-thicknessFront,
    heightSide]);
    
// Back
color("Wheat")
translate([
    thicknessSide,
    length-thicknessSide,
    0]) 
cube(size = [
    width-thicknessSide*2,
    thicknessSide,
    heightSide]);

// Front
color("BurlyWood")
translate([
    thicknessSide,
    thicknessFront,
    0]) 
cube(size = [
    width-thicknessSide*2,
    thicknessSide,
    heightSide]);    

// Front face
color("BurlyWood")
translate([
    0,
    0,
    0]) 
cube(size = [
    width,
    thicknessFront,
    height]);    

// Bottom 
color("Wheat")
translate([
    thicknessSide,
    thicknessFront+thicknessSide,
    2]) 
cube(size = [
    width-thicknessSide*2,
    length-thicknessFront-thicknessSide*2,
    thicknessBottom]);

}}
    
/*
    ---------- Example ---------- 
*/


thicknessBottom = 12;
thicknessSide   = 12;
thicknessFront  = 15;

length = 500;
width  = 600;
height = 100;


x=0;
y=0;
z=0;
yRotate=0;

slidingShelf  (
    thicknessBottom,
    thicknessSide,
    thicknessFront,
    length,
    width,
    height,
    x,y,z,
    yRotate
    );