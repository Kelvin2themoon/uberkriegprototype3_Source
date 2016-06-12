
switch (global.action_order){
    case "wait" :   
                    // set unit state

                    //global.acting_unit.image_index = 21;
                    //add unit to new position
                    obj_map.units[destination.x div 24,destination.y div 24] = global.acting_unit; 
                    // reactivate main phaze UI
                    instance_activate_object(obj_miniwin);
                    instance_activate_object(obj_battleCursor);
                    //remove from unit map array
                    obj_map.units[origin.x div 24,origin.y div 24] = 0;
                    
                    global.acting_unit.state =  "exhuast";
                    global.acting_unit.alarm[0] =  1;
                    //reset depth
                    scr_setUnitDepth(global.acting_unit);
                    break;
        }
