// checks for aly or units in range (uir) for engage, supply, and disrupt

var uir_origin_x    = argument0 //posX
var uir_origin_y    = argument1 //posY
var uir_minRange    = argument2 //max range
var uir_maxRange    = argument3 //min range
var uir_isAlly      = argument4 //true if team, false if enemy

//clear targetables
ds_list_clear(global.targetables);

var targets_avaliable = false;

//initiate loop variables
var uir_temp_x = 0;
var uir_temp_y = 0;

//adjust for land cruiser

if (global.acting_unit.name == "Land Cruiser") {
    uir_minRange = 1;
}

//for all possible positions
for ( uir_temp_x = -uir_maxRange ; uir_temp_x <= uir_maxRange ; uir_temp_x += 1 )
{
    for ( uir_temp_y = -uir_maxRange ; uir_temp_y <= uir_maxRange ; uir_temp_y += 1 )
    {
        var combined_temp_x_y = abs(uir_temp_x) + abs(uir_temp_y);
        var new_x = uir_origin_x + uir_temp_x;
        var new_y = uir_origin_y + uir_temp_y;
        if ( combined_temp_x_y <= uir_maxRange) and (combined_temp_x_y >= uir_minRange) and scr_inBound(new_x, new_y)
        {
            var tUnit = obj_map.units[new_x ,new_y];
            //if a unit exsist 
            if ( tUnit != 0 )
            {
                var unit_check_ok = false;
                
                //ally unit
                if ( uir_isAlly and tUnit.team == global.P_Turn.team )
                    unit_check_ok = true;
                //enemy unit
                else if ( !uir_isAlly and tUnit.team != global.P_Turn.team and tUnit.isVisible )
                    unit_check_ok = true;
                    
                if ( unit_check_ok )
                {
                    targets_avaliable = true;
                    ds_list_add(global.targetables, tUnit);
                }
            }
        }
    }
}

return targets_avaliable
