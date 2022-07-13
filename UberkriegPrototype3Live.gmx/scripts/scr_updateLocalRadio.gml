target = argument0; //target unit or property

originV_X = target.x div 24;
originV_Y = target.y div 24;
tempV_X = 0;
tempV_Y = 0;
radio_range = target.radio

//adjust radio range for CO effects, units only
if (target.ownership !=0 and object_is_ancestor(target.object_index,obj_unit)){
    var target_CO = global.P[target.ownership].CO;
    radio_range += target_CO.D2D_Radio;
    if (target_CO.COP_on) radio_range += target_CO.COP_Radio;
    if (target_CO.SCOP_on) radio_range += target_CO.SCOP_Radio;
    }
//minimum radio range one
if(target.radio != 0 and radio_range < 1) radio_range = 1;
//radio range 0 is always 0 - for Covert_op        
if(target.radio = 0) radio_range = 0;            
//extend radio range on moutains  
if (obj_map.terrains[originV_X,originV_Y].object_index = obj_terrain_Mountain and target.radio != 0) radio_range +=2;

//  START LOOP
for (tempV_X= (-1)*radio_range ; tempV_X<= radio_range ; tempV_X+=1){ //for each possible value of X in range
    for ( tempV_Y= (-1)*radio_range ; tempV_Y<= radio_range ; tempV_Y+=1 ){ //for each possible value of Y in range
        if ( (abs(tempV_X) + abs(tempV_Y))<= radio_range){ //if x + y is less than max range
                if scr_inBound(originV_X+tempV_X,originV_Y+tempV_Y){//id target is unit
                    if object_is_ancestor(target.object_index,obj_unit){
                        if (target.isVisible and target.radio !=0){ 
                            if target.isStanding global.rangeCheck[originV_X+tempV_X,originV_Y+tempV_Y].sprite_index = spr_rangecheck_gold;
                            else global.rangeCheck[originV_X+tempV_X,originV_Y+tempV_Y].sprite_index = spr_rangecheck_bluedk;
                            }
                        else break;
                        }
                    //if is property
                    if object_is_ancestor(target.object_index,obj_property) {
                        if (target.isStanding and target.isVisible) global.rangeCheck[originV_X+tempV_X,originV_Y+tempV_Y].sprite_index = spr_rangecheck_gold;
                        else global.rangeCheck[originV_X+tempV_X,originV_Y+tempV_Y].sprite_index = spr_rangecheck_bluedk;
                        }
            }
        }    
    }  
}

