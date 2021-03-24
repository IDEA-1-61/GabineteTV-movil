      
      
 module Poste(altura=10,espesor=3,tol=1,diamShaft=2){
	   
	   difference(){
	      cylinder(d=(espesor*2)+diamShaft+tol,h=altura);
	   
		  cylinder(d=diamShaft+tol,h=altura*4,center=true);
	      
	   }
   }
      
  module piezaCarretillaX(){        
        tol=1;
diamTorBal=4.6;
 
 distBalerosX=52;  
//distancia medida a finales de circunferencia
 distEntreTorY=37.6;     

diamTorProf=5.8;

minkow=6;
alturaPoste=8.32;
espesor=5;

//altura perfil
calcePerfil=3.67;
      
      //tuerca presion
      diamTuerca=10.58;

difference(){

  union(){

    linear_extrude(height=espesor)
       difference(){   
         
                minkowski(){
                    union(){
                    polygon([[-distBalerosX/2,0],[distBalerosX/2,0],[0,-distEntreTorY-diamTorBal]]);
                         polygon([[-distBalerosX/2,0],[distBalerosX/2,0],[10,9],[-10,9]]);
                                                
                        }
                     circle(r=minkow);
                 }
     
            //perforacionBalero_1
            translate([ distBalerosX/2,0])
             circle(d=diamTorBal+tol);
            
              //perforacionBalero_2
            translate([-distBalerosX/2,0])
             circle(d=diamTorBal+tol);
             
             //perforacionBalero_3
            translate([0,-distEntreTorY-diamTorBal])
             circle(d=diamTorBal+tol);
             
                                            
                 //perforación peso triangular
                 translate([0,-(distEntreTorY/2)])
                 rotate(-90)
                 minkowski(){
                    circle(d=28,$fn=3);
                    circle(d=minkow);
                  }     
                     
             }
             
             //cubo para calce del perfil
           //  translate([-10-(tol/2),distEntreTorY+diamTorBal-10])
            // cube([20+tol,20,espesor+calcePerfil]);
             
                 //poste_1
    translate([ distBalerosX/2,0])
    Poste(altura=alturaPoste+espesor,espesor=espesor*0.6,tol=1,diamShaft=diamTorBal);
              
         //poste_2
    translate([-distBalerosX/2,0])
    Poste(altura=alturaPoste+espesor,espesor=espesor*0.6,tol=1,diamShaft=diamTorBal);
         
               //poste_3
    translate([0,-distEntreTorY-diamTorBal])
    Poste(altura=alturaPoste+espesor,espesor=espesor*0.6,tol=1,diamShaft=diamTorBal);
       
             
         }             
         
         //perforacion Tornillo perfil
            //  translate([0,distEntreTorY+diamTorBal])
               // circle(d=diamTorProf+tol);
             //cylinder(d=diamTorProf+tol,h=20,center=true);
         
           //tuerca para perforacionBalero_1
                  translate([distBalerosX/2,0])
                  cylinder(d=diamTuerca+tol,h=(espesor-tol*2)*2,$fn=6,center=true);
         
          translate([distBalerosX/2+espesor,0])
                  cylinder(d=diamTuerca+tol,h=(espesor-tol*2)*2,$fn=6,center=true);
         
         
          //tuerca para perforacionBalero_2
          translate([-distBalerosX/2,0])
                  cylinder(d=diamTuerca+tol,h=(espesor-tol*2)*2,$fn=6,center=true);
         
                  translate([-distBalerosX/2-espesor,0])
                  cylinder(d=diamTuerca+tol,h=(espesor-tol*2)*2,$fn=6,center=true);
         
         //tuerca para perforacionBalero_3
         translate([0,-distEntreTorY-diamTorBal])
         cylinder(d=diamTuerca+tol,h=(espesor-tol*2)*2,$fn=6,center=true);
         
         translate([0,-distEntreTorY-diamTorBal-10])
         cube([20,20,(espesor-tol*2)*2],center=true);
         
     }
         
         //apoyos para perfil en 90 grados
     
     translate([0,10,0])
     rotate([0,0,90])
     difference(){
           union(){
                   //translate([10+(tol/2),distEntreTorY+diamTorBal-10])
               translate([0,-10,0])
                   cube([espesor,20,espesor+30]);
                     
                     
                         //parte redonda
                    //translate([10+(tol/2),distEntreTorY+diamTorBal,espesor+10])
               translate([0,0,espesor+30])
                    rotate([0,90,0])
                    cylinder(d=20,h=5);
           }
           //translate([0,distEntreTorY+diamTorBal,espesor+10])
           translate([0,0,espesor+10])
           //tornillos perfil
           for(i=[0:1]){
               translate([0,0,20*i])
               rotate([0,90,0])
               cylinder(d=5,h=50,center=true);
           }
       }//fin difference
     
       
     
   }//fin modulo   

$fn=100;

//primer parte
rotate([90,90,0])
piezaCarretillaX();   
   
   //segunda parte
//rotate([90,270,0])
//piezaCarretillaX();  
  