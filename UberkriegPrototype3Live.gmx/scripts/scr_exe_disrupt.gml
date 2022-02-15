//snap camera if out of frame
if (global.target_unit.isObservable) cam_bring_into_frame(global.target_unit,48);

//hp-1 for now, ammo and fuel max
global.acting_unit.ammo -=1;

with (global.target_unit)
    {
    isDisrupted = true;
    disruptor = global.acting_unit.ownership;
    state = "exhaust";
    }

    //find spash targets
    if (global.Disruptor_spread )
        {
        var ix = (-1)*global.target_unit.radio ;
        var iy = (-1)*global.target_unit.radio ;
            
        for( ix = (-1)*global.target_unit.radio ; ix <= global.target_unit.radio ;  ix +=1 )
            {
            for ( iy= (-1)*global.target_unit.radio ; iy <= global.target_unit.radio ;  iy +=1 )
                {
                if (abs(ix)+abs(iy) <= global.target_unit.radio)
                    {
                    var tx = (global.target_unit.x div 24) + ix ;
                    var ty = (global.target_unit.y div 24) + iy;
                                    
                    if (obj_map.units[tx,ty] != 0)
                        {
                        if ( obj_map.units[tx,ty].team != global.acting_unit.team )
                            {
                            obj_map.units[tx,ty].isDisrupted = true ;
                            obj_map.units[tx,ty].state = "exhaust"; 
                            }
                        }
                    }
                } 
            }
        }
    


// place active unit back in map array
obj_map.units[global.posX,global.posY] = global.acting_unit;
//update stamdomg
scr_updateStanding(global.P_Turn); 
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
//clear active unit
global.acting_unit = 0; 
