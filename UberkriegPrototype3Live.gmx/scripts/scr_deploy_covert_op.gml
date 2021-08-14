scr_setUnit(obj_unit_CovertOp,global.posX,global.posY,global.P_Turn.number);  
var deployed_unit =  obj_map.units[global.posX,global.posY];
deployed_unit.team = global.P_Turn.team;
deployed_unit.isHidden= true;


//deployed_unit.isObservable = global.P_View[global.P_Turn.number,deployed_unit.ownership]
//deployed_unit.isObservable = true;
//check observablility
//if global.observe_P[global.P_Turn.number]  obj_map.units[global.posX, global.posY].isObservable = true;
// update visioni
scr_updateLocalVision(obj_map.units[global.posX,global.posY]);
// update standing
scr_updateStanding_global();
//update Radio Boarder
scr_globalRadioCheck();
scr_update_radioBoarder();
scr_rangeCheck_reset();

//network mode
if global.net_mode = 2 {
    ds_map_clear(global.map_out);
    ds_map_add(global.map_out,"scr","net_deploy_covert_op");
    ds_map_add(global.map_out,"x",global.posX);
    ds_map_add(global.map_out,"y",global.posY);
    scr_send(global.map_out,"host");
    }
// re-initiat UI
scr_exe_control_restart();
instance_activate_object(obj_miniwin);
instance_destroy();  
