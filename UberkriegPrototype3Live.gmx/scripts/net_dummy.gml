var unit_type = ds_map_find_value(global.net_data_map,"index");
var pos_x = ds_map_find_value(global.net_data_map,"x")
var pos_y = ds_map_find_value(global.net_data_map,"y")

global.posX = pos_x;
global.posY = pos_y;


scr_setUnit(global.unit_type[unit_type],pos_x,pos_y,global.P_Turn.number);

with obj_map.units[pos_x,pos_y] {
    team = global.P_Turn.team;
    state = "idle";
    hp = 1;
    dummy = true;
    HP_hidden = true;
    //check for COP and SCOP
    if global.P_Turn.CO.COP_on obj_map.units[global.posX,global.posY].COP = true ;
    if global.P_Turn.CO.SCOP_on obj_map.units[global.posX,global.posY].SCOP = true ;
    //if unit is Covert.op, hide
    if unit_index = 10 isHidden = true;
    // network mode
    }

//turn isobervable if acting player is observed
if global.observe_P[global.P_Turn.number]  obj_map.units[pos_x,pos_y].isObservable = true;
// update visioni
scr_updateLocalVision(obj_map.units[pos_x,pos_y]);
//update standing
scr_updateStanding_global();
//scr_updateLocalRadio(obj_map.units[global.posX,global.posY]);
//update vision
scr_updateLocalVision(obj_map.units[pos_x,pos_y]);
//update Radio Boarder
scr_globalRadioCheck();
scr_update_radioBoarder();
scr_rangeCheck_reset();

if global.net_mode = 1 scr_relay(global.net_data_map); 



