


if(file_exists(working_directory+"\\Levels\\"+global.level_filename)&&(room==rm_editor)&&(!global.loaded)){
   event_user(1);
   global.loaded=1;
}


enitityplace=-1;

gui_surf=-4;

grid_surf=-4;

selected_id=-1;

state=0;

if (!view_enabled)&&(room==rm_editor || room==rm_ingame) {


   __view_set( e__VW.Visible, 0, true );
   __view_set( e__VW.WView, 0, obj_controller.Window_W );
   __view_set( e__VW.HView, 0, obj_controller.Window_H );
   __view_set( e__VW.WPort, 0, obj_controller.Window_W );
   __view_set( e__VW.HPort, 0, obj_controller.Window_H );
   __view_set( e__VW.YView, 0, VY );
   __view_set( e__VW.XView, 0, VX );
   view_enabled=true;

}

global.editing=0;

