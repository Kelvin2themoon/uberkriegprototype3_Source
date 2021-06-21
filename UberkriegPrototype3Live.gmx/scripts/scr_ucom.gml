//read netowrk events from sent via global.net_unit_orders

//acting unit
global.acting_unit =
obj_map.units[ds_map_find_value(global.net_data_map,"act_ux"),ds_map_find_value(global.net_data_map,"act_uy")];
//target unit if exsist
if (ds_map_find_value(global.net_data_map,"tar_ux") != noone){
    global.target_unit = obj_map.units[ds_map_find_value(global.net_data_map,"tar_ux"),ds_map_find_value(global.net_data_map,"tar_uy")];
    //change depth to UI level
    global.acting_unit.depth = ACTIVE_UNIT;
    //remove unit from unit grid
    obj_map.units[global.acting_unit.x div 24,global.acting_unit.y div 24] = 0;
    }
//unit action
global.action_order = ds_map_find_value(global.net_data_map,"com");
//convert move path from list to priority queue
var list_mx = ds_map_find_value(global.net_data_map,"movex");
var list_my = ds_map_find_value(global.net_data_map,"movey");
//clear move list and destory al path nodes jyst in case
ds_priority_clear(global.move_order);
with(obj_path_node) instance_destroy();
//re-construct move path
var i = 0;
var tnode = noone;
var tx = 0;
var ty = 0;
for( i=0 ; i<ds_list_size(list_mx) ; i++){
    tx = ds_list_find_value(list_mx,i);
    ty = ds_list_find_value(list_my,i);
    tnode = instance_create(tx,ty,obj_path_node);
    ds_priority_add(global.move_order,tnode,i);
    }
//reframe camera
var first_pos = ds_priority_find_min(global.move_order);
var last_pos  = ds_priority_find_max(global.move_order);

if (last_pos.x < view_xview[0]) view_xview[0] = last_pos.x - 48 ;
if (last_pos.x +24 > view_xview[0] + 768) view_xview[0] =  last_pos.x -768 +48 +24 ;
if (last_pos.y < view_yview[0]) view_yview[0] = last_pos.y - 48 ;
if (last_pos.y +24 > view_yview[0] + 768) view_yview[0] =  last_pos.y -768 +48 +24 ;

if (first_pos.x < view_xview[0]) view_xview[0] = first_pos.x - 48 ;
if (first_pos.x +24 > view_xview[0] + 432) view_xview[0] =  first_pos.x -432 +48 +24 ;
if (first_pos.y < view_yview[0]) view_yview[0] = first_pos.y - 48 ;
if (first_pos.y +24 > view_yview[0] + 432) view_yview[0] =  first_pos.y -438 +48 +24 ;

instance_create(0,0,obj_execute_unit_orders);

//relay to non active clients
if global.net_mode = 1 scr_relay();
/*
//turn sync replay to host
else if (global.net_mode = 2){
    var map_ready = ds_map_create();
    ds_map_add(map_ready,"scr","net_c_turn_ready");
    ds_map_add(map_ready,"p_num",global.Local_Player);
    scr_send(map_ready,"host");
    }
*/
    







    
    
     


