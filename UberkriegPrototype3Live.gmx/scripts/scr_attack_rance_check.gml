arc_unit = argument0;

arc_origin_x = arc_unit.x div 24;
arc_origin_y = arc_unit.y div 24;

//clear
scr_rangeCheck_reset();

//move_max
//check CO effects
max_move_points = arc_unit.move_points;

if (arc_unit.ownership !=0)
    {
    with(obj_CO_0)
        {
        if( other.arc_unit.ownership = ownership )
            {
            other.max_move_points += D2D_Mov[other.arc_unit.unit_index];
            if( COP_on ) other.max_move_points += COP_Mov[other.arc_unit.unit_index];
            if( SCOP_on ) other.max_move_points += SCOP_Mov[other.arc_unit.unit_index];
            }
        }
    }
    
//rstrict by fuel
if (arc_unit.fuel < max_move_points)  max_move_points = arc_unit.fuel;

//check for direct attack
if (arc_unit.max_range = 1){
if (arc_unit.ammo  = 0 and !arc_unit.haveSecondaryWeapon){} //if cant attack
else{
    //make generic move check (without radio check)...then check each attack possibilities
    //graphic
    move_tile_graphic = spr_rangecheck_clear;
    attack_tile_graphic = spr_rangecheck_red;
    check_move_cost = 0
    
    //initiate seed tile at origin
    global.rangeCheck[arc_origin_x,arc_origin_y].move_cost = 0;
    
    
    
    for (check_move_cost = 0; check_move_cost < max_move_points; check_move_cost += 1){
        with (obj_checker_tile){
    
            //check north ( if enouph move points are left )
            newpos_x = (x div 24)+0;
            newpos_y = (y div 24)-1;
            //cost check 
            if(move_cost = other.check_move_cost 
            and scr_inBound(newpos_x,newpos_y) 
            and  global.rangeCheck[newpos_x,newpos_y].move_cost = -1 ){
                if( //total move points needed to move into new tile
                    other.check_move_cost 
                    + scr_check_move_cost(other.arc_unit,obj_map.terrains[newpos_x ,newpos_y]) <= other.max_move_points){
                    //set move cost to new tile
                    global.rangeCheck[newpos_x,newpos_y].move_cost = move_cost + scr_check_move_cost(other.arc_unit,obj_map.terrains[newpos_x,newpos_y]);
                    //change adjacent tiles to red
                    if scr_inBound(newpos_x+0,newpos_y-1)  global.rangeCheck[newpos_x+0,newpos_y-1].sprite_index =  spr_rangecheck_red; //north
                    if scr_inBound(newpos_x+1,newpos_y-0)  global.rangeCheck[newpos_x+1,newpos_y-0].sprite_index =  spr_rangecheck_red; //east
                    if scr_inBound(newpos_x+0,newpos_y+1)  global.rangeCheck[newpos_x+0,newpos_y+1].sprite_index =  spr_rangecheck_red; //south
                    if scr_inBound(newpos_x-1,newpos_y-0)  global.rangeCheck[newpos_x-1,newpos_y-0].sprite_index =  spr_rangecheck_red; //west
                    }
                }
                
            //check east ( if enouph move points are left )
            newpos_x = (x div 24)+1;
            newpos_y = (y div 24)+0 ; 
            //cost check 
            if(move_cost = other.check_move_cost 
            and scr_inBound(newpos_x,newpos_y) 
            and  global.rangeCheck[newpos_x,newpos_y].move_cost = -1 ){
                if( //total move points needed to move into new tile
                    other.check_move_cost 
                    + scr_check_move_cost(other.arc_unit,obj_map.terrains[newpos_x ,newpos_y]) <= other.max_move_points){
                    //set move cost to new tile
                    global.rangeCheck[newpos_x,newpos_y].move_cost = move_cost + scr_check_move_cost(other.arc_unit,obj_map.terrains[newpos_x,newpos_y]);
                    //change adjacent tiles to red
                    if scr_inBound(newpos_x+0,newpos_y-1)  global.rangeCheck[newpos_x+0,newpos_y-1].sprite_index =  spr_rangecheck_red; //north
                    if scr_inBound(newpos_x+1,newpos_y-0)  global.rangeCheck[newpos_x+1,newpos_y-0].sprite_index =  spr_rangecheck_red; //east
                    if scr_inBound(newpos_x+0,newpos_y+1)  global.rangeCheck[newpos_x+0,newpos_y+1].sprite_index =  spr_rangecheck_red; //south
                    if scr_inBound(newpos_x-1,newpos_y-0)  global.rangeCheck[newpos_x-1,newpos_y-0].sprite_index =  spr_rangecheck_red; //west
                    }
                }
                
            //check southf enouph move points are left )
            newpos_x = (x div 24)+0;
            newpos_y = (y div 24)+1 ; 
            //cost check 
            if(move_cost = other.check_move_cost 
            and scr_inBound(newpos_x,newpos_y) 
            and  global.rangeCheck[newpos_x,newpos_y].move_cost = -1 ){
                if( //total move points needed to move into new tile
                    other.check_move_cost 
                    + scr_check_move_cost(other.arc_unit,obj_map.terrains[newpos_x ,newpos_y]) <= other.max_move_points){
                    //set move cost to new tile
                    global.rangeCheck[newpos_x,newpos_y].move_cost = move_cost + scr_check_move_cost(other.arc_unit,obj_map.terrains[newpos_x,newpos_y]);
                    //change adjacent tiles to red
                    if scr_inBound(newpos_x+0,newpos_y-1)  global.rangeCheck[newpos_x+0,newpos_y-1].sprite_index =  spr_rangecheck_red; //north
                    if scr_inBound(newpos_x+1,newpos_y-0)  global.rangeCheck[newpos_x+1,newpos_y-0].sprite_index =  spr_rangecheck_red; //east
                    if scr_inBound(newpos_x+0,newpos_y+1)  global.rangeCheck[newpos_x+0,newpos_y+1].sprite_index =  spr_rangecheck_red; //south
                    if scr_inBound(newpos_x-1,newpos_y-0)  global.rangeCheck[newpos_x-1,newpos_y-0].sprite_index =  spr_rangecheck_red; //west
                    }
                }
                
            //check west ( if enouph move points are left )
            newpos_x = (x div 24)-1;
            newpos_y = (y div 24)+0 ; 
            //cost check 
            if(move_cost = other.check_move_cost 
            and scr_inBound(newpos_x,newpos_y) 
            and  global.rangeCheck[newpos_x,newpos_y].move_cost = -1 ){
                if( //total move points needed to move into new tile
                    other.check_move_cost 
                    + scr_check_move_cost(other.arc_unit,obj_map.terrains[newpos_x ,newpos_y]) <= other.max_move_points){
                    //set move cost to new tile
                    global.rangeCheck[newpos_x,newpos_y].move_cost = move_cost + scr_check_move_cost(other.arc_unit,obj_map.terrains[newpos_x,newpos_y]);
                    //change adjacent tiles to red
                    if scr_inBound(newpos_x+0,newpos_y-1)  global.rangeCheck[newpos_x+0,newpos_y-1].sprite_index =  spr_rangecheck_red; //north
                    if scr_inBound(newpos_x+1,newpos_y-0)  global.rangeCheck[newpos_x+1,newpos_y-0].sprite_index =  spr_rangecheck_red; //east
                    if scr_inBound(newpos_x+0,newpos_y+1)  global.rangeCheck[newpos_x+0,newpos_y+1].sprite_index =  spr_rangecheck_red; //south
                    if scr_inBound(newpos_x-1,newpos_y-0)  global.rangeCheck[newpos_x-1,newpos_y-0].sprite_index =  spr_rangecheck_red; //west
                    }
                }        
            }
        }
    }

}

