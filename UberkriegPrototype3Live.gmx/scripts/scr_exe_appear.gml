//obj_map.units[destination.x div 24,destination.y div 24] = global.acting_unit;

global.drop_phaze_2 = false;
obj_map.units[global.posX,global.posY] = global.acting_unit;

//change hide state to true
global.acting_unit.isHidden = false;
global.acting_unit.isObservable = obj_map.terrains[global.posX,global.posY].isObservable;
              
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
