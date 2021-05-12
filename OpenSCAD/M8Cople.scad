


$fn=100;

difference(){
  cylinder(d=30,h=30,center=true);
  cylinder(d=8,h=60,center=true);
  
  
    for(i=[0:1]){
        rotate(90*i)
        union(){
            translate([4+5,0,-10])
            cube([3.5,8,18],center=true);  
            
            translate([4+5,0,10])
            cube([3.5,8,18],center=true); 
            
            translate([0,0,15-(9/2)])
            rotate([90,0,90])
            cylinder(d=4,h=100);
            
             translate([0,0,-15+(9/2)])
            rotate([90,0,90])
            cylinder(d=4,h=100);
        }
     }
}