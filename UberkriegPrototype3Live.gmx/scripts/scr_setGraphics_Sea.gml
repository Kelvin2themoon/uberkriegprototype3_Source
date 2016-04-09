set_graphics_sea_x = argument0;
set_graphics_sea_y = argument1;


//set land corner variable to corner check
obj_map.terrains[set_graphics_sea_x,set_graphics_sea_y].land_corner = scr_check_corner_terrain(set_graphics_sea_x,set_graphics_sea_y);

//set edge variable to land check
obj_map.terrains[set_graphics_sea_x,set_graphics_sea_y].land_edge = scr_check_land_terrain(set_graphics_sea_x,set_graphics_sea_y);
obj_map.terrains[set_graphics_sea_x,set_graphics_sea_y].river_edge=0;
//change isWet to false if  it cannot accomidate a river opening
if (adj!=1 &&
    adj!=2 &&
    adj!=4 &&
    adj!=5 &&
    adj!=8 &&
    adj!=10
   )
    {
    obj_map.terrains[set_graphics_sea_x,set_graphics_sea_y].isWet= false;
    }
else{

obj_map.terrains[set_graphics_sea_x,set_graphics_sea_y].isWet= true;

//set river edge variable to river adjacent check


adj = 0;
if (instance_exists(obj_terrain_River))
    {
    scr_check_adjacent_terrain(set_graphics_sea_x,set_graphics_sea_y, obj_terrain_River.object_index);
    }
    
if (sprite_exists(asset_get_index("spr_river_clear_"+string(adj))))
    {
    obj_map.terrains[set_graphics_sea_x,set_graphics_sea_y].river_edge = adj;
    }
}
