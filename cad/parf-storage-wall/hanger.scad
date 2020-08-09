$fn=100;

diameter = 19.9;
height = 28+19;

wallThickness = 2;
lidThickness = 2;

stopThickness = 1.5;
stopDiameter = diameter+2;


difference() {
union(){
cylinder(
    h = height+stopThickness, 
    r = diameter/2);

cylinder(
    h = stopThickness, 
    r = stopDiameter/2);
}

union() {
translate([0,0,stopThickness])    
cylinder(
    h = height-lidThickness, 
    r = diameter/2-wallThickness);
}}