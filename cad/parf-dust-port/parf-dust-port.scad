/*

    Bottom
    
    By Anton Augustsson


*/
$fn=90;
use <hose-adapter.scad>
//hoseAdapter (-90,0,0,0);


/*
    ---------- varibles ---------- 
*/

thickness = 2;
depth = 36;

widthGuide  = 95; // Inner not total 
heightGuide = 26;
depthGuide = 20; // Depth guide
clipesExtended = 4;
depthHose = 20;

totalDepth = depth+depthGuide+clipesExtended;
totalWidth = widthGuide+thickness*2;

removeCliper = sqrt(2*pow((widthGuide/2),2));
removalMiddle = totalDepth
    -depthGuide-2;

radiusRemoval = 34;
extraHookLenght = heightGuide-radiusRemoval/2-1;

extended = 2;
removalLowerDepth = 40+extended+0.1;
removalLowerHeight = 10;

/*
    ---------- Code ---------- 
*/


color("Wheat")
difference () {
union () {
// Main
translate([
    0,
    0,
    0]) 
cube(size = [
    totalWidth,
    totalDepth,
    heightGuide]);
    
}

union () {
// removal clip
difference () {
translate([
    (widthGuide/2)+(totalWidth-widthGuide)/2,
    -widthGuide/2,
    -1]) 
rotate ([0,0,45])
cube(size = [
    removeCliper,
    removeCliper,
    heightGuide+2]);

// to prevent clip extruding to long
translate([
    (totalWidth-widthGuide)/2,
    totalDepth-depthGuide,
    -1]) 
cube(size = [
    widthGuide,
    removalMiddle,
    heightGuide+2]);
}

// removal lower
translate([
    -1,
    0,
    -1]) 
cube(size = [
    totalWidth+2,
    removalLowerDepth,
    removalLowerHeight+2]);

// rempval middle
translate([
    (totalWidth-widthGuide)/2,
    totalDepth-depthGuide-removalMiddle,
    -1]) 
cube(size = [
    widthGuide,
    removalMiddle,
    heightGuide+2]);


// remove ventalation hole
translate([
    totalWidth/4,
    totalDepth+1,
    heightGuide/2]) 
rotate ([90,0,0])
cylinder(
    h = depthGuide+18, 
    r = radiusRemoval/4+1.2);    

// remove hose adapter
hoseAdapter (extraHookLenght,radiusRemoval,
    90,totalWidth/4,
    totalDepth+55-10,heightGuide/2);
}
}
