/*
place terrain in XY positions in room and obj_map.units array
*/

set_unit_type   = argument0;
set_unit_x      = argument1;
set_unit_y      = argument2;

if scr_inBound(set_unit_x,set_unit_y) 
        {
        // destroy exsisting unit if it exsist
        
        if (obj_map.units[set_unit_x,set_unit_y] != -1)
            {
            with(obj_map.units[set_unit_x,set_unit_y])instance_destroy();
            }
         //place new terrain
        obj_map.units[set_unit_x,set_unit_y] = instance_create(set_unit_x*24 ,set_unit_y*24 ,set_unit_type);
     
        //set Depth so graphics cascade ledt to right, top to bottom
        var deepness = ((set_unit_y*1000) + (set_unit_x*10))*(-1)-1
        obj_map.units[set_unit_x,set_unit_y].depth = deepness;
        }



