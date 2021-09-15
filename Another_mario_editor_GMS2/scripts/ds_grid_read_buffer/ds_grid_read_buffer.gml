/// @description ds_grid_read_buffer(buffer)
/// @param buffer
function ds_grid_read_buffer() {
	var b = argument[0], ww, hh, g, /*header_size = 8 + 8 + 2, */number_format;

	buffer_seek(b, buffer_seek_start, 0);

	// extract header
	ww = buffer_read(b, buffer_u64);
	hh = buffer_read(b, buffer_u64);
	number_format = buffer_read(b, buffer_u16);

	g = ds_grid_create(ww, hh);

	var i,j;

	for (i=0;i<hh;++i) {
	    for (j=0;j<ww;++j){
	        g[# j,i] = buffer_read(b, number_format);
	    }
	}

	return g;




}
