/// @description scr_input_check(enum)
/// @param enum
function scr_input_check(argument0) {
	var GP=0;
	var key_
	var key_2
	key_=keyboard_check(global.keyboard[argument0]);
	//key_2=keyboard_check(global.keyboard2[argument0]);

	       for(a=0; a<12; a++){
	       if(gamepad_is_connected(a)){
	       GP+=gamepad_button_check(a,global.button[argument0]);  }      
	       }
	return GP+key_//+key_2;




}
