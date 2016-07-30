/*
this code checks all adjacent sides of the input terrain and co-ordinates 
to see if they ar the same.

the varable "adj" will be adjusted to coraspond to the sprite's Image Index

used for Roads... probably River, wall, and bridge also
*/


t_adjX =        argument0;
t_adjY =        argument1;



adj = 0;

//check north
if scr_inBound(t_adjX,t_adjY-1)
    {
    if (obj_map.terrains[t_adjX,t_adjY-1].isLand)
        {
        adj = adj + 1;
        }
    }

//check east
if scr_inBound(t_adjX+1,t_adjY)
    {
    if (obj_map.terrains[t_adjX+1,t_adjY].isLand)
        {
        adj = adj + 2;
        }
    }

//check south
if scr_inBound(t_adjX,t_adjY+1)
    {
    if (obj_map.terrains[t_adjX,t_adjY+1].isLand)
        {
        adj = adj + 4;
        }
    }


//check west
if scr_inBound(t_adjX-1,t_adjY)
    {
    if (obj_map.terrains[t_adjX-1,t_adjY].isLand)
        {
        adj = adj + 8;
        }
    }

    return adj;






    

