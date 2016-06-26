/*
Description....

*/


move_check_target = argument0; // target is unit instance that exsist in map

origin_x = move_check_target.x div 24;
origin_y = move_check_target.y div 24;

//graphic
move_tile_graphic = spr_rangecheck_clear;
check_move_cost = 0

//initiate seed tile at origin
global.rangeCheck[origin_x,origin_y].move_cost = 0;

//perform global radio check 
scr_globalRadioCheck();
//with obj_checker_tile if sprite_index = spr_rangecheck_bluedk sprite_index = -1;

for (check_move_cost = 0; check_move_cost < move_check_target.move_points; check_move_cost += 1){
    with (obj_checker_tile){
        //remove dark blue tiles
        //if sprite_index = spr_rangecheck_bluedk sprite_index =-1;
        
//check north ( if enouph move points are left )
        newpos_x = (x div 24)+0;
        newpos_y = (y div 24)-1 ; 
        if(move_cost = other.check_move_cost 
        and scr_inBound(newpos_x,newpos_y) 
        and  global.rangeCheck[newpos_x,newpos_y].move_cost = -1 ){
            if( //total move points needed to move into new tile
                other.check_move_cost 
                + scr_check_move_cost(other.move_check_target,obj_map.terrains[newpos_x ,newpos_y])
                //less than or equalt to move points avaliable
                <= other.move_check_target.move_points){
                //set move cost to new tile
                global.rangeCheck[newpos_x,newpos_y].move_cost = 
                move_cost 
                + scr_check_move_cost(other.move_check_target,obj_map.terrains[newpos_x,newpos_y]);
                //change graphics (turn this tile on), check radio also
                if (global.rangeCheck[newpos_x,newpos_y].sprite_index = spr_rangecheck_gold ) global.rangeCheck[newpos_x,newpos_y].sprite_index = spr_rangecheck_violet;
                else if (global.rangeCheck[newpos_x,newpos_y].sprite_index = -1 or global.rangeCheck[newpos_x,newpos_y].sprite_index = spr_rangecheck_bluedk) global.rangeCheck[newpos_x,newpos_y].sprite_index = spr_rangecheck_bluedk;
                }
            }
            
        //check east ( if enouph move points are left )
        newpos_x = (x div 24)+1;
        newpos_y = (y div 24)+0 ; 
        if(move_cost = other.check_move_cost 
        and scr_inBound(newpos_x,newpos_y) 
        and  global.rangeCheck[newpos_x,newpos_y].move_cost = -1 ){
            if( //total move points needed to move into new tile
                other.check_move_cost 
                + scr_check_move_cost(other.move_check_target,obj_map.terrains[newpos_x ,newpos_y])
                //less than or equalt to move points avaliable
                <= other.move_check_target.move_points){
                //set move cost to new tile
                global.rangeCheck[newpos_x,newpos_y].move_cost = 
                move_cost 
                + scr_check_move_cost(other.move_check_target,obj_map.terrains[newpos_x,newpos_y]);
                //change graphics (turn this sile on)
                //change graphics (turn this tile on), check radio also
                if (global.rangeCheck[newpos_x,newpos_y].sprite_index = spr_rangecheck_gold ) global.rangeCheck[newpos_x,newpos_y].sprite_index = spr_rangecheck_violet;
                else if (global.rangeCheck[newpos_x,newpos_y].sprite_index = -1 or global.rangeCheck[newpos_x,newpos_y].sprite_index = spr_rangecheck_bluedk) global.rangeCheck[newpos_x,newpos_y].sprite_index = spr_rangecheck_bluedk;
                }
            }
            
        //check southf enouph move points are left )
        newpos_x = (x div 24)+0;
        newpos_y = (y div 24)+1 ; 
        if(move_cost = other.check_move_cost 
        and scr_inBound(newpos_x,newpos_y) 
        and  global.rangeCheck[newpos_x,newpos_y].move_cost = -1 ){
            if( //total move points needed to move into new tile
                other.check_move_cost 
                + scr_check_move_cost(other.move_check_target,obj_map.terrains[newpos_x ,newpos_y])
                //less than or equalt to move points avaliable
                <= other.move_check_target.move_points){
                //set move cost to new tile
                global.rangeCheck[newpos_x,newpos_y].move_cost = 
                move_cost 
                + scr_check_move_cost(other.move_check_target,obj_map.terrains[newpos_x,newpos_y]);
                //change graphics (turn this sile on)
                //change graphics (turn this tile on), check radio also
                 if (global.rangeCheck[newpos_x,newpos_y].sprite_index = spr_rangecheck_gold ) global.rangeCheck[newpos_x,newpos_y].sprite_index = spr_rangecheck_violet;
                else if (global.rangeCheck[newpos_x,newpos_y].sprite_index = -1 or global.rangeCheck[newpos_x,newpos_y].sprite_index = spr_rangecheck_bluedk) global.rangeCheck[newpos_x,newpos_y].sprite_index = spr_rangecheck_bluedk;
                }
            }
            
        //check west ( if enouph move points are left )
        newpos_x = (x div 24)-1;
        newpos_y = (y div 24)+0 ; 
        if(move_cost = other.check_move_cost 
        and scr_inBound(newpos_x,newpos_y) 
        and  global.rangeCheck[newpos_x,newpos_y].move_cost = -1 ){
            if( //total move points needed to move into new tile
                other.check_move_cost 
                + scr_check_move_cost(other.move_check_target,obj_map.terrains[newpos_x ,newpos_y])
                //less than or equalt to move points avaliable
                <= other.move_check_target.move_points){
                //set move cost to new tile
                global.rangeCheck[newpos_x,newpos_y].move_cost = 
                move_cost 
                + scr_check_move_cost(other.move_check_target,obj_map.terrains[newpos_x,newpos_y]);
                //change graphics (turn this sile on)
                //change graphics (turn this tile on), check radio also
                if (global.rangeCheck[newpos_x,newpos_y].sprite_index = spr_rangecheck_gold ) global.rangeCheck[newpos_x,newpos_y].sprite_index = spr_rangecheck_violet;
                else if (global.rangeCheck[newpos_x,newpos_y].sprite_index = -1 or global.rangeCheck[newpos_x,newpos_y].sprite_index = spr_rangecheck_bluedk) global.rangeCheck[newpos_x,newpos_y].sprite_index = spr_rangecheck_bluedk;
                }
            }        
        }
    }


















