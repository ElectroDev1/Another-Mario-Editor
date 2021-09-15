/// @description Variables
global.loaded=0;

music=audio_play_sound(snd_coursebot,0,1);
audio_sound_gain(music,0.75,0);

leveltab_x=46;
leveltab_y=51;
offset=0;
offset_T=0;
max_level_numb=52;

checkX=0;
checkY=0;

goinput=0;
control=1;

global.levelsprite[max_level_numb]=-4;

buttonpos=0;
pagepos=0;

onpage_index=-1;

for(var a=0; a<global.level_numb; a++){
    
    levelsurf[a]=surface_create(62*24 -1,45*24 -1);
    
    surface_set_target(levelsurf[a]);
    draw_clear_alpha(c_black,1);
    
    
    draw_sprite_ext(global.levelsprite[a],0,0,0,1,1,0,c_white,1);
    
    buttonsprite[a]=sprite_create_from_surface(levelsurf[a],0,0,
    62*24,45*24,0,0,0,0);
    
    surface_reset_target();
    surface_free(levelsurf[a]);

}

World=0;
Time=0;
Scroll=0;
ClearCond=-1;

///Static surfaces

//Get static menu base surface
surf=surface_create(room_width,room_height);
draw_set_font(fnt_mario);

surface_set_target(surf);

draw_set_colour(make_colour_rgb(255,220,0));
draw_rectangle(0,0,room_width,38,0);

draw_primitive_begin(pr_trianglefan);

draw_vertex(0,36);
draw_vertex(8,36);
draw_vertex(40,room_height+2);
draw_vertex(0,room_height+2);

draw_primitive_end();

draw_primitive_begin(pr_trianglefan);

draw_vertex(room_width-40,36);
draw_vertex(room_width,36);
draw_vertex(room_width,room_height+2);
draw_vertex(room_width-8,room_height+2);


draw_primitive_end();

draw_set_colour(c_black);
draw_set_halign(fa_center);draw_set_valign(fa_middle);
draw_set_font(fnt_mario_big);
draw_text_transformed(room_width/2,38/2,string_hash_to_newline("SELECT A LEVEL"),0.5,0.5,0);
draw_set_font(fnt_mario);

topsprite=sprite_create_from_surface(surf,0,0,room_width,room_height,0,0,0,0);

surface_reset_target();

surface_free(surf);



//Get static background base surface
surf=surface_create(291,164+54);
surface_set_target(surf);

draw_set_colour(make_colour_rgb(178,195,255));
draw_set_alpha(0.8);
draw_rectangle(2,3,289,164+56,0);

draw_set_alpha(1);
draw_set_colour(c_white);
draw_line_width(1,2,1,164+56,2);
draw_line_width(2,1,288,1,2);
draw_line_width(289,2,289,164+56,2);

backsprite=sprite_create_from_surface(surf,0,0,room_width,room_height,0,0,0,0);

surface_reset_target();

surface_free(surf);

