use<BasePiezas.scad>;

//relacion de TV encontrada 1.72
//Meiddas de Tv actual 124cm x 72 cm
//apoyos patas 6cm
//hiptenusa actual de 143.38
//hipotenusa futura 143.38+50cm=193.38cm
//begin{equation}
//50^2=(1.72x)^2+x^2
//enb{equation}
//despejando x
//x es 25.1310
//usando x tenemos que
//ancho TV nueva MAX = 167.22
//altura TV nueva MAX = 97.13
//mas 6 cm de apoyos patas queda de 103.13
//medidas anteriores mueble blanco es de 
//X:161cm, Y:34cm, Z=124cm



module TeleNueva(){
    anTVnv=167.22;
    altTVnv=97.13;
    cvmmcm=10;

    espRail=200;

    //television Nueva
    //translate([espRail,espCal+50,270])
    //translate([espRail,230,270+(altTVnv*cvmmcm)])
    //color("gray")
    union(){
        translate([0,0,60])
        cube([anTVnv*cvmmcm,30,altTVnv*cvmmcm]);
        translate([(anTVnv*cvmmcm)/2,110,(altTVnv*cvmmcm)/2])
        cube([220,220,220],center=true);
        translate([30,-120,0])
        cube([20,240,60]);
        
         translate([(anTVnv*cvmmcm)-50,-120,0])
        cube([20,240,60]);
    }

}

module Calentador(){
    espCal=170;
    //calentador
    color("red")
    translate([lonTotXm/2,espCal/2,250])
    //calentador todo pie
    //cube([560,270,500],center=true);
    //placa hacia atras 17cm
    cube([560,espCal,500],center=true);

    lonTotXm=(anTVnv*cvmmcm)+(2*espRail);
    lonTotY=220+espCal+50;
    //echo(lonTotY);
    
}

//#############RENDERIZADOS###############

//motorNEMA17();

TeleNueva();

Calentador();

//lonTotXm=2072.2mm;
//lonProfunidadCyan=440mm;
//alto 1240
//echo(lonTotXm);
//color("cyan",alpha=0.5)
//mueble original
//cube([1600+(2*espRail),400,1240]);
/*difference(){

    cube([lonTotXm,lonTotY,1240]);
    translate([lonTotXm/2,-100,250])
   cube([660,270*2,600],center=true);
}*/


//color("cyan",alpha=0.5)
//    linear_extrude(height=6)

/*
espesor=6;
altura=35;
largoP=1990;
//square([2030,440],center=true);
    linear_extrude(height=espesor)
    base(largoP-(2*espesor),440-(2*espesor),espesor,8,1,1,1,1);
    
    //lado frente 1
    translate([0,-(440/2)+espesor,-altura/2])
    rotate([-90,0,180])
    linear_extrude(height=espesor)
    base(largoP-(2*espesor),altura,espesor,8,0,1,1,1);
    
    //lado frente 2
    translate([0,-80,-altura/2])
    rotate([-90,0,180])
    linear_extrude(height=espesor)
    base(largoP-(2*espesor),altura,espesor,8,0,1,1,1);
    
    //lado atrAs 1
    translate([0,(440/2)-espesor,-altura/2])
    rotate([-90,0,0])
    linear_extrude(height=espesor)
    base(largoP-(2*espesor),altura,espesor,8,0,1,1,1);
    
    //lado atrAs 2
    translate([0,80,-altura/2])
    rotate([-90,0,0])
    linear_extrude(height=espesor)
    base(largoP-(2*espesor),altura,espesor,8,0,1,1,1);
    
    //lado derecha
     translate([(largoP/2)-espesor,0,-altura/2])
    rotate([-90,0,270])
    linear_extrude(height=espesor)
    base(440-(2*espesor),altura,espesor,8,0,1,1,1);
    
     //lado derecha
     translate([-(largoP/2)+espesor,0,-altura/2])
    rotate([-90,0,90])
    linear_extrude(height=espesor)
    base(440-(2*espesor),altura,espesor,8,0,1,1,1);
    
    


 */
 //translate([lonTotXm/2,lonTotY/2,0])
 //Armado();
 
//polygon([[-10,0],[10,0],[0,5]]);

// $320 MDF 6mm  corte pasado(cajas) $1600

// $200 1.22x244 MDF 3mm (considerar