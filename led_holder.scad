//////////////////////////////////////////
// LED array Holder for Thor Labs cage  //
// original design by Filip Janiak      //
// optimisation by Andre M Chagas       //
// CC-BY-SA 4.0 13/06/2025              //
//////////////////////////////////////////




/// PARAMETERS FOR THE CUSTOMIZER ///

L_r = 12.6; // Lens Width was 15.5
S_r = 2; // Holding Screw Width (Defined here for M4 Bolts)

//Lens Support Dimension
L_x = 41;
L_y = 41;
L_z = 5;


////////////////////////////////////////////////////////////////////////

R1=22;//15+2; //external size
R2=5.8/2; //LED size
R22=(9.1/2)+0.2;  // TO-39 LED size
R3=0.6;  //LED leg size //was 0.5

h1=2; //led depth
h2=L_z; //led legs depth

Sh=2.8/2; //shift between LED legs
Sh2=5.08/2; //shift between LED legs TO-39 LED size

//parameter to make holes slightly large then the parts
//that are going to sit in them (needs to be adapted based on the
//printer.
tolerance = 0.1;

//how many "sides" each cylinder has
$fn=60;

module large_led_2pins(){
    
    cylinder (r=R22+tolerance, h=h1+tolerance);
    translate([+Sh2,0,0]){cylinder ( r=R3, h=21);}
    translate([-Sh2,0,0]){cylinder ( r=R3, h=21);}
    
    }


module large_led_3pins(){
    cylinder (r=R22+tolerance, h=h1+tolerance);
    color("green"){
    translate([+Sh2,0,0]){cylinder ( r=R3+tolerance, h=21);}}
    color("red"){
    translate([-Sh2,0,0]){cylinder ( r=R3+tolerance, h=21);}}
    translate([0,+Sh2,0]){cylinder ( r=R3+tolerance, h=21);}



}//end large_led_3pins

module small_led(){
    cylinder ( r=R2+tolerance, h=h1);
    translate([0+Sh,0,0]){cylinder ( r=R3, h=21);}
    translate([0-Sh,0,0]){cylinder ( r=R3, h=21);}
    
    }

module Base_pos(){
    cylinder ( r=R1, h=L_z);
   //cube ([L_x,L_y,L_z], center=true); 
    translate([R1-1,-15,0]) cube ([10,30,5]); //fkj do mocowania 
    translate([R1-1,-15,0]) {rotate ([0,90,0])cube ([10,30,10]);} //fkj do mocowania
      

}
module Base_neg(){
    
    translate([R1-2,0,-5]){rotate ([0,90,0])cylinder ($fn=100, r=3.325, h=30);} //na srube
    translate([R1-2,0,-5]){rotate ([0,90,0])cylinder ($fn=100, r=6, h=8);} //na srobe
    
   // translate([0,0,0]){cylinder ( r=R2, h=h1);}
   // translate([0+Sh,0,0]){cylinder ( r=R3, h=21);}
   // translate([0-Sh,0,0]){cylinder ( r=R3, h=21);}
    
    translate([0-1.7*R22+0.4,0,-0.1]){large_led_2pins();} // lens 3
    
    translate([0-1.7*R22+0.4,-(3*R22)+1.8,-0.1]){large_led_2pins();}//lens 8
    
    
 
    translate([0-1.7*R22+0.4,-(-(3*R22)+1.8),-0.1]){large_led_2pins();}//lens 2
    
    translate([-((5*R2)+0.4),((2*R2)+0.4),-0.10]){large_led_3pins();} // lens 1
    
 
    translate([-((5*R2)+0.4),-((2*R2)+0.4),-0.10]){large_led_3pins();} // lens 9
    
    color("red"){
        translate([0,0,-0.1]){
    small_led();
        }
    }
    
    //for (x = [0:(2*R2)+0.4:(5*R2)+0.4]){
        
    for (y = [2*(-R22-1.6)-0:(R22+1.55):2*(R22+1.6)]){
        translate([0,y,-0.1]){
            color("blue"){
            small_led();
                }
                }
      //  }
    }
    translate([0,-R22-1.6,0]){cylinder ( r=R2, h=h1);} // lens 7
    translate([0+Sh,-R22-1.6,0]){cylinder ( r=R3, h=21);}
    translate([0-Sh,-R22-1.6,0]){cylinder ( r=R3, h=21);}
    
    translate([0,2*(-R22-1.6),0]){cylinder ( r=R2, h=h1);}  // lens 10
    translate([0+Sh,2*(-R22-1.6),0]){cylinder ( r=R3, h=21);}
    translate([0-Sh,2*(-R22-1.6),0]){cylinder ( r=R3, h=21);}
    
