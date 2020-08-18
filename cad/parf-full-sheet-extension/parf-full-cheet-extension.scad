$fn=100;

diameter = 19.9;
parfDistanceBetweenHoles = 96;

materialThickness = 22;
wallThickness = 2;
lidThickness = 2;
holderThickness = 4;
removalHolePosition = 212;
removalHoleDiameter = 20.2;


union(){
difference() {
union() {
translate([
    -diameter/2,
    -diameter,
    -holderThickness])
cube(size = [
    removalHolePosition+diameter*3/2,
    diameter*2,
    holderThickness]);

translate([
    removalHolePosition-diameter/2,
    -diameter,
    0])
cube(size = [
    diameter*3/2,
    diameter*2,
    holderThickness*2]);
}

union() {
translate([removalHolePosition,0,-holderThickness-1])
cylinder(
    h = holderThickness*3+2, 
    d = removalHoleDiameter);

translate([removalHolePosition,0,-holderThickness-1])
cylinder(
    h = 3, 
    d1 = diameter+5,
    d2 = diameter);

translate([
    -diameter/2,
    diameter/2,
    -holderThickness-1])
cube(size = [
    removalHolePosition*2/3,
    diameter/2,
    holderThickness*3+2]);
    
translate([
    -diameter/2,
    -diameter,
    -holderThickness-1])
cube(size = [
    removalHolePosition*2/3,
    diameter/2,
    holderThickness*3+2]);
    
translate([
    removalHolePosition+diameter,
    0,
    -holderThickness-1])
rotate([0,0,45])
cube(size = [
    sqrt(2)*diameter,
    sqrt(2)*diameter,
    holderThickness*3+2]);

translate([
    removalHolePosition,
    -diameter,
    -holderThickness-1])
rotate([0,0,-45])
cube(size = [
    sqrt(2)*diameter,
    sqrt(2)*diameter,
    holderThickness*3+2]);    

translate([
    removalHolePosition+diameter*3/4,
    -diameter/2,
    -holderThickness-1])
cube(size = [
    diameter,
    diameter,
    holderThickness*3+2]);
}}


cylinder(
    h = materialThickness, 
    d = diameter);


translate([parfDistanceBetweenHoles,0,0])
cylinder(
    h = materialThickness, 
    d = diameter);
}