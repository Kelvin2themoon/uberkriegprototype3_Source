/*
this script returns radio range of a unit taking into account CO and terrain effects
*/

gur_unit = argument0;
gur_terrain = argument1;

//get base value from unit
gur_total_radio = gur_unit.radio;

//chech terrain
if (gur_terrain.name = "Mountain" and gur_unit.radio !=0 ) gur_total_radio += 2;

//chec CO effects
with (obj_CO_0)
    {
    if (ownership = other.gur_unit.ownership)   
        {
        other.gur_total_radio += D2D_Radio;
        if       COP_on other.gur_total_radio +=  COP_Radio;
        else if SCOP_on other.gur_total_radio += SCOP_Radio;
        }
    }

if( gur_unit.radio != 0 and gur_total_radio < 1 ) gur_total_radio = 1;
return gur_total_radio;

