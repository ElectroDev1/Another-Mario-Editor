///scr_draw_message(x,y,string,opt1,opt2...)
var X=argument[0];
var Y=argument[1];
var message=argument[2];
var arr = array_create(argument_count-3);



var messagepadding=4;
var buttonpadding=4;



//Get the tallest input
var list = ds_list_create();

for(var a=0; a<array_length_1d(arr); a++){

    arr[a]=argument[a+3];

    ds_list_add(list, string_height(arr[a]) );
}

ds_list_sort(list,true);

var highestmessage=ds_list_find_value(list,0);


//ds_list_destroy(list);



//Get the width
var messagewidth = 0;

for(var a=0; a<array_length_1d(arr); a++){
    messagewidth += string_width(arr[a])/2+buttonpadding*2;
}
messagewidth+=buttonpadding*(array_length_1d(arr)-1);

if(messagewidth<string_width(message)/2){ messagewidth=string_width(message)/2; }



//Get the height
var messageheight= string_height(message)/2 + buttonpadding*2 
                   + highestmessage + buttonpadding*2 + messagepadding;



//Draw the base
var Left=X/2-messagewidth/2-messagepadding;
var Right=X/2+messagewidth/2+messagepadding;
var Top=Y/2-messageheight/2;
var Bottom=Y/2+messageheight/2;



draw_set_colour(c_white);
draw_set_alpha(0.6);
draw_rectangle(X/2-messagewidth/2-messagepadding,Y/2-messageheight/2,
               X/2+messagewidth/2+messagepadding,Y/2+messageheight/2,0);
               
//Draw the outline
draw_set_alpha(1);
draw_line_width(Left,Top,Left,Bottom,3);draw_line_width(Left,Top,Right,Top,3);
draw_line_width(Right,Top,Right,Bottom,3);draw_line_width(Left,Bottom,Right,Bottom,3);

//Draw the message
draw_set_valign(fa_top); draw_set_halign(fa_center); draw_set_colour(c_black);
draw_text_transformed(X/2,Y/2-messageheight/2+messagepadding,message,0.5,0.5,0);

//Draw the buttons
draw_set_valign(fa_middle);

if(array_length_1d(arr)>2){ 

 var offs=string_width(arr[0])/4 + (Right-Left)/(array_length_1d(arr)/2+0.75) +buttonpadding*2;
 
}else{

  var offs=string_width(arr[0])/4 + (Right-Left)/2 +buttonpadding*2;

}

for(var a=0; a<array_length_1d(arr); a++){
    if(a>0){offs+=string_width(arr[a-1])/4+string_width(arr[a])/4+buttonpadding*3;}
    
    var MX=offs+2//-messagewidth/( max(array_length_1d(arr)+1,1)/2)+buttonpadding;
    var MY=Bottom-messagepadding-buttonpadding+1;
    
    draw_set_colour(c_white);
    draw_rectangle(
    MX-string_width(arr[a])/4-buttonpadding/2,MY-string_height(arr[a])/4-buttonpadding/2,
       MX+string_width(arr[a])/4+buttonpadding/2,MY+string_height(arr[a])/4+buttonpadding/2,0);
    
    draw_set_colour(c_black);
    draw_text_transformed(MX,MY,arr[a],0.5,0.5,0);
    
    if(point_in_rectangle(device_mouse_x_to_gui(0),device_mouse_y_to_gui(0),
      MX-string_width(arr[a])/4-buttonpadding/2,MY-string_height(arr[a])/4-buttonpadding/2,
       MX+string_width(arr[a])/4+buttonpadding/2,MY+string_height(arr[a])/4+buttonpadding/2)){
     
       if(mouse_check_button_pressed(mb_left)){ show_debug_message(a+1); return a+1; }
         
    }
}
