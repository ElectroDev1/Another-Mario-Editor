audio_stop_sound(music);

global.makersong=audio_play_sound(snd_ground_maker,0,1);
audio_sound_gain(global.makersong,0.75,0);
global.playsong=audio_play_sound(snd_ground,0,1);
audio_sound_gain(global.playsong,0,0);
room_goto(rm_editor);