else if (arc_unit.canMoveFire and arc_unit.ammo > 0) {
//make generic move check (without radio check)...then check each attack possibilities
    //graphic
    move_tile_graphic = spr_rangecheck_clear;
    attack_tile_graphic = spr_rangecheck_red;
    check_move_cost = 0
    fire_range = arc_unit.max_range
    ///apply CO range FX for move and shoot cursor
    with( obj_CO_0 )
        {
        if( ownership = other.arc_unit.ownership)
            {
            other.fire_range += D2D_Rng[other.arc_unit.unit_index];
            if ( COP_on ) other.fire_range += COP_Rng[other.arc_unit.unit_index];
            if ( SCOP_on ) other.fire_range += SCOP_Rng[other.arc_unit.unit_index];
            }
        }
    
    //initiate seed tile at origin
    global.rangeCheck[arc_origin_x,arc_origin_y].move_cost = 0;
    
    for (check_move_cost = 0; check_move_cost < max_move_points; check_move_cost += 1){
    
        
        with (obj_checker_tile){
    
            //check north ( if enouph move points are left )
            newpos_x = (x div 24)+0;
            newpos_y = (y div 24)-1;
            
            //cost check 
            if(move_cost = other.check_move_cost 
            and scr_inBound(newpos_x,newpos_y) 
            and  global.rangeCheck[newpos_x,newpos_y].move_cost = -1 ){
                if( //total move points needed to move into new tile
                    other.check_move_cost 
                    + scr_check_move_cost(other.arc_unit,obj_map.terrains[newpos_x ,newpos_y]) <= other.max_move_points){
                    //set move cost to new tile
                    global.rangeCheck[newpos_x,newpos_y].move_cost = move_cost + scr_check_move_cost(other.arc_unit,obj_map.terrains[newpos_x,newpos_y]);
                    //change adjacent tiles to red
                    ix = 0;
                    iy = 0;            
                    for (ix = other.fire_range*(-1) ; ix <= other.fire_range ; ix+=1 ){
                        for (iy = other.fire_range*(-1) ; iy <= other.fire_range ; iy+=1 ){
                            if(abs(ix) + abs(iy) <= other.fire_range ){
                            if scr_inBound(newpos_x+ix,newpos_y+iy) global.rangeCheck[newpos_x+ix, newpos_y+iy].sprite_index = spr_rangecheck_red;
                                
                                }
                            } 
                        } 
                    }
                }
                
            //check east ( if enouph move points are left )
            newpos_x = (x div 24)+1;
            newpos_y = (y div 24)+0 ; 
            //cost check 
            if(move_cost = other.check_move_cost 
            and scr_inBound(newpos_x,newpos_y) 
            and  global.rangeCheck[newpos_x,newpos_y].move_cost = -1 ){
                if( //total move points needed to move into new tile
                    other.check_move_cost 
                    + scr_check_move_cost(other.arc_unit,obj_map.terrains[newpos_x ,newpos_y]) <= other.max_move_points){
                    //set move cost to new tile
                    global.rangeCheck[newpos_x,newpos_y].move_cost = move_cost + scr_check_move_cost(other.arc_unit,obj_map.terrains[newpos_x,newpos_y]);
                     ix = 0;
                    iy = 0;
                    for (ix = other.fire_range*(-1) ; ix <= other.fire_range ; ix+=1 ){
                        for (iy = other.fire_range*(-1) ; iy <= other.fire_range ; iy+=1 ){
                            if(abs(ix) + abs(iy) <= other.fire_range ){
                            if scr_inBound(newpos_x+ix,newpos_y+iy) global.rangeCheck[newpos_x+ix, newpos_y+iy].sprite_index = spr_rangecheck_red;
                                
                                }
                            } 
                        } 
                    }
                }
                
            //check southf enouph move points are left )
            newpos_x = (x div 24)+0;
            newpos_y = (y div 24)+1 ; 
            //cost check 
            if(move_cost = other.check_move_cost 
            and scr_inBound(newpos_x,newpos_y) 
            and  global.rangeCheck[newpos_x,newpos_y].move_cost = -1 ){
                if( //total move points needed to move into new tile
                    other.check_move_cost 
                    + scr_check_move_cost(other.arc_unit,obj_map.terrains[newpos_x ,newpos_y]) <= other.max_move_points){
                    //set move cost to new tile
                    global.rangeCheck[newpos_x,newpos_y].move_cost = move_cost + scr_check_move_cost(other.arc_unit,obj_map.terrains[newpos_x,newpos_y]);
                    //change adjacent tiles to red
                     ix = 0;
                    iy = 0;
                    for (ix = other.fire_range*(-1) ; ix <= other.fire_range ; ix+=1 ){
                        for (iy = other.fire_range*(-1) ; iy <= other.fire_range ; iy+=1 ){
                            if(abs(ix) + abs(iy) <= other.fire_range ){
                            if scr_inBound(newpos_x+ix,newpos_y+iy) global.rangeCheck[newpos_x+ix, newpos_y+iy].sprite_index = spr_rangecheck_red;
                                
                                }
                            } 
                        } 
                    }
                }
                
            //check west ( if enouph move points are left )
            newpos_x = (x div 24)-1;
            newpos_y = (y div 24)+0 ; 
            //cost check 
            if(move_cost = other.check_move_cost 
            and scr_inBound(newpos_x,newpos_y) 
            and  global.rangeCheck[newpos_x,newpos_y].move_cost = -1 ){
                if( //total move points needed to move into new tile
                    other.check_move_cost 
                    + scr_check_move_cost(other.arc_unit,obj_map.terrains[newpos_x ,newpos_y]) <= other.max_move_points){
                    //set move cost to new tile
                    global.rangeCheck[newpos_x,newpos_y].move_cost = move_cost + scr_check_move_cost(other.arc_unit,obj_map.terrains[newpos_x,newpos_y]);
                    //change adjacent tiles to red
                     ix = 0;
                    iy = 0;
                    for (ix = other.fire_range*(-1) ; ix <= other.fire_range ; ix+=1 ){
                        for (iy = other.fire_range*(-1) ; iy <= other.fire_range ; iy+=1 ){
                            if(abs(ix) + abs(iy) <= other.fire_range ){
                            if scr_inBound(newpos_x+ix,newpos_y+iy) global.rangeCheck[newpos_x+ix, newpos_y+iy].sprite_index = spr_rangecheck_red;
                                
                                }
                            } 
                        } 
                    }
                }        
            }
        }

    }

