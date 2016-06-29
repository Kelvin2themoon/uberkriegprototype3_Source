
switch (global.action_order){
    case "attach"   :   scr_exe_attach(); break;
    case "wait"     :   scr_exe_wait(); break;     
        }
        
        
//reset global order variables
global.acting_unit  = 0;
global.target_unit  = 0;
//global.move_order   = ds_priority_create();
global.action_order = "wait" ;//default to wait

//update radio status
scr_updateStanding_global();

