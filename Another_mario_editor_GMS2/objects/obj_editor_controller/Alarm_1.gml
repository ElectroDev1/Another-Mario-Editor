/// @description Enter game
instance_destroy(obj_mario_shadow);

with(obj_controller){
	 fade_alpha=1;
}

        //Create the entities
    with(obj_editor_entity){
         
        if(!UsesSprite){
         child=instance_create_layer(x+1+sprite_get_xoffset(global.spritemap[? Entity_id]),
         y+1+sprite_get_yoffset(global.spritemap[? Entity_id]),"entities",
         global.entitymap[? Entity_id]);
        }
        else{
        
         child=instance_create(x,
         y,
         global.entitymap[? Entity_id]);
        
        }
         
         switch(child.object_index){
         
                case obj_question_block :
                case obj_coin :
                case obj_inv_block :
                      child.image_speed=0.2;    
                break;
                
                case obj_arrow :
                      child.image_angle=Attribute[Attributes.Direction];
                break;
                
                case obj_bridge :
                      child.image_xscale=Attribute[Attributes.Width];
                break;
                
                /*case obj_spring :
                      child.x+=8;
                      child.y+=8;
                break;*/
         
         }
         
         if(tile_exists(tile)){ tile_set_visible(tile,false); }
         visible=false;
    
    }
    
    with(obj_mario_editor){
         alarm[0]=1;
    }

