if(collision_rectangle(bbox_left-1,bbox_top+1,bbox_right+1,bbox_bottom-1,obj_playerparent,0,0)
||collision_rectangle(bbox_left+1,bbox_top-1,bbox_right-1,bbox_bottom+1,obj_playerparent,0,0)){
   
   with(obj_editor_controller){
        event_perform(ev_keypress, vk_enter);
   }

}

