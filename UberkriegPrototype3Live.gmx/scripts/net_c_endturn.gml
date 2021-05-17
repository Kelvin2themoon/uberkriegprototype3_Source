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
//set acting player to ready
global.P_ready[n] = true;


//relay orders to other players - wait for confirm befor starting next turn
if (n = global.P_Turn.number){
    var h_endturn = ds_map_create();
    ds_map_add(h_endturn,"scr","net_h_endturn");
    scr_send(h_endturn,"relay");
    }
//replay as non acting player, tall host to initiate end turn

