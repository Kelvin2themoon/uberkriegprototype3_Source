instance_create(global.acting_unit.x,global.acting_unit.y,obj_captureBar);

//obj_map.units[destination.x div 24,destination.y div 24] = global.acting_unit;
obj_map.units[global.posX,global.posY] = global.acting_unit; 

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
