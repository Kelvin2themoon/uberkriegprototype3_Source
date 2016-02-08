
//scr_resetTerrainGraphics (X, Y)

set_terrainG_x       =  argument0;
set_terrainG_y       =  argument1;


if scr_inBound(set_terrainG_x,set_terrainG_y) // check within map limits
        {       
        //adjust graphic according to terrain
        
        switch (obj_map.terrains[set_terrainG_x,set_terrainG_y].object_index)
            {
            case obj_terrain_Road :
            scr_setGraphics_Road();
            break; 
            
            case obj_terrain_Mountain :
            scr_setGraphics_Mountain();
            break; 
            
            case obj_terrain_Woods :
            scr_setGraphics_Woods();
            break; 
            }
        }    
     
