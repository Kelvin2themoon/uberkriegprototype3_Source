//check adjacent terain is road


xx = argument0;
yy = argument1;


adj = 0;

//check north
if scr_inBound(xx,yy-1)
    {
    if (obj_map.terrains[xx,yy-1].object_index == obj_terrain_Road.object_index)
        {
        adj = adj + 1;
        }
    }

//check east
if (xx < 0 || xx >= global.mapW || yy-1 < 0 || yy-1 >= global.mapH) 
    {}//do nothing
else{
    if (obj_map.terrains[xx+1,yy].object_index == obj_terrain_Road.object_index)
    {
    adj = adj + 2;
    }
}

//check south
if (xx < 0 || xx >= global.mapW || yy+1 < 0 || yy+1 >= global.mapH) 
    {}//do nothing
else{
    if (obj_map.terrains[xx,yy+1].object_index == obj_terrain_Road.object_index)
    {
    adj = adj + 4;
    }
}

//check west
if (xx < 0 || xx >= global.mapW || yy-1 < 0 || yy-1 >= global.mapH) 
    {}//do nothing
else{
    if (obj_map.terrains[xx-1,yy].object_index == obj_terrain_Road.object_index)
    {
    adj = adj + 8;
    }
    
}





    

