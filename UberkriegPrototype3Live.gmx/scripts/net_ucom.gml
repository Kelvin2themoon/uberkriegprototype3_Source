//stop new actions while unit action is being exeuted
global.ready_next = false;

//acting unit
global.acting_unit = obj_map.units[ds_map_find_value(global.net_data_map,"act_ux"),ds_map_find_value(global.net_data_map,"act_uy")];
//remove target unit from map arry
obj_map.units[ds_map_find_value(global.net_data_map,"act_ux"),ds_map_find_value(global.net_data_map,"act_uy")] = 0;
//target unit if exsist
if (ds_map_find_value(global.net_data_map,"tar_ux") != noone){
    global.target_unit = obj_map.units[ds_map_find_value(global.net_data_map,"tar_ux"),ds_map_find_value(global.net_data_map,"tar_uy")];
    //change depth to UI level
    global.acting_unit.depth = ACTIVE_UNIT;
    //remove unit from unit grid
    obj_map.units[global.acting_unit.x div 24,global.acting_unit.y div 24] = 0;
    }

///update radio boarder without acting unit****************************
scr_rangeCheck_reset();
with obj_unit {
    wasStanding = isStanding;
    isStanding = false;
    }
///check if any unit has been lost radio contact
scr_rangeCheck_reset();
//with (obj_unit) wasStanding = isStanding;
scr_updateStanding_global();
//update radio boarder
scr_globalRadioCheck();
scr_update_radioBoarder();
scr_rangeCheck_reset();
scr_updateLocalMove(global.acting_unit);

global.acting_unit.isStanding= true;

with (obj_unit){
    if (wasStanding and !isStanding and id != global.acting_unit.id and global.P_View[global.P_Turn.number,ownership] and isObservable) instance_create(x,y, obj_event_lost);
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

//check if unit has moved: for indirect fire and capture checks
if (ds_priority_size(global.move_order) <2) global.acting_unit_moved = false;
else global.acting_unit_moved = true;

//reframe camera

if global.acting_unit.isObservable{
    var first_pos = ds_priority_find_min(global.move_order);
    var last_pos  = ds_priority_find_max(global.move_order);
    scr_camera_reframe(first_pos,last_pos);
}
instance_create(0,0,obj_execute_unit_orders);

//relay to non active clients
scr_relay(global.net_data_map);

/*
//turn sync replay to host
else if (global.net_mode = 2){
    var map_ready = ds_map_create();
    ds_map_add(map_ready,"scr","net_c_turn_ready");
    ds_map_add(map_ready,"p_num",global.Local_Player);
    scr_send(map_ready,"host");
    }
*/
    



    
    
     


