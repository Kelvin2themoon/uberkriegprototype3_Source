target = argument0; //target unit or property


originV_X = target.x div 24;
originV_Y = target.y div 24;

tempV_X = 0;
tempV_X = 0;

//make self visible
if target.team = global.P_Turn.team
target.isVisible = true;

vision_range = target.vision

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
                    //adjacent to target if target is unit
                        if ( (abs(tempV_X)+abs(tempV_Y))<=1 and object_is_ancestor(target.object_index,obj_unit)){
                            obj_map.terrains[originV_X + tempV_X, originV_Y + tempV_Y].isVisible = true;
                            if obj_map.units[originV_X + tempV_X, originV_Y + tempV_Y] !=0
                            obj_map.units[originV_X + tempV_X, originV_Y + tempV_Y].isVisible = true;
                            //obj_map.units[originV_X + tempV_X, originV_Y + tempV_Y].isHidden = false;     
                            }
                        //regular vision for terrain
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
