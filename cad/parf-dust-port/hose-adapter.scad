/*
 
    Standerd hose adapter for BOSH GCM 8 SJL Miter Saw
    Anton Augustsson
    
*/




module hoseAdapter (extraHookLenght,
    radiusRemoval,rx,x,y,z) {

$fn=90;
wallThickness = 3;
wallThickness2 = 1;
    
hoseLenght   = 55;
hoseRadius   = 33/2;
mountLenght  = 40;
mountRadius  = radiusRemoval/4;//45/2

wallesRadius = hoseRadius
    +wallThickness;
wallesRadius2 = mountRadius
    +wallThickness2;
    
hookRadius   = 8/2;
hookDistance = hoseLenght
    -hookRadius;
hookLength   = wallesRadius2*2
    +extraHookLenght;




translate([x,y,z]) 
rotate ([rx,0,0])
difference() {
union(){
cylinder(
    h = mountLenght, 
    r = wallesRadius);

translate([
    0,
    0,
    mountLenght]) 
cylinder(
    h = hoseLenght-mountLenght, 
    r = wallesRadius2);


translate([
    0,
    (hookLength)/2,
    hookDistance]) 
rotate([90,0,0])
cylinder(
    h = hookLength, 
    r = hookRadius);

}

union () {
cylinder(
    h = mountLenght
    -wallThickness, 
    r = hoseRadius);

cylinder(
    h = hoseLenght+1, 
    r = mountRadius);
}
}}

hoseAdapter (2,25,-90,0,0,0);
//hoseAdapter (25,0,0,0,0);