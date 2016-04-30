/*
place unit in XY positions in room and obj_map.units array
*/

set_unit_type   = argument0;
set_unit_x      = argument1;
set_unit_y      = argument2;
set_unit_owner  = argument3;

if scr_inBound(set_unit_x,set_unit_y) 
            {
            // destroy exsisting unit if it exsist        
            if (obj_map.units[set_unit_x,set_unit_y] != 0)
                {
                with(obj_map.units[set_unit_x,set_unit_y])instance_destroy();
                }
            //place new unit
            obj_map.units[set_unit_x,set_unit_y] = instance_create(set_unit_x*24 ,set_unit_y*24 ,set_unit_type);
            
            //set unit ownership
            obj_map.units[set_unit_x,set_unit_y].ownership = set_unit_owner;
            //change sprite via sprite name change using strings
            obj_map.units[set_unit_x,set_unit_y].sprite_index = asset_get_index(string_replace(sprite_get_name(obj_map.units[set_unit_x,set_unit_y].sprite_index), string_digits(sprite_get_name(obj_map.units[set_unit_x,set_unit_y].sprite_index)),string(set_unit_owner)));
            
            //set Depth so graphics cascade ledt to right, top to bottom
            var deepness = ((set_unit_y*1000) + (set_unit_x*10))*(-1)-1
            obj_map.units[set_unit_x,set_unit_y].depth = deepness;
            }
            
            //if unit cannot occupy terrain, remove it
            if (scr_check_move_cost(obj_map.units[set_unit_x,set_unit_y],obj_map.terrains[set_unit_x,set_unit_y]) == 99)
                {
                with(obj_map.units[set_unit_x,set_unit_y]){instance_destroy();}
                obj_map.units[set_unit_x,set_unit_y] = 0;
                }
else
    {
    //do nothing
    }
    
   
    


