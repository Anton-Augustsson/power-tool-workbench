/*

    Storage box
    
    By Anton Augustsson
    
    
*/



module SortBox (widthUnit,lenghtUnit){


// ---------- Constant varables ----------
u=50;
height=u;
wallThickness=2;
    
width=widthUnit*u;
lenght=lenghtUnit*u;
    
inerWidth=(width-wallThickness*2);
inerLenght=(lenght-wallThickness*2);


// ---------- Code ---------- 
difference() {
cube(size = [
    width,
    lenght,
    height]);

translate([
    wallThickness,    // Centering
    wallThickness, 
    wallThickness
    ]) 
cube(size = [
    inerWidth,
    inerLenght,
    height]);
}}

// ---------- Example ---------- 
SortBox (4,4);