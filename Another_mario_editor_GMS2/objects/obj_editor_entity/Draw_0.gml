var select=position_meeting(mouse_x,mouse_y,id);

if(select)&&(global.draweditor)&&(!global.closing){

   
        if(!collision_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,obj_editor_entity,0,1)){draw_set_colour(c_blue);}else{draw_set_colour(c_red);}
        draw_set_alpha(0.6);
        draw_rectangle(bbox_left+1,bbox_top+1,bbox_right+1,bbox_bottom+1,0);
        draw_set_alpha(1);
        draw_set_colour(c_white);

}



if(UsesSprite)&&(DrawSprite){

   switch(UsesSprite){

          default:
             draw_sprite_ext(UsesSprite,image_index,x,y,image_xscale,image_yscale,Angle,c_white,1);
          break;
   
   }
   
   sprite_index=UsesSprite;
}


//Special behaviours


switch(Entity_id){

       case "Arrow":
       
          if(global.draweditor && !global.closing){
            draw_sprite_ext(spr_arrow_entity,0,x,y,
            1+0.2*w,1+0.2*w,Angle,c_white,1);
          }
          
          depth=3;
          
       break;
       
          
       
       break;
       
       
       case "Firebar":
       
            depth=-1;
            Attribute[Attributes.Width]=max(3,Attribute[Attributes.Width]);
            
            for(var a=0; a<Attribute[Attributes.Width]; a++){
                draw_sprite(spr_firebar,0,
                x+9 + lengthdir_x(9*a, Attribute[Attributes.Direction]),
                y+9 + lengthdir_y(9*a, Attribute[Attributes.Direction]));
            }
            
            if(global.draweditor && !global.closing){
            draw_sprite_ext(spr_extend_circle,0,
            x+9 + lengthdir_x(9*Attribute[Attributes.Width], Attribute[Attributes.Direction]),
            y+9 + lengthdir_y(9*Attribute[Attributes.Width], Attribute[Attributes.Direction]),
            1+0.2*w,1+0.2*w,0,c_white,1);
            
            if(point_in_circle(mouse_x,mouse_y,
            x+9 + lengthdir_x(9*Attribute[Attributes.Width], Attribute[Attributes.Direction]),
            y+9 + lengthdir_y(9*Attribute[Attributes.Width], Attribute[Attributes.Direction]),9)){
               if(mouse_check_button_pressed(mb_left)&&(!global.closing)){ with(obj_editor_controller){enitityplace=0; selected_id=-1;} global.editing=1; Edited=1;  }
            }
            }
            
            
            if(Edited){
            
               //Initialize circle collisions
               var collision_list=ds_map_create();
               
               for(var a=0; a<Attribute[Attributes.Width]; a++){
                   ds_map_add(collision_list,string(a),
                   point_in_circle(mouse_x,mouse_y,
                   x+9 + lengthdir_x(9*a, Attribute[Attributes.Direction]),
                   y+9 + lengthdir_y(9*a, Attribute[Attributes.Direction]), 9+9*a ));
                   
                   draw_set_alpha(0.3);
                   
                   if(collision_list[? string(a)]){draw_set_colour(c_green);}else{draw_set_colour(c_red);}
                   draw_circle(x+9,y+9,9+9*a,0);
                   
                   draw_set_alpha(1);
                   
               }
               
               if(collision_list[? string(Attribute[Attributes.Width])]==0){  Attribute[Attributes.Width]++; with(obj_editor_controller){ event_user(2); } }
            
            }
       
       break;
       
       
       case "Bridge":
       
            depth=2;
       
            Attribute[Attributes.Width]=max(3,Attribute[Attributes.Width]);
            DrawSprite=0;
            image_xscale=Attribute[Attributes.Width];
            
       
            for(var a=0; a<image_xscale; a++){
    
            if(a==0){
    
              draw_sprite(spr_bridge_top,0,bbox_left+a*16,y-16);
              draw_sprite(spr_bridge_base,0,bbox_left+a*16,y);
              
              if(global.draweditor && !global.closing){draw_sprite_ext(spr_extend_circle,0,bbox_left+a*16+8,y+8,1+0.2*w,1+0.2*w,Angle,c_white,1);}
              
              //Drag to the left
              if(point_in_circle(mouse_x,mouse_y,bbox_left+a*16+8,y+8,9)){
                 if(mouse_check_button_pressed(mb_left)&&(!global.closing)&&(!Edited)){ prev_value=Attribute[Attributes.Width]; global.editing=1; Edited=1; with(obj_editor_controller){enitityplace=0; selected_id=-1;} }
              }
       
           }else if(a>=image_xscale-1){
    
              draw_sprite(spr_bridge_top,2,bbox_left+a*16,y-16);
              draw_sprite(spr_bridge_base,2,bbox_left+a*16,y);
              
              if(global.draweditor && !global.closing){draw_sprite_ext(spr_extend_circle,0,bbox_left+a*16+8,y+8,1+0.2*w,1+0.2*w,Angle,c_white,1);}
              
              //Drag to the left
              if(point_in_circle(mouse_x,mouse_y,bbox_left+a*16+8,y+8,9)){
                 if(mouse_check_button_pressed(mb_left)&&(!global.closing)&&(!Edited)){ prev_value=Attribute[Attributes.Width]; global.editing=1; Edited=2; with(obj_editor_controller){enitityplace=0; selected_id=-1;} }
              }
       
           }
           else{
    
              draw_sprite(spr_bridge_top,0,bbox_left+a*16,y-16);
              draw_sprite(spr_bridge_base,0,bbox_left+a*16,y);
       
           }

         }
         
         if(Edited==1){ if(mouse_x<bbox_left-6){ Attribute[Attributes.Width]++; x-=16; } 
                        if(mouse_x>bbox_left+16+6)&&(Attribute[Attributes.Width]>3){ Attribute[Attributes.Width]--; x+=16; }
         }
         
         if(Edited==2){ if(mouse_x>bbox_right+6){ Attribute[Attributes.Width]++;} 
                        if(mouse_x<bbox_right-16-6)&&(Attribute[Attributes.Width]>3){ Attribute[Attributes.Width]--; }
         }
         
         if(Edited && mouse_check_button_released(mb_left)){ global.editing=0; }
         
       
       break;

}


if(mouse_check_button_released(mb_left))&&(Edited){ if(prev_value!=Attribute[Attributes.Width]){with(obj_editor_controller){event_user(2);}} global.editing=0; Edited=0; }


if(global.closing){ global.editing=0; Edited=0; }

