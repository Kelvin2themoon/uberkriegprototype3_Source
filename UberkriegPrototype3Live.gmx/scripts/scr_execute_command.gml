
switch (global.action_order){
    case "wait" :   
                    // set unit state
                  
                    //obj_map.units[destination.x div 24,destination.y div 24] = global.acting_unit;
                    obj_map.units[global.posX,global.posY] = global.acting_unit; 
                   
                     // reactivate main phaze UI
                    instance_activate_object(obj_miniwin);
                    instance_activate_object(obj_battleCursor);
                    with obj_battleCursor{
                        x = global.posX*24;
                        y = global.posY*24;
                        }
                    
                    global.acting_unit.state =  "exhaust";
                    global.acting_unit.alarm[0] =  1;
                    //reset depth
                    scr_setUnitDepth(global.acting_unit);
                    
                    //set is standing for radio range check
                    break;
        }
        
        
//reset global order variables
global.acting_unit  = 0;
global.target_unit  = 0;
//global.move_order   = ds_priority_create();
global.action_order = "wait" ;//default to wait

//update radio status
scr_updateStanding_global();

