/// @description Controller logic

//Get if we're trying to close the game
if (window_command_check(window_command_close)) { 

    show_debug_message("Close attempted"); 
   
 if(room==rm_editor){
    
   
   
   if(!global.saved){
   
    if(global.closing!=1){
      global.closing=1;
    }
      
   }else{
      game_end();
   } 
      
 }else if(room==rm_levelselect){ game_end(); }
    
    
}

//Discord RPC
//Rich presence setup
np_initdiscord("883736895568375829",0,0);

//Set time
np_setpresence_timestamps(unix,0,1);

//Set profile status
np_setpresence(global.state,global.details,global.icon,global.small_icon);

np_setpresence_more(global.small_icon_text,global.icon_text,0);

np_update();


if(idling>=3600/2){ global.small_icon="rpc_idling"; }else{global.small_icon="rpc_logo"; }

//Set text
switch(global.icon){
        default: global.icon_text="Another Mario Editor"; break;
} 

switch(global.small_icon){
        default: global.small_icon_text=""; break;
        case "rpc_idling": global.small_icon_text="Idling"; break;
} 

