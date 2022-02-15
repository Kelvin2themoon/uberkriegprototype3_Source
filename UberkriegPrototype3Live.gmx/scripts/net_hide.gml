var target_x = ds_map_find_value(global.net_data_map,"x");
var target_y = ds_map_find_value(global.net_data_map,"y");

global.posX = target_x;
global.posY = target_y;

var net_unit = obj_map.units[target_x,target_y];

if (net_unit.isObservable) cam_bring_into_frame(net_unit,48);

net_unit.isHidden = true;

//net_unit.isObservable = global.P_View[global.P_Turn.number,net_unit.ownership];
scr_updateLocalVision(net_unit);
if (net_unit.isObservable) cam_bring_into_frame(net_unit,48);

if global.net_mode = 1 scr_relay(global.net_data_map);


