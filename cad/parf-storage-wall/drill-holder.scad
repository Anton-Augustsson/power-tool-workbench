$fn=100;

diameter = 19.8;
parfDistanceBetweenHoles = 96;

materialThickness = 28;
wallThickness = 2;
lidThickness = 2;
holderThickness = 20;

drill3Diameter = 10.1;
drill20Diameter = drill3Diameter;
parfJoiningDiameter = 8.1;
parfJoiningLength = 6;
screwDiameter = 2.6;
allenKeyDiameter = 2.5;


union(){

difference(){
translate([
    -diameter/2,
    -diameter/2,
    -holderThickness])
cube(size = [
    parfDistanceBetweenHoles+diameter,
    diameter,
    holderThickness]);

union() {    
// 3mm drill slot
translate([
    30,
    diameter/2+1,
    -holderThickness/2])
rotate ([90,0,0])
cylinder(
    h = holderThickness+2, 
    r = drill3Diameter/2);

// 20mm drill slot
translate([
    parfDistanceBetweenHoles-35,
    diameter/2+1,
    -holderThickness/2])
rotate ([90,0,0])
cylinder(
    h = holderThickness+2, 
    r = drill20Diameter/2);

// parf jointing slot
translate([
    6,
    diameter/2+1,
    -holderThickness/2])
rotate ([90,0,0])
cylinder(
    h = parfJoiningLength+1, 
    r = parfJoiningDiameter/2);    

// screw slot
translate([
    parfDistanceBetweenHoles,
    diameter/2+1,
    -holderThickness/2])
rotate ([90,0,0])
cylinder(
    h = holderThickness+2, 
    r = screwDiameter/2);    

// allen key slot
translate([
    parfDistanceBetweenHoles-12,
    diameter/2+1,
    -holderThickness/2])
rotate ([90,0,0])
cylinder(
    h = holderThickness+2, 
    r = allenKeyDiameter/2);    
        
}}


difference() {
cylinder(
    h = materialThickness, 
    r = diameter/2);

cylinder(
    h = materialThickness-lidThickness, 
    r = diameter/2-wallThickness);
}


translate([parfDistanceBetweenHoles,0,0])
difference() {
cylinder(
    h = materialThickness, 
    r = diameter/2);

cylinder(
    h = materialThickness-lidThickness, 
    r = diameter/2-wallThickness);

}
}


