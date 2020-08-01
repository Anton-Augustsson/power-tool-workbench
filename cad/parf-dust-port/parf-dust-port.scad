/*

    Bottom
    
    By Anton Augustsson


*/



/*
    ---------- varibles ---------- 
*/

thickness = 2;
depth = 40;

widthGuide  = 60; // Inner not total 
heightGuide = 20;
depthGuide = 20;// Depth guide
clipesExtended = 4;

totalDepth = depth+depthGuide+clipesExtended;
totalWidth = widthGuide+thickness*2;

//removeCliper =  

/*
    ---------- Code ---------- 
*/


color("Wheat")
difference () {
union () {
// leg 1
translate([
    0,
    0,
    0]) 
cube(size = [
    totalWidth,
    totalDepth,
    heightGuide]);
    
// leg 1
translate([
    widthGuide/2,
    -widthGuide/sqrt(2),
    0]) 
rotate ([0,0,45])
cube(size = [
    widthGuide,
    widthGuide,
    heightGuide]);
}

union () {


}
}
