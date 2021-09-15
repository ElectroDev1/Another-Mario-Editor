draw_set_blend_mode_ext(bm_one, bm_inv_src_alpha);
draw_surface_stretched(application_surface,0,0,window_get_width(),window_get_height());
draw_set_blend_mode(bm_normal);

