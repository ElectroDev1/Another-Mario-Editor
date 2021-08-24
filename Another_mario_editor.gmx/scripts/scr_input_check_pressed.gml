///scr_input_check_pressed(enum)
var GP=0;
var key_
var key_2
key_=keyboard_check_pressed(global.keyboard[argument0]);
//key_2=keyboard_check_pressed(global.keyboard2[argument0]);

       for(a=0; a<12; a++){
       if(gamepad_is_connected(a)){
       GP+=gamepad_button_check_pressed(a,global.button[argument0]);  }      
       }
return GP+key_//+key_2;

