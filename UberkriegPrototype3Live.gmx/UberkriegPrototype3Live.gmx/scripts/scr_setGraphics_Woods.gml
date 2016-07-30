// set and adjusts relative graphics when placing a Woods
set_graphics_woods_x = argument0;
set_graphics_woods_y = argument1;
adj=0;

//set Origin graphics
scr_check_adjacent_terrain_sides(set_graphics_woods_x,set_graphics_woods_y, obj_terrain_Woods.object_index); //returns var adj
obj_map.terrains[set_graphics_woods_x,set_graphics_woods_y].image_index = adj;





