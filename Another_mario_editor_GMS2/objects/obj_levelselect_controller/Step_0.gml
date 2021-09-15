obj_controller.idling=0;

global.state="Selecting a level";
global.details="";
global.icon="rpc_level_select";

offset=lerp(offset,offset_T,0.5);

if(max_level_numb<global.level_numb){max_level_numb=global.level_numb; global.levelsprite[max_level_numb+1]=-4;}





if(control){

if(onpage_index==-1){

//Move through the menu
if(keyboard_check_pressed(vk_up)){
   goinput=0;
   if(buttonpos>3){
      buttonpos-=4;
      if(buttonpos>7){
      if(checkY==0){offset_T+=55; checkY=0;}else{checkY--;}
      }else{
      if(checkY==0){offset_T=0; checkY=0;}else{checkY--;}
      }
   }
}

if(keyboard_check_pressed(vk_down)){
   goinput=0;
   if(buttonpos<max_level_numb-4){
      buttonpos+=4;
      if(checkY==2){offset_T-=55; checkY=2;}else{checkY++;}
   }
   
}

if(keyboard_check_pressed(vk_right)){
   goinput=0;
   if(checkX<3){checkX++; buttonpos++;}
}

if(keyboard_check_pressed(vk_left)){
   goinput=0;
   if(checkX>0){checkX--; buttonpos--;}
}

if(goinput<20){goinput++;}else{
   
if(keyboard_check(vk_up)){
   goinput=10;
   if(buttonpos>3){
      buttonpos-=4;
      if(buttonpos>7){
      if(checkY==0){offset_T+=55; checkY=0;}else{checkY--;}
      }else{
      if(checkY==0){offset_T=0; checkY=0;}else{checkY--;}
      }
   }
}

if(keyboard_check(vk_down)){
   goinput=10;
   if(buttonpos<max_level_numb-4){
      buttonpos+=4;
      if(checkY==2){offset_T-=55; checkY=2;}else{checkY++;}
   }
   
}

if(keyboard_check(vk_right)){
   goinput=10;
   if(checkX<3){checkX++; buttonpos++;}
}

if(keyboard_check(vk_left)){
   goinput=10;
   if(checkX>0){checkX--; buttonpos--;}
}

}

//Select a level
if(keyboard_check_pressed(vk_space)&&(onpage_index==-1)){
   
   if(buttonpos<global.level_numb){
   
   /*global.level_filename=global.levelname[buttonpos];
   global.new_filename=string_delete(global.level_filename,string_length(global.level_filename)-3,4);
   room_goto(rm_editor);*/
   pagepos=0;
   onpage_index=buttonpos;
   event_user(0);
   
   }else{
     /*room_goto(rm_editor);
     global.level_filename="";*/
     pagepos=0;
     onpage_index=-2;
   }
   goinput=0;
   
   
}

}else{
 
 /*if(keyboard_check_pressed(vk_right)||keyboard_check_pressed(vk_left)){
    pagepos=!pagepos;
    goinput=0;
 }
 
 if(goinput<20){goinput++;}else{
    if(keyboard_check(vk_right)||keyboard_check(vk_left)){
    goinput=10;
    pagepos=!pagepos;
    goinput=0;
    }
 }*/

}

}

/* */
/*  */
