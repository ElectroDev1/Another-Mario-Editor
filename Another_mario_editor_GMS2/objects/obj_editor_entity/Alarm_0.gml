/// @description Update tile
if(room==rm_editor){



if(tile_exists(tile)){tile_delete(tile);}

if(!UsesSprite){

 tile=tile_add(
 global.tileset,
 global.tileposX[? Entity_id],global.tileposY[? Entity_id],
 width,height,x,y,1);
 
}else{sprite_index=UsesSprite;}

   switch Entity_id {
        case "Firebar":
        case "Arrow":
        case "Spring":
        
             with(obj_editor_controller){enitityplace=0; selected_id=-1;}
        
        break;
   }

}

