// this script activates after unit has moves.
//does not execute if "trap" interups the move action

show_debug_message("Script: Execute Command");

switch (global.action_order){

    case "disrupt"  :   scr_exe_disrupt();  break;
    case "appear"   :   scr_exe_appear();   break;
    case "hide"     :   scr_exe_hide();     break;
    case "drop_A"   :   scr_exe_drop("A");  break;
    case "drop_B"   :   scr_exe_drop("B");  break;
    case "load"     :   scr_exe_load();     break;
    case "supply"   :   scr_exe_supply();   break;
    case "capture"  :   scr_exe_capture();  break;
    case "join"     :   scr_exe_join();     break;
    case "engage"   :   scr_exe_engage();   break;
    case "attach"   :   scr_exe_attach();   break;
    case "wait"     :   scr_exe_wait();     break;     
        }
        
        
//reset global order variables
//global.acting_unit  = 0;
//global.target_unit  = 0;
//global.move_order   = ds_priority_create();
//global.action_order = "wait" ;//default to wait

//update radio status
scr_updateStanding_global();

