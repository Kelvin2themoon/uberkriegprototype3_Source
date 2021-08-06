var pos_x = ds_map_find_value(global.net_data_map,"x");
var pos_y = ds_map_find_value(global.net_data_map,"y");

global.posX = pos_x;
global.posY = pos_y;

//retireve range
var range = 0;
if global.P_Turn.CO.COP_on var range = global.P_Turn.CO.COP_Disrupt;
else if global.P_Turn.CO.SCOP_on var range = global.P_Turn.CO.SCOP_Disrupt;

//makes the loops
            for( ix = -range ; ix <= range ; ix++){
                for(iy = -range ; iy <= range ; iy++){
                    if( abs(ix) + abs(iy) <= range){
                        //check inbound then set to terrain isSmoke on
                        if( scr_inBound(global.posX+ix,global.posY+iy) ){
                            //check for unit
                            if( obj_map.units[global.posX+ix,global.posY+iy] != 0 ) {
                                with(obj_map.units[global.posX+ix,global.posY+iy]){
                                    isDisrupted = true;
                                    state = "exhaust" ;
                                    if( global.P_Turn.CO.COP_on ) hp -=  global.P_Turn.CO.COP_DisruptDamage;
                                    else if ( global.P_Turn.CO.SCOP_on ) hp -=  global.P_Turn.CO.SCOP_DisruptDamage;
                                    }    
                                }
                            }
                        }
                    }
                }

scr_globalRadioCheck();
scr_update_radioBoarder();
scr_rangeCheck_reset();
scr_relay(global.net_data_map);
