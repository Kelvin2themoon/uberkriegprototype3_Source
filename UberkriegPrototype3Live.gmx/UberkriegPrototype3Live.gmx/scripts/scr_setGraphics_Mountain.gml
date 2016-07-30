// set and adjusts relative graphics when placing a Mountain

set_graphics_mt_x = argument0;
set_graphics_mt_y = argument1;
adj=0;

//set Origin graphics
scr_check_adjacent_terrain_sides(set_graphics_mt_x,set_graphics_mt_y, obj_terrain_Mountain.object_index); //returns var adj
obj_map.terrains[set_graphics_mt_x,set_graphics_mt_y].image_index = adj;

