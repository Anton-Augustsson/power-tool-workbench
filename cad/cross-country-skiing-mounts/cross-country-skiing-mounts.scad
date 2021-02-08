use <threadlib/threadlib.scad>

$fn=100;
// width length height depth thickness

/*
*  Fundemental Variabels
*/

smallNum = 0.01;

// ski mount spesific
skiWidth       = 45; 
skiExtraWidth  = 2; // Each side

mountDepth     = 50; 
mountSideThick = 4; 
mountBaseThick = 6; 
mountHeight    = 12.5; // Extra not total

fastenerDiameter = 8.5; // To fasten skiis
srewHoleDiameter = 8.5; // bottom hole 

// hole attachment spesific
holeDiameter     = 19.8; 
holeStopDiameter = 35;
holeHeight       = 25;
holeStopThick    = 45-mountBaseThick;
nutWidth         = 13.25;  


/*
*  Calculated Variables
*/

// ski mount spesific
mountInnerDepth  = mountDepth;
mountInnerWidth  = skiWidth
                   +skiExtraWidth*2;   
mountInnerHeight = mountHeight;
mountTotDepth  = mountInnerDepth;
mountTotWidth  = mountInnerWidth
                 +mountSideThick*2;
mountTotHeight = mountInnerHeight
                 +mountBaseThick;

/*
*  Helper Model
*/


module fhex(wid,height){
    hull(){
    cube([wid/1.7,wid,height],center = true);

    rotate([0,0,120])
    cube([wid/1.7,wid,height],center = true);

    rotate([0,0,240])
    cube([wid/1.7,wid,height],center = true);
}}

module skiMount(){
    
    translate([
        -mountTotDepth/2,
        -mountTotWidth/2,
        0])
    difference(){
    // Saved
    union(){
    cube(size = [
        mountTotDepth,
        mountTotWidth,
        mountTotHeight]);       
    }
    
    
    // Removed
    union(){
    // Remove to hold skiis 
    translate([
        -smallNum,
        mountSideThick,
        mountBaseThick])
    cube(size = [
        mountInnerDepth+smallNum*2,
        mountInnerWidth,
        mountInnerHeight+smallNum]); 
    
    // Hole for fasten the skiis
    

    translate([
        mountTotDepth/2,
        -smallNum,
        mountHeight/2+mountBaseThick])
    rotate([-90,0,0])
    bolt("M6", turns=8, higbee_arc=30);
    /*    
    cylinder(
        h=mountSideThick+smallNum*2,
        d=fastenerDiameter);
    */
    // Hole for mounting hole pice
    translate([
        mountTotDepth/2,
        mountTotWidth/2,
        -smallNum])
    cylinder(
        h=mountBaseThick+smallNum*2,
        d1=srewHoleDiameter,
        d2=srewHoleDiameter*2);
    }}
    
}


module holeAttachment(){
    
    // Main cylinder
    difference(){
    cylinder(
        h=holeHeight,
        d=holeDiameter);
    
    translate([0,0,holeHeight/2-smallNum])
    fhex(nutWidth,holeHeight+smallNum*3);
    }
    
    // Stop
    translate([0,0,-holeStopThick])
    difference(){
    cylinder(
        h=holeStopThick,
        d=holeStopDiameter);
        
    translate([0,0,-smallNum])
    cylinder(
        h=holeStopThick+smallNum*2,
        d=srewHoleDiameter);
    }
}


/*
*  Model
*/

//translate([0,0,holeStopThick])
skiMount();

//rotate([180,0,0])
//holeAttachment();
