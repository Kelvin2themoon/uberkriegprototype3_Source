/*
This cript is to be called in move_cursor object to find the shortest path back to the origin
counting down move_const down to 0

*/

destination = argument0;//checker tile
move_left = destination.move_cost;// destination move_cost

//set destination
destination.pathority = destination.move_cost;
path_total = destination.move_cost;

checking = destination
checkingX = checking.x div 24;
checkingY = checking.y div 24;

loop = 0 ;//loop count

//clear move orders

ds_priority_clear(global.move_order);

adjQ = ds_priority_create();
while( move_left > 0){    
    //feed adjecent tiles into priority Q
    
    if (global.rangeCheck[checkingX+1,checkingY+0].move_cost !=  -1 and scr_inBound(checkingX+1,checkingY+0))
    ds_priority_add(adjQ,global.rangeCheck[checkingX+1,checkingY+0].id,global.rangeCheck[checkingX+1,checkingY+0].move_cost);
    
    if (global.rangeCheck[checkingX-1,checkingY+0].move_cost !=  -1 and scr_inBound(checkingX-1,checkingY+0))
    ds_priority_add(adjQ,global.rangeCheck[checkingX-1,checkingY+0].id,global.rangeCheck[checkingX-1,checkingY+0].move_cost);
    
    if (global.rangeCheck[checkingX+0,checkingY+1].move_cost !=  -1 and scr_inBound(checkingX+0,checkingY+1))
    ds_priority_add(adjQ,global.rangeCheck[checkingX+0,checkingY+1].id,global.rangeCheck[checkingX+0,checkingY+1].move_cost);
    
    if (global.rangeCheck[checkingX+0,checkingY-1].move_cost !=  -1 and scr_inBound(checkingX+0,checkingY-1))
    ds_priority_add(adjQ,global.rangeCheck[checkingX+0,checkingY-1].id,global.rangeCheck[checkingX+0,checkingY-1].move_cost);
    
    //minus move_cost
    move_left -= scr_check_move_cost(acting_unit,obj_map.terrains[checkingX,checkingY]);
    
    //set new check
    checking = ds_priority_find_min(adjQ);
    checking.pathority = checking.move_cost;
    checkingX = checking.x div 24;
    checkingY = checking.y div 24;
    //add to move_order
    ds_priority_add(global.move_order,checking,checking.move_cost);
    //clear Q
    ds_priority_clear(adjQ);
    loop +=1;
    }
    
ds_priority_destroy(adjQ);

//draw_path
scr_draw_path();


