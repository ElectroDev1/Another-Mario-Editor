var player = collision_rectangle(bbox_left,bbox_bottom-4,bbox_right,bbox_bottom+6,obj_playerparent,0,0);

if(player)&&(offsetT<=0)&&(state==0){

   if((player.state==Playerstate.jump)||(scr_input_check_pressed(input.action0)))
   &&(player.bbox_right>bbox_left || player.bbox_left<bbox_right)
   /*&&(collision_rectangle(bbox_left-2,bbox_bottom-4,bbox_right+2,bbox_bottom-player.Vsp+3,obj_playerparent,0,0))*/{
      
      event_user(0);
   
   }

}

offset=scr_approach(offset,offsetT,1);

if(global.switchstate){
   sprite_index=spr_onoff_switch_off;
}
else{ sprite_index=spr_onoff_switch_on; }

/* */
/*  */
