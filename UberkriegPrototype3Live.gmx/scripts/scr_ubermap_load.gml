

loading = argument0;

if (file_exists(loading))
    {
    //nuke
    with (obj_terrain and obj_unit){instance_destroy();} 
    
    //load protoland
    ini_open("protoland.umb"); 
    
    global.mapW = ini_read_real("Meta", "Width", 5);
    global.mapH = ini_read_real("Meta", "Height",5);
    
    //fill map with plains for setter detection conflicts
    for( i = 0 ; i < global.mapW ; i += 1 )         // i is to X
        {
        for( j = 0 ; j < global.mapH; j += 1 )      // j is to Y
            {        
            obj_map.terrains[i,j] = instance_create( i*24 , j*24 , obj_terrain_Plains ) ;
            obj_map.units[i,j] = 0; //fill unit array with 0s
            }
        }
    
    //start loop
    //start loop to all positions in map
    for( i = 0 ; i < global.mapW ; i += 1 )         // i is to X
        {
        for( j = 0 ; j < global.mapH; j += 1 )      // j is to Y
            {
            
            //Read and adjust at each position
            posRead = string(i)+ "X" + string(j) + "Y"; //Key read variable
            player_set = ini_read_real("Terrains",posRead +"P",1);
            setting_terrain = ini_read_real("Terrains",posRead,0);
            scr_setTerrain(setting_terrain,i,j,player_set);
            
            //set unit
            if (ini_key_exists("Units",posRead+"P"))
                {
                player_set = ini_read_real("Units",posRead +"P",1);
                setting_unit = ini_read_real("Units",posRead,1);
                scr_setUnit(setting_unit,i,j,player_set);
                }

            }    
        }
    }
