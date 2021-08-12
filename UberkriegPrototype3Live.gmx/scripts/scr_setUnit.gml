/*
place unit in XY positions in room and obj_map.units array
*/

set_unit_type   = argument0;
set_unit_x      = argument1;
set_unit_y      = argument2;
set_unit_owner  = argument3;

if scr_inBound(set_unit_x,set_unit_y) {
            // destroy exsisting unit if it exsist        
            if (obj_map.units[set_unit_x,set_unit_y] != 0){
                with(obj_map.units[set_unit_x,set_unit_y])instance_destroy();
                }
            //place new unit
            obj_map.units[set_unit_x,set_unit_y] = instance_create(set_unit_x*24 ,set_unit_y*24 ,set_unit_type);
            //set unit ownership
            obj_map.units[set_unit_x,set_unit_y].ownership = set_unit_owner;
            //change sprite colour
            scr_unit_change_sprite(obj_map.units[set_unit_x,set_unit_y],set_unit_owner);
            //set Depth so graphics cascade ledt to right, top to bottom
            scr_setUnitDepth(obj_map.units[set_unit_x,set_unit_y]);
            }
            //if unit cannot occupy terrain, remove it
            if (scr_check_move_cost(obj_map.units[set_unit_x,set_unit_y],obj_map.terrains[set_unit_x,set_unit_y]) == 99){
                with(obj_map.units[set_unit_x,set_unit_y]){instance_destroy();}
                obj_map.units[set_unit_x,set_unit_y] = 0;
                }
                
//if mode is map editor, switch to observable automatically
if global.mode = "Map Edit" obj_map.units[set_unit_x,set_unit_y].isObservable = true;
else{
    //do nothing
    }
    
   
    


