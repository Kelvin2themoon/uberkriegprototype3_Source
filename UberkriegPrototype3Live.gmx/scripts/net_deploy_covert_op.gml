var pos_x = ds_map_find_value(global.net_data_map,"x");
var pos_y = ds_map_find_value(global.net_data_map,"y");

global.posX = pos_x;
global.posY = pos_y;

scr_setUnit(obj_unit_CovertOp,pos_x,pos_y,global.P_Turn.number);
deployed_unit = obj_map.units[global.posX,global.posY]
deployed_unit.team = global.P_Turn.team;
deployed_unit.isHidden = true;
scr_camera_reframe(deployed_unit,deployed_unit);
//check observablility
if global.observe_P[global.P_Turn.number]  deployed_unit.isObservable = true;
// update visioni
scr_updateLocalVision(deployed_unit);
// update standing
scr_updateStanding_global();
//update Radio Boarder
scr_globalRadioCheck();
scr_update_radioBoarder();
scr_rangeCheck_reset();

scr_relay(global.net_data_map);
