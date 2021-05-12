
tol=0;
dTor=7;


$fn=200;

linear_extrude(height=3)
difference(){
 
 square([30,40],center=true);
    translate([-9.5/2,-10])
    union(){
        circle(d=dTor+tol);

        translate([3.7,11])
        circle(d=13);


        translate([9.5,20])
        circle(d=dTor+tol);
    }
}