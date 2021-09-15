if(vspeed<3){ vspeed+=0.4; }
else if(vspeed<10){ vspeed+=0.6; }

if(y>__view_get( e__VW.YView, 0 )+__view_get( e__VW.HView, 0 )+100){ instance_destroy(); }

image_angle+=vspeed;

