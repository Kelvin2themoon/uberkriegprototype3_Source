arc_unit = argument0;

arc_origin_x = arc_unit.x div 24;
arc_origin_y = arc_unit.y div 24;

//clear
scr_rangeCheck_reset();

//move_max

max_move_points = arc_unit.move_points;
if (arc_unit.fuel < max_move_points)  max_move_points = arc_unit.fuel;

//check for direct attack
if (arc_unit.max_range = 1){
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
                    + scr_check_move_cost(other.arc_unit,obj_map.terrains[newpos_x ,newpos_y]) <= other.arc_unit.move_points){
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
                    + scr_check_move_cost(other.arc_unit,obj_map.terrains[newpos_x ,newpos_y]) <= other.arc_unit.move_points){
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
                    + scr_check_move_cost(other.arc_unit,obj_map.terrains[newpos_x ,newpos_y]) <= other.arc_unit.move_points){
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
                    + scr_check_move_cost(other.arc_unit,obj_map.terrains[newpos_x ,newpos_y]) <= other.arc_unit.move_points){
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

else if (arc_unit.name = "Land Cruiser") {
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
                    + scr_check_move_cost(other.arc_unit,obj_map.terrains[newpos_x ,newpos_y]) <= other.arc_unit.move_points){
                    //set move cost to new tile
                    global.rangeCheck[newpos_x,newpos_y].move_cost = move_cost + scr_check_move_cost(other.arc_unit,obj_map.terrains[newpos_x,newpos_y]);
                    //change adjacent tiles to red
                    ix = 0;
                    iy = 0;
                    for (ix = other.arc_unit.max_range*(-1) ; ix <= other.arc_unit.max_range ; ix+=1 ){
                        for (iy = other.arc_unit.max_range*(-1) ; iy <= other.arc_unit.max_range ; iy+=1 ){
                            if(abs(ix) + abs(iy) <= other.arc_unit.max_range ){
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
                    + scr_check_move_cost(other.arc_unit,obj_map.terrains[newpos_x ,newpos_y]) <= other.arc_unit.move_points){
                    //set move cost to new tile
                    global.rangeCheck[newpos_x,newpos_y].move_cost = move_cost + scr_check_move_cost(other.arc_unit,obj_map.terrains[newpos_x,newpos_y]);
                     ix = 0;
                    iy = 0;
                    for (ix = other.arc_unit.max_range*(-1) ; ix <= other.arc_unit.max_range ; ix+=1 ){
                        for (iy = other.arc_unit.max_range*(-1) ; iy <= other.arc_unit.max_range ; iy+=1 ){
                            if(abs(ix) + abs(iy) <= other.arc_unit.max_range ){
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
                    + scr_check_move_cost(other.arc_unit,obj_map.terrains[newpos_x ,newpos_y]) <= other.arc_unit.move_points){
                    //set move cost to new tile
                    global.rangeCheck[newpos_x,newpos_y].move_cost = move_cost + scr_check_move_cost(other.arc_unit,obj_map.terrains[newpos_x,newpos_y]);
                    //change adjacent tiles to red
                     ix = 0;
                    iy = 0;
                    for (ix = other.arc_unit.max_range*(-1) ; ix <= other.arc_unit.max_range ; ix+=1 ){
                        for (iy = other.arc_unit.max_range*(-1) ; iy <= other.arc_unit.max_range ; iy+=1 ){
                            if(abs(ix) + abs(iy) <= other.arc_unit.max_range ){
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
                    + scr_check_move_cost(other.arc_unit,obj_map.terrains[newpos_x ,newpos_y]) <= other.arc_unit.move_points){
                    //set move cost to new tile
                    global.rangeCheck[newpos_x,newpos_y].move_cost = move_cost + scr_check_move_cost(other.arc_unit,obj_map.terrains[newpos_x,newpos_y]);
                    //change adjacent tiles to red
                     ix = 0;
                    iy = 0;
                    for (ix = other.arc_unit.max_range*(-1) ; ix <= other.arc_unit.max_range ; ix+=1 ){
                        for (iy = other.arc_unit.max_range*(-1) ; iy <= other.arc_unit.max_range ; iy+=1 ){
                            if(abs(ix) + abs(iy) <= other.arc_unit.max_range ){
                            if scr_inBound(newpos_x+ix,newpos_y+iy) global.rangeCheck[newpos_x+ix, newpos_y+iy].sprite_index = spr_rangecheck_red;
                                
                                }
                            } 
                        } 
                    }
                }        
            }
        }

    }

//regular indirecr fire range check

else{
    //indirect range check
    ix = 0;
    iy = 0;
    for (ix = arc_unit.max_range*(-1) ; ix <= arc_unit.max_range ; ix+=1 ){
        for (iy = arc_unit.max_range*(-1) ; iy <= arc_unit.max_range ; iy+=1 ){
            if( abs(ix) + abs(iy) >= arc_unit.min_range and abs(ix) + abs(iy) <= arc_unit.max_range ){
            newpos_x = (arc_unit.x div 24) + ix;
            newpos_y = (arc_unit.y div 24) + iy;
            if scr_inBound(newpos_x,newpos_y) global.rangeCheck[newpos_x, newpos_y].sprite_index = spr_rangecheck_red;
                
                }
            } 
        }   
    }















