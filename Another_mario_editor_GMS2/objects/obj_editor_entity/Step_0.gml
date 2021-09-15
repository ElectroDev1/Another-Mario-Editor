if(tile_exists(tile)){
   tile_set_position(tile,x+1,y+1);
}

wt++;
w=sin(wt*0.1);

Angle=scr_approach(Angle,Attribute[Attributes.Direction],5);

if(Angle>=360){Angle-=360; Attribute[Attributes.Direction]-=360;}

