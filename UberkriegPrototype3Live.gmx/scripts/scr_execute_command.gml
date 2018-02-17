// this script activates after unit has moved.
//does not execute if "trap" interups the move action

show_debug_message("Script: Execute Command");

standing_unit = global.acting_unit;

var presist = true;


switch (global.action_order){

    case "disrupt"  :   scr_exe_disrupt();  break;
    case "appear"   :   scr_exe_appear();   break;
    case "hide"     :   scr_exe_hide();     break;
    case "drop_A"   :   scr_exe_drop("A");  break;
    case "drop_B"   :   scr_exe_drop("B");  break;
    case "load"     :   scr_exe_load();     break;
    case "supply"   :   scr_exe_supply();   break;
    case "capture"  :   scr_exe_capture();  break;
    case "join"     :   scr_exe_join();     presist = false;    break;
    case "engage"   :   scr_exe_engage();   break;
    case "attach"   :   scr_exe_attach();   presist = false;    break;
    case "wait"     :   scr_exe_wait();     break;
    
    case "infiltrate": scr_exe_infiltrate(); break;     
        }
        
        
//reset global order variables
//global.acting_unit  = 0;
//global.target_unit  = 0;
//global.move_order   = ds_priority_create();
//global.action_order = "wait" ;//default to wait

//update radio status

if (global.acting_unit != 0)
    {
    with(obj_unit)
        {
        if (id != other.standing_unit.id)
            {
            wasStanding = true;
            if (!isStanding) wasStanding = false;
            if (global.rangeCheck[x div 24,y div 24].sprite_index = spr_rangecheck_bluedk) wasStanding = false;
            }   
        }
    }
else
    {
    with (obj_unit)
        {
        wasStanding = true;
        if (!isStanding) wasStanding = false;
        if (global.rangeCheck[x div 24,y div 24].sprite_index = spr_rangecheck_bluedk) wasStanding = false;
        }
    }
        
scr_updateStanding_global();

with (obj_unit) if ( !wasStanding and isStanding ) instance_create(x,y,obj_event_link);
if (global.acting_unit != 0) if !standing_unit.isStanding instance_create(standing_unit.x,standing_unit.y, obj_event_lost);

//update Radio Boarder
scr_globalRadioCheck();
scr_update_radioBoarder();
scr_rangeCheck_reset();


