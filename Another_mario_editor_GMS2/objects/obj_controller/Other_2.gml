//Get the number of levels saved
/*
A lot of the code was for a method that would not rely on how files are ordered by the computer
but I can't seem to figure it out rn
*/

global.level_numb=0;
global.levelname[60]="";

//Get level number
var levelfile=file_find_first(working_directory+"\\Levels\\*.sav",fa_directory);
var i=0;

while(levelfile!=""){

    global.level_numb++;
    global.levelname[i]=levelfile;
    show_debug_message("Found level "+string(global.levelname[i]));
    i++;
    levelfile=file_find_next();
    
}

show_debug_message("Found "+string(global.level_numb)+" levels");


/*if(file_exists("Level list.dat")){
  
   //Put the level names and images on a list based on the level list file 
   var file=file_text_open_read("Level list.dat");


   for(var a=0; a<60; a++){
   
       var Fname=file_text_read_string(file);
         
       if(file_exists(working_directory+"\Levels\"+Fname)){
          global.levelname[a]=Fname;
          show_debug_message("Found level "+string(global.levelname[a]));
       
       
          if(file_exists(working_directory+"\Levels\Level images\"+
          string_delete(Fname,string_width(Fname)-3,4)+".png")){
         
             global.levelsprite[a]=sprite_add(working_directory+"\Levels\Level images\"+string_delete(Fname,string_width(Fname)-3,4)+".png",0,0,0,0,0);
             
             show_debug_message("Found image "+string(working_directory+"\Levels\Level images\"+string_delete(Fname,string_width(Fname)-3,4)+".png"));
       
          }
          else{
    
             global.levelsprite[a]=spr_nothumbnail; 
    
          }
       
       }
         
       file_text_readln(file);
   }   
     


   file_text_close(file);*/


/*var levelfile=file_find_first(working_directory+"\Levels\*.sav",fa_directory);
while(levelfile!=''){

     for(var a=0; a<global.level_numb; a++){
         var Fname=file_text_read_string(file);
         
         if(Fname==levelfile){
            global.levelname[a]=levelfile;
            show_debug_message("Found level "+string(levelfile));  
            
            //Set image
            if(file_exists(working_directory+"\Levels\Level images\"+
            string_delete(levelfile,string_length(levelfile)-3,4)+".png")){
      
                   global.levelsprite[a]=sprite_add(working_directory+"\Levels\Level images\"+string_delete(levelfile,string_length(levelfile)-3,4)+".png",0,0,0,0,0);
    
            }else{
    
                   global.levelsprite[a]=spr_nothumbnail; 
    
            }
            
         }
         
         file_text_readln(file);
     }   
     levelfile=file_find_next();
}*/







//}

var levelfile=file_find_first(working_directory+"\\Levels\\*.sav",fa_directory);
var i=0;
while(levelfile!=""){

    if(room!=rm_init){
     if(sprite_exists(global.levelsprite[i])&&(global.levelsprite[i]!=spr_nothumbnail)){
       sprite_delete(global.levelsprite[i]);
     } 
    }

    if(file_exists(working_directory+"\\Levels\\Level images\\"+
    string_delete(levelfile,string_length(levelfile)-3,4)+".png")){
      
      global.levelsprite[i]=sprite_add(working_directory+"\\Levels\\Level images\\"+string_delete(levelfile,string_length(levelfile)-3,4)+".png",0,0,0,0,0);
    
    }else{
    
      global.levelsprite[i]=spr_nothumbnail; 
    
    }

    show_debug_message("Found image "+string(string_delete(levelfile,string_length(levelfile)-3,4)+".png"));
    levelfile=file_find_next();
    i++;
    
}


/*var levelfile=file_find_first(working_directory+"\Levels\*.sav",fa_directory);
for(var a=0; a<3; a++){
   
     show_debug_message(levelfile);
     levelfile=file_find_next()
}*/





if(file_exists("Settings.dat")){
   
   var file=file_text_open_read("Settings.dat");
   
   
   Window_S=real(file_text_read_string(file));
   file_text_readln(file);

   vSyncreal=real(file_text_read_string(file));
   file_text_readln(file);

   fullscreen=real(file_text_read_string(file));
   file_text_readln(file);
   
   
   file_text_close(file);


}else{

  Window_S=3;

  vSync=0;

  fullscreen=0;

}



event_user(0);

room_goto(rm_levelselect);

/* */
/*  */
