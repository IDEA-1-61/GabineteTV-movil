      
      
 module Poste(altura=10,espesor=3,tol=1,diamShaft=2){
	   
	   difference(){
	      cylinder(d=(espesor*2)+diamShaft+tol,h=altura);
	   
		  cylinder(d=diamShaft+tol,h=altura*4,center=true);
	      
	   }
   }
      
  module piezaPilares(){        
      
difference(){
    
    translate([-15+8,-15+8,-4])
    minkowski(){
         cube([100+30-16,30-16,8]);
       // cube([30-16,30-16,17],center=true);
        cylinder(r=8,h=0.01,center=true);
    }
       
    
    //perforaciOn tornillo 
   union(){ 
       translate([0,0,-50])
        cylinder(d=8,h=100,center=true);
        cylinder(d=14,h=50);
   }
   
  
   //perforaciOn Balero
   translate([100,0,-4.01+2])
   cylinder(d=22.5,h=20);
   
      //perforaciOn Balero
   translate([100,0,0])
   cylinder(d=9,h=100,center=true);
   
     //perforaciOn pija 1
   translate([100,0,0])
   rotate(45)
   translate([11.25+3,0,0])
   cylinder(d=2.5,h=100,center=true);
   
      //perforaciOn pija 2
   translate([100,0,0])
   rotate(45+180)
   translate([11.25+3,0,0])
   cylinder(d=2.5,h=100,center=true);
  
   
   //ahgujero amortiguador 1
   translate([36,0,0])
   for(i=[0:1]){
       translate([29*i,0,0])
      cube([10.5,400,400],center=true);
   } 
}
       
     translate([0,0,-4-9])
     for(i=[0:3]){
         rotate(90*i)
         translate([0,-15])
         //import("CanalPerfil30x30V2.dxf");
         translate([-4,0,0])
         cube([8,9,9]);
     }   



   translate([26,-28,-4])
   //for(i=[0:1]){
      // translate([29*i,0,0])
       linear_extrude(height=8)
       text("U",size=20);  
       
   //}
     
     
     mirror([0,1,0]){
            //for(i=[0:1]){
                 translate([29*1,0,0])
           translate([26,-28,-4])
       linear_extrude(height=8)
       text("U",size=20);  
           // }
     }
 }//fin modulo  


module tapa(){
        
    difference(){
        
       union(){
          cylinder(d=25,h=6,center=true);
          rotate(45)
          minkowski(){
              
              cube([30,0.01,0.01],center=true);
              cylinder(d=6,h=2);
          } 
       }
           //perforaciOn Balero
       //translate([100,0,-4.01+2])
       cylinder(d=22.5,h=4,center=true);


       //corte para mitad
        translate([0,0,-200])    
        cube([400,400,400],center=true);
       
          //perforaciOn pija 1
       rotate(45)
       translate([11.25+3,0,0])
       cylinder(d=3,h=100,center=true);
       
          //perforaciOn pija 2
       rotate(45+180)
       translate([11.25+3,0,0])
       cylinder(d=3,h=100,center=true);
      
             //perforaciOn Balero
   cylinder(d=9,h=100,center=true);
       
       
    } 
     
}
 

$fn=100;




piezaPilares(); 

//translate([100,0,4])
//tapa();


