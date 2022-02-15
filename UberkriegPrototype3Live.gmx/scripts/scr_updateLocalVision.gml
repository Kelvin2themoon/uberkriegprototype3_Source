target = argument0; //target unit or property

//set observer
var observer = global.P_Turn.number;
var owner = global.P[target.ownership];
var covert_exception = false;
var temp_unit_check = 0; //for not fow covert op exceptions

//check if unit has moved in or out of fog, also check for is hidden
if object_is_ancestor(target.object_index,obj_unit) {
    if (target.isHidden){ 
        if (global.net_mode = 2 and target.team != global.P[global.Local_Player].team){ 
            target.is_observable = false;
            covert_exception = true;
            }
        else target.is_observable = global.P_View[global.P_Turn.number,target.ownership];
        }
    else target.isObservable = obj_map.terrains[target.x div 24, target.y div 24].isObservable;
    }
else target.isObservable = obj_map.terrains[target.x div 24, target.y div 24].isObservable;  

//target position
var originV_X = target.x div 24;
var originV_Y = target.y div 24;
//variables for for loops
var tempV_X = 0;
var tempV_X = 0;

//check if target is observable ( global.P_View adjusted on obj_basicBattle create
var can_see = global.P_View[observer,target.ownership];

if (object_is_ancestor(target.object_index,obj_unit)){
    if (target.isHidden){
        if (global.net_mode = 2){
            can_see = false;
            if (target.ownership = global.Local_Player) can_see = true;
            }
        }
    }
 
 
       
if can_see { 
    target.isVisible  = true;
    target.isObservable = true;
    }

 
//vision range and COFX variables
var vision_range = target.vision
var vision_bonus = 0
perfectVision = false;

// adjust for COFX
if (target.ownership !=0 and object_is_ancestor(target.object_index,obj_unit)){
    vision_bonus = global.P[target.ownership].CO.D2D_Vision;
    if global.P[target.ownership].CO.COP_on vision_bonus += owner.CO.COP_Vision ;
    if global.P[target.ownership].CO.SCOP_on vision_bonus += owner.CO.SCOP_Vision ;
    vision_range += vision_bonus;
    if ( global.P[target.ownership].CO.COFX_PerfectVision and ( global.P[target.ownership].CO.COP_on or  global.P[target.ownership].CO.SCOP_on) ) perfectVision = true;
    } 


//uncrease visoin range over mountains
if ( obj_map.terrains[originV_X,originV_Y].object_index = obj_terrain_Mountain) vision_range += 1;
//if target is out of radio contact, reduce vision range to minumum
if (target.isStanding = false){
    if object_is_ancestor(target.object_index,obj_unit) vision_range = 1;
    else vision_range = 0;
    }

//start loop
for ( tempV_X= (-1)*vision_range ; tempV_X<= vision_range ; tempV_X+=1 ){ //for each possible value of X in range
    for ( tempV_Y= (-1)*vision_range ; tempV_Y<= vision_range ; tempV_Y+=1 ){ //for each possible value of Y in range
        if ( (abs(tempV_X) + abs(tempV_Y))<= vision_range){ //if x + y is less than max range
            if (global.P_Turn.team = target.team){
                if scr_inBound(originV_X+tempV_X,originV_Y+tempV_Y){                    
                    // perfect vision, see all units w/in vision range
                    if perfectVision {    
                            //visablility
                            obj_map.terrains[originV_X + tempV_X, originV_Y + tempV_Y].isVisible = true;
                            obj_map.units[originV_X + tempV_X, originV_Y + tempV_Y].isVisible = true;
                            }                    
                    //if checking adjacent tile and acting target is unit
                    else if ( (abs(tempV_X)+abs(tempV_Y))<=1 and object_is_ancestor(target.object_index,obj_unit)){
                        //adjust for terrain
                        obj_map.terrains[originV_X + tempV_X, originV_Y + tempV_Y].isVisible = true;
                        
                        //if unit exsist at position
                        if( obj_map.units[originV_X + tempV_X, originV_Y + tempV_Y] !=0){
                            //target is visible
                            obj_map.units[originV_X + tempV_X, originV_Y + tempV_Y].isVisible = true;
                            }
                        }
                    //terrain cannot hide unit, aka. standard case senerio
                    else if(obj_map.terrains[originV_X+tempV_X,originV_Y+tempV_Y].canHide = false) {
                        //terrain cannot hide unit
                        obj_map.terrains[originV_X + tempV_X, originV_Y + tempV_Y].isVisible = true;
                        }
                    //check unit in regular case senerio
                    if (obj_map.units[originV_X + tempV_X, originV_Y + tempV_Y] != 0){
                        //stay hidden is isHiding
                        if( obj_map.units[originV_X + tempV_X, originV_Y + tempV_Y].isHidden ){
                            //exception for when unit occupies a propety
                            if( object_is_ancestor(obj_map.terrains[originV_X + tempV_X, originV_Y + tempV_Y].object_index,obj_property)){
                                if( obj_map.terrains[originV_X + tempV_X, originV_Y + tempV_Y].team = global.P_Turn.team ){
                                    obj_map.units[originV_X + tempV_X, originV_Y + tempV_Y].isVisible = true;
                                    }
                                }
                            } 
                        //visible if terrrtain is also visible
                        else if (obj_map.terrains[originV_X + tempV_X, originV_Y + tempV_Y].isVisible) 
                            {
                            obj_map.units[originV_X + tempV_X, originV_Y + tempV_Y].isVisible = true;
                            }
                        }
                    }     
                }
            }    
        }  
    }
    
