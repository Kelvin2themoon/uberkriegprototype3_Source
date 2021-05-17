// retioreve argumetns from ds map
// ds map should have been read in masterControls - network event

//retrieve player number form ds map

global.Local_Player = ds_map_find_value( global.net_data_map , "p_num" );
global.last_network_event = "assigned player to slot " + string( global.Local_Player );
