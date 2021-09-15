/// @description Draw the bridge
for(var a=0; a<image_xscale; a++){
    
    if(a==0){
    
       draw_sprite(spr_bridge_top,0,x+a*16,y-16);
       draw_sprite(spr_bridge_base,0,x+a*16,y);
       
    }else if(a>=image_xscale-1){
    
       draw_sprite(spr_bridge_top,2,x+a*16,y-16);
       draw_sprite(spr_bridge_base,2,x+a*16,y);
       
    }
    else{
    
       draw_sprite(spr_bridge_top,0,x+a*16,y-16);
       draw_sprite(spr_bridge_base,0,x+a*16,y);
       
    }

}

