//obj_map.units[destination.x div 24,destination.y div 24] = global.acting_unit;

//reset captue
if (global.acting_unit_moved) global.acting_unit.capturing  = 0;

global.drop_phaze_2 = false;

//place unit back in map 
obj_map.units[global.posX,global.posY] = global.acting_unit; 

 // reactivate main phaze UI
scr_exe_control_restart();

global.acting_unit.state =  "exhaust";
global.acting_unit.alarm[0] =  1;

//reset depth
scr_setUnitDepth(global.acting_unit);

//nuke syscom
with par_syscom_menu instance_destroy();

//clear active unit
global.acting_unit = 0;

/*
//if host restart client controls
if global.net_mode = 1 {
    ds_map_clear(global.map_out);
    ds_map_add(global.map_out,"scr","net_start_controls");
    scr_send(global.map_out,"acting");
    }

                    
