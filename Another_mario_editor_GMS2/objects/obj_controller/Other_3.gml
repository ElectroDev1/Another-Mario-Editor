/*var file=file_text_open_write("Level list.dat");
   
    for(var a=0; a<60; a++){
        file_text_write_string(file,string(global.levelname[a]));
        file_text_writeln(file);
    }

file_text_close(file);*/
 
  
    var file=file_text_open_write("Settings.dat");
   
   
   file_text_write_string(file,string(Window_S));
   file_text_writeln(file);

   file_text_write_string(file,string(vSync));
   file_text_writeln(file);

   file_text_write_string(file,string(fullscreen));
   file_text_writeln(file);
   
   
   file_text_close(file);
   
directory_destroy("Temp");

/* */
/*  */