//regular indirect fire range check
    
    //check for land cruiser
    aux_min_range = arc_unit.min_range;
    if (arc_unit.name = "Land Cruiser") aux_min_range = 1;
if (arc_unit.ammo  = 0 and !arc_unit.haveSecondaryWeapon){} //if cant attack
else{
    //indirect range check
    ix = 0;
    iy = 0;
    //max range Co effect
    aux_max_rng = arc_unit.max_range
    with( obj_CO_0 )
        {
        if( ownership = other.arc_unit.ownership)
            {
            other.aux_max_rng += D2D_Rng[other.arc_unit.unit_index];
            if(COP_on) other.aux_max_Rng += COP_rng[other.arc_unit.unit_index];
            if(SCOP_on) other.aux_max_Rng += SCOP_rng[other.arc_unit.unit_index];
            }
        } 
    
    
    for (ix = aux_max_rng*(-1) ; ix <= aux_max_rng ; ix+=1 ){
        for (iy = aux_max_rng*(-1) ; iy <= aux_max_rng ; iy+=1 ){
            if( abs(ix) + abs(iy) >= aux_min_range and abs(ix) + abs(iy) <= aux_max_rng ){
            newpos_x = (arc_unit.x div 24) + ix;
            newpos_y = (arc_unit.y div 24) + iy;
            if scr_inBound(newpos_x,newpos_y) global.rangeCheck[newpos_x, newpos_y].sprite_index = spr_rangecheck_red;
                
                }
            } 
        }   
    }














