with obj_starting state = "fade out"

//change phasze to "upkeep"
global.Phaze = "Upkeep";
//change BGM************************************************************************************************************************************tempBGM
if global.BGM_on{
    audio_stop_sound(global.BGM);
    audio_destroy_stream(global.BGM);
    global.BGM = audio_create_stream(global.tempBGM[global.P_Turn.number]);
    audio_sound_gain(global.BGM,0.7,0);
    audio_play_sound(global.BGM,1,true);
    }
//audio cue for new turn in netowrk mode
audio_play_sound(sfx_bark,2,false); 
            
