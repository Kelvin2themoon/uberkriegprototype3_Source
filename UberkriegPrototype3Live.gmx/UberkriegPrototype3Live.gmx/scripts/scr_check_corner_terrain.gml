/*
this code checks all corner sides 
of the input terrain and co-ordinates to see if they ar the same.

the varable "adj_c" will be adjusted to coraspond to the sprite's Image Index
( nw=1, ne=2, se=4, sw=8) 

specifically, this script is used to set sea Land Corners
*/


t_adjcX =        argument0;
t_adjcY =        argument1;



adj_c = 0;

//check North-Wesr
if scr_inBound(t_adjcX-1,t_adjcY-1)
    {
    if (obj_map.terrains[t_adjcX-1,t_adjcY-1].isLand)
        {
        adj_c = adj_c + 1;
        }
    }

//check North-East
if scr_inBound(t_adjcX+1,t_adjcY-1)
    {
    if (obj_map.terrains[t_adjcX+1,t_adjcY-1].isLand)
        {
        adj_c = adj_c + 2;
        }
    }

//check south-East
if scr_inBound(t_adjcX+1,t_adjcY+1)
    {
    if (obj_map.terrains[t_adjcX+1,t_adjcY+1].isLand)
        {
        adj_c = adj_c + 4;
        }
    }


//check South-West
if scr_inBound(t_adjcX-1,t_adjcY+1)
    {
    if (obj_map.terrains[t_adjcX-1,t_adjcY+1].isLand)
        {
        adj_c = adj_c + 8;
        }
    }
    
return adj_c;






    

