/*
Description....

*/


move_check_target = argument0; // target is unit instance that exsist in map

origin_x = move_check_target.x div 24;
origin_y = move_check_target.y div 24;



//graphic
move_tile_graphic = spr_rangecheck_clear;
check_move_cost = 0

max_move_points =  move_check_target.move_points;

//check for CO bonus

if (move_check_target.ownership !=0)
    {
    with(obj_CO_0)
        {
        if( other.move_check_target.ownership = ownership )
            {
            other.max_move_points += D2D_Mov[other.move_check_target.unit_index];
            if( COP_on ) other.max_move_points += COP_Mov[other.move_check_target.unit_index];
            if( SCOP_on ) other.max_move_points += SCOP_Mov[other.move_check_target.unit_index];
            }
        }
    }



//chek fuel restrictions
if (move_check_target.fuel < max_move_points) max_move_points = move_check_target.fuel;


//initiate seed tile at origin
global.rangeCheck[origin_x,origin_y].move_cost = 0;

//make exception
move_check_target.isException = true;
//check standing
scr_updateStanding_global();

//perform global radio check 
scr_globalRadioCheck();
//use radio info to set isOnRadioVariable
with (obj_checker_tile){
    if sprite_index = spr_rangecheck_gold isOnRadio = true;
    else isOnRadio = false;
    sprite_index = -1;
    }


for (check_move_cost = 0; check_move_cost < max_move_points; check_move_cost += 1){
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
                <= other.max_move_points){
                //set move cost to new tile
                global.rangeCheck[newpos_x,newpos_y].move_cost = 
                move_cost 
                + scr_check_move_cost(other.move_check_target,obj_map.terrains[newpos_x,newpos_y]);
                //change graphics (turn this tile on), check radio also
                if (global.rangeCheck[newpos_x,newpos_y].isOnRadio = true ) global.rangeCheck[newpos_x,newpos_y].sprite_index = spr_rangecheck_clear;
                else  global.rangeCheck[newpos_x,newpos_y].sprite_index = spr_rangecheck_bluedk;
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
                <= other.max_move_points){
                //set move cost to new tile
                global.rangeCheck[newpos_x,newpos_y].move_cost = 
                move_cost 
                + scr_check_move_cost(other.move_check_target,obj_map.terrains[newpos_x,newpos_y]);
                //change graphics (turn this sile on)
                //change graphics (turn this tile on), check radio also
               if (global.rangeCheck[newpos_x,newpos_y].isOnRadio = true ) global.rangeCheck[newpos_x,newpos_y].sprite_index = spr_rangecheck_clear;
                else  global.rangeCheck[newpos_x,newpos_y].sprite_index = spr_rangecheck_bluedk;
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
                <= other.max_move_points){
                //set move cost to new tile
                global.rangeCheck[newpos_x,newpos_y].move_cost = 
                move_cost 
                + scr_check_move_cost(other.move_check_target,obj_map.terrains[newpos_x,newpos_y]);
                //change graphics (turn this sile on)
                //change graphics (turn this tile on), check radio also
                 if (global.rangeCheck[newpos_x,newpos_y].isOnRadio = true ) global.rangeCheck[newpos_x,newpos_y].sprite_index = spr_rangecheck_clear;
                else  global.rangeCheck[newpos_x,newpos_y].sprite_index = spr_rangecheck_bluedk;
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
                <= other.max_move_points){
                //set move cost to new tile
                global.rangeCheck[newpos_x,newpos_y].move_cost = 
                move_cost 
                + scr_check_move_cost(other.move_check_target,obj_map.terrains[newpos_x,newpos_y]);
                //change graphics (turn this sile on)
                //change graphics (turn this tile on), check radio also
                if (global.rangeCheck[newpos_x,newpos_y].isOnRadio = true ) global.rangeCheck[newpos_x,newpos_y].sprite_index = spr_rangecheck_clear;
                else  global.rangeCheck[newpos_x,newpos_y].sprite_index = spr_rangecheck_bluedk;
                }
            }        
        }
    }
    
if (move_check_target.isCommander) {
    with (obj_checker_tile) if (sprite_index != -1) sprite_index = spr_rangecheck_clear;     

    }
    
//undo make exception
move_check_target.isException = false;
//check standing
scr_updateStanding_global();







