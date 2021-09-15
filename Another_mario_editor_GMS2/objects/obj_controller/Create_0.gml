/// @description AME controller

global.debug=0;
window_command_hook(window_command_close);
//window_set_background_redraw(true);

instance_create(mouse_x,mouse_y,obj_mousechek);

global.saved=0;


ViewXoffset=0;
ViewYoffset=0;

enum input {
   left, right, up, down, action0, action1, start
}

global.keyboard[input.left]=vk_left;
global.keyboard[input.right]=vk_right;
global.keyboard[input.up]=vk_up;
global.keyboard[input.down]=vk_down;
global.keyboard[input.action0]=vk_space;
global.keyboard[input.action1]=vk_shift;
global.keyboard[input.start]=vk_enter;

global.button[input.left]=gp_padl;
global.button[input.right]=gp_padr;
global.button[input.up]=gp_padu;
global.button[input.down]=gp_padd;
global.button[input.action0]=gp_face1;
global.button[input.action1]=gp_face3;
global.button[input.start]=gp_start;


Window_W=room_width;
Window_H=room_height;

Window_S=3;

vSync=0;

fullscreen=0;

application_surface_draw_enable(false);
surface_resize(application_surface,Window_W*5,Window_H*5);

event_user(0);

global.cursor=spr_cursor;
global.cursor_angle=0;


enum Attributes {
     Mushroom = 0,
     Wings = 1,
     Direction = 2,
     Parachute = 3,
     Width = 4,
     Height = 5
}

global.switchstate=0;


global.closing=0;
global.saved=1;
screensprite=-4;

//Discord
unix=unix_timestamp();
global.state="In";
global.details="doing";
global.icon="rpc_logo";
global.small_icon="";

global.icon_text="text";
global.small_icon_text="small text";

idling=60;

//Level save stuff
global.level_filename="";

global.level_index=0;
global.new_filename="Level";
onquestion=0;

msg_var=0;
ques_var=0;

global.getstring_cont="saveas";

fade_alpha=0;
fade=0;


global.number_font = font_add_sprite(spr_numbers_hud,ord("0"),false,0);

///Initialize enitity ids
global.tileset=tiles_ground;//background_add("Tiles\Tile_ground.png",1,0);

entityname[0]="Semis"; entityname[1]="Ground"

global.entitymap=ds_map_create();

ds_map_add(global.entitymap,"Semis",obj_semisolid);
ds_map_add(global.entitymap,"Ground",obj_solid);//Still dunno how I'd handle walls
ds_map_add(global.entitymap,"Coin",obj_coin);
ds_map_add(global.entitymap,"MetalBlock",obj_metal_block);
ds_map_add(global.entitymap,"FlipBlock",obj_flipblock);
ds_map_add(global.entitymap,"QuestBlock",obj_question_block);
ds_map_add(global.entitymap,"InvBlock",obj_inv_block);
ds_map_add(global.entitymap,"Spiketrap",obj_spiketrap);
ds_map_add(global.entitymap,"OnOff_switch",obj_onoff_switch);
ds_map_add(global.entitymap,"OnOff_block_ON",obj_onoff_block_red);
ds_map_add(global.entitymap,"OnOff_block_OFF",obj_onoff_block_blue);
ds_map_add(global.entitymap,"Cloud",obj_cloud);
ds_map_add(global.entitymap,"Arrow",obj_arrow);
ds_map_add(global.entitymap,"Bridge",obj_bridge);
ds_map_add(global.entitymap,"Firebar",obj_firebar);
ds_map_add(global.entitymap,"Spring",obj_spring);

//Set tile positions
global.tileposX=ds_map_create();

ds_map_add(global.tileposX,"Coin",1);
ds_map_add(global.tileposX,"MetalBlock",18);
ds_map_add(global.tileposX,"FlipBlock",35);
ds_map_add(global.tileposX,"QuestBlock",52);
ds_map_add(global.tileposX,"InvBlock",69);
ds_map_add(global.tileposX,"Spiketrap",86);
ds_map_add(global.tileposX,"OnOff_switch",103);
ds_map_add(global.tileposX,"OnOff_block_ON",137);
ds_map_add(global.tileposX,"OnOff_block_OFF",188);
ds_map_add(global.tileposX,"Cloud",205);
ds_map_add(global.tileposX,"Firebar",239);
ds_map_add(global.tileposX,"Spring",52);

