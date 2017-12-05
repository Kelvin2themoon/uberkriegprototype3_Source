//update is standing statuf for all players
show_debug_message("update Standing: Global");

// reset all units
with obj_unit isStanding = false ;

with obj_property isStanding = false ;

// create and duplicate player Q
if global.P1_in_play    scr_updateStanding(global.P1);
if global.P2_in_play    scr_updateStanding(global.P2);
if global.P3_in_play    scr_updateStanding(global.P3);
if global.P4_in_play    scr_updateStanding(global.P4);






