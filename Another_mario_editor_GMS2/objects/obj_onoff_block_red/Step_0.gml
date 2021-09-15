image_index=global.switchstate;

//Change solid state
if(!global.switchstate){
   if(!instance_exists(sld)){ instance_activate_object(sld); }
}
else{
   if(instance_exists(sld)){ instance_deactivate_object(sld); }
}

