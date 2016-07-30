saving_map = argument0;

//delete exsisting save
if (file_exists(saving_map)) file_delete(saving_map);
//create and open file
ini_open(saving_map);

//write to meta section [ map name and size ]
ini_write_string("Meta","name",obj_map.name); //save name as protoland
ini_write_real( "Meta", "Width", global.mapW);
ini_write_real( "Meta", "Height", global.mapH);


//start loop to all positions in map
for( i = 0 ; i < global.mapW ; i += 1 )         // i is to X
    {
    for( j = 0 ; j < global.mapH; j += 1 )      // j is to Y
        {
        //save terrain   
        posKey = string(i)+ "X" + string(j) + "Y";       
        ini_write_real("Terrains", posKey, obj_map.terrains[i,j].object_index);
        //save property ownership
        if ( obj_map.terrains[i,j].isProperty )
            {
            ini_write_real("Terrains", posKey+"P", obj_map.terrains[i,j].ownership);
            }
        //save units
        if (obj_map.units[i,j] != 0)
            {
            ini_write_real("Units", posKey , obj_map.units[i,j].object_index);
            //save unit ownership
            ini_write_real("Units", posKey+"P" , obj_map.units[i,j].ownership);
            }
        }
    }
ini_close();
