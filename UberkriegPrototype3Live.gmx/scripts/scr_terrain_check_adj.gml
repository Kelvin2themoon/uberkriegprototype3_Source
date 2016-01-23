//check adjacent terain is road


xx = argument0;
yy = argument1;


adj = 0;

//check north
if (obj_map.terrains[xx,yy-1].object_index == obj_terrain_Road.object_index)
    {
    adj = adj + 2;
    }
//check east
if (obj_map.terrains[xx+1,yy].object_index == obj_terrain_Road.object_index)
    {
    adj = adj + 4;
    }
//check south
if (obj_map.terrains[xx,yy+1].object_index == obj_terrain_Road.object_index)
    {
    adj = adj + 8;
    }
//check west
if (obj_map.terrains[xx-1,yy].object_index == obj_terrain_Road.object_index)
    {
    adj = adj + 16;
    }
    
adj = adj div 2 ;
    

