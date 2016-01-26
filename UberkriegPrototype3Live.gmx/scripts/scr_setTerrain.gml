
//scr_setTerrain (new terrain, X, Y)

set_terrain_type    =  argument0;
set_terrain_x       =  argument1;
set_terrain_y       =  argument2;


if scr_inBound(set_terrain_x,set_terrain_y) // check within map limits
        {
        // destroy exsisting terrain
        with(obj_map.terrains[set_terrain_x,set_terrain_y])instance_destroy();
        //place new terrain
        obj_map.terrains[set_terrain_x,set_terrain_y] = instance_create(set_terrain_x*24 ,set_terrain_y*24 ,set_terrain_type);
        scr_setGraphics_Road();
        }    
     
