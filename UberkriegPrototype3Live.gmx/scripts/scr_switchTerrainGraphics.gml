/*
this is a switch that detects the terrain type in the input co-ordinates 
then adjusts its graphics to match its surroundings

*/

set_terrainGraphics_x =  argument0;
set_terrainGraphics_y =  argument1;


if scr_inBound(set_terrainGraphics_x,set_terrainGraphics_y) // check within map limits
        {       
        //adjust graphic according to terrain
        
        switch (obj_map.terrains[set_terrainGraphics_x,set_terrainGraphics_y].object_index)
            {
           
             case obj_terrain_Road :
            scr_setGraphics_Road(set_terrainGraphics_x,set_terrainGraphics_y);
            break; 
            
            case obj_terrain_Woods :
            scr_setGraphics_Woods(set_terrainGraphics_x,set_terrainGraphics_y);
            break; 
            
            case obj_terrain_Mountain :
            scr_setGraphics_Mountain(set_terrainGraphics_x,set_terrainGraphics_y);
            break; 
          
            }
        }    
     
