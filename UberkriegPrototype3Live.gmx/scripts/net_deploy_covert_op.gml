var pos_x = ds_map_find_value(global.net_data_map,"x");
var pos_y = ds_map_find_value(global.net_data_map,"y");

global.posX = pos_x;
global.posY = pos_y;

scr_setUnit(obj_unit_CovertOp,pos_x,pos_y,global.P_Turn.number);
deployed_unit = obj_map.units[global.posX,global.posY]
deployed_unit.team = global.P_Turn.team;
deployed_unit.isHidden = true;
deployed_unit.isObservable = global.P_View[global.P_Turn.number,deployed_unit.ownership];

scr_camera_reframe(deployed_unit,deployed_unit);
// update visionin
if deployed_unit.isObservable scr_updateLocalVision(deployed_unit);
// update standing
scr_updateStanding_global();
//update Radio Boarder
scr_globalRadioCheck();
scr_update_radioBoarder();
scr_rangeCheck_reset();

scr_relay(global.net_data_map);
