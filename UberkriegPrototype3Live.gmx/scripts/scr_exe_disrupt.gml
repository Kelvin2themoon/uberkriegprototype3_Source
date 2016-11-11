
//hp-1 for now, ammo and fuel max
global.acting_unit.ammo -=1;

with (global.target_unit){
    isDisrupted = true;
    disruptor = global.acting_unit.ownership;
    state = "exhaust";
    }

// place active unit back in map array
obj_map.units[global.posX,global.posY] = global.acting_unit; 
//activate UI
instance_activate_object(obj_miniwin);
instance_activate_object(obj_battleCursor);
with obj_battleCursor{
    x = global.posX*24;
    y = global.posY*24;
    }

//set active unit state
global.acting_unit.state =  "exhaust";
global.acting_unit.alarm[0] =  1;
//reset depth
scr_setUnitDepth(global.acting_unit);

//reset drop phaze2 incase it is active
global.drop_phaze_2 = false;
//nuke syscom
with par_syscom_menu instance_destroy();
