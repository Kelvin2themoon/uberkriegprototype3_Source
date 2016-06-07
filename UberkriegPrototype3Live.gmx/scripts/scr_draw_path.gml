/*
use global.move_order to adjust arrow_index
from min to max
*/

with (obj_checker_tile){
    north = false;
    east  = false;
    south = false;
    west  = false; 
    }

//copy move order
move_order_copy = ds_priority_create();
ds_priority_copy(move_order_copy,global.move_order);

//set up first node (origin) and remove.

entry = ds_priority_delete_min(move_order_copy);
entry_x = entry.x div 24;
entry_y = entry.y div 24;

while(ds_priority_size(move_order_copy) > 0){
    //set and remove target node
    pass = ds_priority_delete_min(move_order_copy);

    // adjust horizontal connections
    switch ( pass.x - entry.x){
        
        //same x co-ordinates
        case 0 :
            //no change
            break;
        // moving west to east    
        case (24) :
            pass.west = true;
            entry.east = true;
            break;
        //move east to west
        case (-24):
            pass.east = true;
            entry.west = true;
            break;
        }
    //adjust for vertival connections
    switch( pass.y - entry.y){
        
        //no change
        case 0 :
            break;
        //moving  south to north
        case (24):
            pass.north = true;
            entry.south = true;
            break;
        //moving north to south
        case (-24):
            pass.south = true;
            entry.north = true;
            break; 
        }
       //set up nest loop
       entry = pass;  
    } 
//destroy copy Q   
ds_priority_destroy(move_order_copy);

//change graphic (arrow_index)

with (obj_checker_tile){
    if (pathority != -1){
        if north arrow_index += 1;
        if east  arrow_index += 2;
        if south arrow_index += 4;
        if west arrow_index  += 8;
        
        //set destination
            
    
        }
    }
