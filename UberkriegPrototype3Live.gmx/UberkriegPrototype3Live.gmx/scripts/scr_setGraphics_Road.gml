// set and adjusts relative graphics when placing a Road

set_graphics_road_x = argument0;
set_graphics_road_y = argument1;


//set Origin graphics

adjRoad = 0 ;
adjRoad = scr_check_adjacent_terrain(set_graphics_road_x,set_graphics_road_y, obj_terrain_Road.object_index);


// check for seabridge
if instance_exists(obj_terrain_SeaBridge)
    {
    adjRoad = adjRoad + scr_check_adjacent_terrain(set_graphics_road_x,set_graphics_road_y, obj_terrain_SeaBridge.object_index);
    }
    
// check for Riverbridge
if instance_exists(obj_terrain_RiverBridge)
    {
    adjRoad = adjRoad + scr_check_adjacent_terrain(set_graphics_road_x,set_graphics_road_y, obj_terrain_RiverBridge.object_index);
    }


; //returns var adj
obj_map.terrains[set_graphics_road_x,set_graphics_road_y].image_index = adjRoad;


