/// @description Camera logic
visible=global.debug;


//Set the final position
__view_set( e__VW.XView, 0, (round(-(__view_get( e__VW.WView, view_current )/2) + x)+obj_controller.ViewXoffset) );
__view_set( e__VW.YView, 0, (round(-(__view_get( e__VW.HView, view_current )/2) + y+32+8)+obj_controller.ViewYoffset) ); 

//Move to the object
if(instance_exists(Object)){
x=lerp(x,Object.x,SpeedH*canH);
y=lerp(y,Object.y-32,SpeedV*canV);
}

//Keep the camera at bay

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

//Shake the view position
__view_set( e__VW.XView, view_current, __view_get( e__VW.XView, view_current ) + (random_range(-shake,shake)) );
__view_set( e__VW.YView, view_current, __view_get( e__VW.YView, view_current ) + (random_range(-shakeV,shakeV)) );

//Multiply shake
shake *= 0.9;
shakeV *=0.9;

XSPD=x-xprevious;
YSPD=y-yprevious;

