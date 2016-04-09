// set and adjusts relative graphics when placing a Road

set_graphics_river_x = argument0;
set_graphics_river_y = argument1;


//set Origin graphics
scr_check_adjacent_terrain(set_graphics_river_x,set_graphics_river_y, obj_terrain_River.object_index); //returns var adj

obj_map.terrains[set_graphics_river_x,set_graphica_river_y].sprite_index =   asset_get_index( "spr_river_clear" + string(adj));
