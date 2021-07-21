var target_x = ds_map_find_value(global.net_data_map,"x");
var target_y = ds_map_find_value(global.net_data_map,"y");

global.posX = target_x;
global.posY = target_y;

obj_map.units[target_x,target_y].isHidden = true;
if global.net_mode = 1 scr_relay(global.net_data_map);
