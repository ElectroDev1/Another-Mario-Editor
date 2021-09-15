/// @description ds_grid_dump(grid)
/// @param grid
function ds_grid_dump(argument0) {
	var g = argument0, ww = ds_grid_width(g), hh = ds_grid_height(g), s = "", i, j;

	for (i=0;i < ww; ++i) {
	    s += ",[ ";
	        for (j=0;j<hh;++j) {
	            s += string(g[# i,j]) + ", "
	        }
	    s += "]"
	}

	show_debug_message(s);



}
