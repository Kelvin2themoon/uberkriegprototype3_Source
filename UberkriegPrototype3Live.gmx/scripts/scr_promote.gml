//PROMOTE!
obj_map.units[global.posX,global.posY].isCommander = true;
scr_updateStanding(global.P_Turn);

//network
if global.net_mode = 2 {
    ds_map_clear(global.map_out);
    ds_map_add(global.map_out,"scr","net_promote");
    ds_map_add(global.map_out,"x",global.posX);
    ds_map_add(global.map_out,"y",global.posY);
    scr_send(global.map_out,"host");
    }
// re-initiat UI
scr_exe_control_restart();
instance_destroy();  
