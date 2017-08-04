target = argument0; //target unit or property


originV_X = target.x div 24;
originV_Y = target.y div 24;

tempV_X = 0;
tempV_X = 0;

//make self visible
if target.team = global.P_Turn.team
target.isVisible = true;

var vision_range = target.vision
var vision_bonus = 0
perfectVision = false ;

//check for Co ability
if (target.ownership !=0)
    {
    
        var owner = 0;
        switch target.ownership 
            {
                case 1 : if(global.P1_in_play) owner = global.P1; break;
                case 2 : if(global.P1_in_play) owner = global.P2; break;    
                case 3 : if(global.P1_in_play) owner = global.P3; break;
                case 4 : if(global.P1_in_play) owner = global.P4; break;
            }
            
            if(owner !=0)
                {
                vision_bonus = owner.CO.D2D_Vision ;
                if owner.CO.COP_on  vision_bonus += owner.CO.COP_Vision ;
                if owner.CO.SCOP_on  vision_bonus += owner.CO.SCOP_Vision ;
                 
                vision_range += vision_bonus;
                
                if (owner.CO.COFX_PerfectVision and (owner.CO.COP_on or owner.CO.SCOP_on) ) perfectVision = true;
                } 
                
                
    }





if ( obj_map.terrains[originV_X,originV_Y].object_index = obj_terrain_Mountain) vision_range += (target.vision div 2);
if (target.isStanding = false)
{
    if object_is_ancestor(target.object_index,obj_unit) vision_range = 1;
    else vision_range = 0;
}

for ( tempV_X= (-1)*vision_range ; tempV_X<= vision_range ; tempV_X+=1 ){ //for each possible value of X in range
    for ( tempV_Y= (-1)*vision_range ; tempV_Y<= vision_range ; tempV_Y+=1 ){ //for each possible value of Y in range
        if ( (abs(tempV_X) + abs(tempV_Y))<= vision_range){ //if x + y is less than max range
            if (target.team = global.P_Turn.team){
            
                if scr_inBound(originV_X+tempV_X,originV_Y+tempV_Y){
                
                    if perfectVision 
                            {
                                
                                obj_map.terrains[originV_X + tempV_X, originV_Y + tempV_Y].isVisible = true;
                                obj_map.units[originV_X + tempV_X, originV_Y + tempV_Y].isVisible = true;

                            }
                    //adjacent to target if target is unit
                    else if ( (abs(tempV_X)+abs(tempV_Y))<=1 and object_is_ancestor(target.object_index,obj_unit)){
                            obj_map.terrains[originV_X + tempV_X, originV_Y + tempV_Y].isVisible = true;
                            if obj_map.units[originV_X + tempV_X, originV_Y + tempV_Y] !=0
                            obj_map.units[originV_X + tempV_X, originV_Y + tempV_Y].isVisible = true;
                            //obj_map.units[originV_X + tempV_X, originV_Y + tempV_Y].isHidden = false;     
                            }
                        //regular vision for terrain
                        //check percet vision
 
                        
                        else if  obj_map.terrains[originV_X+tempV_X,originV_Y+tempV_Y].canHide = false {
                             obj_map.terrains[originV_X + tempV_X, originV_Y + tempV_Y].isVisible = true;
                            }
                        //check unit visibility
                        if (obj_map.units[originV_X + tempV_X, originV_Y + tempV_Y] != 0){
                            //check terrain
                            
                            //stay hidden is isHiding
                            if obj_map.units[originV_X + tempV_X, originV_Y + tempV_Y].isHidden {}; 
                            //visible is terrrtain is also visible
                            else if (obj_map.terrains[originV_X + tempV_X, originV_Y + tempV_Y].isVisible) {obj_map.units[originV_X + tempV_X, originV_Y + tempV_Y].isVisible = true;}
                            }

                    }     
            }
        }    
    }  
}
