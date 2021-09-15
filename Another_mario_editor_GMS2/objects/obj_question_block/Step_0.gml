var player = collision_rectangle(bbox_left,bbox_bottom-4,bbox_right,bbox_bottom+6,obj_playerparent,0,0);

if(player)&&(state==0){

   if((player.state==Playerstate.jump)||(scr_input_check_pressed(input.action0)))
   
   &&(collision_rectangle(bbox_left-2,bbox_bottom-4,bbox_right+2,bbox_bottom-player.Vsp+3,obj_playerparent,0,0)){
      
      event_user(0);
   
   }

}

offset=scr_approach(offset,offsetT,1);

if(offset>=0)&&(state==2){
   
   sprite_index=spr_block_gone;
   state=3;

}