global.tileposY=ds_map_create();

ds_map_add(global.tileposY,"Coin",1);
ds_map_add(global.tileposY,"MetalBlock",1);
ds_map_add(global.tileposY,"FlipBlock",1);
ds_map_add(global.tileposY,"QuestBlock",1);
ds_map_add(global.tileposY,"InvBlock",1);
ds_map_add(global.tileposY,"Spiketrap",1);
ds_map_add(global.tileposY,"OnOff_switch",1);
ds_map_add(global.tileposY,"OnOff_block_ON",1);
ds_map_add(global.tileposY,"OnOff_block_OFF",1);
ds_map_add(global.tileposY,"Cloud",1);
ds_map_add(global.tileposY,"Firebar",1);
ds_map_add(global.tileposY,"Spring",18);

//Set sprites
/*
This is for the UI icons
*/
global.spritemap=ds_map_create();

ds_map_add(global.spritemap,"Semis",spr_semisolid);
ds_map_add(global.spritemap,"Ground",spr_solid);
ds_map_add(global.spritemap,"Coin",spr_coin);
ds_map_add(global.spritemap,"MetalBlock",spr_metal_block);
ds_map_add(global.spritemap,"FlipBlock",spr_flipblock);
ds_map_add(global.spritemap,"QuestBlock",spr_question_block);
ds_map_add(global.spritemap,"InvBlock",spr_invisible_block);
ds_map_add(global.spritemap,"Spiketrap",spr_spiketrap);
ds_map_add(global.spritemap,"OnOff_switch",spr_onoff_switch_on);
ds_map_add(global.spritemap,"OnOff_block_ON",spr_onoff_block_red);
ds_map_add(global.spritemap,"OnOff_block_OFF",spr_onoff_block_blue);
ds_map_add(global.spritemap,"Cloud",spr_cloud);
ds_map_add(global.spritemap,"Arrow",spr_arrow_icon);
ds_map_add(global.spritemap,"Bridge",spr_bridge_icon);
ds_map_add(global.spritemap,"Firebar",spr_firebar_block);
ds_map_add(global.spritemap,"Spring",spr_spring);

//Object type
global.entityclass=ds_map_create();



ds_map_add(global.entityclass,"Semis",0);
ds_map_add(global.entityclass,"Ground",0);
ds_map_add(global.entityclass,"Coin",1);
ds_map_add(global.entityclass,"MetalBlock",0);
ds_map_add(global.entityclass,"FlipBlock",0);
ds_map_add(global.entityclass,"QuestBlock",0);
ds_map_add(global.entityclass,"InvBlock",0);
ds_map_add(global.entityclass,"Spiketrap",0);
ds_map_add(global.entityclass,"OnOff_switch",3);
ds_map_add(global.entityclass,"OnOff_block_ON",3);
ds_map_add(global.entityclass,"OnOff_block_OFF",3);
ds_map_add(global.entityclass,"Cloud",0);
ds_map_add(global.entityclass,"Arrow",3);
ds_map_add(global.entityclass,"Bridge",0);
ds_map_add(global.entityclass,"Firebar",3);
ds_map_add(global.entityclass,"Spring",3);


for(var a=0; a<12; a++){ global.selected_entity[a]="Coin"; }
global.selected_entity[0]="MetalBlock";global.selected_entity[1]="FlipBlock";
global.selected_entity[2]="QuestBlock";global.selected_entity[3]="InvBlock";
global.selected_entity[4]="Spiketrap";global.selected_entity[4]="OnOff_switch";
global.selected_entity[5]="OnOff_block_ON";global.selected_entity[6]="OnOff_block_OFF";
global.selected_entity[7]="Cloud";global.selected_entity[8]="Arrow";
global.selected_entity[9]="Bridge";global.selected_entity[10]="Spring";

/* */
/*  */
