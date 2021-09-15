if(room!=rm_editor){exit;}


depth=6;

draw_background(bkg_plains,__view_get( e__VW.XView, 0 )-__view_get( e__VW.XView, 0 )/10,room_height-background_get_height(bkg_plains));

var tabheight=36;
var tabwidth=33;

if(!global.closing){

//Draw the grid
if(!surface_exists(grid_surf)){
   grid_surf=surface_create(room_width,room_height);
}else{

   surface_set_target(grid_surf);
   
     for(var a=0; a<room_width/16; a++){
     
         draw_set_alpha(0.25);         
         draw_set_colour(c_blue);
         
         if(16*a>=__view_get( e__VW.XView, 0 ))&&(16*a<__view_get( e__VW.XView, 0 )+__view_get( e__VW.WView, 0 )){draw_line_width(16*a,__view_get( e__VW.YView, 0 ),16*a,__view_get( e__VW.YView, 0 )+__view_get( e__VW.HView, 0 ),2);}                  
         
         draw_set_colour(c_white);
         
         draw_set_alpha(1);
     
     }
     
     
     
     for(var a=0; a<room_height/16; a++){
     
         draw_set_alpha(0.25);         
         draw_set_colour(c_blue);
         
         if(16*a>=__view_get( e__VW.YView, 0 ))&&(16*a<__view_get( e__VW.YView, 0 )+__view_get( e__VW.HView, 0 )){draw_line_width(__view_get( e__VW.XView, 0 ),16*a,__view_get( e__VW.XView, 0 )+__view_get( e__VW.WView, 0 ),16*a,2);}                  
         
         draw_set_colour(c_white);
         
         draw_set_alpha(1);
     
     }
   
   surface_reset_target();
   
   if(global.draweditor){draw_surface(grid_surf,0,0);}

}



//Select logic
if(state==ControlState.normal){

 if(selected_id>=0){

  if(enitityplace){

   //Get the id of what we want to place
   switch(global.selected_entity[selected_id]){
   
           case "Semis" :
           
                 
           
           break;
           
           default: 
           
           draw_sprite_ext(
           global.spritemap[? global.selected_entity[selected_id]],0,
           device_mouse_x(0),device_mouse_y(0),1,1,0,c_white,1);
           
           break;
           
           case "Arrow" :
           
           draw_sprite_ext(
           spr_arrow,0,
           device_mouse_x(0),device_mouse_y(0),1,1,0,c_white,1);
           
           break;
           
           case "Bridge" :
           
           draw_sprite_ext(
           spr_bridge_base,0,device_mouse_x(0),device_mouse_y(0),1,1,0,c_white,1);
           draw_sprite_ext(
           spr_bridge_top,0,device_mouse_x(0),device_mouse_y(0)-16,1,1,0,c_white,1);
           
           draw_sprite_ext(
           spr_bridge_base,1,device_mouse_x(0)+16,device_mouse_y(0),1,1,0,c_white,1);
           draw_sprite_ext(
           spr_bridge_top,1,device_mouse_x(0)+16,device_mouse_y(0)-16,1,1,0,c_white,1);
           
           draw_sprite_ext(
           spr_bridge_base,2,device_mouse_x(0)+32,device_mouse_y(0),1,1,0,c_white,1);
           draw_sprite_ext(
           spr_bridge_top,2,device_mouse_x(0)+32,device_mouse_y(0)-16,1,1,0,c_white,1);
           
           break;
           
   
   }
   
   
   if(mouse_check_button(mb_left))&&(device_mouse_y(0)>__view_get( e__VW.YView, 0 )+Topmenu_height+4-Topmenu_height*MenuOffset[0])&&
   (device_mouse_x(0)>__view_get( e__VW.XView, 0 )+Leftmenu_width+4-Leftmenu_width*MenuOffset[2])&&
   (device_mouse_x(0)<__view_get( e__VW.XView, 0 )+__view_get( e__VW.WView, 0 )-Rightmenu_width-6+Rightmenu_width*MenuOffset[1])
   &&(!instance_exists(obj_reset_rocket)&&!Dragging)&&(!EntitySelected){
   
      with(instance_create(device_mouse_x(0)-8,device_mouse_y(0)-8,obj_editor_entity)){
      
           Entity_id=global.selected_entity[other.selected_id];
      
           //Special properties
           switch(Entity_id){
                                    
                  case "Arrow": UsesSprite=spr_arrow; x++; y++;  break;
                  case "Bridge": UsesSprite=spr_bridge_base; x++; y++; break;
                  
           }
      
           
           move_snap(16,16)
           other.Placing=1;//alarm[1]=1;
           other.LatestEntity=id;
      
      }
      
      
   
   }
 
  }


 }
 
 global.cursor=spr_cursor;
 
}else if(state=ControlState.erase){

   global.cursor=spr_eraser;

}

}else{ global.cursor=spr_cursor; }

