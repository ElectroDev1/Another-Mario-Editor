with(obj_editor_entity){
  if(y>=other.y){
     with(instance_create(x+17,y+17,obj_entity_dead)){
          sprite_index=global.spritemap[? other.Entity_id];
     }
     
     instance_destroy();     
     
  }
}

if(y<__view_get( e__VW.YView, 0 )-80)&&(!instance_exists(obj_editor_entity)){ instance_destroy(); }

