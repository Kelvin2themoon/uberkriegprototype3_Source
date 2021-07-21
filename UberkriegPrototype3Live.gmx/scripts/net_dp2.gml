//special net cod to handle drop phaze 2
global.last_network_event = "net drop phaze 2 script called";
//

//acting unit
var act_x = ds_map_find_value(global.net_data_map,"act_x");
var act_y = ds_map_find_value(global.net_data_map,"act_y");
global.acting_unit = obj_map.units[act_x,act_y];
//destination
//target unit
if (global.acting_unit.load_A !=0){ 
    global.target_unit = global.acting_unit.load_A;
    scr_exe_drop("A");
    }
else if (global.acting_unit.load_B !=0){
    global.target_unit = global.acting_unit.load_B;
    scr_exe_drop("B");
    }
//global.drop_phaze_2 = false;
//relay to clients
scr_relay(global.net_data_map);

