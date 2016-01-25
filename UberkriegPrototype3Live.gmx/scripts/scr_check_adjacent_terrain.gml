//check adjacent terain is road


t_adjX = argument0;
t_adjY = argument1;


adj = 0;

//check north
if scr_inBound(t_adjX,t_adjY-1)
    {
    if (obj_map.terrains[t_adjX,t_adjY-1].object_index == obj_terrain_Road.object_index)
        {
        adj = adj + 1;
        }
    }

//check east
if scr_inBound(t_adjX+1,t_adjY)
    {
    if (obj_map.terrains[t_adjX+1,t_adjY].object_index == obj_terrain_Road.object_index)
        {
        adj = adj + 2;
        }
    }

//check south
if scr_inBound(t_adjX,t_adjY+1)
    {
    if (obj_map.terrains[t_adjX,t_adjY+1].object_index == obj_terrain_Road.object_index)
        {
        adj = adj + 4;
        }
    }


//check west
if scr_inBound(t_adjX-1,t_adjY)
    {
    if (obj_map.terrains[t_adjX-1,t_adjY].object_index == obj_terrain_Road.object_index)
        {
        adj = adj + 8;
        }
    }






    

