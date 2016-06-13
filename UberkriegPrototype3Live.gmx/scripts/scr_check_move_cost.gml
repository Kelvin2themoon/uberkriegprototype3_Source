/*
takes unit& terrain then returns move cost in int
both unit and terrain must exsist, so read from map arrys
*/

check_move_cost_unit    = argument0
check_move_cost_terrain = argument1

//create return variable & default
check_move_cost_output = 1;
check_move_cost_movetype = "free";

//if target lovation is occupied by visible enemy unit
//check if unit exsist at target terrain location
if( obj_map.units[check_move_cost_terrain.x div 24, check_move_cost_terrain.y div 24] != 0){
    //check ownership and visibility
    if  (obj_map.units[check_move_cost_terrain.x div 24, check_move_cost_terrain.y div 24].ownership != check_move_cost_unit.ownership and 
        obj_map.units[check_move_cost_terrain.x div 24, check_move_cost_terrain.y div 24].isVisible = true){
            check_move_cost_output = 99;
            }
    }

else{
    switch (check_move_cost_unit.move_type)
        {
    
        case "Boots":
            check_move_cost_output = check_move_cost_terrain.mtype_boots;
            break;
        case "Heavy Boots":
            check_move_cost_output = check_move_cost_terrain.mtype_heavyBoots;
            break;
        case "Tires":
            check_move_cost_output = check_move_cost_terrain.mtype_tires;
            break;
        case "Heavy Tires":
            check_move_cost_output = check_move_cost_terrain.mtype_heavyTires;
            break;
        case "Special Tires":
            check_move_cost_output = check_move_cost_terrain.mtype_specialTires;
            break;
        case "Tracks":
            check_move_cost_output = check_move_cost_terrain.mtype_tracks;
            break;
        case "Heavy Tracks":
            check_move_cost_output = check_move_cost_terrain.mtype_heavyTracks;        
            break;
        }
    }


    
return check_move_cost_output;
    

        



