/// @description Save a temp file
with(obj_controller){ idling=0; }
   temp_index++; 
   global.saved=0;
          //Data structure method
          var items = instance_number(obj_editor_entity);
   
          //Create the grid
          var levelmap = ds_grid_create(11,items+1);
   
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
          var file = file_text_open_write("Temp\\TempLevel_"+string(temp_index)+".sav");
          
              file_text_write_string(file, string(items));
              
              file_text_writeln(file);
              
              file_text_write_string(file, string(buffer));
          
          file_text_close(file);
          
          ds_grid_destroy(levelmap);
          
          }
          
          show_debug_message("Saved temp of index "+string(temp_index));
   

/* */
/*  */
