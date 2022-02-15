var unit_type = ds_map_find_value(global.net_data_map,"index");
var pos_x = ds_map_find_value(global.net_data_map,"x")
var pos_y = ds_map_find_value(global.net_data_map,"y")

global.posX = pos_x;
global.posY = pos_y;


scr_setUnit(global.unit_type[unit_type],pos_x,pos_y,global.P_Turn.number);

var new_dummy = obj_map.units[pos_x,pos_y];

with new_dummy {
    team = global.P_Turn.team;
    state = "idle";
    hp = 1;
    dummy = true;
    HP_hidden = true;
    //check for COP and SCOP
    if (global.P_Turn.CO.COP_on )  COP  = true ;
    if (global.P_Turn.CO.SCOP_on)  SCOP = true ;
    //if unit is Covert.op, hide
    if unit_index = 10 isHidden = true;
    // network mode
    }




//update standing
scr_updateStanding_global();
//scr_updateLocalRadio(obj_map.units[global.posX,global.posY]);
//update vision
scr_updateLocalVision(new_dummy);
//snap camera
if (new_dummy.isObservable) cam_bring_into_frame(new_dummy,48);
//update Radio Boarder
scr_globalRadioCheck();
scr_update_radioBoarder();
scr_rangeCheck_reset();

if global.net_mode = 1 scr_relay(global.net_data_map); 



