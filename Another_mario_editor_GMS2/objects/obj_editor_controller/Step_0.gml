/// @description Editor logic

with(obj_controller){ if(idling<3700){idling++;} }


if(room!=rm_editor || global.closing){exit;}

global.state="In the editor";
global.details="Editing level '"+string(global.level_filename)+"'";
global.icon="rpc_edit";

//Update menu positions

    MenuOffset[0]=scr_approach(MenuOffset[0],MenuClose[0],0.1);
    MenuOffset[1]=scr_approach(MenuOffset[1],MenuClose[1],0.1);
    MenuOffset[2]=scr_approach(MenuOffset[2],MenuClose[2],0.1);


EntitySelected=obj_mousechek.entitycollision;

w=sin(wt*0.1);
wt++;

//Get the entity id
if(state==ControlState.normal){

 //Select object from menu
 for(var a=0; a<12; a++){

    var X=40+27*a;

    //Place
    if(point_in_rectangle(device_mouse_x(0),device_mouse_y(0),
    __view_get( e__VW.XView, 0 )+X-10,__view_get( e__VW.YView, 0 )+20-12-Topmenu_height*MenuOffset[0],
    __view_get( e__VW.XView, 0 )+X+11,__view_get( e__VW.YView, 0 )+20+12-Topmenu_height*MenuOffset[0])){
    
       if(mouse_check_button_pressed(mb_left)){with(obj_controller){ idling=0; } state=ControlState.normal; enitityplace=1; selected_id=a;}
    
    }    
 }
 
 //Select an onject
 if(EntitySelected){
 
 
 
    if(mouse_check_button_pressed(mb_right)){
       
       //Get out of the placing state
       enitityplace=0; selected_id=-1;
       global.editing=0;
       
       
       //Get the entity id
      
       /*
       if(entity.UsesSprite){
          var xoff = sprite_get_xoffset(entity.UsesSprite);
          var yoff = sprite_get_yoffset(entity.UsesSprite);
          instance_create(entity.x+xoff,entity.y+yoff,obj_ring_effect);
       }else{
          instance_create(entity.x-32,entity.y-32,obj_ring_effect);
       }*/
       
       
       
       
       //Interact with the entity
       with(EntitySelected){
       
            switch(Entity_id){
                   case "Arrow":  Attribute[Attributes.Direction]+=45; with(other){event_user(2);} break;
            }
       
       }
       
       
       
    }else if(mouse_check_button_pressed(mb_left)&&(!global.editing)){
    
        Drag_id=EntitySelected;
      
    }
 
 }
 
 //Drag
 if(mouse_check_button(mb_left))
 &&(device_mouse_y(0)>__view_get( e__VW.YView, 0 )+Topmenu_height+4-Topmenu_height*MenuOffset[0])&&
   (device_mouse_x(0)>__view_get( e__VW.XView, 0 )+Leftmenu_width+4-Leftmenu_width*MenuOffset[2])&&
   (device_mouse_x(0)<__view_get( e__VW.XView, 0 )+__view_get( e__VW.WView, 0 )-Rightmenu_width-6+Rightmenu_width*MenuOffset[1])
   &&(!instance_exists(obj_reset_rocket)){
    
        if(Dragging<1)&&(instance_exists(Drag_id))&&(EntitySelected)&&(!Placing){ if(Drag_id!=LatestEntity)&&(Drag_id.Edited==0){ Dragging+=0.35; } }
 
        if(Dragging>=1)&&(instance_exists(Drag_id))&&(!Placing){
        
           //Get out of the placing state
           enitityplace=0; selected_id=-1;
       
       
           //Get the entity id
           var entity = Drag_id;
           
           if(entity.UsesSprite==-4){ var off=-8; }else{ var off=0; }
           
           entity.x=mouse_x+off; entity.y=mouse_y+off;
           with(entity){move_snap(16,16);}
        
        }
      
 }else{ if(Dragging>=1){event_user(2);} Dragging=0; }
 
 if(point_in_circle(device_mouse_x(0),device_mouse_y(0),__view_get( e__VW.XView, 0 )+__view_get( e__VW.WView, 0 )+ButtonRight_X[2]+Rightmenu_width*MenuOffset[1],
 __view_get( e__VW.YView, 0 )+ButtonRight_Y[2]+Rightmenu_top,10)){
    if(mouse_check_button_pressed(mb_left)){with(obj_controller){ idling=0; } state=ControlState.erase; global.cursor_angle=0;}
 }
 
 
}else if(state==ControlState.erase){//Eraser

  if(mouse_check_button(mb_left)){
  
     global.cursor_angle=45;
     with(obj_controller){ idling=0; }
     
     if(point_in_rectangle(device_mouse_x(0),device_mouse_y(0),obj_mario_editor.bbox_left,obj_mario_editor.bbox_top,obj_mario_editor.bbox_right,obj_mario_editor.bbox_bottom)){
        with(obj_mario_editor){
             sprite_index=spr_mario_crouch;
             shake=3;
        }
     }else{
          with(obj_mario_editor){
             sprite_index=spr_mario_idle;
             shake=0;
        }
     }

     
      
     
     if(EntitySelected){
     
        
        with(EntitySelected){ 
        
 
         instance_destroy(); 
        
        }
        Placing=1;
     
     }
     
       
  }else if(mouse_check_button_released(mb_left)){
     global.cursor_angle=0;
     
        with(obj_mario_editor){
             sprite_index=spr_mario_idle;
             shake=0;
        }
     
     
  }
  
  
  //Rubber
  if(point_in_circle(device_mouse_x(0),device_mouse_y(0),__view_get( e__VW.XView, 0 )+__view_get( e__VW.WView, 0 )+ButtonRight_X[2]+Rightmenu_width*MenuOffset[1],__view_get( e__VW.YView, 0 )+ButtonRight_Y[2]+Rightmenu_top,10)){
  
   if(mouse_check_button_pressed(mb_left)){with(obj_controller){ idling=0; } state=ControlState.normal; global.cursor_angle=0;}

  }


}
 
