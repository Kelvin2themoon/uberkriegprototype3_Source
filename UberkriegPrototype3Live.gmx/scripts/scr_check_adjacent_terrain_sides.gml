/*
this code checks ease and west of the input terrain and co-ordinates 
to see if they ar the same.

the varable "adj" will be adjusted to coraspond to the sprite's Image Index

used for Woods and Mountains
*/


t_adjX =        argument0;
t_adjY =        argument1;
terrain_type =  argument2; //requires object index (ie.  = obj_terrain_Road.object_index)

// return adj to 0, in-case another adjacentcy check was made earlier
adj = 0;


//check east
if scr_inBound(t_adjX+1,t_adjY)
    {
    if (obj_map.terrains[t_adjX+1,t_adjY].object_index == terrain_type)
        {
        adj = adj + 1;
        }
    }


//check west
if scr_inBound(t_adjX-1,t_adjY)
    {
    if (obj_map.terrains[t_adjX-1,t_adjY].object_index == terrain_type)
        {
        adj = adj + 2;
        }
    }






    

