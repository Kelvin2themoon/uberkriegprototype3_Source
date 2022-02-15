//remove unit if space is occupied
instance_deactivate_object(obj_miniwin);
if(obj_map.units[global.posX,global.posY] != 0){
    instance_destroy(obj_map.units[global.posX,global.posY]);
    global.unit_check = 0;
    obj_map.units[global.posX,global.posY] = 0;
    }

scr_setUnit(obj_unit_LandCruiser,global.posX,global.posY,global.P_Turn.number);
new_unit = obj_map.units[global.posX,global.posY];
new_unit.team = global.P_Turn.team;
//check observablility
if (global.observe_P[global.P_Turn.number])  new_unit.isObservable = true;
// update vision
scr_updateLocalVision(new_unit);
// update standing
scr_updateStanding_global();
//update Radio Boarder
scr_globalRadioCheck();
scr_update_radioBoarder();
scr_rangeCheck_reset();
        
         //network mode
        if global.net_mode = 2 {
            ds_map_clear(global.map_out);
            ds_map_add(global.map_out,"scr","net_deploy_land_cruiser");
            ds_map_add(global.map_out,"x",global.posX);
            ds_map_add(global.map_out,"y",global.posY);
            scr_send(global.map_out,"host");
            }
        // re-initiat UI
        scr_exe_control_restart();
        //instance_activate_object(obj_miniwin);
        instance_destroy();  
