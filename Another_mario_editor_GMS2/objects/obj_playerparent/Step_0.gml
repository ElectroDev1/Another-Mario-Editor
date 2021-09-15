/// @description Player logic

mask_index=spr_mario_idle;

if(Control){
   key_left = scr_input_check(input.left);
   key_right = scr_input_check(input.right);
   key_jump = scr_input_check_pressed(input.action0);
}

//Move
if(controlmode){

  if(crouch){ if(!onfloor){ INP = (key_right-key_left)/2; } }else{
     INP = key_right-key_left;
  }
  
  
  var T=scr_input_check_pressed(input.right) - scr_input_check_pressed(input.left)
  
  if(T!=0)&&(spd==0){
     if(Dir!=T){ Dir=T; }
  }

if(INP!=0){  Dir=scr_approach(Dir,sign(INP),0.25);;}

}else{
INP = Dir;
}





if(onfloor)
||(collision_line(x-2,bbox_bottom-16,x+2,bbox_bottom+10+Vsp,obj_slopeparent,0,0))
{ cayote=cayote_max; }else{
   if(cayote>0){ cayote-=0.25; }
}


if(onfloor){runjump=0; spinjump=0;}


//Jump
if(key_jump){

   if(cayote>0)&&(state!=Playerstate.jump)&&(!collision_rectangle(bbox_left,bbox_top-2,bbox_right,bbox_top+2,obj_solid,0,0)){
   
     if(!scr_input_check(input.up)){
      Vsp=-jumpforce;      
      if(spd>3.5){runjump=1;}
     }
     else{
     
       Vsp-=spinforce;
       spinjump=1;
     
     }
      
      cayote=0;
   
   }

}



run=scr_input_check(input.action1);

if(crouch){ if(!onfloor){ spd=walk_spd*abs(INP);   }else{spd=scr_approach(spd,0,0.25);} 

}else{
 spd=scr_approach(spd, (walk_spd* ((0.5*run)+1) ) *abs(INP), 0.25);; 
}

event_inherited();

if(y>=room_height+40){ 
   with(obj_editor_controller){
        event_perform(ev_keypress, vk_enter);
   }
}





///State machine
if(state!=Playerstate.death){

 if(onfloor)
 ||
 (collision_line(x-2,bbox_bottom-16,x+2,bbox_bottom+10+Vsp,obj_slopeparent,0,0)
 ){

   if(hspeed==0){
   
      state=Playerstate.idle;
   
   }else{
   
      if(INP!=0){
      
         state=Playerstate.walk;
      
      }
   
   }
   
   if(scr_input_check(input.down)){ crouch=1; }
   
   
 }else{

   if(Vsp<0){
   
      state=Playerstate.jump;
   
   }else if(Vsp>0){
   
      state=Playerstate.fall;
   
   }else{ state=Playerstate.idle; }

 }
 
}


if(scr_input_check_released(input.down)){ crouch=0; }

///Animation logic
if(!animate){exit;}

if(!crouch){

 switch(state){

       case Playerstate.idle : 
         if(scr_input_check(input.up)){sprite_index=spr_mario_up;}else{sprite_index=spr_mario_idle;} break;
       case Playerstate.walk :
       
         if(sign(Dir)!=INP)&&(key_right || key_left){ sprite_index=spr_mario_skid; }else{
       
          if(!run){ sprite_index=spr_mario_walk; }else{ sprite_index=spr_mario_run; }
        
        }
        
         
           image_speed=.5; break;
           
           
       case Playerstate.fall :  if(spinjump){ sprite_index=spr_mario_spinjump;  }else{  if(runjump){sprite_index=spr_mario_jumprun;}else{sprite_index=spr_mario_fall;} }   break;
       
       case Playerstate.jump :  if(spinjump){ sprite_index=spr_mario_spinjump;  }else{  if(runjump){sprite_index=spr_mario_jumprun;}else{sprite_index=spr_mario_jump;} } break;
 
 }
 
 
}
else{

   sprite_index=spr_mario_crouch;

}

