load_slot = argument0;

show_debug_message("Script: Drop");


if (global.net_mode != 0 and global.Local_Player != global.P_Turn.number){

    //set action darget
    if (load_slot = "A") global.target_unit = global.acting_unit.load_A;
    if (load_slot = "B") global.target_unit = global.acting_unit.load_B;
    //set drop zone
    var drop_x = ds_map_find_value(global.net_data_map,"drop_x");
    var drop_y = ds_map_find_value(global.net_data_map,"drop_y");
    global.destination = global.rangeCheck[drop_x,drop_y];
    }


//check for unit at destination
if (obj_map.units[global.destination.x div 24,global.destination.y div 24] !=0){
    //re-deactivate target unit
    instance_deactivate_object(global.target_unit);
    //trap
    var itsatrap = instance_create(global.acting_unit.x,global.acting_unit.y,obj_event_trap);
    if(!global.P_View[global.P_Turn.number,global.acting_unit.ownership]){
        itsatrap.image_alpha = 0;
        }
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
    scr_setUnitDepth(global.target_unit);
    with global.target_unit{
        image_index = 21;
        state = "exhaust";
        isVisable = true;
        x = global.destination.x;
        y = global.destination.y;
        alarm[0] = 1;
        }
        
    //set acting unit to map array for radio stacding check
    obj_map.units[global.posX,global.posY] = global.acting_unit; 
    scr_updateLocalVision(global.target_unit);
    //reset depth
    scr_setUnitDepth(global.target_unit);
    //remove from APC slot
    switch load_slot {
        case "A" : global.acting_unit.load_A = 0; global.drop_A = false; global.engage = false; break;
        case "B" : global.acting_unit.load_B = 0; global.drop_B = false; global.engage = false; break;   
        }
    global.supply = false;
    //open new syscom command if drop target is still avaliable
    if(global.acting_unit.load_A !=0 and (global.net_mode = 0 or global.P_Turn.number = global.Local_Player)){
        show_debug_message("can drop A");
        //recreate syscom 
        instance_activate_object(obj_syscom_command); 
        with(obj_syscom_command) instance_destroy();
        instance_create(global.acting_unit.x+24,global.acting_unit.y,obj_syscom_command);
        scr_updateLocalVision(global.target_unit);
        global.drop_phaze_2 = true;
        }
    else if (global.acting_unit.load_B !=0 and (global.net_mode = 0 or global.P_Turn.number = global.Local_Player)){
    show_debug_message("can drop B");
        //recreate syscom
        instance_activate_object(obj_syscom_command); 
        with(obj_syscom_command) instance_destroy();
        instance_create(global.acting_unit.x+24,global.acting_unit.y,obj_syscom_command);
        scr_updateLocalVision(global.target_unit);
        global.drop_phaze_2 = true;
        }
    else{
        if(global.acting_unit.load_A !=0 or global.acting_unit.load_B !=0) global.drop_phaze_2 = true;
        //wait
        global.acting_unit.state =  "exhaust";
        global.acting_unit.alarm[0] =  1;
        //reset depth
        scr_setUnitDepth(global.acting_unit);
        //nuke syscom
        with par_syscom_menu instance_destroy();
        //clear active unit
        if !global.drop_phaze_2 global.acting_unit = 0; //****************************************************************
        global.drop_phaze_2 = false;
        // force radio outline update
        // reactivate main phaze UI
        scr_exe_control_restart();
        instance_create(0,0,obj_radio_update_event);
        }
    }
scr_updateStanding_global();
scr_globalRadioCheck();
scr_update_radioBoarder();
scr_rangeCheck_reset();







    

