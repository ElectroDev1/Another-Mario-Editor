
//Closing menu
draw_set_font(fnt_mario);
switch(global.closing){

  case 1:

   var T = scr_draw_message(display_get_gui_width(),display_get_gui_height(),
   "The level wasn't saved!#Would you like to save?","Save","Don't save","Cancel");
   
   switch(T){
    
       case 1: with(obj_editor_controller){event_user(0);} game_end(); break;
       
       
       case 2: game_end(); break;
       case 3: global.closing=0; break;
   
   }

  break;
  
  case 2:

    if(!obj_editor_controller.savebot_open){
  
   var T = scr_draw_message(display_get_gui_width(),display_get_gui_height(),
   "Memobot","Save","Save as","Open","Cancel");
   
   if(!onquestion){
   
    switch(T){
    
       case 1: 
       
               if(file_exists(working_directory+"\\Levels\\"+string(global.level_filename))){
                   with(obj_editor_controller){scr_save_level();} 
                   global.level_numb++;
                    with(obj_editor_controller){savebot_open=0;}  global.closing=0;
               }else{
                   onquestion=1; msg_var=get_string_async("Type the level name","Level"); 
                   //We use a get string cause god I don't want to make a custom typer it's pain
               }
       
       
               
       
       break;
       
       
       
       case 2: onquestion=1; msg_var=get_string_async("Type the level name","Level"); break;
       case 3: onquestion=1; fade=1; alarm[2]=30;break;
       case 4:   with(obj_editor_controller){savebot_open=0;} global.closing=0; break;
   
    }
   
   }
   
   }else{
   
     var T=scr_draw_message(display_get_gui_width(),display_get_gui_height(),
           "File with this name already exists, do#you want to replace it?#You won't be able to recover it","Yes","No");
           
           switch(T){
           
                 case 1:
                 show_debug_message("Replaced file");
                 event_user(1);
                 break;
                 
                 case 2:
                 show_debug_message("No file replaced");
                 global.closing=0; 
                 with(obj_editor_controller){savebot_open=0;} 
                 onquestion=0;
                 break;
           
           }
   
   }

  break;

}

draw_set_halign(fa_left); draw_set_valign(fa_top);
draw_set_colour(c_black);
draw_text_transformed(2,2,

string_hash_to_newline("FPS:"+string(fps))

,0.25,0.25,0);
draw_set_colour(c_white);

depth=-10;
draw_sprite_ext(global.cursor,0,device_mouse_x_to_gui(0)+8,device_mouse_y_to_gui(0)+8,
0.2,0.2,global.cursor_angle,c_white,1);


fade_alpha=scr_approach(fade_alpha,fade,0.1);
draw_set_alpha(fade_alpha);
draw_set_colour(c_black);
draw_rectangle(0,0,display_get_gui_width(),display_get_gui_height(),0);
draw_set_alpha(1);

