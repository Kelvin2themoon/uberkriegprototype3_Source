///execute at target location
var co_check = global.P_Turn.CO
var smoke_rounds = co_check.COFX_rounds; // redundent code for smoke screen (multi-charge)
var smoke_range = 2;
var damage = 0;

//check in bound
if (scr_inBound(global.posX,global.posY)){
    if (smoke_rounds > 0){
        //make the smokes
        ix = -smoke_range;
        iy = -smoke_range;
        smoke_rounds -= 1;
        global.P_Turn.CO.rounds = smoke_rounds
        
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
        }
    //netowrk mode
    if global.net_mode = 2{
        ds_map_clear(global.map_out);
        ds_map_add(global.map_out,"scr","net_cofx_smkoe");
        ds_map_add(global.map_out,"x",global.posX);
        ds_map_add(global.map_out,"y",global.posY);
        scr_send(global.map_out,"host");
        }
    //Re-initiate UI
    if (smoke_rounds <=0 ){
        global.wave = 100;
        scr_exe_control_restart();
        instance_destroy();
        }
    else{
        var re_con = instance_create(global.posX,global.posY,obj_smokeScreenCurosr);
        re_con.range = 2;
        re_con.rounds = smoke_rounds;
        co_check.COFX_rounds = smoke_rounds;
        global.wave = 100;
        instance_destroy();
        }
    }
