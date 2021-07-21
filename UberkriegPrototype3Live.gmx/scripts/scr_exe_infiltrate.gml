//check for infiltrate targets, adjacent enemy properties

var xx  = global.posX;     
var yy  = global.posY;


//check north
if scr_inBound(xx,yy-1)
if object_is_ancestor( obj_map.terrains[xx,yy-1].object_index, obj_property){
    global.P_Turn.intel_P[obj_map.terrains[xx,yy-1].ownership]  = true;
    }  
//check east
if scr_inBound(xx+1,yy)
if object_is_ancestor( obj_map.terrains[xx+1,yy].object_index, obj_property){
    global.P_Turn.intel_P[obj_map.terrains[xx+1,yy].ownership]  = true;
    }
//check south
if scr_inBound(xx,yy+1)
if object_is_ancestor( obj_map.terrains[xx,yy+1].object_index, obj_property){
    global.P_Turn.intel_P[obj_map.terrains[xx,yy+1].ownership]  = true;
    }
//check west
if scr_inBound(xx-1,yy)
if object_is_ancestor( obj_map.terrains[xx-1,yy].object_index, obj_property){
    global.P_Turn.intel_P[obj_map.terrains[xx-1,yy].ownership]  = true;
    }
//check west
if scr_inBound(xx,yy)
if object_is_ancestor( obj_map.terrains[xx,yy].object_index, obj_property){
    global.P_Turn.intel_P[obj_map.terrains[xx,yy].ownership]  = true;
    }
global.acting_unit.isInfiltrate = true;   
scr_exe_wait();

 
