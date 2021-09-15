if(keyboard_check_pressed(vk_enter)){
   fullscreen=!fullscreen;
   event_user(0);
}

for(var a=0; a<=5; a++){
   if(keyboard_check_pressed(ord(string(a)))){
      Window_S=a-1;
      event_user(0);
   }
}

if(keyboard_check_pressed(vk_f5)){
   game_end();
}

if(keyboard_check_pressed(ord("R"))){
   game_restart();
}

