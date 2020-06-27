/*

    Simple Drawer
    
    By Anton Augustsson


*/



module simpleDrawer (
    thicknessBottom,
    thicknessSide,
    thicknessFront,
    lenghtDrawer,
    widthDrawer,
    heightDrawer,
    xDrawer,yDrawer,zDrawer,
    yRotate
    ){
/*
    ---------- Local varibles ---------- 
*/

length = lenghtDrawer;
width  = widthDrawer;
height = heightDrawer;
heightSide = height/2;

x=xDrawer;
y=yDrawer;
z=zDrawer;

/*
    ---------- Code ---------- 
*/

translate([
    x,
    y,
    z]) 
difference () {
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

}


translate([
    width/2,                   
    -1,   
    height/4*3
    ])  
rotate([270,0,0])
cylinder(
    h = thicknessFront+2,    
    r = 10        
    );      

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

simpleDrawer (
    thicknessBottom,
    thicknessSide,
    thicknessFront,
    length,
    width,
    height,
    x,y,z,
    yRotate
    );