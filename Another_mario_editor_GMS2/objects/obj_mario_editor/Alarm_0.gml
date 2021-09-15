 instance_create(x,y,obj_playerparent);
        obj_camera.x=x;
       obj_camera.y=y;
       
       if(!collision_rectangle(bbox_left+1,bbox_bottom-2,bbox_right-1,room_height,obj_semisolid,0,0)){
          for(var a=-1; a<2; a++){
              instance_create(x+16*a,bbox_bottom+9,obj_pinkplatform);
          }
       }

