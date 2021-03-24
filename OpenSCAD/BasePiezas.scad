/*
     -/+oooo+:.     
  `/syo/:::/+syo-   
 `sy+.     ```-sy/  
 +y+      +::+`-yy- 
 sy-      +-:o:-oy/ 
 sy-       ``   +y/ 
 sy-            /y/ 
 sy-            /y/ 
 sy.            /y/ 
 sy/............oy/ 
 sysoooooooooooosy/ 
`sy/............oy+ 
syyyssssssssssssyyy/
/++++oys++++yy+++++-
     /y+    yy.     
     /y+    yy.     
     `-`    ss` 
    
     IDEA 1.61        
*/


//modulos para el renderizado de varios tipos de caja a manufacturear en la máquina de corte lAser

//Largo se desplaza en "X"
//Ancho se desplaza en "Y"

module base(largo=80,ancho=80,espesor=3,dientes=20,Up=1,Down=1,Left=1,Right=1){
tamDientesLargo=(largo)/dientes;
tamDientesAncho=(ancho)/dientes;


union(){

//Dientes derecha
  if(Right==1){
    translate([largo/2,-ancho/2-tamDientesAncho/2])
    for(i=[1:dientes/2]){
       translate([0,tamDientesAncho*2*i])
       square([2*espesor,tamDientesAncho],center=true);
    }
}

//Dientes Izquierda

if(Left==1){
   translate([-largo/2,-ancho/2-3*tamDientesAncho/2])
   for(i=[1:dientes/2]){
      translate([0,tamDientesAncho*2*i])
      square([2*espesor,tamDientesAncho],center=true);
   }
}

//Dientes Arriba

if(Up==1){
   translate([-largo/2-3*tamDientesLargo/2,ancho/2])
   for(i=[1:dientes/2]){
     translate([tamDientesLargo*2*i,0])
     square([tamDientesLargo,2*espesor],center=true);
   }
}

//Dientes Abajo

if(Down==1){
   translate([-largo/2-tamDientesLargo/2,-ancho/2])
    for(i=[1:dientes/2]){
     translate([tamDientesLargo*2*i,0])
     square([tamDientesLargo,2*espesor],center=true);
    }
}

//Cuadrado
square([largo,ancho],center=true);
}

}//Fin module base


//#####CAJA SIN O CON TAPA####//

