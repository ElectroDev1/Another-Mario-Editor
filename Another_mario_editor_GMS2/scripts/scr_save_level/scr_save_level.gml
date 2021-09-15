/// @description Save level
function scr_save_level() {
	/*
	This script goes through all the level properties and entity objects and saves what is needed
	in a big ds grid, then we just put it all inside a .sav file
	*/
	if(room==rm_editor){

	    //Create the thumbnail sprite and make shadows go away
    
	    
	    //obj_editor_controller.shadow_allow=0;
    
	
	    var desprite=sprite_create_from_surface(application_surface,0,0,
	    surface_get_width(application_surface),surface_get_height(application_surface),0,0,0,0);
	   
   
	    //Save the sprite as .png
	    sprite_save(desprite,0,"Levels\\Level images\\"+string(global.new_filename)+".png");
   
	    //Delete the sprite to prevent memory leaks and reactivate shadows
	    sprite_delete(desprite);
    
	    //with(obj_editor_controller){alarm[0]=2;}
   
	    //Update idle state
	    with(obj_controller){ idling=0; }
   
   
	    //Check how many entities are in the level
	    var items = instance_number(obj_editor_entity);
   
	    //Create the grid
	    var levelmap = ds_grid_create(13,items+1);
   
	    //Add level properties
	    ds_grid_add(levelmap,0,0,string(items));
	    ds_grid_add(levelmap,1,0,string(World));
	    ds_grid_add(levelmap,2,0,string(Time));
	    ds_grid_add(levelmap,3,0,string(Scroll));
	    ds_grid_add(levelmap,4,0,string(ClearCond));


	    var pos=0;
          
	    //Deal with the entities
	    with(obj_editor_entity){
          
	        ds_grid_add(levelmap,0,pos+1,string(Entity_id));
	        ds_grid_add(levelmap,1,pos+1,string(x));
	        ds_grid_add(levelmap,2,pos+1,string(y));
               
              
	        for(var a=0; a<array_length_1d(Attribute); a++){
	            ds_grid_add(levelmap, a+3, pos+1, string(Attribute[a]));
	        }
               
	        ds_grid_add(levelmap, array_length_1d(Attribute)+3, pos+1,UsesSprite);

	        //Go to the next position in the grid    
	        pos++;
          
	    }
          

	    if(pos==items){//If we're done with the entities
          
	        //Serialize the grid to buffer
	        var buffer = /*ds_grid_write_buffer(levelmap);*/ds_grid_write(levelmap);
   
	        //Store the buffer in a file
	        var file = file_text_open_write("Levels\\"+string(global.level_filename));
          
	            file_text_write_string(file, string(items));
              
	            file_text_writeln(file);
              
	            file_text_write_string(file, string(buffer));
          
	        file_text_close(file);
          
	        ds_grid_destroy(levelmap);
          
	    }


	    //Show that the level has been saved
	    show_debug_message("Level '"+string(global.level_filename)+"' saved");
    
	    global.saved=1;

	}



}
