/*

    Storage Unit
    
    By Anton Augustsson


*/



module storageUnit (
    thickness,
    length,
    width,
    height,
    x,y,z,
    yRotate
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
translate([
    0,
    0,
    0]) 
cube(size = [
    thickness,
    length-thickness,
    height]);

// Right
color("Wheat")
translate([
    width-thickness,
    0,
    0]) 
cube(size = [
    thickness,
    length-thickness,
    height]);
    
// Back
color("Wheat")
translate([
    0,
    length-thickness,
    0]) 
cube(size = [
    width,
    thickness,
    height]);

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

}

}
    
/*
    ---------- Example ---------- 
*/


thickness= 12;

length = 500;
width  = 600;
height = 400;


x=0;
y=0;
z=0;
yRotate=0;

storageUnit (
    thickness,
    length,
    width,
    height,
    x,y,z,
    yRotate
    );