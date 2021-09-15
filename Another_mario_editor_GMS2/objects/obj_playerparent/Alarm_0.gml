alarm[0]=5;

if(sign(Dir)!=0){ var IX=sign(Dir); }else{ var IX=1; }

if(shaX!=x || shaY!=y){
   with(instance_create(x,y,obj_mario_shadow)){
        sprite_index=other.sprite_index;
        image_index=other.image_index;
        image_xscale=other.image_xscale*IX;
        index=other.shaID;
   }
   
   shaID++;

   if(shaID>=60){
      instance_activate_object(obj_mario_shadow);
      with(obj_mario_shadow){ if(index==0){instance_destroy();}else{index--;} }

   }

   instance_deactivate_object(obj_mario_shadow);
   
   
} 

shaX=x;
shaY=y; 



