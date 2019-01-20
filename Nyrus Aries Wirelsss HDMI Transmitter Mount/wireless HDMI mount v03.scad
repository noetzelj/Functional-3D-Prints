
//V01 Wings/Tabs to side
//V02 Wings/Tans to other 90degree side
//V03 cutout for 3/8 nut in bottom, thicker bottom

use <nuts_and_bolts_v1.95.scad>;

shell_thick = 5;
wing_thick = 8;
wing_length = 20;

difference(){
    union(){
        hdmi_blank();
        wings_three();
    }
    hdmi_bore();
    bolt_cutout();
    //isolate bolt cutout
    //translate([0,-10,-10])
    //cube([80,80,80]);
}


module bolt_cutout(){
  rotate([0,90,0])
translate([0,13.9/2-(shell_thick/2),0])
translate([-21/2,0,-20])
//for a 3/8 bolt cutout
//hex_bolt (lenght, thread_d, head_h, head_d, tolerance, quality, thread, pitch);
hex_bolt (3/8, 2/8, 2/8, 7/16, 1/128, 64, 0, "imperial");
}  
module wings_one(){
    color("green")
    translate([-shell_thick-wing_thick,
            -shell_thick,
            -wing_length/2-(shell_thick/2)])
    {
        //10mm on each side of the 21 height...
    cube([3,13.9+shell_thick,21+shell_thick+wing_length]);
    } 
}

module wings_two(){
    color("green")
    translate([-shell_thick-wing_thick,
            -shell_thick-(wing_length/2),
            -(shell_thick/2)])
    {
        //10mm on each side of the 21 height...
    cube([3,13.9+shell_thick+wing_length,21+shell_thick]);
    } 
}

module wings_three(){
    color("green")
    translate([-wing_thick-shell_thick,
            -shell_thick,
            -(shell_thick/2)])
    {
        //10mm on each side of the 21 height...
    cube([wing_thick,13.9+shell_thick,21+shell_thick]);
    } 
}
module hdmi_blank()
  {
    color("blue")    
    translate([-shell_thick,-shell_thick,-shell_thick/2]){
    cube([50+shell_thick,13.9+shell_thick,21+shell_thick],center=false); //tall part
    }
}

module hdmi_bore() 
    {
    color("yellow")
    cube([52,9.15,21],center=false); //tall part
    //50+2 for view
        color("red")
    cube([11.9,15.9,21],center=false);  //stub
    //13.9 + 2 for view
        }
