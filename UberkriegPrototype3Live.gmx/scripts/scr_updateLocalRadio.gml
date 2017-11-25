target = argument0; //target unit or property

originV_X = target.x div 24;
originV_Y = target.y div 24;

tempV_X = 0;
tempV_Y = 0;

radio_range = target.radio

//adjust radio range for CO effects, units only)
with( obj_CO_0 )
    {
    if( ownership = other.target.ownership and object_is_ancestor(other.target.object_index, obj_unit) )
        {
        other.radio_range += D2D_Radio;
        if( COP_on ) other.radio_range += COP_Radio;
        if( SCOP_on ) other.radio_range += SCOP_Radio;
        if( other.target.radio != 0 and other.radio_range < 1 ) other.radio_range = 1;
        if( other.target.radio = 0 ) other.radio_range = 0;
        }
    }
            
//make self visible   
if ( obj_map.terrains[originV_X,originV_Y].object_index = obj_terrain_Mountain and target.radio != 0) radio_range +=2;


for ( tempV_X= (-1)*radio_range ; tempV_X<= radio_range ; tempV_X+=1 )
    { //for each possible value of X in range
    for ( tempV_Y= (-1)*radio_range ; tempV_Y<= radio_range ; tempV_Y+=1 )
        { //for each possible value of Y in range
        if ( (abs(tempV_X) + abs(tempV_Y))<= radio_range){ //if x + y is less than max range
                if scr_inBound(originV_X+tempV_X,originV_Y+tempV_Y)
                    {
                    //id target is unit
                    if object_is_ancestor(target.object_index,obj_unit)
                        {
                        if (target.isVisible)
                            { 
                            if target.isStanding global.rangeCheck[originV_X+tempV_X,originV_Y+tempV_Y].sprite_index = spr_rangecheck_gold;
                            else global.rangeCheck[originV_X+tempV_X,originV_Y+tempV_Y].sprite_index = spr_rangecheck_bluedk;
                            }
                        else break;
                        }
                    //if is property
                    if object_is_ancestor(target.object_index,obj_property) 
                        {
                        if (target.isStanding and target.isVisible) global.rangeCheck[originV_X+tempV_X,originV_Y+tempV_Y].sprite_index = spr_rangecheck_gold;
                        else global.rangeCheck[originV_X+tempV_X,originV_Y+tempV_Y].sprite_index = spr_rangecheck_bluedk;
                        }
            }
        }    
    }  
}

