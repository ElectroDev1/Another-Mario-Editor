//Spring logic
var col = collision_rectangle(bbox_left,bbox_top-4,bbox_right,bbox_top+1,obj_physicsparent,0,1);



if(col){

  if(col!=id){
  
   if(col.Vsp>=0){col.y=bbox_top-col.sprite_yoffset+4*image_index+1;}

   if(col.bbox_bottom>=bbox_top-col.Vsp/2-2)&&(col.bbox_bottom<bbox_top+5)&&(image_index==0)&&(col.Vsp>=0){
   
      image_speed=0.2;
      col.Vsp = 0;
       
   }
   
   if(image_index>3){
      
      
      if(object_is_ancestor(col.object_index,obj_playerparent)
      ||(col.object_index==obj_playerparent)){
         if(scr_input_check(input.action0)){ col.Vsp=springforce-2; }else{col.Vsp=springforce;}
      }
      else{
         col.Vsp=springforce;
      } 
      
      image_speed=0;
      image_index=0;
      col=-4;
   }
   
  }

}else{ image_index=0; image_speed=0; }

event_inherited();

