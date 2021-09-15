/// @description Load levels
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

