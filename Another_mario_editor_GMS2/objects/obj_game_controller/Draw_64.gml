draw_set_font(fnt_mario);
draw_set_colour(c_black);
draw_text_transformed(45,display_get_gui_height()-30,string_hash_to_newline("Press ENTER#to go back"),0.25,0.25,0);
draw_set_colour(c_white);


draw_sprite_ext(ButtonLeft_Sprite[0],0,ButtonLeft_X[0],ButtonLeft_Y[0]+1+Leftmenu_top,1,1,0,c_black,0.25);
    draw_sprite(ButtonLeft_Sprite[0],0,ButtonLeft_X[0],ButtonLeft_Y[0]+Leftmenu_top);
    
draw_sprite(spr_playmovie_bar,0,ButtonLeft_X[0]-sprite_get_xoffset(ButtonLeft_Sprite[0]),
          ButtonLeft_Y[0]+Leftmenu_top-sprite_get_yoffset(ButtonLeft_Sprite[0]));
          
//Play
if(point_in_rectangle(device_mouse_x_to_gui(0),device_mouse_y_to_gui(0),
   ButtonLeft_X[0]-sprite_get_xoffset(ButtonLeft_Sprite[0]),
   Leftmenu_top+ButtonLeft_Y[0]-sprite_get_yoffset(ButtonLeft_Sprite[0])-sprite_get_height(spr_playmovie_bar),
   ButtonLeft_X[0]+sprite_get_xoffset(ButtonLeft_Sprite[0]),
   Leftmenu_top+ButtonLeft_Y[0]+sprite_get_yoffset(ButtonLeft_Sprite[0]) )

){
  if(mouse_check_button_pressed(mb_left)){
     with(obj_editor_controller){event_perform(ev_keypress, vk_enter);}
  }
}

//Game HUD
draw_set_font(global.number_font);
draw_set_halign(fa_left);
draw_set_valign(fa_middle);

if(Mode==1){
   draw_sprite_ext(Lives_sprite,0,Lives_x,Lives_y,0.5,0.5,0,c_white,1);
   draw_sprite(spr_x_hud,0,Lives_x+sprite_get_xoffset(Lives_sprite)*0.5+4,Lives_y);
   
   draw_text_transformed(Lives_x+sprite_get_xoffset(Lives_sprite)*0.5+sprite_get_width(spr_x_hud)+1,
      Lives_y+3,string_hash_to_newline(string_replace_all( string_format(Lives,3,0)," ","0" )),1,1,0);
} 

draw_sprite_ext(Coins_sprite,0,Coins_x,Coins_y+17*abs(Mode),1,1,0,c_white,1);
draw_sprite(spr_x_hud,0,Coins_x+sprite_get_xoffset(Coins_sprite)+4,Coins_y+17*abs(Mode));
draw_text_transformed(Coins_x+sprite_get_xoffset(Coins_sprite)+sprite_get_width(spr_x_hud)+1,Coins_y+14*abs(Mode),
   string_hash_to_newline(string_replace_all( string_format(Coins,2,0)," ","0" )),1,1,0);
   

var Timestring = string_replace_all( string_format(Time,3,0)," ","0" ) 
   
draw_set_halign(fa_right);
draw_text_transformed(display_get_gui_width()+Time_x,Time_y,
   string_hash_to_newline(Timestring),1,1,0);
draw_sprite(Time_sprite,0,
      display_get_gui_width()+Time_x-string_width(string_hash_to_newline(Timestring))-1-sprite_get_xoffset(Time_sprite),Time_y);


draw_text_transformed(display_get_gui_width()+Score_x,Score_y,
   string_hash_to_newline(string_replace_all( string_format(Score,9,0)," ","0" )),1,1,0);


