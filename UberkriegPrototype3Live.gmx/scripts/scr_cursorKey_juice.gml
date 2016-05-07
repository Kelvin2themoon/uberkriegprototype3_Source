/*
this code is used to juice key activated cursors on the main game or in menus

-   play a cursour click SFX
-   manage movement, accelleratioin, and delays (set alarm and frame delay variables)
-   graphic "pop" on position change

REQUIREMENTS:

-   an instance of obj_masterControls is active
-   sprite assigned to the target instance is a standard (to this game) 4 frame structure
    from widest to shortest
-   alarm event is active
-   assign variable  image_index = global.cursorFrameIndex ;
-   proper checks for ve_nokey, pressed & release for relative keys

see battle curosr basic for use esample   


Call this code after
keyboard_key action is called in a switch after position change

*/

cusorKeyJuice_alarm = argument0;    //assign alarm, make sure event exsist (int)
cusorKeyJuice_sfx   = argument1;    //assign sfx

global.cursorFrame = global.cursorKey_popFrame;
audio_play_sound(cusorKeyJuice_sfx, 1, 0);
alarm[cusorKeyJuice_alarm] = global.cursorKey_delay;

while ( global.cursorKey_delay > global.cursorKey_topspeed ){
global.cursorKey_delay = global.cursorKey_delay - global.cursorKey_accel;
}





