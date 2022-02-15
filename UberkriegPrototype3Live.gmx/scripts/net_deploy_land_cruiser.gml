var pos_x = ds_map_find_value(global.net_data_map,"x");
var pos_y = ds_map_find_value(global.net_data_map,"y");

global.posX = pos_x;
global.posY = pos_y;

var remove_unit = obj_map.units[global.posX,global.posY];
if (remove_unit) !=0 {
    instance_destroy(remove_unit);
    remove_unit = 0;
    global.unit_check = 0;
    } 


scr_setUnit(obj_unit_LandCruiser,pos_x,pos_y,global.P_Turn.number);
deployed_unit = obj_map.units[global.posX,global.posY]
deployed_unit.team = global.P_Turn.team;
scr_camera_reframe(deployed_unit,deployed_unit);
//check observablility
if global.observe_P[global.P_Turn.number]  deployed_unit.isObservable = true;
// update vision
scr_updateLocalVision(deployed_unit);
if (deployed_unit.isObservable) cam_bring_into_frame(deployed_unit,48);
// update standing
scr_updateStanding_global();
//update Radio Boarder
scr_globalRadioCheck();
scr_update_radioBoarder();
scr_rangeCheck_reset();

scr_relay(global.net_data_map);
