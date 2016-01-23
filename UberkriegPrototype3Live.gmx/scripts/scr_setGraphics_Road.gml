

//set graphics north
scr_terrain_check_adj(posX,posY-1); //returns var adj
obj_map.terrains[posX,posY-1].image_index = adj;

//set graphics east
scr_terrain_check_adj(posX+1,posY); //returns var adj
obj_map.terrains[posX+1,posY].image_index = adj;

//set graphics south
scr_terrain_check_adj(posX,posY+1); //returns var adj
obj_map.terrains[posX,posY+1].image_index = adj;

//set graphics west
scr_terrain_check_adj(posX-1,posY); //returns var adj
obj_map.terrains[posX-1,posY].image_index = adj;

//set Origin graphics
scr_terrain_check_adj(posX,posY); //returns var adj
obj_map.terrains[posX,posY].image_index = adj;


