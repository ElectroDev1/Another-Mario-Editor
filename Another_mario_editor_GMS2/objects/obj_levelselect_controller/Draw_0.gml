/// @description Draw menu
draw_sprite_ext(backsprite,0,leveltab_x,leveltab_y+max(offset,-53),1,1,0,c_white,1);



var y_button_offset=0;
var xpos=0;

for(var a=0; a<max_level_numb; a++){
 
    var X= leveltab_x+9+ 70*xpos;
    var Y= leveltab_y+8+ 54*y_button_offset+offset;
    
    if(buttonpos==xpos+(4*y_button_offset)){
       draw_set_colour(make_colour_rgb(255,216,0));
       draw_rectangle(X-2,Y-3,X+62+3,Y+45+2,0);
       draw_set_colour(c_white);
    }
    
   if(Y<room_height+1)&&(Y>-65){
   
    if(a<global.level_numb){
      draw_sprite_stretched(buttonsprite[a],0,
      X, Y,62,45);
    }else{
    
      draw_set_colour(c_black);
      draw_rectangle(X,Y,X+62-1,Y+45-1,0);
      draw_set_colour(c_white);
      draw_sprite_stretched_ext(spr_nothumbnail,0,
      X, Y,62,45,c_white,0.4);
    }
    
    draw_set_colour(c_white);
    draw_line_width(X,Y-1,X,Y+45-1,2);
    draw_line_width(X,Y-1,X+62,Y-1,2);
    draw_line_width(X+62,Y-1,X+62,Y+45-1,2);
    draw_line_width(X,Y+45-1,X+62,Y+45-1,2);

   } 
    
    xpos++;
    
    if(xpos>3){
       y_button_offset++;
       xpos=0;
    }
       

}



draw_sprite_ext(topsprite,0,0,0,1,1,0,c_white,1);

//Level button
if(onpage_index!=-1){

   if(onpage_index>-1){
    var levelstring=string_delete(global.levelname[buttonpos],string_length(global.levelname[buttonpos])-3,4);
   }else{
    var levelstring="Empty level";
   }
      
   
   draw_set_alpha(0.4);
   draw_set_colour(c_black);
   draw_rectangle(0,0,room_width,room_height,0);
   draw_set_alpha(1);
   
   draw_set_colour(make_colour_rgb(178,195,255));
   
   var X1=room_width/2-62-8;var X2=room_width/2+62+8;
   
   if(string_width(string_hash_to_newline(levelstring))/2>X2-X1){
      X1=room_width/2-string_width(string_hash_to_newline(levelstring))/4-8;
      X2=room_width/2+string_width(string_hash_to_newline(levelstring))/4+8;
   }
   
   var Y1=room_height/2-45*2-8;
   var Y2=room_height/2+45*2+8;
   
   draw_rectangle(X1+1,Y1,X2-1,Y2-1,0);
   
   if(onpage_index>-1){
   draw_set_colour(c_white);
   }else{
   draw_set_colour(c_black);
   
   }
   
   
   draw_rectangle(X1+(X2-X1)/2-62-2,Y1+(Y2-Y1)/2-45*2+10-2,
   X1+(X2-X1)/2+62+2,Y1+(Y2-Y1)/2+11,0);
   
   draw_set_colour(c_white);
   draw_line_width(X1,Y1,X1,Y2,2);
   draw_line_width(X1,Y1,X2,Y1,2);
   draw_line_width(X2,Y1,X2,Y2,2);
   draw_line_width(X1,Y2,X2,Y2,2);
   
   
   
   if(onpage_index>-1){
    draw_sprite_stretched(buttonsprite[onpage_index],0,X1+(X2-X1)/2-62,
    Y1+(Y2-Y1)/2-45*2+10,62*2,45*2);
   }else{
    draw_set_alpha(0.4);
    draw_sprite_stretched(spr_nothumbnail,0,X1+(X2-X1)/2-62,
    Y1+(Y2-Y1)/2-45*2+10,62*2,45*2);
    draw_set_alpha(1);
   }
   
   draw_set_colour(c_black);
   draw_set_halign(fa_center); draw_set_valign(fa_top);
   draw_text_transformed(X1+(X2-X1)/2,Y1+5,
   string_hash_to_newline(levelstring),0.5,0.5,0);
   
   if(onpage_index>-1){
   draw_text_transformed(X1+(X2-X1)/2,Y1+(Y2-Y1)/2+16,
   string_hash_to_newline("World : Plains"+
   "#Time :"+string_replace_all(string_format(Time,3,0)," ","0")+
   "#Srcoll: Normal")
   ,0.5,0.5,0);
   }
   
   draw_set_valign(fa_bottom);
   
   draw_text_transformed(X1+(X2-X1)/2,Y2-4,
   string_hash_to_newline("SPACE - Edit"+
   "#ESC - Back")
   ,0.5,0.5,0);

   if(goinput<11){goinput++;}
   
   if(keyboard_check_pressed(vk_escape)&&(goinput>10)){
      onpage_index=-1;
   }
   
   if(keyboard_check_pressed(vk_space)&&(goinput>10)){
      goinput=-999;
      
      if(onpage_index>-1){
      global.level_filename=global.levelname[onpage_index];
      global.new_filename=string_delete(global.level_filename,string_length(global.level_filename)-3,4);
      }
      obj_controller.fade=1;
      alarm[0]=30;
   }
   
}

