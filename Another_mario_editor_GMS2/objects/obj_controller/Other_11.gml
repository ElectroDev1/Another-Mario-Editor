/// @description Save this file
if(global.getstring_cont=="saveas"){
    room_goto(rm_editor);
}

global.closing=2;
global.draweditor=0;
onquestion=0;
global.level_filename=global.new_filename+".sav";

with(obj_editor_controller){scr_save_level();}

alarm[1]=2;


