target = argument0; //target unit or property


originV_X = target.x div 24;
originV_Y = target.y div 24;

tempV_X = 0;
tempV_X = 0;

//make self visible
if target.ownership = global.P_Turn.number
target.isVisible = true;

for ( tempV_X= (-1)*target.vision ; tempV_X<= target.vision ; tempV_X+=1 ){ //for each possible value of X in range
    for ( tempV_Y= (-1)*target.vision ; tempV_Y<= target.vision ; tempV_Y+=1 ){ //for each possible value of Y in range
        if ( (abs(tempV_X) + abs(tempV_Y))<= target.vision){ //if x + y is less than max range
            if (target.ownership = global.P_Turn.number){
            
                if scr_inBound(originV_X+tempV_X,originV_Y+tempV_Y){
                    //adjacent to target if target is unit
                        if ( (abs(tempV_X)+abs(tempV_Y))<=1 and object_is_ancestor(target.object_index,obj_unit)){
                            obj_map.terrains[originV_X + tempV_X, originV_Y + tempV_Y].isVisible = true;
                            if obj_map.units[originV_X + tempV_X, originV_Y + tempV_Y] !=0
                            obj_map.units[originV_X + tempV_X, originV_Y + tempV_Y].isVisible = true;     
                            }
                        //regular vision for terrain
                        if  obj_map.terrains[originV_X+tempV_X,originV_Y+tempV_Y].canHide = false
                            obj_map.terrains[originV_X + tempV_X, originV_Y + tempV_Y].isVisible = true;
                        //regular vision for terrain excluding hidden units: subs and spys
                        if obj_map.units[originV_X + tempV_X, originV_Y + tempV_Y] !=0
                        if  obj_map.units[originV_X+tempV_X,originV_Y+tempV_Y].isHidden = false
                            obj_map.units[originV_X + tempV_X, originV_Y + tempV_Y].isVisible = true;
                    }     
            }
        }    
    }  
}
