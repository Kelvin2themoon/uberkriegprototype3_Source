//update is standing statuf for all players

// reset all units
with obj_unit isStanding = false ;
with obj_property isStanding = false ;

// create and duplicate player Q
if is_undefined(global.P1) = false scr_updateStanding(global.P1);
if is_undefined(global.P2) = false scr_updateStanding(global.P2);
if is_undefined(global.P3) = false scr_updateStanding(global.P3);
if is_undefined(global.P4) = false scr_updateStanding(global.P4);




