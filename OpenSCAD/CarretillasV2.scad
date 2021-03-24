      
      
 module Poste(altura=10,espesor=3,tol=1,diamShaft=2){
	   
	   difference(){
	      cylinder(d=(espesor*2)+diamShaft+tol,h=altura);
	   
		  cylinder(d=diamShaft+tol,h=altura*4,center=true);
	      
	   }
   }
      
  module piezaCarretillaX(){        
        tol=1;
diamTorBal=4.6;
      
     // diamTorBal=0;
 
 distBalerosX=40;  
      
//distancia medida a finales de circunferencia
 distEntreTorY=50;     
//ajY=2;
  ajY=0;

diamTorProf=5.8;

minkow=8;
alturaPoste=9.75+3;
espesor=10;

//altura perfil
calcePerfil=3.67;
      
      //tuerca presion
      //diamTuerca=10.58;
      diamTuerca=11;
      
      espPoste=4;


translate([0,-(distEntreTorY/2)-ajY,17/2])
difference(){
    minkowski(){
        cube([30-14,30-14,17],center=true);
        cylinder(r=7,h=0.01,center=true);
    }
       
    translate([0,0,27/2])
   union(){ 
       translate([0,0,-50])
        cylinder(d=8,h=50);
        cylinder(d=14,h=50);
   }


}
//Carretilla
translate([0,0,17])
difference(){

  union(){

    linear_extrude(height=espesor)
       difference(){   
         
                minkowski(){
       
                    polygon([[-distBalerosX/2,0],[distBalerosX/2,0],[0,-distEntreTorY]]);
 
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
             
                                            
             
                     
             }
                          
                 //poste_1
    translate([ distBalerosX/2,0])
    Poste(altura=alturaPoste+espesor,espesor=espPoste,tol=1,diamShaft=diamTorBal);
              
         //poste_2
    translate([-distBalerosX/2,0])
    Poste(altura=alturaPoste+espesor,espesor=espPoste,tol=1,diamShaft=diamTorBal);
         
               //poste_3
    translate([0,-distEntreTorY])
    Poste(altura=alturaPoste+espesor,espesor=espPoste,tol=1,diamShaft=diamTorBal);
       
             
         }             
         
           //tuerca para perforacionBalero_1
                  translate([distBalerosX/2,0])
                  cylinder(d=diamTuerca+tol,h=(espesor-tol*2)*2,$fn=6,center=true);
               
         
          //tuerca para perforacionBalero_2
          translate([-distBalerosX/2,0])
                  cylinder(d=diamTuerca+tol,h=(espesor-tol*2)*2,$fn=6,center=true);
         
         
         //tuerca para perforacionBalero_3
         
         //translate([0,-distEntreTorY-diamTorBal])
         translate([0,-distEntreTorY])
         rotate(90)
         cylinder(d=diamTuerca+tol,h=(espesor-tol*2)*2,$fn=6,center=true);
                  
           //cabeza de tuerca de apoyo
         translate([0,-(distEntreTorY/2)-ajY,0])
         cylinder(d=14,h=100,center=true);
                  
     }//fin difference
     
     translate([0,-(distEntreTorY/2)-ajY,-15])
     //linear_extrude(height=15+1)
     for(i=[0:3]){
         rotate(90*i)
         translate([0,-15])
         //import("CanalPerfil30x30V2.dxf");
         translate([-4,0,0])
         cube([8,9,15]);
     }              
 }//fin modulo   

$fn=100;

//primer parte
//rotate([90,90,0])
 
 difference(){
    piezaCarretillaX();  
    translate([0,0,32])
    cube([200,20,20],center=true); 
 }   
   //segunda parte
//rotate([90,270,0])
//piezaCarretillaX();  
  