    translate([0,R22+1.6,0]){cylinder ( r=R2, h=h1);}  // lens 5
    translate([0+Sh,R22+1.6,0]){cylinder ( r=R3, h=21);}
    translate([0-Sh,R22+1.6,0]){cylinder ( r=R3, h=21);}
    
    translate([0,2*(R22+1.6),0]){cylinder ( r=R2+0.1, h=h1);}  // lens 4
    translate([0+Sh,2*(R22+1.6),0]){cylinder ( r=R3, h=21);}
    translate([0-Sh,2*(R22+1.6),0]){cylinder ( r=R3, h=21);}
    
   translate([(2*R2)+0.4,0,0]){cylinder ( r=R2+0.1, h=h1);}  //lens 6
    translate([+Sh+(2*R2)+0.4,0,0]){cylinder ( r=R3, h=21);}
    translate([0-Sh+(2*R2)+0.4,0,0]){cylinder ( r=R3, h=21);}
    
    translate([(2*R2)+0.4,((2*R2)+0.4),0]){cylinder ( r=R2, h=h1);}  // lens 12
    translate([+Sh+(2*R2)+0.4,((2*R2)+0.4),0]){cylinder ( r=R3, h=21);}
    translate([0-Sh+(2*R2)+0.4,((2*R2)+0.4),0]){cylinder ( r=R3, h=21);}
    
    translate([(2*R2)+0.4,2*((2*R2)+0.4),0]){cylinder ( r=R2, h=h1);}  // lens 11
    translate([+Sh+(2*R2)+0.4,2*((2*R2)+0.4),0]){cylinder ( r=R3, h=21);}
    translate([0-Sh+(2*R2)+0.4,2*((2*R2)+0.4),0]){cylinder ( r=R3, h=21);}
    
    %translate([(2*R2)+0.4,-((2*R2)+0.4),0]){cylinder ( r=R2, h=h1);}  // lens 14
    translate([+Sh+(2*R2)+0.4,-((2*R2)+0.4),0]){cylinder ( r=R3, h=21);}
    translate([0-Sh+(2*R2)+0.4,-((2*R2)+0.4),0]){cylinder ( r=R3, h=21);}
    
    %translate([(2*R2)+0.4,-2*((2*R2)+0.4),0]){cylinder ( r=R2+0.1, h=h1);}  // lens 15
    translate([+Sh+(2*R2)+0.4,-2*((2*R2)+0.4),0]){cylinder ( r=R3, h=21);}
    translate([0-Sh+(2*R2)+0.4,-2*((2*R2)+0.4),0]){cylinder ( r=R3, h=21);}
    
    translate([(4*R2)+0.8,0,0]){cylinder ( r=R2+0.1, h=h1);}  // lens 18
    translate([(4*R2)+0.8+Sh,0,0]){cylinder ( r=R3, h=21);}
    translate([(4*R2)+0.8-Sh,0,0]){cylinder ( r=R3, h=21);}
    
    translate([(4*R2)+0.8,((2*R2)+0.4),0]){cylinder ( r=R2, h=h1);}  // lens 17
    translate([(4*R2)+0.8+Sh,((2*R2)+0.4),0]){cylinder ( r=R3, h=21);}
    translate([(4*R2)+0.8-Sh,((2*R2)+0.4),0]){cylinder ( r=R3, h=21);}
    
    translate([(4*R2)+0.8,2*((2*R2)+0.4),0]){cylinder ( r=R2, h=h1);}  // lens 16
    translate([(4*R2)+0.8+Sh,2*((2*R2)+0.4),0]){cylinder ( r=R3, h=21);}
    translate([(4*R2)+0.8-Sh,2*((2*R2)+0.4),0]){cylinder ( r=R3, h=21);}
    
    translate([(4*R2)+0.8,-((2*R2)+0.4),0]){cylinder ( r=R2, h=h1);}  // lens 19
    translate([(4*R2)+0.8+Sh,-((2*R2)+0.4),0]){cylinder ( r=R3, h=21);}
    translate([(4*R2)+0.8-Sh,-((2*R2)+0.4),0]){cylinder ( r=R3, h=21);}
    
    translate([(4*R2)+0.8,-2*((2*R2)+0.4),0]){cylinder ( r=R2, h=h1);}  // lens 20
    translate([(4*R2)+0.8+Sh,-2*((2*R2)+0.4),0]){cylinder ( r=R3, h=21);}
    translate([(4*R2)+0.8-Sh,-2*((2*R2)+0.4),0]){cylinder ( r=R3, h=21);}
    
    

    
 

}


difference() {
    Base_pos();
    Base_neg();
}

//large_led_3pins();


    
   