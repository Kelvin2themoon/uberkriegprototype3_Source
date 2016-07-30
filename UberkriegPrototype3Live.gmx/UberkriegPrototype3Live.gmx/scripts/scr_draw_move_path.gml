//clear  image index values
with(obj_path_node) image_index = 0;



//copy move order
draw_path_copy = ds_priority_create(); 
ds_priority_copy(draw_path_copy, global.move_order);
//check path total size
path_size = ds_priority_size(draw_path_copy);


//initiate path at origin
from_node = ds_priority_delete_min(draw_path_copy);

while ( ds_priority_size(draw_path_copy) > 0){
    to_node = ds_priority_delete_min(draw_path_copy);
    
    switch (from_node.x - to_node.x){
        case 0: //do nothing 
            break;
        //go west
        case 24:
            if (from_node.image_index !=8) from_node.image_index +=8;
            if (to_node.image_index !=2) to_node.image_index +=2;
            break;
        //go east
        case-(24):
        if (from_node.image_index !=2)from_node.image_index +=2;
        if (to_node.image_index !=8)to_node.image_index +=8;
        break;
        } 
    
    switch (from_node.y - to_node.y){
        case 0 : break; //do nothin'
        //north
        case 24:
        if (from_node.image_index !=1) from_node.image_index +=1;
        if (to_node.image_index !=4) to_node.image_index +=4;
        break;
    //south
    case(-24):
        if (from_node.image_index !=4) from_node.image_index +=4;
        if (to_node.image_index !=1) to_node.image_index +=1;
        break;
        }
    from_node = to_node;
    }
//destroy copy Q
ds_priority_destroy(draw_path_copy);



//final node ->
if (path_size > 1){
switch (to_node.image_index){
    case 1: to_node.image_index = 16; break;
    case 2: to_node.image_index = 17; break;
    case 4: to_node.image_index = 18; break;
    case 8: to_node.image_index = 19; break;
        }
    }
