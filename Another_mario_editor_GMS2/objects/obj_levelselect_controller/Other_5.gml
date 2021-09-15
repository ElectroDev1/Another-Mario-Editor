/// @description Free everything
for(var a=0; a<global.level_numb; a++){
    sprite_delete(buttonsprite[a]);
}

sprite_delete(topsprite);
sprite_delete(backsprite);

