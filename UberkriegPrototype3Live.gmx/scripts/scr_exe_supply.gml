//snap camera if out of frame
if (global.target_unit.isObservable) cam_bring_into_frame(global.target_unit,48);

//hp-1 for now, ammo and fuel max
with (global.target_unit)
    {
    fuel = max_fuel;
    isDisrupted = false;
    if name != "A.P.C." ammo = max_ammo;
    //special CO ability APC Repair, assums number is 1 (for now)
    if( global.P_Turn.CO.COFX_APC_Repair > 0
    and global.target_unit.hp <10 
    and global.target_unit.dummy = false
    and (global.target_unit.cost div 20) <= global.P_Turn.funds )
        {
        hp += global.P_Turn.CO.COFX_APC_Repair;
        if (hp > 10)
            {
            hp = 10;
            }
        else global.P_Turn.funds -= (global.target_unit.cost div 20);
        }
    }

// place active unit back in map array
obj_map.units[global.posX,global.posY] = global.acting_unit; 

//activate UI
scr_exe_control_restart();

//set active unit state
global.acting_unit.state =  "exhaust";
global.acting_unit.alarm[0] =  1;
//reset depth
scr_setUnitDepth(global.acting_unit);

//reset drop phaze2 incase it is active
global.drop_phaze_2 = false;
//nuke syscom
with par_syscom_menu instance_destroy();



