/// @description buffer_number_constant(min,max,dec)
/// @param min
/// @param max
/// @param dec
function buffer_number_constant(argument0, argument1, argument2) {
	var small = min(argument0, argument1), big = max(argument0, argument1),
	    dec = argument2, unsigned = small >= 0;

	if (dec) {
	    //floats
	    if (small > -16777216 && big < 16777216)
	        return buffer_f32;
	    else return buffer_f64;
	} else {
	    //ints
	    if (unsigned) {
	        if (big <= 255)
	            return buffer_u8;
	        else if (big <= 65535)
	            return buffer_u16;
	        else if (big <= 4294967295)
	            return buffer_u32;
	        else return buffer_u64;
	    } else {
	        if (small >= -128 && big <= 127)
	            return buffer_s8;
	        else if (small >= -32768 && big <= 32767)
	            return buffer_s16;
	        else /*if (small >= -2147483648 && big <= 2147483647)*/
	            return buffer_s32;
	    }
	}




}
