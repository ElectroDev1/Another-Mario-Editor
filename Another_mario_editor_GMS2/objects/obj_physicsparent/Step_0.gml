
//Vertical
if(Vsp<maxVsp){Vsp+=grav;}else{Vsp=maxVsp;}

grav=grav_O;
hspeed=spd*Dir;

onfloor=0;

var Semi=collision_rectangle(bbox_left,bbox_bottom-2,bbox_right,bbox_bottom+1+Vsp,obj_semisolid,1,0);

if(Vsp>=0){

    if(Semi){
    
        if(bbox_bottom<Semi.y+2){
           
           y=Semi.bbox_top-sprite_yoffset
           Vsp=0;
           event_user(0);
           grav=0;
           onfloor=1;
        
        }
    
    }

}



Slopesensor=collision_line(x-2,bbox_bottom-16,x+2,bbox_bottom+2+Vsp,obj_slopeparent,0,0);

if(Slopesensor){ 

   if(Vsp>=0){
        onfloor=1;     
           
           
           //Stop vertical speed      
           Vsp=0;
           grav=0;
           onfloor=1;
           with(Slopesensor){
             scr_slope_calculatepos();
           }
           
           
           //Angle
           /*if(Slopesensor.object_index==obj_slope_sl)||(Slopesensor.object_index==obj_slope_sr){
              Angle=45*-Slopesensor.Dir;
           }
        
           if(Slopesensor.object_index==obj_slope_l)||(Slopesensor.object_index==obj_slope_r){
              Angle=45/2*-Slopesensor.Dir;
           }*/
        
        
        while(!collision_rectangle(x-4,y-16,x+4,bbox_bottom-4/*y+6.8+6*/,obj_slopeparent,1,0)){
           y++;
        }
       
        
   
   }
}




//Horizontal collision
SOLIDL=collision_rectangle(bbox_left,bbox_top+1,bbox_left,bbox_bottom-1,obj_solid,1,0);
SOLIDR=collision_rectangle(bbox_right,bbox_top+1,bbox_right,bbox_bottom-1,obj_solid,1,0);

SOLIDL_V=collision_rectangle(bbox_left+hspeed-1,bbox_top+1,bbox_left,bbox_bottom-1,obj_solid,1,0);
SOLIDR_V=collision_rectangle(bbox_right,bbox_top+1,bbox_right+hspeed+1,bbox_bottom-1,obj_solid,1,0);

//Right
if(SOLIDR_V){

   if(hspeed>=0)&&(!SOLIDR){
      
      //event_user(2);
      hspeed=0;
      spd=0;
      x=SOLIDR_V.bbox_left-(bbox_right-x)-1;
      event_user(0);
   }

}


if(SOLIDR){

   if(hspeed>=0){
      //event_user(2);
      hspeed=0;
      spd=0;
           
  }

  while(collision_rectangle(bbox_right-2,bbox_top+8,bbox_right-1,bbox_bottom-8,obj_solid,true,false))
       &&(!collision_point(x,bbox_top+1,obj_solid,true,false)){
        x--;
  }
  
}


//Left
if(SOLIDL_V){

   if(hspeed<=0)&&(!SOLIDL){
      
      //event_user(2);
      hspeed=0;
      spd=0;
      x=SOLIDL_V.bbox_right+(x-bbox_left)+1;
      event_user(0);
      
   }

}


if(SOLIDL){

   if(hspeed<=0){
      //event_user(2);
      hspeed=0;
      spd=0;
           
  }

  while(collision_rectangle(bbox_left+1,bbox_top+8,bbox_left+2,bbox_bottom-8,obj_solid,true,false))
       &&(!collision_point(x,bbox_top+1,obj_solid,true,false)){
        x++;
  }
  
}


//Top collision
var SOLIDU=collision_rectangle(bbox_left,bbox_top-1,bbox_right,bbox_top+1,obj_solid,1,0);
var SOLIDU_V=collision_rectangle(bbox_left,bbox_top+Vsp-1,bbox_right,bbox_top+1,obj_solid,1,0);

if(SOLIDU_V){

   if(Vsp<=0)&&(!SOLIDU){
      
      Vsp=0;
      y=SOLIDU_V.bbox_bottom+(y-bbox_top)+1;
   
   }

}


if(SOLIDU){

   if(Vsp<=0){
      
      Vsp=0;
      y=SOLIDU_V.bbox_bottom+(y-bbox_top)+1;
           
  }

  /*while(collision_rectangle(bbox_right,bbox_top-1,bbox_right+1,bbox_top+3,obj_solid,true,false)){
        y++;
  }*/
  
}


/*if(Vsp<0){

   while(collision_rectangle(bbox_left-4,bbox_top,bbox_left+1,bbox_bottom-1,obj_solid,1,0)){
         x++;
   }
   
   while(collision_rectangle(bbox_right-1,bbox_top,bbox_right+4,bbox_bottom-1,obj_solid,1,0)){
         x--;
   }

}*/



if(Vsp<0){
   //Top collision
   if(collision_rectangle(bbox_left+1,bbox_top-4,bbox_right-1,bbox_top+1,obj_solid,true,false)){
      Vsp=0;
      grav=0;      
   }

}

y+=Vsp;



/* */
/*  */
