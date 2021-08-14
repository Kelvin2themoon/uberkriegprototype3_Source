//extract data
var posx = ds_map_find_value( global.net_data_map , "posx" );
var posy = ds_map_find_value( global.net_data_map , "posy" );
//unit info
var unit_index = ds_map_find_value( global.net_data_map , "unit" );
var price = ds_map_find_value( global.net_data_map , "price" ); 
var owner = obj_map.terrains[posx,posy].ownership; // from base

//change global pos for camerta
global.posX = posx;
global.posY = posy;

//setup for re link
//with(obj_unit) WasStanding = isStanding;

global.P_Turn.funds -= price;
scr_setUnit(global.unit_type[unit_index],posx,posy,owner);
global.last_network_event = "unit deployed";

var unit = obj_map.units[posx,posy];
//adjust cost to match price
unit.cost = price;
//set team
unit.team = global.P_Turn.team;
//check if player isobservable
if global.observe_P[global.P_Turn.number]  unit.isObservable = true;
scr_updateLocalVision(unit);
//exshaust deployed unit
unit.state = "exhaust" ;
//set if HP is Hidden
if (global.P_Turn.CO.COFX_HiddenHP) unit.HP_hidden = true;
//check for COP and SCOP
if global.P_Turn.CO.COP_on unit.COP = true ;
if global.P_Turn.CO.SCOP_on unit.SCOP = true ;

//update standing
scr_updateStanding_global();
if(unit.isObservable)
scr_updateLocalRadio(unit);
//update vision
scr_updateLocalVision(unit);
//update Radio Boarder
scr_globalRadioCheck();
scr_update_radioBoarder();
scr_rangeCheck_reset();

//check for link
unit.wasStanding = true;
unit.isStanding   = true;
with(obj_unit){ 
    if(!wasStanding and isStanding and isObservable) instance_create(x,y,obj_event_link);
    wasStanding = isStanding
    }     

global.posX = posx;
global.posY = posy;


//relay to non active clients
if global.net_mode = 1 scr_relay (global.net_data_map);
//turn sync replay to host
else if (global.net_mode = 2){
    var map_ready = ds_map_create();
    ds_map_add(map_ready,"scr","net_c_turn_ready");
    ds_map_add(map_ready,"p_num",global.Local_Player);
    scr_send(map_ready,"host");
    } 

