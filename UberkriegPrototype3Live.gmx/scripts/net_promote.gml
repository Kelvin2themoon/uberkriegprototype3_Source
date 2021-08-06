var pos_x = ds_map_find_value(global.net_data_map,"x");
var pos_y = ds_map_find_value(global.net_data_map,"y");

global.posX = pos_x;
global.posY = pos_y;

obj_map.units[global.posX,global.posY].isCommander = true;
scr_updateStanding(global.P_Turn);

scr_globalRadioCheck();
scr_update_radioBoarder();
scr_rangeCheck_reset();
scr_relay(global.net_data_map);
