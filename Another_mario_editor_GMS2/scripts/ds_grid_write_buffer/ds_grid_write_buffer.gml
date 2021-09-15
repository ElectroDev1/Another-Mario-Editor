/// @description ds_grid_write_buffer(grid[,decimals])
/// @param grid[
/// @param decimals]
function ds_grid_write_buffer() {

	/*
	This was a script I found online for an alterante way of saving level which would have made the level files
	a LOt smaller, sadly I can't seem to get it working
	*/

	var g = argument[0], ww = ds_grid_width(g), hh = ds_grid_height(g),
	    number_format, dec = false, header_size = 8 + 8 + 2;
 
	if (argument_count > 1)
	    dec = argument[1];

	number_format = buffer_number_constant(ds_grid_get_min(g, 0, 0, ww - 1, hh - 1),
	                                   ds_grid_get_max(g, 0, 0, ww - 1, hh - 1),
	                                   dec
	                );

	b = buffer_create(ww * hh * buffer_sizeof(number_format) + header_size, buffer_fixed, 1);
                          
	//write header to buffer
	//header: ww(64),hh(64),type(u16)
	buffer_write(b, buffer_u64, ww);
	buffer_write(b, buffer_u64, hh);
	buffer_write(b, buffer_u16, number_format);

	var i,j;

	for (i=0;i<hh;++i) {
	    for (j=0;j<ww;++j){
	        if (dec)
	            buffer_write(b, number_format, g[# j, i]);
	        else
	            buffer_write(b, number_format, floor(g[# j, i]));
	    }
	}

	return b;




}
