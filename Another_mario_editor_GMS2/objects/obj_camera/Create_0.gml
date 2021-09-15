Object=obj_playerparent;
shake = 0; 
shakeV=0;
image_alpha=0;
SpeedH=0.125;
SpeedV=0.125;
XSPD=0;
YSPD=0;
canH=1;
canV=1;

if(instance_exists(Object)){
 __view_set(e__VW.XView, 0, Object.x);
 __view_set(e__VW.YView, 0, Object.y);
}