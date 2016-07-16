// this script is activated when a menu item is selected from syscom menu, 
//actual execution of unit action after move: see unit Command -> scr_execute_command
show_debug_message("Script: syscom select");

command = argument0; //string

switch (command){

    case "disrupt" :
        global.action_order = "disrupt";
        instance_create(0,0,obj_disruptCursor);
        instance_destroy();
        break;
    
    case "appear"   :
        global.action_order = "appear";
        instance_create(0,0,obj_execute_unit_orders);
        instance_destroy();
        break;

    case "hide"   :
        global.action_order = "hide";
        instance_create(0,0,obj_execute_unit_orders);
        instance_destroy();
        break;
    
    case "drop_A" :
        global.action_order = "drop_A";
        instance_activate_object(global.acting_unit.load_A)
        global.target_unit = global.acting_unit.load_A;
        global.target_unit.image_alpha = 0;
        instance_create(0,0,obj_dropCursor);
        instance_destroy();
        break;
        
    case "drop_B" :
        global.action_order = "drop_B";
        instance_activate_object(global.acting_unit.load_B)
        global.target_unit = global.acting_unit.load_B;
        global.target_unit.image_alpha = 0;
        instance_create(0,0,obj_dropCursor);
        instance_destroy();
        break;
    
    
    case "load" :
        global.action_order = "load"
        instance_create(0,0,obj_execute_unit_orders);
        instance_destroy();
        break;
        
    case "capture" :
        global.action_order = "capture"; 
        instance_create(0,0,obj_execute_unit_orders);
        instance_destroy();
        break;
    
    case "join":
        global.action_order = "join";
        instance_create(0,0,obj_execute_unit_orders);
        instance_destroy();
        break;
        
    case "supply" :
        global.action_order = "supply";
        instance_create(0,0,obj_supplyCursor);
        instance_deactivate_object(obj_syscom_command);
        break;
    
    case "engage":
       global.action_order = "engage";
       instance_create(0,0,obj_engageCursor);
       instance_deactivate_object(obj_syscom_command);
       break;
    
    case "attach":
        global.action_order = "attach";
        instance_create(0,0,obj_execute_unit_orders);
        instance_destroy();
        break;
        
    case "wait":
        global.action_order = "wait";
        //check for drop phaze 2
        if (global.drop_phaze_2){
            scr_exe_wait();
            instance_destroy();
            break;
            }
        else{
            instance_create(0,0,obj_execute_unit_orders);
            instance_destroy();
            break;
            }
    case "endturn" : //end turn
        scr_syscom_endturn();
        instance_destroy();
        break;
    }
    

