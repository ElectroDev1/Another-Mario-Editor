
if(room!=rm_editor || global.closing){exit;}


if(!surface_exists(gui_surf)){
   gui_surf=surface_create(display_get_gui_width(),display_get_gui_height());
}else{


//Draw the HUD
surface_set_target(gui_surf);

draw_clear_alpha(c_blue,0);

//Shadows



/*draw_primitive_begin(pr_trianglefan);
draw_vertex_colour(display_get_gui_width()-Rightmenu_width-5,Rightmenu_top,c_black,0);
draw_vertex_colour(display_get_gui_width()-Rightmenu_width,Rightmenu_top,c_black,.25);
draw_vertex_colour(display_get_gui_width()-Rightmenu_width,display_get_gui_height(),c_black,.25);
draw_vertex_colour(display_get_gui_width()-Rightmenu_width-5,display_get_gui_height(),c_black,0);

draw_primitive_end();




draw_primitive_begin(pr_trianglefan);
draw_vertex_colour(0,Topmenu_height-Topmenu_height*MenuOffset[0],c_black,0.25);
draw_vertex_colour(display_get_gui_width()-Rightmenu_width,Topmenu_height-Topmenu_height*MenuOffset[0],c_black,0.25);

draw_vertex_colour(display_get_gui_width()-Rightmenu_width,Topmenu_height-Topmenu_height*MenuOffset[0]+5,c_black,0);
draw_vertex_colour(0,Topmenu_height-Topmenu_height*MenuOffset[0]+5,c_black,0);
draw_primitive_end();*/


//
draw_set_colour(c_white);
draw_set_alpha(0.4);
draw_rectangle(0,0,display_get_gui_width(),Topmenu_height-Topmenu_height*MenuOffset[0],0);

draw_set_alpha(1);

var halfX=display_get_gui_width()/2;

draw_rectangle(halfX-6,
Topmenu_height-Topmenu_height*MenuOffset[0],halfX+6,Topmenu_height-Topmenu_height*MenuOffset[0]+4,0);


if(point_in_rectangle(device_mouse_x_to_gui(0),device_mouse_y_to_gui(0),
halfX-6,Topmenu_height-Topmenu_height*MenuOffset[0],
halfX+6,Topmenu_height-Topmenu_height*MenuOffset[0]+4)){

   if(mouse_check_button_pressed(mb_left)){ with(obj_controller){ idling=0; }  MenuClose[0]=!MenuClose[0]; }

}


draw_line_width(0,Topmenu_height-Topmenu_height*MenuOffset[0],display_get_gui_width(),
Topmenu_height-Topmenu_height*MenuOffset[0],1);




//Top bar


//Draw icons
for(var a=0; a<12; a++){
  
    var X=40+27*a;
    if(selected_id==a){ var Y=w; }else{ var Y=0; }

    draw_sprite_ext(spr_objectUI,0,X, 21-Topmenu_height*MenuOffset[0]  ,1,1,0,c_black,0.25);
    
    draw_sprite(spr_objectUI,
    global.entityclass[? global.selected_entity[a]],X, 20-Topmenu_height*MenuOffset[0]);
    
    draw_sprite(global.spritemap[? global.selected_entity[a]],0,X, (21+Y)-Topmenu_height*MenuOffset[0]);
    
}

draw_sprite_ext(spr_magnUI,0,
display_get_gui_width()-17,21-Topmenu_height*MenuOffset[0],1,1,0,c_black,0.25);


draw_sprite(spr_magnUI,0,
display_get_gui_width()-17,20-Topmenu_height*MenuOffset[0]);



//Right side
draw_set_colour(c_white);
draw_set_alpha(0.4);
draw_rectangle(display_get_gui_width()-Rightmenu_width +Rightmenu_width*MenuOffset[1],
Rightmenu_top,display_get_gui_width()+Rightmenu_width*MenuOffset[1],display_get_gui_height(),0);



var halfY=Rightmenu_top + (display_get_gui_height()-Rightmenu_top)/2;

if(point_in_rectangle(device_mouse_x_to_gui(0),device_mouse_y_to_gui(0),
display_get_gui_width()-Rightmenu_width-6+Rightmenu_width*MenuOffset[1],halfY-6,
display_get_gui_width()-Rightmenu_width+Rightmenu_width*MenuOffset[1],halfY+6)){

   if(mouse_check_button_pressed(mb_left)){ with(obj_controller){ idling=0; } enitityplace=0; selected_id=-1; MenuClose[1]=!MenuClose[1]; }

}



draw_set_alpha(1);


draw_rectangle(
display_get_gui_width()-Rightmenu_width-4+Rightmenu_width*MenuOffset[1],halfY-6,
display_get_gui_width()-Rightmenu_width+Rightmenu_width*MenuOffset[1],halfY+6,0);


draw_line(display_get_gui_width()-Rightmenu_width+Rightmenu_width*MenuOffset[1],
Rightmenu_top-1,display_get_gui_width()-Rightmenu_width+Rightmenu_width*MenuOffset[1],display_get_gui_height());

draw_line(display_get_gui_width()-Rightmenu_width+Rightmenu_width*MenuOffset[1]
,Rightmenu_top-1,display_get_gui_width()+Rightmenu_width*MenuOffset[1],Rightmenu_top-1);

//Draw the right buttons
for(var a=0; a<array_length_1d(ButtonRight_Sprite); a++){

    var img=0;
    if(ButtonRight_Sprite[a]==spr_robotUI){ var img=savebot_open; }

    draw_sprite_ext(ButtonRight_Sprite[a],img,display_get_gui_width()+ButtonRight_X[a]+Rightmenu_width*MenuOffset[1],ButtonRight_Y[a]+1+Rightmenu_top,1,1,0,c_black,0.25);
    draw_sprite(ButtonRight_Sprite[a],img,display_get_gui_width()+ButtonRight_X[a]+Rightmenu_width*MenuOffset[1],ButtonRight_Y[a]+Rightmenu_top);
    
   

}



draw_set_colour(c_black);

//Redo circle
draw_pie(display_get_gui_width()+Rightmenu_width*MenuOffset[1]+ButtonRight_X[3]+sprite_get_xoffset(ButtonRight_Sprite[3]),
ButtonRight_Y[3]+Rightmenu_top+sprite_get_yoffset(ButtonRight_Sprite[3]),1,1,c_black,4,1);
draw_set_colour(c_white);
draw_pie(display_get_gui_width()+Rightmenu_width*MenuOffset[1]+ButtonRight_X[3]+sprite_get_xoffset(ButtonRight_Sprite[3]) ,
ButtonRight_Y[3]+Rightmenu_top+sprite_get_yoffset(ButtonRight_Sprite[3]),max(redo_time,0), 1, c_red, 3, 1);

//Undo circle
draw_pie(display_get_gui_width()+Rightmenu_width*MenuOffset[1]+ButtonRight_X[4]+sprite_get_xoffset(ButtonRight_Sprite[4]),
ButtonRight_Y[4]+Rightmenu_top+sprite_get_yoffset(ButtonRight_Sprite[4]),1,1,c_black,4,1);
draw_set_colour(c_white);
draw_pie(display_get_gui_width()+Rightmenu_width*MenuOffset[1]+ButtonRight_X[4]+sprite_get_xoffset(ButtonRight_Sprite[4]) ,
ButtonRight_Y[4]+Rightmenu_top+sprite_get_yoffset(ButtonRight_Sprite[4]),max(undo_time ,0), 1, c_red, 3, 1);



//Left side
draw_set_colour(c_white);
draw_set_alpha(0.4);

draw_rectangle(-Leftmenu_width*MenuOffset[2],Leftmenu_top,Leftmenu_width-Leftmenu_width*MenuOffset[2],display_get_gui_height()-Leftmenu_top,0);

draw_set_alpha(0.8);
draw_rectangle(-Leftmenu_width*MenuOffset[2],display_get_gui_height()-Leftmenu_top-24,Leftmenu_width-Leftmenu_width*MenuOffset[2],display_get_gui_height()-Leftmenu_top,0);

draw_set_alpha(1);


var halfY=Leftmenu_top + (display_get_gui_height()-Leftmenu_top-Leftmenu_top)/2;

draw_rectangle(Leftmenu_width-Leftmenu_width*MenuOffset[2],halfY-6,Leftmenu_width-Leftmenu_width*MenuOffset[2]+4,halfY+6,0);


//Slide
if(point_in_rectangle(device_mouse_x_to_gui(0),device_mouse_y_to_gui(0),
Leftmenu_width-Leftmenu_width*MenuOffset[2],halfY-6,Leftmenu_width-Leftmenu_width*MenuOffset[2]+4,halfY+6
)){
   if(mouse_check_button_pressed(mb_left)){ with(obj_controller){ idling=0; }  MenuClose[2]=!MenuClose[2]; }
}



draw_line(Leftmenu_width-Leftmenu_width*MenuOffset[2],Leftmenu_top-1,Leftmenu_width-Leftmenu_width*MenuOffset[2],display_get_gui_height()-Leftmenu_top-1);
draw_line(-1-Leftmenu_width*MenuOffset[2],display_get_gui_height()-Leftmenu_top,Leftmenu_width-1-Leftmenu_width*MenuOffset[2],display_get_gui_height()-Leftmenu_top);
draw_line(-1-Leftmenu_width*MenuOffset[2],Leftmenu_top-1,Leftmenu_width-1-Leftmenu_width*MenuOffset[2],Leftmenu_top-1);

//Draw the right buttons
for(var a=0; a<array_length_1d(ButtonLeft_Sprite); a++){

    

    draw_sprite_ext(ButtonLeft_Sprite[a],0,ButtonLeft_X[a]-Leftmenu_width*MenuOffset[2],ButtonLeft_Y[a]+1+Leftmenu_top,1,1,0,c_black,0.25);
    draw_sprite(ButtonLeft_Sprite[a],0,ButtonLeft_X[a]-Leftmenu_width*MenuOffset[2],ButtonLeft_Y[a]+Leftmenu_top);

     switch(a){ 
        case 0: 
          //texture_set_interpolation(true);
          draw_sprite_ext(spr_game_icon,0,ButtonLeft_X[0]-Leftmenu_width*MenuOffset[2],ButtonLeft_Y[0]+Leftmenu_top,1,1,0,c_white,1);
          texture_set_interpolation(false);
        break;
        
        case 2:
          draw_set_halign(fa_left); draw_set_valign(fa_middle); draw_set_colour(c_black); draw_set_font(fnt_mario);
          draw_text_transformed(ButtonLeft_X[0]-Leftmenu_width*MenuOffset[2]-4,ButtonLeft_Y[2]+Leftmenu_top+2,string_hash_to_newline("000"),0.5,0.5,0);
          draw_set_colour(c_white);
        break;
        
        case 3:
          if(shadow_allow){draw_sprite(spr_shadowmario_button,1,ButtonLeft_X[a]-Leftmenu_width*MenuOffset[2],ButtonLeft_Y[a]+Leftmenu_top);}
        break;
        
        case 4:
          draw_sprite(spr_playmovie_bar,0,ButtonLeft_X[4]-sprite_get_xoffset(ButtonLeft_Sprite[4])-Leftmenu_width*MenuOffset[2],
          ButtonLeft_Y[4]+Leftmenu_top-sprite_get_yoffset(ButtonLeft_Sprite[4]));
        break;
    }
    
}

//Play
if(point_in_rectangle(device_mouse_x_to_gui(0),device_mouse_y_to_gui(0),
   ButtonLeft_X[4]-sprite_get_xoffset(ButtonLeft_Sprite[4])-Leftmenu_width*MenuOffset[2],
   Leftmenu_top+ButtonLeft_Y[4]-sprite_get_yoffset(ButtonLeft_Sprite[4])-sprite_get_height(spr_playmovie_bar),
   ButtonLeft_X[4]+sprite_get_xoffset(ButtonLeft_Sprite[4])-Leftmenu_width*MenuOffset[2],
   Leftmenu_top+ButtonLeft_Y[4]+sprite_get_yoffset(ButtonLeft_Sprite[4]) )

){
  if(mouse_check_button_pressed(mb_left)){
     with(obj_controller){ idling=0; }
     event_perform(ev_keypress, vk_enter);
  }
}


surface_reset_target();

if(state!=ControlState.searching){
 if(surface_exists(gui_surf)){draw_surface(gui_surf,0,0);}
}


//Reset rocket circle
draw_set_font(fnt_hd); draw_set_alpha(0.75);
draw_set_halign(fa_center); draw_set_valign(fa_middle);

if(delet_time>=0){

 draw_pie(display_get_gui_width()/2,display_get_gui_height()/2+16,
 delet_time,1,c_white,64,0.75);

 draw_set_colour(c_black);
 draw_text(display_get_gui_width()/2,display_get_gui_height()/2+16,string_hash_to_newline(string(3-delet_pos)));
 
}

draw_set_font(fnt_mario); draw_set_valign(fa_top); draw_set_alpha(1);


}

draw_set_colour(c_black); draw_set_halign(fa_left);

//infoalpha=scr_approach(infoalpha,0,0.2);

//draw_text_transformed(5,display_get_gui_height()-20,string(obj_mousechek.entitycollision)+" / "+string(Drag_id)+" / "+string(global.editing)
//,0.5,0.5,0);

draw_set_colour(c_white);



/* */
/*  */
