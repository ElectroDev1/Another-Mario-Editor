///rgb_to_bgr(real)
return (argument0 & $FF) << 16 | (argument0 & $FF00) | (argument0 & $FF0000) >> 16;
