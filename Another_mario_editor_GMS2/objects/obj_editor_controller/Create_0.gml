/// @description Stock file
/*if(!file_exists("Levels\Level.sav")){
   var file = file_text_open_write("Levels\Level.sav");
       file_text_write_string(file, string(0));
   file_text_close(file);
}*/
//Get the ds grid

   //Data structure method
       /*   var items = 0;
   
          //Create the grid
          var levelmap = ds_grid_create(11,items+1);
   
          ds_grid_add(levelmap,0,0,string(items));
          ds_grid_add(levelmap,1,0,string(World));
          ds_grid_add(levelmap,2,0,string(Time));
          ds_grid_add(levelmap,3,0,string(Scroll));
          ds_grid_add(levelmap,4,0,string(ClearCond));

          
          //Serialize the grid to buffer
          var buffer = ds_grid_write(levelmap);
   
          //Store the buffer in a file
          var file = file_text_open_write("Temp\_Default_DO_NOT_DELETE.sav");
          
              file_text_write_string(file, string(items));
              
              file_text_writeln(file);
              
              file_text_write_string(file, string(buffer));
          
          file_text_close(file);
          
          ds_grid_destroy(levelmap);


/* */
///Button positions

Topmenu_height=36;




Leftmenu_top=37;
Leftmenu_width=55;


ButtonLeft_Sprite[0]=spr_game_button;
ButtonLeft_X[0]=28;
ButtonLeft_Y[0]=16;

ButtonLeft_Sprite[1]=spr_world_icon;
ButtonLeft_X[1]=16;
ButtonLeft_Y[1]=39;


ButtonLeft_Sprite[2]=spr_time_button;
ButtonLeft_X[2]=28;
ButtonLeft_Y[2]=83;

ButtonLeft_Sprite[3]=spr_shadowmario_button;
ButtonLeft_X[3]=39;
ButtonLeft_Y[3]=129;

ButtonLeft_Sprite[4]=spr_playmovie_base;
ButtonLeft_X[4]=24;
ButtonLeft_Y[4]=164;



Rightmenu_top=37;
Rightmenu_width=33;

ButtonRight_Sprite[0]=spr_menu_UI;
ButtonRight_X[0]=-16;
ButtonRight_Y[0]=50-Rightmenu_top;
ButtonClose[0]=0;

ButtonRight_Sprite[1]=spr_robotUI;
ButtonRight_X[1]=-16;
ButtonRight_Y[1]=78-Rightmenu_top;

ButtonRight_Sprite[2]=spr_rubberUI;
ButtonRight_X[2]=-16;
ButtonRight_Y[2]=115-Rightmenu_top;

ButtonRight_Sprite[3]=spr_redocat_UI;
ButtonRight_X[3]=-16;
ButtonRight_Y[3]=145-Rightmenu_top;

ButtonRight_Sprite[4]=spr_undodog_UI;
ButtonRight_X[4]=-16;
ButtonRight_Y[4]=168-Rightmenu_top;

ButtonRight_Sprite[5]=spr_rocket_UI;
ButtonRight_X[5]=-16;
ButtonRight_Y[5]=196-Rightmenu_top;

Menus=3;
MenuClose[Menus-1]=0;
MenuOffset[Menus-1]=0;


/* */
///Editor object

switch_allow = true;

global.loaded=0;

global.draweditor=1;

enitityplace=-1;

gui_surf=-4;

grid_surf=-4;

selected_id=-1;
w=0; wt=0;

shadow_allow=false;

instance_create(64,340,obj_mario_editor);

state=0;
enum ControlState { normal, erase, searching }

VX=0;
VY=obj_controller.Window_H;

EntitySelected=-4;

Placing=0;
Dragging=0;

LatestEntity=-4;

Drag_id=-4;

//Level attributes
World=0;
Time=0;
Scroll=0; //Includes scrollspeed too
ClearCond=0;

infostring="";
infoalpha=0;

//Undo and redo variables
temp_index=-1;

undo_time=-1;
redo_time=-1;
delet_time=-1;
delet_pos=0;
delet_shake=0;

//Set if the controller is editing
global.editing=0;


savebot_open=0;




/* */
/*  */
