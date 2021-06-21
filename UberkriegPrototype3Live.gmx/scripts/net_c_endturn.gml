//end turn script sent by client
//type A: from acting player
//type B: from off turn players

//host ends turn (should be after all players confirmed)
// remember that data maps associated with the network event will delet automatically post step
var n = ds_map_find_value(global.net_data_map,"p_num"); 
global.last_network_event ="P"+ string(n) +  " initiated end turn";
//if (n = global.P_Turn.number) scr_syscom_execute("endturn");

//reset okayer ready
scr_clear_player_ready();
global.Host_ready = true;
//set acting player to ready
global.P_ready[n] = true;


//relay orders to other players - wait for confirm befor starting next turn
if (n = global.P_Turn.number){
    ds_map_clear(global.map_out);
    ds_map_add(global.map_out,"scr","net_h_endturn");
    scr_send(global.map_out,"relay");
    }
//replay as non acting player, tall host to initiate end turn

