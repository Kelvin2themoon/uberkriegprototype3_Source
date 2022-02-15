///execute at target location
var rounds = 1; // redundent code for smoke screen (multi-charge)
var range = 1;
var damage = 0;
var co_check = global.P_Turn.CO
if (co_check.COP_on) range = co_check.COP_Disrupt;
else if (co_check.SCOP_on) range = co_check.SCOP_Disrupt;
if(co_check.COP_on) damage = co_check.COP_DisruptDamage;
else if(co_check.COP_on) damage = co_check.COP_DisruptDamage;

    //check in bound
    if (scr_inBound(global.posX,global.posY)){
        if (rounds > 0){
            //make the smokes
            var ix = -range;
            var iy = -range;
            rounds -= 1;
            
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
                                    hp -= damage;
                                    if (hp < 1) hp = 1;
                                    }    
                                }
                            }
                        }
                    }
                }
            }
        //netowrk mode
        if global.net_mode = 2{
            ds_map_clear(global.map_out);
            ds_map_add(global.map_out,"scr","net_cofx_disrupt");
            ds_map_add(global.map_out,"x",global.posX);
            ds_map_add(global.map_out,"y",global.posY);
            scr_send(global.map_out,"host");
            }
        //Re-initiate UI
        if (rounds <=0 )
            {
            scr_exe_control_restart();
            instance_destroy();
            }
        }
    