//Buttons-------------
if(state!=ControlState.searching){


//Search
if(point_in_rectangle(device_mouse_x(0),device_mouse_y(0),
   __view_get( e__VW.XView, 0 )+__view_get( e__VW.WView, 0 )-17-sprite_get_xoffset(spr_magnUI),
   __view_get( e__VW.YView, 0 )+21-sprite_get_yoffset(spr_magnUI)-Topmenu_height*MenuOffset[0],
   __view_get( e__VW.XView, 0 )+__view_get( e__VW.WView, 0 )-17+sprite_get_xoffset(spr_magnUI),
   __view_get( e__VW.YView, 0 )+21+sprite_get_yoffset(spr_magnUI)-Topmenu_height*MenuOffset[0]
   )){
   
      //if(mouse_check_button_pressed(mb_left)){ state=ControlState.searching; }
   
}


//Savebot
if(point_in_rectangle(device_mouse_x(0),device_mouse_y(0),

   __view_get( e__VW.XView, 0 )+__view_get( e__VW.WView, 0 )+Rightmenu_width*MenuOffset[1]+ButtonRight_X[1]-sprite_get_xoffset(ButtonRight_Sprite[1]),
   __view_get( e__VW.YView, 0 )+ButtonRight_Y[1]+Rightmenu_top-sprite_get_yoffset(ButtonRight_Sprite[1]),
   __view_get( e__VW.XView, 0 )+__view_get( e__VW.WView, 0 )+Rightmenu_width*MenuOffset[1]+ButtonRight_X[1]+sprite_get_xoffset(ButtonRight_Sprite[1]),
   __view_get( e__VW.YView, 0 )+ButtonRight_Y[1]+Rightmenu_top+sprite_get_yoffset(ButtonRight_Sprite[1])
   
   )){
   
    if(mouse_check_button_pressed(mb_left)){with(obj_controller){ idling=0; } enitityplace=0; selected_id=-1;  global.closing=2; }
   
}


//Undo
if(point_in_rectangle(device_mouse_x(0),device_mouse_y(0),

   __view_get( e__VW.XView, 0 )+__view_get( e__VW.WView, 0 )+Rightmenu_width*MenuOffset[1]+ButtonRight_X[4]-sprite_get_xoffset(ButtonRight_Sprite[4]),
   __view_get( e__VW.YView, 0 )+ButtonRight_Y[4]+Rightmenu_top-sprite_get_yoffset(ButtonRight_Sprite[4]),
   __view_get( e__VW.XView, 0 )+__view_get( e__VW.WView, 0 )+Rightmenu_width*MenuOffset[1]+ButtonRight_X[4]+sprite_get_xoffset(ButtonRight_Sprite[4]),
   __view_get( e__VW.YView, 0 )+ButtonRight_Y[4]+Rightmenu_top+sprite_get_yoffset(ButtonRight_Sprite[4])
   
   )){
  
   if(mouse_check_button_pressed(mb_left)&&(!instance_exists(obj_reset_rocket))){ undo_time=0; } 

   if(mouse_check_button(mb_left) && (undo_time>=0)){
      if(undo_time<1.05){undo_time+=0.025;}else{ event_user(3); undo_time=-1; }
   }
   
   
}else{ undo_time=-1; }


//Redo
if(point_in_rectangle(device_mouse_x(0),device_mouse_y(0),

   __view_get( e__VW.XView, 0 )+__view_get( e__VW.WView, 0 )+Rightmenu_width*MenuOffset[1]+ButtonRight_X[3]-sprite_get_xoffset(ButtonRight_Sprite[3]),
   __view_get( e__VW.YView, 0 )+ButtonRight_Y[3]+Rightmenu_top-sprite_get_yoffset(ButtonRight_Sprite[3]),
   __view_get( e__VW.XView, 0 )+__view_get( e__VW.WView, 0 )+Rightmenu_width*MenuOffset[1]+ButtonRight_X[3]+sprite_get_xoffset(ButtonRight_Sprite[3]),
   __view_get( e__VW.YView, 0 )+ButtonRight_Y[3]+Rightmenu_top+sprite_get_yoffset(ButtonRight_Sprite[3])
   
   )){
  
   if(mouse_check_button_pressed(mb_left)&&(!instance_exists(obj_reset_rocket))){ with(obj_controller){ idling=0; } redo_time=0; } 

  if(mouse_check_button(mb_left) && (redo_time>=0)){
      if(redo_time<1.05){redo_time+=0.025;}else{ event_user(4); redo_time=-1; }
   }
   
   
}else{ redo_time=-1; }



//Delete
if(point_in_rectangle(device_mouse_x(0),device_mouse_y(0),

   __view_get( e__VW.XView, 0 )+__view_get( e__VW.WView, 0 )+Rightmenu_width*MenuOffset[1]+ButtonRight_X[5]-sprite_get_xoffset(ButtonRight_Sprite[5]),
   __view_get( e__VW.YView, 0 )+ButtonRight_Y[5]+Rightmenu_top-sprite_get_yoffset(ButtonRight_Sprite[5]),
   __view_get( e__VW.XView, 0 )+__view_get( e__VW.WView, 0 )+Rightmenu_width*MenuOffset[1]+ButtonRight_X[5]+sprite_get_xoffset(ButtonRight_Sprite[5]),
   __view_get( e__VW.YView, 0 )+ButtonRight_Y[5]+Rightmenu_top+sprite_get_yoffset(ButtonRight_Sprite[5])
   
   )){
  
   if(mouse_check_button_pressed(mb_left)&&(!instance_exists(obj_reset_rocket))){ with(obj_controller){ idling=0; } delet_time=0; } 

   
   
   if(mouse_check_button(mb_left) && (delet_time>=0)){
   
      delet_shake=1;
   
      if(delet_time<1.05){delet_time+=0.025;}else{ 
         
          if(delet_pos<2){
             delet_pos++; delet_time=0;
          }else{
            event_user(5); delet_pos=0; delet_time=-1; 
          }
          
      }
   }
   else{ delet_shake=scr_approach(delet_shake,0,0.2); delet_pos=0; delet_time=-1;  }
   
   //if(mouse_check_button_released(mb_left)){ surface_free(gui_surf); }
   
   
   
}else{ delet_shake=scr_approach(delet_shake,0,0.2); delet_time=-1; delet_pos=0; }

ButtonRight_X[5]=-16+random_range(-delet_shake,delet_shake);
ButtonRight_Y[5]=196-Rightmenu_top+random_range(-delet_shake,delet_shake);


//Shadow mario
if(point_in_rectangle(device_mouse_x(0),device_mouse_y(0),
   __view_get( e__VW.XView, 0 )+Leftmenu_width*MenuOffset[2]+ButtonLeft_X[3]-sprite_get_xoffset(ButtonLeft_Sprite[3]),
   __view_get( e__VW.YView, 0 )+Leftmenu_top+ButtonLeft_Y[3]-sprite_get_yoffset(ButtonLeft_Sprite[3]),
   __view_get( e__VW.XView, 0 )+Leftmenu_width*MenuOffset[2]+ButtonLeft_X[3]+sprite_get_xoffset(ButtonLeft_Sprite[3]),
   __view_get( e__VW.YView, 0 )+Leftmenu_top+ButtonLeft_Y[3]+sprite_get_yoffset(ButtonLeft_Sprite[3])
   )){
   
   if(mouse_check_button_pressed(mb_left)){
      with(obj_controller){ idling=0; }
      shadow_allow=!shadow_allow;
   }
   
}
   





//Released event
if(mouse_check_button_released(mb_left)){ 
   
   if(Placing){  event_user(2); }

   if(Dragging>=1)&&(!Placing){
      with(Drag_id){if(collision_rectangle(bbox_left+1,bbox_top+1,bbox_right-1,bbox_bottom-1,obj_editor_entity,0,1)){instance_destroy();}}
      event_user(2);
   }
   

   Placing=0;
   Dragging=0;
   LatestEntity=-4;
   undo_time=-1;
   redo_time=-1;
   global.editing=0;
   with(obj_controller){ idling=0; }
   
} 

}

//Up
if(__view_get( e__VW.YView, view_current )<64){__view_set( e__VW.YView, view_current, __view_get( e__VW.YView, view_current ) + (8) ); __view_set( e__VW.YView, view_current, 64 );}

//Left border
if(__view_get( e__VW.XView, view_current )<0){
__view_set( e__VW.XView, view_current, __view_get( e__VW.XView, view_current ) + (8) ); __view_set( e__VW.XView, view_current, 0 );}

//Right border
if(__view_get( e__VW.XView, view_current )>room_width-__view_get( e__VW.WView, view_current )){
__view_set( e__VW.XView, view_current, room_width-__view_get( e__VW.WView, view_current ) );}

//Down
if(__view_get( e__VW.YView, view_current )>room_height-__view_get( e__VW.HView, view_current )+8){
__view_set( e__VW.YView, view_current, __view_get( e__VW.YView, view_current ) - (8) ); __view_set( e__VW.YView, view_current, room_height-__view_get( e__VW.HView, view_current )+8 );}


__view_set( e__VW.YView, 0, min(__view_get( e__VW.YView, 0 ),room_height-__view_get( e__VW.HView, 0 )-8) );


/* */
/*  */
