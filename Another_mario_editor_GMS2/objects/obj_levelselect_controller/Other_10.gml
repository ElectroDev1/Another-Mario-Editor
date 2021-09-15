/// @description Load some file info
var file = file_text_open_read("Levels\\"+string(global.levelname[buttonpos]));

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
        
ds_grid_destroy(levelmap);

/* */
/*  */
