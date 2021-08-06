// save a map in ds_map format to ini file
var data_map  = argument0; // map data is extracted from
var file_name = argument1; // save as ini file

//replace file if it already exsists
if file_exists(file_name) file_delete(file_name);
ini_open(file_name);

//meta data
ini_write_string("Meta","name",file_name); //save name as protoland

//map size
global.mapW =  ds_map_find_value(data_map,"map_w");
global.mapH =  ds_map_find_value(data_map,"map_h");
ini_write_real( "Meta", "Width" , ds_map_find_value(data_map,"map_w"));
ini_write_real( "Meta", "Height", ds_map_find_value(data_map,"map_h"));

//start loop to all positions in map
var ix = 0;
var iy = 0;

for( ix = 0 ; ix < global.mapW ; ix += 1 ){
    for( iy = 0 ; iy < global.mapH; iy += 1 ){
        //save terrain   
        posKey = string(ix)+ "X" + string(iy) + "Y";       
        ini_write_real("Terrains", posKey, ds_map_find_value(data_map,"T"+string(posKey)));
        //save property ownership
        if ds_map_exists(data_map,string(posKey)+"P") 
            ini_write_real("Terrains", posKey+"P", ds_map_find_value(data_map,string(posKey)+"P"));
        //save units
        if ds_map_exists(data_map,"U"+string(posKey)) 
            ini_write_real("Units", posKey , ds_map_find_value(data_map,"U"+string(posKey)));
        //unit ownership
        if ds_map_exists(data_map,"U"+posKey+"P")            
            ini_write_real("Units", posKey+"P" , ds_map_find_value(data_map,"U"+posKey+"P"));
        //unit is command?
        if ds_map_exists(data_map,"C"+posKey,)
            ini_write_real("Units", posKey+"C" ,ds_map_find_value(data_map,"C"+posKey,));   
        }
    }
ini_close();

