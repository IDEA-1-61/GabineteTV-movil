


module Poste(esp=3,altura=20,diamShaft=5,tol=1){
    
    difference(){
      cylinder(d=diamShaft+(2*tol)+(2*esp),h=altura);
      cylinder(d=diamShaft+(2*tol),h=altura*4,center=true);
    }
}

//tipo Minebea (mercadolibre)
module motorNEMA17(){
    difference(){
       translate([-21,-21,0])
       cube([42,42,37]);
        
        translate([0,0,37])
        for(i=[0:3]){
            rotate(90*i)
            translate([31/2,31/2,0])
            cylinder(d=4,h=20,center=true);
        }
    }
    translate([0,0,35])
    cylinder(d=22,h=4);
    translate([0,0,35])
    cylinder(d=5,h=16);
    
}

module Rodamiento(){
    difference(){
        union(){
            translate([0,0,-5])
            cylinder(d1=20,d2=24,h=2);

            cylinder(d=24,h=6,center=true);

            translate([0,0,3])
            cylinder(d1=24,d2=20,h=2);
        }
        
        cylinder(d=5,h=50,center=true);
    }
}



module NEMA17bracket(){
    
    
    tol=1;
    espe=4;
    

    difference(){
        
      union(){  
        translate([-21-tol-espe,-21,25])
        cube([42+(2*tol)+(2*espe),42,37+espe-25]);
          
        //Postes tornillos m3
       for(i=[0:3]){
                rotate(90*i)
               translate([31/2,31/2,37])
               cylinder(d=8,h=4.8);
       }
      }
        
      translate([-21-tol,-42,-37])
      cube([42+(2*tol),42*2,37*2]);
        
        //agujero centro NEMA
      cylinder(d=22+(2*tol),h=200,center=true);
        
        //agujeros Tornillos m3
           for(i=[0:3]){
                rotate(90*i)
                translate([31/2,31/2,0])
                cylinder(d=3+tol,h=80);
            }
    }


    viajePoste=21+(2*tol)+(2*espe)+4;

    //refuerzos y postes
    difference(){
        for(i=[0:1]){
            rotate(180*i)
            translate([21+tol,0,0,])
            hull(){
                translate([espe+4+tol+espe,0,0])
                cylinder(d=(2*tol)+(2*espe)+8,h=26);
                
                translate([0,-21,0])
                cube([espe,42,26]);
            }
        }
        
        //perforaciOn 1
        translate([viajePoste,0,0])
        cylinder(d=8+(2*tol),h=100,center=true);
        
         //perforaciOn 2
        translate([-viajePoste,0,0])
        cylinder(d=8+(2*tol),h=100,center=true);
    }
    

}//fin modulo


//###################RENDERIZADOS################
 //Rodamiento();

//color("red")
//motorNEMA17();

$fn=100;


//NEMA17bracket();

