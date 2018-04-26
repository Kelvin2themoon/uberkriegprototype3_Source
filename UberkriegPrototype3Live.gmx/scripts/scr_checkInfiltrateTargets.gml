//check for infiltrate targets, adjacent enemy properties

var xx  = argument0;     
var yy  = argument1;

is = false;

//check north

if scr_inBound(xx,yy-1){
        if object_is_ancestor( obj_map.terrains[xx,yy-1].object_index, obj_property) {
            if (obj_map.terrains[xx,yy-1].ownership != global.P_Turn.number)  is = true;
            }  
    }

//check east

if scr_inBound(xx+1,yy){
    if  object_is_ancestor( obj_map.terrains[xx+1,yy].object_index, obj_property) {
        if (obj_map.terrains[xx+1,yy].ownership != global.P_Turn.number)  is = true;
        }
    }

//check south
if scr_inBound(xx,yy+1){
    if  object_is_ancestor( obj_map.terrains[xx,yy+1].object_index, obj_property) {
        if (obj_map.terrains[xx,yy+1].ownership != global.P_Turn.number)  is = true;
        }
    }

//check west
if scr_inBound(xx-1,yy){
    if  object_is_ancestor( obj_map.terrains[xx-1,yy].object_index, obj_property) {
        if (obj_map.terrains[xx-1,yy].ownership != global.P_Turn.number)  is = true;
        }
    }

//check occpied   
if scr_inBound(xx,yy){
    if  object_is_ancestor( obj_map.terrains[xx,yy].object_index, obj_property) {
        if (obj_map.terrains[xx,yy].ownership != global.P_Turn.number)  is = true;
        }
    }

///return value
return is;
 
