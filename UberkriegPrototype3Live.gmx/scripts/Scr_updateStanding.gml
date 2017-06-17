//units recieving radio transmissions from commanders are standing ( I'm sleepy)

//show_debug_message("Run update standing script");
standingPlayer = argument0;

//detect team
standteam  = standingPlayer.team;

//create Q for checking
standing_Q = ds_queue_create();

//add commanding units and properties
with (obj_unit)     if(team = other.standingPlayer.team and isCommander and scr_inBound(x div 24, y div 24) and isDisrupted = false) ds_queue_enqueue(other.standing_Q, obj_map.units[ x div 24, y div 24 ]);
with (obj_property) if(team = other.standingPlayer.team and isCommander) ds_queue_enqueue(other.standing_Q, obj_map.terrains[ x div 24, y div 24 ]);

//start loop


while (ds_queue_size(standing_Q) != 0 ){
    //get new check
    checkStandTarget = ds_queue_dequeue(standing_Q);
    checkStandTarget.isStanding = true;
    
    //ADD VALID UNITS AND PROPERTIES TO Q
    
    //set range variables
    cst_origin_x = checkStandTarget.x div 24;
    cst_origin_y = checkStandTarget.y div 24;
    // range value's to check
    cst_temp_x = 0;
    cst_temp_y = 0;
    //increase range if over mountain
    broadcast_range = checkStandTarget.radio;
    if ( obj_map.terrains[cst_origin_x,cst_origin_y].object_index = obj_terrain_Mountain and checkStandTarget.radio != 0) broadcast_range +=2;
    //increase bonus range (COs)
    
    //check owership
    if (checkStandTarget.ownership != 0)
        {
            
            var owner = 0;
            switch checkStandTarget.ownership
                
                {
                    
                    case 1 : owner = global.P1; break;
                    case 2 : owner = global.P2; break;    
                    case 3 : owner = global.P3; break;
                    case 4 : owner = global.P4; break;
                
                }
            if checkStandTarget.radio != 0
                {
             
                    var radio_bonus = owner.CO.D2D_Radio ; 
                    broadcast_range += radio_bonus;
             }
        
        
        }
    
    
    
    
    
    
    
    
    //check all co-ordinates in range of origin
    
    for ( cst_temp_x = (-1)*broadcast_range ; cst_temp_x <= broadcast_range ; cst_temp_x+=1){
        for ( cst_temp_y = (-1)*broadcast_range ; cst_temp_y <= broadcast_range ; cst_temp_y+=1){
            if ( abs(cst_temp_x) + abs(cst_temp_y) <= broadcast_range and scr_inBound(cst_origin_x +cst_temp_x , cst_origin_y +cst_temp_y) ){
                
            //check if a unit is present (must be ally and not already a commander asnd not standing)
                if ( obj_map.units[ cst_origin_x +cst_temp_x , cst_origin_y +cst_temp_y ] != 0){
                    //check unit properties
                    if ( obj_map.units[ cst_origin_x +cst_temp_x , cst_origin_y +cst_temp_y ].isCommander = false 
                         and obj_map.units[ cst_origin_x +cst_temp_x , cst_origin_y +cst_temp_y ].isStanding = false
                         and obj_map.units[ cst_origin_x +cst_temp_x , cst_origin_y +cst_temp_y ].team = standingPlayer.team
                         ){
                            //add unit to Q, exclude disrupted units and move check exceptions
                            if (obj_map.units[ cst_origin_x +cst_temp_x , cst_origin_y +cst_temp_y ].isDisrupted = true or
                                obj_map.units[ cst_origin_x +cst_temp_x , cst_origin_y +cst_temp_y ].isException = true){
                                //do nothing
                                }
                                else ds_queue_enqueue(standing_Q,obj_map.units[ cst_origin_x +cst_temp_x , cst_origin_y +cst_temp_y ]);
                            }
                    }
                //check if therrain is property
                if( object_is_ancestor(obj_map.terrains[ cst_origin_x +cst_temp_x , cst_origin_y +cst_temp_y ].object_index, obj_property)){
                    //check if property is valid target ( not commander already, not standing-not been checked )
                    if ( obj_map.terrains[ cst_origin_x +cst_temp_x , cst_origin_y +cst_temp_y ].isCommander = false and
                         obj_map.terrains[ cst_origin_x +cst_temp_x , cst_origin_y +cst_temp_y ].isStanding  = false and
                         obj_map.terrains[ cst_origin_x +cst_temp_x , cst_origin_y +cst_temp_y ].team   = standingPlayer.team
                         ){
                            //add property to Q
                            ds_queue_enqueue(standing_Q,obj_map.terrains[ cst_origin_x +cst_temp_x , cst_origin_y +cst_temp_y ]);
                            }
                    }
                }
            }
        }
    }
    
//destroy_Q
ds_queue_destroy(standing_Q);
    
/*
    // check if unit has already been checked (isStanding)
    if checkStandTarget.isStanding = true break; // this target has been checked, move on to next in Q
    //target has not beec checked
    else{
        checkStandTarget.isStanding = true; //mark as checked and radio-active
        //find other targets in range
        
        stand_origin_x = checkStandTarget.x div 24;
        stand_origin_y = checkStandTarget.y div 24;
        
        stand_temp_x = 0;
        stand_temp_y = 0;
        
        for( stand_temp_x = (-1)*checkStandTarget.radio ; stand_temp_x <=  checkStandTarget.radio ; stand_temp_x+=1 ){ //for all possible values of x
            for ( stand_temp_y = (-1)*checkStandTarget.radio ; stand_temp_y <=  checkStandTarget.radio ; stand_temp_y+=1 ){ //for all possible values of y
                if ( abs(stand_temp_x) + abs(stand_temp_y) <= checkStandTarget.radio ){ //for all possible combinations of X &Y
                    if scr_inBound(stand_origin_x+stand_temp_x , stand_origin_y+stand_temp_y){
                        //test co-ordinates
                        show_debug_message( "Stand Cordinates: " + string(stand_origin_x+stand_temp_x) + "," + string(stand_origin_y+stand_temp_y) );
                        //if exsist
                        if (obj_map.units[stand_origin_x+stand_temp_x,stand_origin_y+stand_temp_y] != 0){
                            //if unit belongs t player
                            if (obj_map.units[stand_origin_x+stand_temp_x,stand_origin_y+stand_temp_y].ownership =  standingPlayer.number){
                                //add to queue
                                ds_queue_enqueue(standing_Q,obj_map.units[stand_origin_x+stand_temp_x,stand_origin_y+stand_temp_y]);
                                show_debug_message( "added unit " + obj_map.units[stand_origin_x+stand_temp_x,stand_origin_y+stand_temp_y].name )
                                }
                            } 
                        //add property to q if exsist
                        if (object_is_ancestor(obj_map.terrains[stand_origin_x+stand_temp_x,stand_origin_y+stand_temp_y].object_index,obj_property)){
                            //if ownerchip = current player
                            if (obj_map.terrains[stand_origin_x+stand_temp_x,stand_origin_y+stand_temp_y].ownership = standingPlayer.number){
                                ds_queue_enqueue(standing_Q,obj_map.terrains[stand_origin_x+stand_temp_x,stand_origin_y+stand_temp_y]);
                                show_debug_message( "added property " + obj_map.terrains[stand_origin_x+stand_temp_x,stand_origin_y+stand_temp_y].name)
                                }
                            }
                        }
                    }
                }
            }
        }
        
    }
    
//destroy Q
ds_queue_destroy(standing_Q);
