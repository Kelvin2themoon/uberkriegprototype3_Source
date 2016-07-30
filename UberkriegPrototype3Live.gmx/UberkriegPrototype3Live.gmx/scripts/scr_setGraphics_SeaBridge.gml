

// set and adjusts relative graphics when placing a Road

set_graphics_seabridge_x = argument0;
set_graphics_seabridge_y = argument1;




//set variable crossing for bridge orientation 
obj_map.terrains[set_graphics_seabridge_x,set_graphics_seabridge_y].crossing = scr_check_solid_terrain(set_graphics_seabridge_x,set_graphics_seabridge_y);

//print sea stuff
scr_setGraphics_Sea(set_graphics_seabridge_x,set_graphics_seabridge_y);


