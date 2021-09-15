if(!keyboard_check(vk_alt))&&(switch_allow){
	
	switch_allow=false;
	alarm[2]=2;

if(room==rm_editor){
        
    audio_sound_gain(global.makersong,0,0);
    audio_sound_gain(global.playsong,1,0);

    global.switchstate=0;
    room_set_width(rm_ingame, room_width);
    room_set_height(rm_ingame,room_height);

    room_goto(rm_ingame);
    
    alarm[1]=1;


}
else if(room==rm_ingame){

    audio_sound_gain(global.makersong,1,0);
    audio_sound_gain(global.playsong,0,0);

    VX=__view_get( e__VW.XView, 0 );
    VY=__view_get( e__VW.YView, 0 );
    
    instance_activate_object(obj_mario_shadow);

    with(obj_mario_editor){
       x=obj_playerparent.x;
       y=obj_playerparent.y;
       visible=true;
    }
    
    with(obj_editor_entity){
       visible=true;
       if(tile_exists(tile)){ tile_set_visible(tile,true); }
    }

    room_goto(rm_editor);
    
}

}

