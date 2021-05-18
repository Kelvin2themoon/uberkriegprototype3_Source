// this is a short cut for creating a ds_map  for the deply menu, to be coverted and sent as a JSON sting
var unit_index = argument0;
var price = argument1; //cost to deploy 
//var worth = argument2; //for adjusting unit.cost for calculating repait costs, currently the same as price)

var scr_map = ds_map_create();
ds_map_add(scr_map,"scr","cnet_deploy");
ds_map_add(scr_map,"posx",global.posX);
ds_map_add(scr_map,"posy",global.posY);
ds_map_add(scr_map,"unit",unit_index) //usi unit ty[e index array found in master controls
ds_map_add(scr_map,"price",price); // adjusted from cost because of CO
//ds_map_add(cmap_deploy,"worth",worth);//calculated for repair cost, may be different from price if a collin type co is implimented
return scr_map;
