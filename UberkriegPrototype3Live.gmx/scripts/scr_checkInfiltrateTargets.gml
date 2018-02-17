//check for infiltrate targets, adjacent enemy properties

var xx  = argument0;     
var yy  = argument1;

is = false;

//check north
if object_is_ancestor( obj_map.terrains[xx,yy-1].object_index, obj_property) 
    {
    if (obj_map.terrains[xx,yy-1].ownership != global.P_Turn.number)  is = true;
    }  
//check east
if  object_is_ancestor( obj_map.terrains[xx+1,yy].object_index, obj_property) 
    {
    if (obj_map.terrains[xx+1,yy].ownership != global.P_Turn.number)  is = true;
    }
//check south
if  object_is_ancestor( obj_map.terrains[xx,yy+1].object_index, obj_property) 
    {
    if (obj_map.terrains[xx,yy+1].ownership != global.P_Turn.number)  is = true;
    }
//check west
if  object_is_ancestor( obj_map.terrains[xx-1,yy].object_index, obj_property) 
    {
    if (obj_map.terrains[xx-1,yy].ownership != global.P_Turn.number)  is = true;
    }   
    
return is;
 
