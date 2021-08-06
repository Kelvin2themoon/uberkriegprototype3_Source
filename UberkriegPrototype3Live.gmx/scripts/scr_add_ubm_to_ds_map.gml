//convert map data deom .ubm or .sav file and add to ds_map (for map transfer via net mode)

var ini_map = argument0;   //ini map or save file to decode (string)
var scr_map = argument1;   //ds_map to write to

//open ini file
ini_open(ini_map);

//meta data
var map_w = ini_read_real("Meta", "Height", 5); //x
var map_h = ini_read_real("Meta", "Width",  5); //y

ds_map_replace(scr_map,"map_w",map_w);
ds_map_replace(scr_map,"map_h",map_h); // this typo will haunt me forever

//write terrain 2D loop
var ix = 0;
var iy = 0;
var key_pos = "";
var val_index = 0; //value to add 

for(ix = 0 ; ix < map_w ; ix++){
    for(iy = 0 ; iy < map_h ; iy++){
        key_pos = string(ix) + "X" + string(iy) + "Y";
        //terrain
        ds_map_replace(scr_map,"T"+key_pos,ini_read_real("Terrains",key_pos,1));//defaul to plains
        //check for terrain/property owner
        if ini_key_exists("Terrains",key_pos+"P") ds_map_replace(scr_map,key_pos+"P",ini_read_real("Terrains",key_pos+"P",0))//defau; to neutral
        //units
        if (ini_key_exists("Units",key_pos+"P")){
            ds_map_replace(scr_map,"U"+key_pos,ini_read_real("Units",key_pos,1));           // unit index
            ds_map_replace(scr_map,"U"+key_pos+"P",ini_read_real("Units",key_pos+"P",1));   // player owner
             if (ini_read_real("Units",key_pos+"C",0)=1) ds_map_replace(scr_map,"C"+key_pos,1);  // is command
            }
        }
    }
ini_close();
