//adjust target unit HP

//snap camera if out of frame
if (global.target_unit.isObservable) cam_bring_into_frame(global.target_unit,48);

hp_remainder = 0

with (global.target_unit){
    hp = hp + global.acting_unit.hp;
    isDisrupted = false; 
    if (hp > 10){  
        hp_remainder = hp - 10;
        hp = 10;
        hp_remainder *= (cost div 10);
        global.P_Turn.funds += hp_remainder;
        if (global.acting_unit.isCommander) isCommander = true;
        isDisrupted = false;   
         
        }
    state =  "exhaust";    
    }
//delete activ unit
with(global.acting_unit) instance_destroy();
global.acting_unit = 0;
                   
// reactivate main phaze UI
scr_exe_control_restart();
    
//nuke syscom
with par_syscom_menu instance_destroy();

//clear active unit
global.acting_unit = 0;
                    
