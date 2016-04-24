/*
check if terrain is next to edge of map.
for use with riversso they rul off the map instead stopping.
*/


t_adjX =        argument0;
t_adjY =        argument1;

adj_non = 0;
//check north
if (t_adjY = 0)
    {
    adj_non = adj_non + 1;
    }
//check east
if (t_adjX = global.mapW-1)
    {
   adj_non = adj_non + 2;
    }
//check south
if (t_adjY = global.mapH-1)
    {
    adj_non = adj_non + 4;
    }

//check west
if (t_adjX = 0)
    {
    adj_non = adj_non + 8;
    }
    
return adj_non;






    

