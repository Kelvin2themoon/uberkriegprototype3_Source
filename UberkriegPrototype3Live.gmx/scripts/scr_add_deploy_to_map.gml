//this script replaces scr_map_create becasue im switching to a presistant map system and also an 2d deploy array
var target_map  = argument0; // ds map to write to
var unit_type   = argument1; // unit type index
var price       = argument2; //cost to deploy 
var isDummy     = argument3; // unit is dummy?

//clear target map
ds_map_clear(target_map);
ds_map_add(target_map,"scr","cnet_deploy");
ds_map_add(target_map,"posx",global.posX);
ds_map_add(target_map,"posy",global.posY);
ds_map_add(target_map,"unit",unit_type) //usi unit ty[e index array found in master controls
ds_map_add(target_map,"price",price); // adjusted from cost because of CO
ds_map_add(target_map,"isDummy",isDummy);//if unit deployed is decoy, for (S)COP[1]
