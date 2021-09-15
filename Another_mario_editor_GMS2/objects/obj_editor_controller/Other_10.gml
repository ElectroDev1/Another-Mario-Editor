/// @description Save level
if(room==rm_editor){

   /*
   So my choice was to either use data structures which would lower how much space each
   level file gets, or use have a list with all the properties than can be easily viewed
   */
   
   //For now I'll try data structures
   
   /*
   We go through all the level entities and save their indexes + special attributes based
   on the object type
   We also save the level attributes at the start
   */
   
   global.draweditor=0;
   
   //shadow_allow=0;
   instance_destroy(obj_mario_shadow);
   
   var desprite=sprite_create_from_surface(application_surface,0,0,
   surface_get_width(application_surface),surface_get_height(application_surface),
   0,0,0,0);
   
   sprite_save(desprite,0,"Levels\\Level images\\"+string(global.level_filename)+".png");
   
   sprite_delete(desprite);
   shadow_allow=1;
   
   //alarm[0]=2;
   
   with(obj_controller){ idling=0; }
   infostring="Saved level";
   infoalpha=2;
   global.saved=1;
   
          //Data structure method
          var items = instance_number(obj_editor_entity);
   
          //Create the grid
          var levelmap = ds_grid_create(13,items+1);
   
          ds_grid_add(levelmap,0,0,string(items));
          ds_grid_add(levelmap,1,0,string(World));
          ds_grid_add(levelmap,2,0,string(Time));
          ds_grid_add(levelmap,3,0,string(Scroll));
          ds_grid_add(levelmap,4,0,string(ClearCond));

          var pos=0;
          
          //Entities
          with(obj_editor_entity){
          
               ds_grid_add(levelmap,0,pos+1,string(Entity_id));
               ds_grid_add(levelmap,1,pos+1,string(x));
               ds_grid_add(levelmap,2,pos+1,string(y));
               
               show_debug_message("Item loaded successfully at "
             +string(ds_grid_get(levelmap,1,pos+1))+"/"+string(ds_grid_get(levelmap,2,pos+1)) );
              
               for(var a=0; a<array_length_1d(Attribute); a++){
                   ds_grid_add(levelmap, a+3, pos+1, string(Attribute[a]));
               }
               
               ds_grid_add(levelmap, array_length_1d(Attribute)+3, pos+1,UsesSprite);
               
               pos++;
          
          }
          
          if(pos==items){
          
          //Serialize the grid to buffer
          var buffer = /*ds_grid_write_buffer(levelmap);*/ds_grid_write(levelmap);
   
          //Store the buffer in a file
          var file = file_text_open_write("Levels\\"+string(global.level_filename)+".sav");
          
              file_text_write_string(file, string(items));
              
              file_text_writeln(file);
              
              file_text_write_string(file, string(buffer));
          
          file_text_close(file);
          
          ds_grid_destroy(levelmap);
          
          }
    
   
          global.saved=1;
}

/* */
/*  */
