//obj_map.units[destination.x div 24,destination.y div 24] = global.acting_unit;

//reset Capturing
global.acting_unit.capturing  = 0;

                    global.drop_phaze_2 = false;
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
                    
                    //nuke syscom
                    with par_syscom_menu instance_destroy();
