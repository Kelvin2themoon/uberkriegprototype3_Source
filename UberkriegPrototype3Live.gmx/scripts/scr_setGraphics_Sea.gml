set_graphics_sea_x = argument0;
set_graphics_sea_y = argument1;


//set land corner variable to corner check
obj_map.terrains[set_graphics_sea_x,set_graphics_sea_y].land_corner = scr_check_corner_terrain(set_graphics_sea_x,set_graphics_sea_y);
//set edge variable to land check
obj_map.terrains[set_graphics_sea_x,set_graphics_sea_y].land_edge = scr_check_land_terrain(set_graphics_sea_x,set_graphics_sea_y);

