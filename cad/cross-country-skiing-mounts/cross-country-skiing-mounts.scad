use <threadlib/threadlib.scad>

$fn=100;
smallNum = 0.01;



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

    skiWidth       = 45; 
    skiExtraWidth  = 1; // Each side

    mountDepth     = 50; 
    mountSideThick = 4; 
    mountBaseThick = 6; 
    mountHeight    = 5; // Extra not total

    fastenerDiameter = 8.5; // To fasten skiis
    srewHoleDiameter = 8.5; // bottom hole 

        
    mountInnerDepth  = mountDepth;
    mountInnerWidth  = skiWidth
                    +skiExtraWidth*2;   
    mountInnerHeight = mountHeight;
    mountTotDepth  = mountInnerDepth;
    mountTotWidth  = mountInnerWidth
                    +mountSideThick*2;
    mountTotHeight = mountInnerHeight
                    +mountBaseThick;


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


module crossCountrySkiBootsMount(){
    
    width = 28;
    depth = 45;
    height = 36;
    baseThickness = 6;
    sideThickness = 4;
    rodeHeight = 10;
    rodeDiameter = 4.2;
    srewHoleDiameter = 8.5; // bottom hole 

    difference(){
    cube(size = [
        width,
        depth,
        height]); 
    
    union(){
    translate([
        -smallNum,
        sideThickness,
        baseThickness])
    cube(size = [
        width+smallNum*2,
        depth-sideThickness*2,
        height]);
        
    rotate([90,0,0])
    translate([
        width/2,
        height*5/6,
        -(depth+smallNum)])
    cylinder(
        h=depth+smallNum*2,
        d=rodeDiameter);
    
    // Hole for mounting hole pice
    translate([
        width/2,
        depth/2,
        -smallNum])
    cylinder(
        h=baseThickness+smallNum*2,
        d1=srewHoleDiameter,
        d2=srewHoleDiameter*2);
    }}     
}


module holeAttachment(){

    diameter     = 19.8; 
    stopDiameter = 35;
    height       = 25;
    stopThick    = 39;
    nutWidth     = 13.25;  
    srewHoleDiameter = 8.5; // bottom hole 
    
    // Main cylinder
    difference(){
    cylinder(
        h=height,
        d=diameter);
    
    translate([0,0,height/2-smallNum])
    fhex(nutWidth,height+smallNum*3);
    }
    
    // Stop
    translate([0,0,-stopThick])
    difference(){
    cylinder(
        h=stopThick,
        d=stopDiameter);
        
    translate([0,0,-smallNum])
    cylinder(
        h=stopThick+smallNum*2,
        d=srewHoleDiameter);
    }
}



/*
*  Model
*/

//crossCountrySkiBootsMount();

//translate([0,0,holeStopThick])
//skiMount();

//rotate([180,0,0])
holeAttachment();
