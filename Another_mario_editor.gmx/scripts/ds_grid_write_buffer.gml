#define ds_grid_write_buffer
///ds_grid_write_buffer(grid[,decimals])
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

#define ds_grid_read_buffer
///ds_grid_read_buffer(buffer)
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

#define buffer_number_constant
///buffer_number_constant(min,max,dec)
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

#define ds_grid_dump
///ds_grid_dump(grid)
var g = argument0, ww = ds_grid_width(g), hh = ds_grid_height(g), s = "", i, j;

for (i=0;i < ww; ++i) {
    s += ",[ ";
        for (j=0;j<hh;++j) {
            s += string(g[# i,j]) + ", "
        }
    s += "]"
}

show_debug_message(s);