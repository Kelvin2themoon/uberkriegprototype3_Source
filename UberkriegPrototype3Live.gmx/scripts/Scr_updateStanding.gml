//units recieving radio transmissions from commanders are standing ( I'm sleepy)

//show_debug_message("Run update standing script");
standingPlayer = argument0;

//detect team
standteam  = standingPlayer.team;

//create Q for checking
standing_Q = ds_queue_create();

//check acting unit id to make check for exception



//add commanding units and properties (edit, it unit is commander, make sure it is in units array)
with (obj_unit)     if(team = other.standingPlayer.team and isCommander and scr_inBound(x div 24, y div 24) and isDisrupted = false and obj_map.units[x div 24, y div 24] !=  0) ds_queue_enqueue(other.standing_Q, obj_map.units[ x div 24, y div 24 ]);
with (obj_property) if(team = other.standingPlayer.team and isCommander) ds_queue_enqueue(other.standing_Q, obj_map.terrains[ x div 24, y div 24 ]);

//CLEAR OFFICER ZONES
with( obj_checker_tile )
    {
    CO_Zone[other.standingPlayer.number] = false;
    }

//start loop
while (ds_queue_size(standing_Q) != 0 )
    {
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
    
    
    //increase bonus range (COFX)
    with ( standingPlayer.CO )
        {
        if( object_is_ancestor(other.checkStandTarget.object_index, obj_unit))
            {
            other.broadcast_range += D2D_Radio;
            if( COP_on ) other.broadcast_range += COP_Radio;
            if( SCOP_on ) other.broadcast_range += SCOP_Radio;
            //set minimum to 1
            if( other.checkStandTarget.radio != 0 and  other.broadcast_range < 1 )  other.broadcast_range = 1;
            }
        }
    
    //check all co-ordinates in range of origin
    for ( cst_temp_x = (-1)*broadcast_range ; cst_temp_x <= broadcast_range ; cst_temp_x+=1)
        {
        for ( cst_temp_y = (-1)*broadcast_range ; cst_temp_y <= broadcast_range ; cst_temp_y+=1)
            {
            if ( abs(cst_temp_x) + abs(cst_temp_y) <= broadcast_range and scr_inBound(cst_origin_x +cst_temp_x , cst_origin_y +cst_temp_y) )
                {
                //switch on local CO Zone
                if( checkStandTarget.isCommander and checkStandTarget.isDisrupted = false and checkStandTarget.ownership = standingPlayer.number  ) global.rangeCheck[cst_origin_x +cst_temp_x , cst_origin_y +cst_temp_y].CO_Zone[standingPlayer.number] = true;
                //check if a unit is present (must be ally and not already a commander asnd not standing)
                if ( obj_map.units[ cst_origin_x +cst_temp_x , cst_origin_y +cst_temp_y ] != 0)
                    {
                    //check unit properties
                    if ( obj_map.units[ cst_origin_x +cst_temp_x , cst_origin_y +cst_temp_y ].isCommander = false 
                         and obj_map.units[ cst_origin_x +cst_temp_x , cst_origin_y +cst_temp_y ].isStanding = false
                         and obj_map.units[ cst_origin_x +cst_temp_x , cst_origin_y +cst_temp_y ].team = standingPlayer.team)
                            {
                            //add unit to Q, exclude disrupted units and move check exceptions
                            if (obj_map.units[ cst_origin_x +cst_temp_x , cst_origin_y +cst_temp_y ].isDisrupted = true 
                            or obj_map.units[ cst_origin_x +cst_temp_x , cst_origin_y +cst_temp_y ].isException = true)
                                {
                                //do nothing
                                }
                                else ds_queue_enqueue(standing_Q,obj_map.units[ cst_origin_x +cst_temp_x , cst_origin_y +cst_temp_y ]);
                            }
                    }
                //check if therrain is property
                if( object_is_ancestor(obj_map.terrains[ cst_origin_x +cst_temp_x , cst_origin_y +cst_temp_y ].object_index, obj_property))
                    {
                    //check if property is valid target ( not commander already, not standing-not been checked )
                    if( obj_map.terrains[ cst_origin_x +cst_temp_x , cst_origin_y +cst_temp_y ].isCommander = false 
                    and obj_map.terrains[ cst_origin_x +cst_temp_x , cst_origin_y +cst_temp_y ].isStanding  = false 
                    and obj_map.terrains[ cst_origin_x +cst_temp_x , cst_origin_y +cst_temp_y ].team   = standingPlayer.team)
                         {
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
    