module cajaSCTapa (largo=40,ancho=30,alto=40,espesor=3,dientes=6,modo=1,
  tolBisagras=2.2){

//base
        
    if(modo==2){
    base(largo,ancho,espesor,dientes,1,1,0,0);
        }
       else{
        base(largo,ancho,espesor,dientes,1,1,1,1);
           }
    
//Tapa
    
 if(modo==1){
    translate([((largo)+(2.5*espesor)),0])
    square([largo,ancho],center=true);
    
    translate([((largo)+(2.5*espesor)),-ancho/2+(1.5*espesor)])
    square([largo+2*espesor,espesor],center=true);
  
     translate([((largo)+(2.5*espesor)),+ancho/2])
    square([2*espesor,2*espesor],center=true);
 
     //}

//lados largo
 
 //if(modo==1){
 
    translate([0,(ancho+alto)/2+(2.5*espesor)])
   difference(){
       for(i=[0:1]){
          translate([((i*largo)+(i*2.5*  espesor)),0])
           difference(){
          base(largo,alto,espesor,dientes,0,  1,1,1);
               translate([0,(alto)/2])
           square([i*2*espesor,i*2*espesor],center=true);
            }
       }
       
       
     translate([0,alto])
    square([2*espesor,2*espesor],center=true);
   }
   
   //lados alto
  
      //reinicio
    translate([0,-ancho-(2.5*espesor)])
 difference(){
  union(){
   for(i=[0:1]){
      translate([((i*alto)+(i*2.5*espesor)),0])
     base(alto,ancho,espesor,dientes,1,1,0,1);
   }
   //circulos orillas (Material)
   
   translate([-((alto-espesor)/2),(ancho/2)-(1.5*espesor)])
   circle($fn=100,r=2*(espesor/2+0.5));
   
   translate([-(((alto-espesor)/2))+alto+(2.5*espesor),-(ancho/2)+(1.5*espesor)])
   circle($fn=100,r=2*(espesor/2+0.5));
   
  }
  
  //taladros bisagras
  
  
   translate([-(((alto-espesor)/2)),(ancho/2)-(1.5*espesor)])
   circle($fn=100,r=(espesor/2+0.5)-tolBisagras);
  
  translate([-(((alto-espesor)/2))+alto+(2.5*espesor),-(ancho/2)+(1.5*espesor)])
   circle($fn=100,r=(espesor/2+0.5)-tolBisagras);


 
  }
  
 
   
 }//fin modo 1
 
 
 if(modo==2){
      translate([0,(ancho+alto)/2+(2.5*espesor)])
   for(i=[0:1]){
      translate([((i*largo)+(i*2.5*  espesor)),0])
      base(largo,alto,espesor,dientes,0,  1,0,0);   
   }
 
 } 
 
 /*else{
     
 translate([0,(ancho+alto)/2+(2.5*espesor)])
   for(i=[0:1]){
      translate([((i*largo)+(i*2.5*  espesor)),0])
       
      base(largo,alto,espesor,dientes,0,  1,1,1);
        
   }
 
  }*/




 if(modo==2){
 //no hay reinicio
 //No dibujar nada en modo 2
 }
 
 if(modo==0){
   //reinicio
   translate([0,-ancho-(2.5*espesor)])
     for(i=[0:1]){
      translate([((i*alto)+(i*2.5*espesor)),0])
     base(alto,ancho,espesor,dientes,1,1,0,1);
   }
 }
  
  
}//Fin module cajaSCTapa

//####RENDERIZADOS#####//

//$1000 pino o MDF 1.22x2.44mm

module Armado(){
    //lonTotXm=2072.2mm;
    //lonProfunidadCyan=440mm;
    //alto 1240
    espesor=9;

    lonX=2072.2-(2*espesor);
    lonY=440-(2*espesor);
    lonZ=1240-(2*espesor);


    //base
    color("cyan",alpha=0.5)
    linear_extrude(height=6)
    base(lonX,lonY,espesor,10,0,1,1,1);

    //pared mayor (refuerzo)
    color("green",alpha=0.5)
    translate([0,-espesor,(lonZ/2)+espesor])
    rotate([90,0,0])
    linear_extrude(height=6)
    base(lonX,lonZ,espesor,10,1,1,1,1);

    //pared mayor 2
    color("green",alpha=0.5)
    translate([0,-(lonY/2)-espesor,(lonZ/2)+espesor])
    rotate([90,0,180])
    linear_extrude(height=6)
    base(lonX,lonZ,espesor,10,1,1,1,1);

    //pared menor 1
    color("orange",alpha=0.5)
    translate([-(lonX/2)-espesor,0,(lonZ/2)+espesor])
    rotate([90,0,90])
    linear_extrude(height=6)
    base(lonY,lonZ,espesor,10,1,1,1,0);

    //pared menor 2
    color("orange",alpha=0.5)
    translate([(lonX/2)+espesor,0,(lonZ/2)+espesor])
    rotate([270,0,90])
    linear_extrude(height=6)
    base(lonY,lonZ,espesor,10,1,1,1,0);

    //tapa 
    color("cyan",alpha=0.5)
    translate([0,0,lonZ+(espesor*2)])
    rotate([180,0,0])
    linear_extrude(height=6)
    difference(){
       base(lonX,lonY,espesor,10,1,0,1,1);
        translate([0,-500])
       square([4000,1000],center=true);
    }

}


 Armado();


//linear_extrude(height=3)
//cajaSCTapa(largo=110,ancho=80,alto=50,espesor=6,dientes=4,modo=0,tolBisagras=0);

