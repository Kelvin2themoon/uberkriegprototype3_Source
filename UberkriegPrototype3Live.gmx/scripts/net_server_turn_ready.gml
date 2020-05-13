/*
instructions from server to start next turn
AFTER new server turn finnished with upkeep and is ready to accept new player actions 
so game does not desync
*/

argument0 = file_name;

with obj_starting {
     //switch to "fad out"
     state = "fade out"
     //change phasze to "main"
     global.Phaze = "Upkeep";
    }
