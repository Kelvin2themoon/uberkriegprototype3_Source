
//target is hidden
global.target_unit.isHidden = true;
//consume special rounds
global.P_Turn.CO.rounds -=1;
//if network mode
if ( global.net_mode = 2){
    ds_map_clear(global.map_out);
    ds_map_add(global.map_out,"scr","net_hide");
    ds_map_add(global.map_out,"x",global.posX);
    ds_map_add(global.map_out,"y",global.posY);
    scr_send(global.map_out,"host");
    }
//destroy if rounds are used up
if (global.P_Turn.CO.rounds <= 0){
    // re-initiat UI
    instance_activate_object(obj_battleCursor);
    instance_activate_object(obj_miniwin);
    instance_destroy();
    }
else { //reactivate dummy deploy cursor
    instance_activate_object(obj_deployDummyCursor);
    instance_destroy();
    }

