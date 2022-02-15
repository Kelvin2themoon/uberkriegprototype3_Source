//obj_map.units[destination.x div 24,destination.y div 24] = global.acting_unit;

global.drop_phaze_2 = false;
obj_map.units[global.posX,global.posY] = global.acting_unit;

//change hide state to true
global.acting_unit.isHidden = true;
global.acting_unit.isObservable = false;
//if (global.net_mode = 2)  global.acting_unit.isObservable = global.P_View[global.Local_Player,global.acting_unit.ownership]; 


/*
if (global.net_mode = 2)  global.acting_unit.isObservable = global.P_View[global.Local_Player,global.acting_unit.ownership];  
else global.acting_unit.isObservable = global.P_View[global.P_Turn.number,global.acting_unit.ownership];  
*/
/*                 
if (global.net_mode = 2){ 
    if (global.Local_Player = global.acting_unit.ownership) global.acting_unit.isObservable = true; 
    else global.acting_unit.isObservable = false; 
    }
*/

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
