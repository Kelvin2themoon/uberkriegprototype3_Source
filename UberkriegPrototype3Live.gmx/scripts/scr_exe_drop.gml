load_slot = argument0;

show_debug_message("Script: Drop");

//check for unit at destination
if (obj_map.units[global.destination.x div 24,global.destination.y div 24] !=0){
    //re-deactivate target unit
    instance_deactivate_object(global.target_unit);
    //trap
    instance_create(global.destination.x,global.destination.y,obj_event_trap);
    //wait
    
    //place acting unit in map array
    obj_map.units[global.posX,global.posY] = global.acting_unit; 
    //reset acting unit state
    global.acting_unit.state =  "exhaust";
    global.acting_unit.alarm[0] =  1;
    //reset depth
    scr_setUnitDepth(global.acting_unit);
    with (par_syscom_menu) instance_destroy();
    instance_destroy();
    }
    
else {
    //reactivate target unit and place at location
    instance_activate_object(global.target_unit);
    obj_map.units[global.destination.x div 24, global.destination.y div 24] = global.target_unit;
    with global.target_unit{
        image_index = 21;
        state = "exhaust";
        x = global.destination.x;
        y = global.destination.y;
        }
    scr_updateLocalVision(global.target_unit);
    
    //reset depth
    scr_setUnitDepth(global.target_unit);
    
    //set acting unit to map array for radio stacding check
    obj_map.units[global.posX,global.posY] = global.acting_unit; 
    //remove from APC slot
    switch load_slot {
        case "A" : global.acting_unit.load_A = 0; global.drop_A = false; global.engage = false; break;
        case "B" : global.acting_unit.load_B = 0; global.drop_B = false; global.engage = false; break;   
        }
    global.supply = false;
        
        
    //open new syscom command if drop target is still avaliable
    if(global.acting_unit.load_A !=0){
        show_debug_message("can drop A");
        //recreate syscom 
        instance_activate_object(obj_syscom_command); 
        with(obj_syscom_command) instance_destroy();
        instance_create(global.acting_unit.x+24,global.acting_unit.y,obj_syscom_command);
        scr_updateLocalVision(global.target_unit);
        global.drop_phaze_2 = true;
        }
    else if (global.acting_unit.load_B !=0){
    show_debug_message("can drop B");
        //recreate syscom
        instance_activate_object(obj_syscom_command); 
        with(obj_syscom_command) instance_destroy();
        instance_create(global.acting_unit.x+24,global.acting_unit.y,obj_syscom_command);
        scr_updateLocalVision(global.target_unit);
        global.drop_phaze_2 = true;
        }
    else{
        //wait
        global.acting_unit.state =  "exhaust";
        global.acting_unit.alarm[0] =  1;
        //reset depth
        scr_setUnitDepth(global.acting_unit);
        //nuke syscom
        with par_syscom_menu instance_destroy();
        //clear active unit
        global.acting_unit = 0;
        
        
                           
        // reactivate main phaze UI
        instance_activate_object(obj_miniwin);
        instance_activate_object(obj_battleCursor);
        with obj_battleCursor{
            x = global.posX*24;
            y = global.posY*24;
            }
          
    
        }
    }
    
scr_updateStanding_global();






    