//check if targert is observable (graphically visable)
for ( tempV_X= (-1)*vision_range ; tempV_X<= vision_range ; tempV_X+=1 ){ //for each possible value of X in range
    for ( tempV_Y= (-1)*vision_range ; tempV_Y<= vision_range ; tempV_Y+=1 ){ //for each possible value of Y in range
        if ( (abs(tempV_X) + abs(tempV_Y))<= vision_range){ //if x + y is less than max range
            if (can_see){
                if scr_inBound(originV_X+tempV_X,originV_Y+tempV_Y)
                    {
                    // perfect vision, see all units w/in vision range
                    if perfectVision{    
                            //visablility
                            obj_map.terrains[originV_X + tempV_X, originV_Y + tempV_Y].isObservable = true;
                            obj_map.units[originV_X + tempV_X, originV_Y + tempV_Y].isObservable = true;
                            }
                    
                    //if checking adjacent tile and acting target is unit
                    else if ( (abs(tempV_X)+abs(tempV_Y))<=1 and object_is_ancestor(target.object_index,obj_unit)){
                        //adjust for terrain
                        obj_map.terrains[originV_X + tempV_X, originV_Y + tempV_Y].isObservable = true;
                        //if unit exsist at position
                        if( obj_map.units[originV_X + tempV_X, originV_Y + tempV_Y] !=0){
                            //store unit in temp variable
                            temp_unit_check = obj_map.units[originV_X + tempV_X, originV_Y + tempV_Y];
                            //check for covert exception, units and properties on the same team do not revieal their own units to enemy obervers
                            if (global.net_mode = 2 and global.fow[global.Local_Player] = "Disabled" and  temp_unit_check.team = owner.team){} //do nothing
                            //target is visible
                            else obj_map.units[originV_X + tempV_X, originV_Y + tempV_Y].isObservable = true;
                            }
                        }
                        
                    //terrain cannot hide unit, aka. standard case senerio
                    else if(obj_map.terrains[originV_X+tempV_X,originV_Y+tempV_Y].canHide = false) {
                        //terrain cannot hide unit
                        obj_map.terrains[originV_X + tempV_X, originV_Y + tempV_Y].isObservable = true;
                        }
                        
                    //check unit in regular case senerio
                    if (obj_map.units[originV_X + tempV_X, originV_Y + tempV_Y] != 0){
                        //stay hidden is isHiding
                        if( obj_map.units[originV_X + tempV_X, originV_Y + tempV_Y].isHidden ){
                            //exception for when unit occupies a propety
                            //obj_map.units[originV_X + tempV_X, originV_Y + tempV_Y].isObservable = false;
                            if( object_is_ancestor(obj_map.terrains[originV_X + tempV_X, originV_Y + tempV_Y].object_index,obj_property)){
                                if( obj_map.terrains[originV_X + tempV_X, originV_Y + tempV_Y].team = global.P_Turn.team ){
                                    obj_map.units[originV_X + tempV_X, originV_Y + tempV_Y].isObservable = true;
                                    }
                                }
                            } 
                        //visible if terrrtain is also visible
                        else if (obj_map.terrains[originV_X + tempV_X, originV_Y + tempV_Y].isObservable) {
                            obj_map.units[originV_X + tempV_X, originV_Y + tempV_Y].isObservable = true;
                            }
                        }
                    }     
                }
            }    
        }  
    }
    
    