/*



old [faliour] code





//create seed note at unit origin
global.rangeCheck[origin_x,origin_y].check_this_node 
= true;//check this node is true

//set origin move_points left to move or fuel if limited
if (move_check_target.fuel < move_check_target.move_points){
    global.rangeCheck[origin_x,origin_y].move_points_left 
    = move_check_target.fuel; 
    }
else{
    global.rangeCheck[origin_x,origin_y].move_points_left 
    =  move_check_target.move_points;
    }
    
//create ender variable (stop when zero)
still_to_check = 1;

while (still_to_check > 0 ){
    with (obj_checker_tile){
        if (check_this_node){
            check_this_node = false;
            
            //check north
            //if there is enugh local movepoints to move north
            if( move_points_left >=  scr_check_move_cost( other.move_check_target,obj_map.terrains[ (x div 24)+0 , (y div 24)-1])){
                global.rangeCheck[ (x div 24)+0 , (y div 24)-1].sprite_index    = other.tile_graphic; //change graphic
                global.rangeCheck[ (x div 24)+0 , (y div 24)-1].check_this_node = true; // add to be checked
                //set new move points left
                global.rangeCheck[ (x div 24)+0 , (y div 24)-1].move_points_left = move_points_left 
                - scr_check_move_cost( other.move_check_target,obj_map.terrains[ (x div 24)+0 , (y div 24)-1]);
                //increase still to check
                other.still_to_check +=1;       
                }
                
            
            ///check east
            if( move_points_left >=  scr_check_move_cost( other.move_check_target,obj_map.terrains[ (x div 24)+1 , (y div 24)+0])){
                global.rangeCheck[ (x div 24)+1 , (y div 24)-0].sprite_index    = other.tile_graphic; //change graphic
                global.rangeCheck[ (x div 24)+1 , (y div 24)-0].check_this_node = true; // add to be checked
                //set new move points left
                global.rangeCheck[ (x div 24)+1 , (y div 24)-0].move_points_left = move_points_left 
                - scr_check_move_cost( other.move_check_target,obj_map.terrains[ (x div 24)+1 , (y div 24)-0]);
                //increase still to check
                other.still_to_check +=1;       
                }
            
          
            
            ///check west
            if( move_points_left >=  scr_check_move_cost( other.move_check_target,obj_map.terrains[ (x div 24)-1 , (y div 24)+0])){
                global.rangeCheck[ (x div 24)-1 , (y div 24)-0].sprite_index    = other.tile_graphic; //change graphic
                global.rangeCheck[ (x div 24)-1 , (y div 24)-0].check_this_node = true; // add to be checked
                //set new move points left
                global.rangeCheck[ (x div 24)-1 , (y div 24)-0].move_points_left = move_points_left 
                - scr_check_move_cost( other.move_check_target,obj_map.terrains[ (x div 24)-1 , (y div 24)-0]);
                //increase still to check
                other.still_to_check +=1;       
                }
            other.still_to_check -=1;   
            }
            

        }
            
    }



/*
while (still_to_check > 0){
    with(obj_checker_tile ){
        if (check_this_node){
            //check north if enough Mp
            if (move_points_left >= scr_check_move_cost(other.move_check_target,obj_map.terrains[(x div 24)+0, (y div 24)-1])){
                //if tile has not been checked
                    if (global.rangeCheck[(x div 24)+0, (y div 24)-1].move_points_left = -1){
                        //activate new node & increase check count
                        global.rangeCheck[(x div 24)+0, (y div 24)-1].check_this_node = true;
                        other.still_to_check +=1
                        //set move points left
                        global.rangeCheck[(x div 24)+0, (y div 24)-1].move_points_left 
                        = move_points_left - scr_check_move_cost(other.move_check_target,obj_map.terrains[(x div 24)+0, (y div 24)-1]);
                        //set graphic on
                        sprite_index = other.tile_graphic;
                    } 
                }
            check_this_node = false;
            other.still_to_check -=1;
            }
        }    
    }

