var pos_x = ds_map_find_value(global.net_data_map,"x");
var pos_y = ds_map_find_value(global.net_data_map,"y");

global.posX = pos_x;
global.posY = pos_y;

//retireve range
var smoke_range = 0;
if global.P_Turn.CO.COP_on var smoke_range = global.P_Turn.CO.COP_SmokeScreen;
else if global.P_Turn.CO.SCOP_on var smoke_range = global.P_Turn.CO.SCOP_SmokeScreen;

//makes the loops
            for( ix = -smoke_range ; ix <= smoke_range ; ix++){
                for(iy = -smoke_range ; iy <= smoke_range ; iy++){
                    if( abs(ix) + abs(iy) <= smoke_range){
                        //check inbound then set to terrain isSmoke on
                        if( scr_inBound(global.posX+ix,global.posY+iy) ){
                            with(  obj_map.terrains[global.posX+ix,global.posY+iy] ){
                                isSmoke = true;
                                canHide = true;
                                smoker = global.P_Turn.number;
                                //calculatesmake density
                                smoke_left = 3 - (abs(other.ix) + abs(other.iy)) +smoke_left;
                                if( smoke_left > 3 ) smoke_left = 3;
                                }
                            obj_map.terrains[global.posX+ix,global.posY+iy].isSmoke = true;
                            obj_map.terrains[global.posX+ix,global.posY+iy].canHide = true;
                            obj_map.terrains[global.posX+ix,global.posY+iy].smoker = global.P_Turn.number;
                            }
                        }
                    }
                }

scr_globalRadioCheck();
scr_update_radioBoarder();
scr_rangeCheck_reset();
scr_relay(global.net_data_map);
