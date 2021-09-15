if(room!=rm_editor || global.closing){exit;}

if(scr_input_check(input.left)){
   x-=4;
}

if(scr_input_check(input.right)){
   x+=4;
}


if(scr_input_check(input.up)){
   y-=4;
}

if(scr_input_check(input.down)){
   y+=4;
}

//Adjust the view
if(x<__view_get( e__VW.XView, 0 )+4) && (__view_get( e__VW.XView, 0 )>0){ __view_set( e__VW.XView, 0, __view_get( e__VW.XView, 0 ) - (4) ); }
if(x>__view_get( e__VW.XView, 0 )+__view_get( e__VW.WView, 0 )-4) && (__view_get( e__VW.XView, 0 )+__view_get( e__VW.WView, 0 )<room_width){ __view_set( e__VW.XView, 0, __view_get( e__VW.XView, 0 ) + (4) ); }

if(y<__view_get( e__VW.YView, 0 )+4) && (__view_get( e__VW.YView, 0 )>0){ __view_set( e__VW.YView, 0, __view_get( e__VW.YView, 0 ) - (4) ); }
if(y>__view_get( e__VW.YView, 0 )+__view_get( e__VW.HView, 0 )-4) && (__view_get( e__VW.YView, 0 )+__view_get( e__VW.HView, 0 )<room_height){ __view_set( e__VW.YView, 0, __view_get( e__VW.YView, 0 ) + (4) ); }


x=max(x,__view_get( e__VW.XView, 0 )+4);
x=min(x, __view_get( e__VW.XView, 0 )+__view_get( e__VW.WView, 0 )-4);

y=max(y,__view_get( e__VW.YView, 0 )+4);
y=min(y, __view_get( e__VW.YView, 0 )+__view_get( e__VW.HView, 0 )-4);

shake*=0.9;


