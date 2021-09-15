/// @description Load temp
with(obj_controller){ idling=0; }
//Load the current temp file
if(temp_index>-1){
global.saved=0;

    //Clear the room
    with(obj_editor_entity){instance_destroy();}
   
    show_debug_message("Saved temp of index "+string(temp_index));
    
  if(file_exists("Temp\\TempLevel_"+string(temp_index-1)+".sav")){
     
    //Get the ds grid
    var file = file_text_open_read("Temp\\TempLevel_"+string(temp_index-1)+".sav");
    
        var items = real(file_text_read_string(file));
        
        file_text_readln(file);
          
        var buffer = (file_text_read_string(file));
          
    file_text_close(file);
    
    var levelmap = /*ds_grid_read_buffer(buffer);*/ds_grid_create(11,items+1);
    //Convert the buffer into a ds grid
    ds_grid_read(levelmap,buffer);
    
        //var items = ds_grid_get(levelmap,0,0);
        World=real(ds_grid_get(levelmap,1,0));
        Time=real(ds_grid_get(levelmap,2,0));
        Scroll=real(ds_grid_get(levelmap,3,0));
        ClearCond=real(ds_grid_get(levelmap,4,0));
        

        //Create the objects
        for(var pos=0; pos<items; pos++){
        
            with(instance_create(
            real(ds_grid_get(levelmap,1,pos+1)),
            real(ds_grid_get(levelmap,2,pos+1)),
            obj_editor_entity)){
            
                 Entity_id = ds_grid_get(levelmap,0,pos+1);
                 
                 for(var a=0; a<array_length_1d(Attribute); a++){
                     Attribute[a] = real(ds_grid_get(levelmap,a+3,pos+1));
                 }
                 
                 Angle=Attribute[Attributes.Direction];
                 
                 UsesSprite = real(ds_grid_get(levelmap,array_length_1d(Attribute)+3,pos+1));
            
            }
             show_debug_message("Item created successfully at "
             +string(ds_grid_get(levelmap,1,pos+1))+"/"+string(ds_grid_get(levelmap,2,pos+1)) );

        }
        
        if(pos==items){
         ds_grid_destroy(levelmap);
        }
        
  }
}
        
         if(temp_index>-1){temp_index--;}
        //file_delete("Temp\TempLevel_"+string(temp_index)+".sav");

/* */
/*  */
