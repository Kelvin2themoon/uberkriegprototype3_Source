// checks for aly or units in range (uir)

uir_origin_x    = argument0 //posX
uir_origin_y    = argument1 //posY
uir_minRange    = argument2 //max range
uir_maxRange    = argument3 //min range
uir_isAlly      = argument4 //true if ally, false if enemy

targets_avaliable = false;

//initiate loop variables
uir_temp_x = 0;
uir_temp_y = 0;

//for all possible positions
for (uir_temp_x = (-1)*uir_maxRange ; uir_temp_x <= uir_maxRange ; uir_temp_x +=1 ){
    for (uir_temp_y = (-1)*uir_maxRange ; uir_temp_y <= uir_maxRange ; uir_temp_y +=1 ){
        if (    abs(uir_temp_x) + abs(uir_temp_y) <= uir_maxRange and abs(uir_temp_x) + abs(uir_temp_y) >=uir_minRange and
                scr_inBound( uir_origin_x + uir_temp_x ,  uir_origin_y + uir_temp_y ) ){
                    //if a unit exsist 
                    if (obj_map.units[uir_origin_x + uir_temp_x ,uir_origin_y + uir_temp_y ] != 0){
                        //ally unit
                        if ( uir_isAlly and obj_map.units[uir_origin_x + uir_temp_x ,uir_origin_y + uir_temp_y ].ownership = global.P_Turn.number ){ 
                            targets_avaliable = true;
                            ds_list_add(global.targetables,  obj_map.units[uir_origin_x + uir_temp_x ,uir_origin_y + uir_temp_y ]);
                            }
                        //enemy unit
                        if ( !uir_isAlly and obj_map.units[uir_origin_x + uir_temp_x ,uir_origin_y + uir_temp_y ].ownership != global.P_Turn.number
                             and obj_map.units[uir_origin_x + uir_temp_x ,uir_origin_y + uir_temp_y ].isVisible ) {
                             targets_avaliable = true;
                             ds_list_add(global.targetables,  obj_map.units[uir_origin_x + uir_temp_x ,uir_origin_y + uir_temp_y ]);
                             }
                        }
                    } 
        }
    }
    
    
return targets_avaliable

