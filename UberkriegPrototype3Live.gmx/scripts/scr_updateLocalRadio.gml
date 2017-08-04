target = argument0; //target unit or property


originV_X = target.x div 24;
originV_Y = target.y div 24;

tempV_X = 0;
tempV_Y = 0;



radio_range = target.radio


if (target.ownership !=0)
    {
    
        var owner = 0;
        switch target.ownership 
            {
                case 1 : if(global.P1_in_play) owner = global.P1; break;
                case 2 : if(global.P2_in_play) owner = global.P2; break;    
                case 3 : if(global.P3_in_play) owner = global.P3; break;
                case 4 : if(global.P4_in_play) owner = global.P4; break;
            }
            
        if (target.radio != 0 and owner !=0)
        
            {
            
                var radio_bonus = owner.CO.D2D_Radio ;
                if (owner.CO.COP_on) radio_bonus  += owner.CO.COP_Radio;
                if (owner.CO.SCOP_on) radio_bonus += owner.CO.SCOP_Radio ;

                radio_range += radio_bonus;
            
            }
    }
    
//make self visible   
if ( obj_map.terrains[originV_X,originV_Y].object_index = obj_terrain_Mountain and target.radio != 0) radio_range +=2;


for ( tempV_X= (-1)*radio_range ; tempV_X<= radio_range ; tempV_X+=1 ){ //for each possible value of X in range
    for ( tempV_Y= (-1)*radio_range ; tempV_Y<= radio_range ; tempV_Y+=1 ){ //for each possible value of Y in range
        if ( (abs(tempV_X) + abs(tempV_Y))<= radio_range){ //if x + y is less than max range
                if scr_inBound(originV_X+tempV_X,originV_Y+tempV_Y){
                    //id target is unit
                    if object_is_ancestor(target.object_index,obj_unit){
                        if (target.isVisible){ 
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

