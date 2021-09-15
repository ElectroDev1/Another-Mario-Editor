//Get the name typed
var i_d = ds_map_find_value(async_load, "id");
 if i_d == msg_var
    {
    if ds_map_find_value(async_load, "status")
       {
       if ds_map_find_value(async_load, "result") != ""
          {
            var res=ds_map_find_value(async_load, "result");
            
            global.new_filename=res;
            
            global.closing=2;
            //Go through the saved levels and see if one is already called like it
            var file=file_find_first(working_directory + "\\Levels\\*.sav",fa_directory);
            
            while(file!=""){
            
                  if(global.new_filename+string(".sav")==file){
                  
                     global.closing=2;
                     show_debug_message("File with equal file name found");
                      with(obj_editor_controller){savebot_open=1;} 
                     break;
                  }
            
                  file=file_find_next();
            }
            
            if(!file_exists(working_directory + "\\Levels\\"+file)){
                
                
            
                event_user(1);}
            
            
          }
       }else{ show_debug_message("Closed typing window"); onquestion=0; }
       

    }
    


