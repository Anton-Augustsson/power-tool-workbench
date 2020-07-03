/*

    Template Removal Side Holes Male
    
    By Anton Augustsson


*/
$fn=100;  // accuracy
use <removal-side-holes.scad>;

/*
    ---------- Local varibles ---------- 
*/

h=14;
positionFromUpperEdge=95;

length=300;
extra=20;
fenceThickness=15; 

widthRemovalSideHoles=50;
edgeTopThickness = 20; 

maleR=3;
maleLength=4;

/*
    ---------- Code ---------- 
*/

difference() { 
union () {
translate([
    (length+extra*2)/2-extra,
    -widthRemovalSideHoles
    -extra,
    0
    ])  
cube(size = [
    (length+extra*2)/2,
    positionFromUpperEdge+extra,
    h
    ]);

translate([
    (length+extra*2)/2-extra,
    positionFromUpperEdge
    -(widthRemovalSideHoles),
    0
    ])  
cube(size = [
    (length+extra*2)/2,
    fenceThickness,
    h+edgeTopThickness-1
    ]);
    
}

rotate([90,0,0])
removalSideHoles (
    edgeTopThickness,
    length,
    0,0,0
    );

translate([
    (length)/2-1,
    30,
    h/2
    ])  
rotate([0,90,0])
cylinder(
    h=maleLength+1,
    r=maleR
    );

translate([
    (length)/2-1,
    -60,
    h/2
    ])  
rotate([0,90,0])
cylinder(
    h=maleLength+1,
    r=maleR
    );
}