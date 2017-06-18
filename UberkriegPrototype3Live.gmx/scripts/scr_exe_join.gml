//adjust target unit HP
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
        }
    state =  "exhaust";    
    }
//delete activ unit
with(global.acting_unit) instance_destroy();
global.acting_unit = 0;
                   
// reactivate main phaze UI
instance_activate_object(obj_miniwin);
instance_activate_object(obj_battleCursor);
with obj_battleCursor{
    x = global.posX*24;
    y = global.posY*24;
    }
    
//nuke syscom
with par_syscom_menu instance_destroy();

//clear active unit
global.acting_unit = 0;
                    
